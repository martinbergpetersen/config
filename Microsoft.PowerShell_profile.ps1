Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Alias -Name cd -Value z -Option AllScope
Set-Alias -Name cdi -Value zi -Option AllScope
