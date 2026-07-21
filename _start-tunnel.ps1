$exe = 'c:\Users\keyjiang\CodeBuddy\20260623230426\cloudflared.exe'
$log = 'c:\Users\keyjiang\CodeBuddy\20260623230426\_tunnel.log'
if (Test-Path $log) { Remove-Item $log -Force }
# 后台启动 cloudflared 临时隧道，指向本地 5173；用 http2 协议避免 UDP/QUIC 被封
Start-Process -FilePath $exe `
  -ArgumentList @('tunnel','--url','http://localhost:5173','--protocol','http2','--logfile',$log,'--loglevel','info') `
  -WindowStyle Hidden
Write-Output 'STARTED'
