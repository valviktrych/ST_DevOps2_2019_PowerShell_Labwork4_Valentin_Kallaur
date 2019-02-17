[int]$t = $null
(Test-Connection 192.168.1.3).ResponseTime | foreach {
    $t += $_
}

Write-Host "Ping time: $t ms"