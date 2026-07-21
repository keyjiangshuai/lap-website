$f = 'c:\Users\keyjiang\CodeBuddy\20260623230426\assets\Vector.png'
if (Test-Path -LiteralPath $f) {
  $i = Get-Item -LiteralPath $f
  Write-Output ('size=' + $i.Length)
  Write-Output ('ext=' + $i.Extension)
  # 读取前几个字节判断是否真的是 PNG
  $fs = [System.IO.File]::OpenRead($f)
  $buf = New-Object byte[] 8
  $n = $fs.Read($buf, 0, 8)
  $fs.Close()
  $hex = ($buf[0..7] | ForEach-Object { $_.ToString('X2') }) -join ' '
  Write-Output ('header=' + $hex)
} else {
  Write-Output 'NOT_FOUND'
}
