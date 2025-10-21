param(
  [Parameter(Mandatory)] [string]$Path,
  [string]$FileName = (Split-Path -Leaf $Path),
  [string]$SshHost = "ha"
)

$ErrorActionPreference = "Stop"
$Path = (Resolve-Path -Path $Path).Path
echo "Deploying blueprint file '$Path' to Home Assistant host '$SshHost' as '/tmp/$FileName'"
scp -O "$Path" ("{0}:/tmp/{1}" -f $SshHost, $FileName)
ssh $SshHost ("sudo -n /config/bin/deploy-blueprint -s /tmp/{0} -n {0}" -f $FileName)
