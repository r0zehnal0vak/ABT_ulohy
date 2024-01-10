# DHCP bez hashtable

#Add-DhcpServerV4Scope -Name 'TestNetwork' -StartRange '10.0.0.2' -EndRange '10.0.0.254' -SubnetMask '255.255.255.0' -Description 'Network for testlab A' -LeaseDuration (New-TimeSpan -Days 8) -Type "Both"

# S hashtable / jde to rozepsat

$DHCPScope = @{
    Name          = 'TestNetwork'
    StartRange    = '10.0.0.2'
    EndRange      = '10.0.0.254'
    SubnetMask    = '255.255.255.0'
    Description   = 'Network for testlab A'
    LeaseDuration = (New-TimeSpan -Days 8)
    Type          = "Both"
}
# Add-DhcpServerV4Scope @DHCPScope

$DHCPScope.GetEnumerator() | ForEach-Object{
    $message = 'Name = $Name, StartRange = {1}, EndRange = {2}, SubnetMask = {3}, Description = {4}, LeaseDuration = {5}, Type = {6}' -f $_.Name, $_StartRange, $_.EndRange, $_.SubnetMask, $_.Description, $_.LeaseDuration, $_.Type
    Write-Output $message
}