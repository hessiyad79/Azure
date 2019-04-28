#setup your account
Login-AzureRmAccount

#verify your subscriptions
Get-AzureRmSubscription

#set your default Subscription
Get-AzureRmSubscription `
–SubscriptionName “Visual Studio Premium with MSDN” | Select-AzureRmSubscription

#create the Azure SQL server
$adminCredential = Get-Credential

New-AzureRmSqlServer -ResourceGroupName "hichamdemo" `
-Location "East US 2" `
-ServerName "hichamdemopshell" `
-SqlAdministratorCredentials $adminCredential `
-ServerVersion "12.0"

#create a new Basic database
New-AzureRmSqlDatabase `
-DatabaseName "hichamdbpshell" `
-ServerName "hichamdemopshell" `
-ResourceGroupName "hichamdemo" `
-Edition "Basic"

# -- set a database level rule
# EXEC sp_set_database_firewall_rule @name = N'ClientFirewallRule', 
#     @start_ip_address = '99.230.128.115', @end_ip_address = '99.230.128.115'
# 
# -- query the rules
# select * from sys.firewall_rules
# select * from sys.database_firewall_rules