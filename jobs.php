
<?php
$servername = "iyc353.encs.concordia.ca";
$username = "iyc353_1";
$password = "folklore";

try {
  $conn = new PDO("mysql:host=$servername;dbname=iyc353_1", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "success?";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}

$query= $conn->prepare("SELECT * FROM author");
$query->execute();
$result = $query->fetchAll();
var_dump($result);

?>
