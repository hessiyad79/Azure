#setup your account
Login-AzureRmAccount

#verify your subscriptions
Get-AzureRmSubscription

#set your default Subscription
Get-AzureRmSubscription `
–SubscriptionName “Visual Studio Ultimate with MSDN” | Select-AzureRmSubscription

#get the database object
$Database = Get-AzureRmSqlDatabase -ResourceGroupName "TestResources" `
-ServerName "testdbs" `
-DatabaseName "AdventureWorksLT"

#which metrics are available
Get-AzureRmMetricDefinition -ResourceId $Database.ResourceId | Format-Table

#collect the information necessary
$targetEmail = 'xxxx@xxxxxx.com'
$alertName = 'CPU Over 90'
$metricName = 'cpu_percent'
$operator = 'GreaterThanOrEqual'
$threshold = 90
$period='00:05:00'
$timeOperator = 'Average'

#create the notification rule
$emailRule = New-AzureRmAlertRuleEmail -CustomEmails $targetEmail

#create the alert
Add-AzureRmMetricAlertRule -Name $alertName `
-Location $Database.Location `
-ResourceGroup $Database.ResourceGroupName `
-TargetResourceId $Database.ResourceId `
-MetricName $metricName `
-Operator $operator `
-Threshold $threshold `
-WindowSize $period `
-TimeAggregationOperator $timeOperator `
-Actions $emailRule
