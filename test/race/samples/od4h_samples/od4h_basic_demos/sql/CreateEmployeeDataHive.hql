--
-- $Header: hadoop/demo/osh/sql/CreateEmployeeDataHive.hql ratiwary_osh_newsplitters_outputformat/2 2016/01/19 05:57:36 ratiwary Exp $
--
-- CreateEmployeeDataHive.hql
--
-- Copyright (c) 2015, 2016, Oracle and/or its affiliates. All rights reserved.
--
--    NAME
--      CreateEmployeeDataHive.hql
--
--    DESCRIPTION
--      Creates hive external tables using OracleStorageHandler
--
--    NOTES
--
--    MODIFIED   (MM/DD/YY)
--    ratiwary    03/20/15 - Created
--

DROP TABLE EmployeeDataSimple;
CREATE EXTERNAL TABLE EmployeeDataSimple (
 Emp_ID int,
 First_Name string,
 Last_Name string,
 Job_Title string,
 Salary int
)
STORED BY 'oracle.hcat.osh.OracleStorageHandler'
WITH SERDEPROPERTIES (
     'oracle.hcat.osh.columns.mapping' = 'Emp_ID,First_Name,Last_Name,Job_Title,Salary')
TBLPROPERTIES (
 'mapreduce.jdbc.url' = '${hiveconf:connection_string}',
 'mapreduce.jdbc.username' = '${hiveconf:oracle_user}',
 'mapreduce.jdbc.password' = '${hiveconf:oracle_pwd}',
 'mapreduce.jdbc.input.table.name' = 'EmployeeData',
 'oracle.hcat.osh.splitterKind' = 'SINGLE_SPLITTER'
);


DROP TABLE EmployeeDataPartitioned;
CREATE EXTERNAL TABLE EmployeeDataPartitioned (
 Emp_ID int,
 First_Name string,
 Last_Name string,
 Job_Title string,
 Salary int
)
STORED BY 'oracle.hcat.osh.OracleStorageHandler'
WITH SERDEPROPERTIES (
     'oracle.hcat.osh.columns.mapping' = 'Emp_ID,First_Name,Last_Name,Job_Title,Salary')
TBLPROPERTIES (
 'mapreduce.jdbc.url' = '${hiveconf:connection_string}',
 'mapreduce.jdbc.username' = '${hiveconf:oracle_user}',
 'mapreduce.jdbc.password' = '${hiveconf:oracle_pwd}',
 'mapreduce.jdbc.input.table.name' = 'EmployeeData',
 'oracle.hcat.osh.splitterKind' = 'PARTITION_SPLITTER',
 'oracle.hcat.osh.maxSplits' = '10'
);

DROP TABLE EmployeeBonusReport;
CREATE EXTERNAL TABLE EmployeeBonusReport (
 First_Name string,
 Last_Name string,
 Bonus int
)
STORED BY 'oracle.hcat.osh.OracleStorageHandler'
WITH SERDEPROPERTIES (
     'oracle.hcat.osh.columns.mapping' = 'First_Name,Last_Name,Bonus')
TBLPROPERTIES (
 'mapreduce.jdbc.url' = '${hiveconf:connection_string}',
 'mapreduce.jdbc.username' = '${hiveconf:oracle_user}',
 'mapreduce.jdbc.password' = '${hiveconf:oracle_pwd}',
 'mapreduce.jdbc.input.table.name' = 'EmployeeBonusReport'
);
