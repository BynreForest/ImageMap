<?
require_once("includes/initialize.php");

$category=$_POST['element_3'];
$tipname=$_POST['element_1'];
$tipdesc=$_POST['element_2'];

echo $category;
echo $tipname;
echo $tipdesc;

//mysql_connect(localhost,$username,$password);
//@mysql_select_db($database) or die( "Unable to select database");

/*$query = "INSERT INTO tips ('prime_key', 'Date', 'category', 'tipname', 'tip', 'total_votes', 'avg_votes') VALUES (NULL, CURRENT_TIMESTAMP, '$category','$tipname','$tipdesc', NULL, NULL)";*/
$query = "INSERT INTO tips VALUES (NULL, CURRENT_TIMESTAMP, '$category','$tipname','$tipdesc', NULL, NULL)";
/*INSERT INTO `bbgaynor_saffit`.`tips` (`prime_key`, `Date`, `category`, `tipname`, `tip`, `total_votes`, `avg_vote`) VALUES (NULL, CURRENT_TIMESTAMP, 'skin', 'softness', 'mmmmmmm lotion', NULL, NULL);*/
mysql_query($query);

//mysql_close();
$query2="select * from tips";  // query string stored in a variable
$rt=mysql_query($query2);          // query executed 
echo mysql_error();                    // if any error is there that will be printed to the screen


while($nt=mysql_fetch_array($rt)){
echo "$nt[prime_key] $nt[Date] $nt[category] $nt[tipname] $nt[tip]<br>";     // name class and mark will be printed with one line break at the end
}
?>
<input type="button" value="GO BACK TO START" onclick="location.href='form.html'">
