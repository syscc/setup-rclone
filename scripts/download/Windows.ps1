$ErrorActionPreference = 'Stop'
$version = (gh api repos/rclone/rclone/releases/latest -q .tag_name)
Write-Host ::group::Downloading Rclone $version for Windows
aria2c -x 16 $env:GITHUB_SERVER_URL/rclone/rclone/releases/download/$version/rclone-$version-windows-amd64.zip
7z e rclone-$version-windows-amd64.zip rclone.exe -oRclone -r
Remove-Item rclone-$version-windows-amd64.zip
Write-Host ::endgroup::