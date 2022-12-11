# Create a new DataTable object
$table = New-Object System.Data.DataTable

# Add columns to the DataTable
$table.Columns.Add("ID", [System.Int32])
$table.Columns.Add("Name", [System.String])

# Create a new DataRow object and add it to the DataTable
$row = $table.NewRow()
$row.ID = 1
$row.Name = "John"
$table.Rows.Add($row)

# Create another DataRow object and add it to the DataTable
$row = $table.NewRow()
$row.ID = 2
$row.Name = "Jane"
$table.Rows.Add($row)

$row.Item("ID") = 42

<#
PS C:\Users\ryan\powershell-history-log> $row[0]
42
PS C:\Users\ryan\powershell-history-log> $row.Item("ID")
42
PS C:\Users\ryan\powershell-history-log> $row.ID
42
#>

# Print the data in the DataTable
$table | Format-Table
