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
