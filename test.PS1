$server = "$(hostname)\SQLEXPRESS"
$command = New-Object -TypeName PSCustomObject -Property @{
    Id          = 42
    CommandLine = "Write-Host `"'`""
}
Invoke-Sqlcmd -ServerInstance $server -Query "INSERT INTO history (id, command) VALUES ($($command.Id), '$($command.CommandLine)')"

<#
Invoke-Sqlcmd : Unclosed quotation mark after the character string '')
'.
Incorrect syntax near '')
'.
At C:\Users\ryan\powershell-history-log\test.PS1:6 char:1
+ Invoke-Sqlcmd -ServerInstance $server -Query "INSERT INTO history (id ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [Invoke-Sqlcmd], SqlPowerShellSqlExecutionException
    + FullyQualifiedErrorId : SqlError,Microsoft.SqlServer.Management.PowerShell.GetScriptCommand
#>
