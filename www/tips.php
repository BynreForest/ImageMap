<?php
require_once("includes/initialize.php");

$result =  mysql_query("Select pk, date, category, desc, photo_bool, lat, lon from secrets where DATE(date) =" CURDATE();


while($obj = mysql_fetch_object($result))
{
$encodable[] = $obj;
}

$encoded = json_encode($encodable);

echo $encoded;

?>
