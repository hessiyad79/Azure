#setup your account
Login-AzureRmAccount

#verify your subscriptions
Get-AzureRmSubscription

#set your default Subscription
Get-AzureRmSubscription `
–SubscriptionName “Visual Studio Premium with MSDN” | Select-AzureRmSubscription

#create the elastic pool
New-AzureRmSqlElasticPool `
-ResourceGroupName "TestResources" `
-ServerName "testdbs" `
-ElasticPoolName "TestPool" `
-Edition "Standard" `
-Dtu 100 `
-DatabaseDtuMin 10 `
-DatabaseDtuMax 100

#move databases into the pool
Set-AzureRmSqlDatabase `
-ResourceGroupName "TestResources" `
-ServerName "testdbs" `
-DatabaseName "t1" `
-ElasticPoolName "TestPool"

Set-AzureRmSqlDatabase `
-ResourceGroupName "TestResources" `
-ServerName "testdbs" `
-DatabaseName "t2" `
-ElasticPoolName "TestPool"