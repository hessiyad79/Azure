chdir /d C:\Program Files (x86)\Microsoft SQL Server\130\DAC\bin\
SQLPackage.exe /Action:Import ^
/TargetServerName:.\DEMO ^
/TargetDatabaseName:AdventureWorksLT ^
/SourceFile:E:\Import\AdventureWorksLT.bacpac 
chdir /d %~dp0