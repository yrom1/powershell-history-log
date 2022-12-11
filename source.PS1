# source file.sh -> . 'file.PS1'
$ans = 42
<#
PS C:\Users\ryan\powershell-history-log> Write-Host $ans

PS C:\Users\ryan\powershell-history-log> .\test.PS1
PS C:\Users\ryan\powershell-history-log> Write-Host $ans

PS C:\Users\ryan\powershell-history-log> .  .\test.PS1
PS C:\Users\ryan\powershell-history-log> Write-Host $ans
42
#>
