select * from AzurePartitionTest
order by recordDate desc

insert into AzurePartitionTest
values(getdate());