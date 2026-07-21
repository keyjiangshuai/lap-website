$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$dst = 'c:\Users\keyjiang\CodeBuddy\20260623230426\cloudflared.exe'
if (Test-Path $dst) {
  Write-Output ('EXISTS ' + (Get-Item $dst).Length)
} else {
  try {
    Invoke-WebRequest -Uri 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe' -OutFile $dst -TimeoutSec 180
    Write-Output ('DOWNLOADED ' + (Get-Item $dst).Length)
  } catch {
    Write-Output ('ERROR ' + $_.Exception.Message)
  }
}
