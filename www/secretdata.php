<?php
require_once("includes/initialize.php");

$mydate = CURDATE();
echo $mydate;
/*
$result =  mysql_query('SELECT pk, date, category, descriptions, photo_bool, lat, lon FROM secrets where date =' $mydate); 

/* where DATE(date) =' CURDATE();


while($obj = mysql_fetch_object($result))
{
$encodable[] = $obj;
}

$encoded = json_encode($encodable);

echo $encoded;
*/

?>
