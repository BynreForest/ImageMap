<?php
require_once("includes/initialize.php");


/*
function mysql2json($mysql_result,$name){
$json="{\n\"$name\": [\n";
$field_names = array();
$fields = mysql_num_fields($mysql_result);
for($x=0;$x<$fields;$x++){
$field_name = mysql_fetch_field($mysql_result, $x);
if($field_name){
$field_names[$x]=$field_name>name;
}
}
$rows = mysql_num_rows($mysql_result);
for($x=0;$x<$rows;$x++){
$row = mysql_fetch_array($mysql_result);
$json.="{\n";
for($y=0;$y<count($field_names);$y++) {
$json.="\"$field_names[$y]\" :&nbsp;&nbsp; &nbsp;\"$row[$y]\"";
if($y==count($field_names)-1){
$json.="\n";
}
else{
$json.=",\n";
}
}
if($x==$rows-1){
$json.="\n}\n";
}
else{
$json.="\n},\n";
}
}
$json.="]\n};";
return($json);
}

$name = "test";
$mysql_result = mysql_query("Select * from tips");
echo mysql2json($mysql_result,$name);
*/

$result =  mysql_query("Select prime_key, category, tip, tipname from tips");


while($obj = mysql_fetch_object($result))
{
$encodable[] = $obj;
}

$encoded = json_encode($encodable);

echo $encoded;



 
 // Check database to see if username/password exist.
// User::insertAnswers($one,$two,$three,$four,$five,$six, $seven, $eight, $nine, $ten, $eleven, $twelve);
?>
