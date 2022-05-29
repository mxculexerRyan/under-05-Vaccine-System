<?php
//Enter your database information here and the name of the backup file
// $dbname='pharmacy_db';
// $username='root';
// $password='';
// $host='localhost';
// $export_path='patrick.sql';
$mysqlDatabaseName ='pharmacy_db';
$mysqlUserName ='root';
$mysqlPassword ='';
$mysqlHostName ='localhost:3036';
$mysqlImportFilename ='Filename-of-backup.sql';


// mysqli_connect('localhost','root','','pharmacy_db') or die("Could not connect to mysql".mysqli_error($conn));

//Please do not change the following points
//Import of the database and output of the status
$command='mysqldump --opt -h' .$mysqlHostName .' -u' .$mysqlUserName .' -p' .$mysqlPassword .' ' .$mysqlDatabaseName .' > ' .$mysqlImportFilename;
exec($command,$output,$worked);
switch($worked){
case 0:
echo 'The database <b>' .$mysqlDatabaseName .'</b> was successfully stored in the following path '.getcwd().'/' .$mysqlImportFilename .'</b>';
break;
case 1:
echo 'An error occurred when exporting <b>' .$mysqlDatabaseName .'</b> zu '.getcwd().'/' .$mysqlImportFilename .'</b>';
break;
case 2:
echo 'An export error has occurred, please check the following information: <br/><br/><table><tr><td>MySQL Database Name:</td><td><b>' .$mysqlDatabaseName .'</b></td></tr><tr><td>MySQL User Name:</td><td><b>' .$mysqlUserName .'</b></td></tr><tr><td>MySQL Password:</td><td><b>NOTSHOWN</b></td></tr><tr><td>MySQL Host Name:</td><td><b>' .$mysqlHostName .'</b></td></tr></table>';
break;
}
?>