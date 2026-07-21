$nodeDir = 'C:\Users\keyjiang\.workbuddy\binaries\node\versions\20.18.0\node-v20.18.0-win-x64'
$node = Join-Path $nodeDir 'node.exe'
$npx  = Join-Path $nodeDir 'node_modules\npm\bin\npx-cli.js'
$log  = 'c:\Users\keyjiang\CodeBuddy\20260623230426\_vite.log'
if (Test-Path $log) { Remove-Item $log -Force }
if (Test-Path ($log + '.err')) { Remove-Item ($log + '.err') -Force }
# 关键：把内置 node 目录加进 PATH，否则 npx 内部调用 node 会找不到
$env:PATH = $nodeDir + ';' + $env:PATH
Start-Process -FilePath $node `
  -ArgumentList @($npx,'--yes','vite','--port','5173','--host','0.0.0.0') `
  -WorkingDirectory 'c:\Users\keyjiang\CodeBuddy\20260623230426' `
  -WindowStyle Hidden `
  -RedirectStandardOutput $log `
  -RedirectStandardError ($log + '.err')
Write-Output 'STARTED'
