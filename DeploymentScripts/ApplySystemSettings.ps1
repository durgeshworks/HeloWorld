
Write-Host "before New-NetFirewallRule"

New-NetFirewallRule -DisplayName "Allow Inbound Port 81" -Direction Inbound –LocalPort 81 -Protocol TCP -Action Allow

Write-Host "after New-NetFirewallRule"