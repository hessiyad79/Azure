#setup your account
Login-AzureRmAccount

#verify your subscriptions
Get-AzureRmSubscription

#set your default Subscription
Get-AzureRmSubscription `
–SubscriptionName “Visual Studio Premium with MSDN” | Select-AzureRmSubscription

#pick the date and time (UTC)
$RestorePoint = Get-Date -Date "2016-10-20 00:10:00" 

#get the database object
$Database = Get-AzureRmSqlDatabase -ResourceGroupName "TestResources" `
-ServerName "testdbs" `
-DatabaseName "t1"

#submit the restore request
Restore-AzureRmSqlDatabase –FromPointInTimeBackup `
–PointInTime $RestorePoint `
-ResourceGroupName $Database.ResourceGroupName `
-ServerName $Database.ServerName `
-TargetDatabaseName "t1_PshellRestore" `
–ResourceId $Database.ResourceID `
-Edition "Standard" `
-ServiceObjectiveName "S0"