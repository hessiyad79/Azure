chdir /d C:\Program Files (x86)\Microsoft SQL Server\130\DAC\bin\
SQLPackage.exe /Action:Export ^
/SourceServerName:testdbs.database.windows.net ^
/SourceDatabaseName:AdventureWorksLT ^
/SourceEncryptConnection:True ^
/TargetFile:E:\Import\AdventureWorksLT.bacpac ^
/SourceUser:yyyyyyy ^
/SourcePassword:xxxxxxx 
chdir /d %~dp0