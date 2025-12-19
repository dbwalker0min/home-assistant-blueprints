param(
  [Parameter(Mandatory=$true)]
  [string]$Path
)

$haHost  = "ha"
$tmpRoot = "/tmp/ha-deploy"

$full = (Resolve-Path $Path).Path

# Find git repo root
$repoRoot = (git -C (Split-Path $full -Parent) rev-parse --show-toplevel 2>$null).Trim()
if (-not $repoRoot) {
  Write-Error "❌ Could not determine git repo root for: $full"
  exit 1
}

# Compute repo-relative path with forward slashes
$rel = $full.Substring($repoRoot.Length).TrimStart('\','/')
$relUnix = $rel -replace '\\','/'
$tmpRoot = "~/.cache/ha-deploy"   # <-- user-owned, no sudo needed


Write-Output "relative path: $relUnix"

$type = $null
$targetRel = $null

if ($relUnix -like "packages/*") {
  $type = "package"
  $targetRel = $relUnix.Substring("packages/".Length)
}
elseif ($relUnix -like "scripts/*") {
  $type = "script"
  $targetRel = $relUnix.Substring("scripts/".Length)
}
elseif ($relUnix -like "blueprints/automation/*") {
  $type = "automation"
  $targetRel = $relUnix.Substring("blueprints/automation/".Length)
}
elseif ($relUnix -like "dashboards/*") {
  $type = "dashboard"
  $targetRel = $relUnix.Substring("dashboards/".Length)
}
else {
  Write-Error "❌ File is not under packages/, scripts/, or blueprints/automation/: $relUnix"
  exit 1
}

$remotePath = "$tmpRoot/$type/$targetRel"
$remoteDir  = ($remotePath -replace '/[^/]+$','')

Write-Host "📤 Uploading $full → ${haHost}:$remotePath"

# Create remote dir as *your ssh user* (no sudo)
ssh $haHost "mkdir -p '$remoteDir'"
if (-not $?) { throw "ssh mkdir failed" }

# scp as your ssh user (no root@)
scp -O "$full" "${haHost}:`"$remotePath`""
if (-not $?) { throw "scp failed" }

# Deploy (sudo only for moving into /config and reload/restart)
Write-Host "🔧 Deploying on HA (type=$type, rel=$targetRel)"
ssh $haHost "sudo /config/bin/deploy-blueprint '$remotePath' '$type' '$targetRel'"
if (-not $?) { throw "deploy on HA failed" }

Write-Host "✅ Deployment complete!"
