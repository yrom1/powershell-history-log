# sqlcmd -S "$(hostname)\SQLEXPRESS" -E
$server = "$(hostname)\SQLEXPRESS"
# $result = Invoke-Sqlcmd -ServerInstance $server -Query "SELECT 1 a UNION ALL SELECT 2 a"
Invoke-Sqlcmd -ServerInstance $server -Query "DROP TABLE IF EXISTS history"
Invoke-Sqlcmd -ServerInstance $server -Query "CREATE TABLE history (id int, command varchar(255))"
# Invoke-Sqlcmd -ServerInstance $server -Query "TRUNCATE TABLE history"
# Invoke-Sqlcmd -ServerInstance DESKTOP-PCC2R8U\SQLEXPRESS -Query "INSERT INTO history(id, command) VALUES (1, 'x')"
$history = Get-History
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
foreach ($command in $history) {
    $insert = "INSERT INTO history (id, command) VALUES ($($command.Id), '$($command.CommandLine)')"
    Write-Host $insert
    Invoke-Sqlcmd -ServerInstance $server -Query $insert
    # break
    # Write-Host $command.Id
    # Write-Host $command.CommandLine
    # Write-Host ---
    <# NOTE this is case insensitive!
    PS C:\Users\ryan\powershell-history-log> 'Trees' -eq 'trees' # ceq for case sensitive
    True
    PS C:\Users\ryan\powershell-history-log> $row

    ID Name
    -- ----
    2 Jane


    PS C:\Users\ryan\powershell-history-log> $ROW

    ID Name
    -- ----
    2 Jane


    #>
    # NOTE if you didnt give it a column name, it will be the column name will be 'Column1':
    <#
    1> select 1
    2> go

    -----------
            1

    (1 rows affected)
    #>
}

<# INSPECT INTO OBJECT
PS C:\Users\ryan\powershell-history-log> $row | Get-Member


   TypeName: System.Data.DataRow

Name              MemberType            Definition
----              ----------            ----------
AcceptChanges     Method                void AcceptChanges()
BeginEdit         Method                void BeginEdit()
CancelEdit        Method                void CancelEdit()
ClearErrors       Method                void ClearErrors()
Delete            Method                void Delete()
EndEdit           Method                void EndEdit()
Equals            Method                bool Equals(System.Object obj)
GetChildRows      Method                System.Data.DataRow[] GetChildRows(string rel...
GetColumnError    Method                string GetColumnError(int columnIndex), strin...
GetColumnsInError Method                System.Data.DataColumn[] GetColumnsInError()
GetHashCode       Method                int GetHashCode()
GetParentRow      Method                System.Data.DataRow GetParentRow(string relat...
GetParentRows     Method                System.Data.DataRow[] GetParentRows(string re...
GetType           Method                type GetType()
HasVersion        Method                bool HasVersion(System.Data.DataRowVersion ve...
IsNull            Method                bool IsNull(int columnIndex), bool IsNull(str...
RejectChanges     Method                void RejectChanges()
SetAdded          Method                void SetAdded()
SetColumnError    Method                void SetColumnError(int columnIndex, string e...
SetModified       Method                void SetModified()
SetParentRow      Method                void SetParentRow(System.Data.DataRow parentR...
ToString          Method                string ToString()
Item              ParameterizedProperty System.Object Item(int columnIndex) {get;set;...
Column1           Property              int Column1 {get;set;}
#>
