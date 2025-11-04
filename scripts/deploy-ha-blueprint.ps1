param (
    [Parameter(Mandatory = $true)]
    [string]$Path
)

$haHost = "ha"
$tmpRemote = "/tmp"
$fileName = Split-Path $Path -Leaf


# Detect type based on path
if ($Path -match "automation[\\/]+dbwalker0min") {
    $type = "automation"
} elseif ($Path -match "script[\\/]+dbwalker0min") {
    $type = "script"
} else {
    Write-Error "❌ Unknown type (expected automation\\dbwalker0min or script\\dbwalker0min)"
    exit 1
}

Write-Host "📤 Uploading $fileName to ${haHost}:${tmpRemote} ..."
# Write-Host "scp -O $Path `"${haHost}:${tmpRemote}/${fileName}`""
scp -O $Path "${haHost}:${tmpRemote}/${fileName}"
if ($?) {
  Write-Host "Command succeeded."
} else {
  Write-Host "Command failed."
}
Write-Host "🔧 Deploying via helper script on HA ..."
Write-Host "ssh $haHost `"/config/bin/deploy-blueprint ${tmpRemote}/${fileName} ${type}`""
ssh $haHost "sudo /config/bin/deploy-blueprint ${tmpRemote}/${fileName} ${type}"

Write-Host "✅ Deployment complete! (${type} → ${fileName})"
