# $command = [PSCustomObject]@{
#     Id          = 42
#     CommandLine = 'x'
# }
# $command.Id       # Returns 42
# $command.CommandLine   # Returns 'x'

$command = New-Object -TypeName PSCustomObject -Property @{
    Id          = 42
    CommandLine = 'x'
}
