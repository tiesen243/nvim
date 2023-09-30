#----- Aliases -----#
Set-Alias py python
Set-Alias vi nvim
Set-Alias lg lazygit

#----- Utils -----#
function fzf() { 
  $res = Invoke-Expression "fzf.exe -e --multi --cycle"
  if ($res -like "*.ipynb") {  cd (Split-Path $res); code . } 
  elseif ($res -like "*.exe") { start $res }
  else { nvim $res }
}

function fzfs(){
  $res = Invoke-Expression "fzf.exe -e --multi --cycle"
  if($res) { cd (Split-Path $res); start . }
}

function q() { exit }

function which($command) {
  Get-Command $command -ErrorAction SilentlyContinue | 
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

#----- Theme -----#
oh-my-posh init pwsh --config '~\scoop\apps\oh-my-posh\current\themes\paradox.omp.json' | Invoke-Expression

$ENV:FZF_DEFAULT_OPTS=@"
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
"@

# ----- Modules -----#

# Terminal-Icons
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History 
Set-PSReadLineOption -PredictionViewStyle ListView 
Set-PSReadLineOption -HistoryNoDuplicates:$true
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl+j -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+k -Function PreviousHistory
