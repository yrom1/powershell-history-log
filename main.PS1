# sqlcmd -S "$(hostname)\SQLEXPRESS" -E
$server = "$(hostname)\SQLEXPRESS"
$result = Invoke-Sqlcmd -ServerInstance $server -Query "SELECT 1 UNION ALL SELECT 2"
<#
PS C:\Users\ryan\powershell-history-log> $result.GetType()

IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    DataRow                                  System.Object
#>
<#
PS C:\Users\ryan\powershell-history-log> $result.GetType().Name
DataRow
#>
<#
PS C:\Users\ryan\powershell-history-log> $result[0]
1
PS C:\Users\ryan\powershell-history-log> $result[1]
#>
foreach ($row in $result) {
    Write-Host $row.Column1
}
