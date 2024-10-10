Set-PSReadLineOption -EditMode Vi -ViModeIndicator Cursor
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Alias -Name cd -Value z -Option AllScope
Set-Alias -Name cdi -Value zi -Option AllScope
Set-Alias -Name vim -Value nvim -Option AllScope

Set-PSReadLineKeyHandler -Chord Tab -Function Complete
Set-PSReadLineKeyHandler -Chord "ctrl+w" -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord "ctrl+l" -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord "ctrl+e" -Function AcceptLine
Set-PSReadlineKeyHandler -Key "ctrl+k" -Function  HistorySearchForward
Set-PSReadlineKeyHandler -Key "ctrl+j" -Function  HistorySearchBackward

Set-PSReadLineKeyHandler -Chord 'j' -ScriptBlock {
  if ([Microsoft.PowerShell.PSConsoleReadLine]::InViInsertMode()) {
    $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    if ($key.Character -eq 'k') {
      [Microsoft.PowerShell.PSConsoleReadLine]::ViCommandMode()
    }
    else {
      [Microsoft.Powershell.PSConsoleReadLine]::Insert('j')
      [Microsoft.Powershell.PSConsoleReadLine]::Insert($key.Character)
    }
  }
}


oh-my-posh init pwsh --config /home/mbp/.config/powershell/tiwahu.omp.json | Invoke-Expression
import-Module posh-git
$env:FZF_DEFAULT_OPTS='--height=40%'


