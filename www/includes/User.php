<?php
// If it's going to need the database, then it's 
// probably smart to require it before we start.
require_once('Database.php');

class User {
	
	
  
  public static function insertAnswers($one,$two,$three,$four,$five,$six, $seven, $eight, $nine, $ten, $eleven, $twelve)
	{	
		$query = "INSERT INTO abilify_ts (id, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve) VALUES (NULL, $one, $two, $three, $four, $five, $six, $seven, $eight, $nine, $ten, $eleven, $twelve)";
		$result = mysql_query($query);
		return $result;
	}


}

?>