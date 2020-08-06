<?php

session_start();

// initialize variables

$username_ = "";
$password_ = "";

// connect to the database

$servername = "iyc353.encs.concordia.ca";
$username = "iyc353_1";
$password = "folklore";
$dbname = "iyc353_1";

// $db = mysqli_connect($servername, $username, $password, $dbname) or die("DEBUG: couldn't connect");
$conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);

 $query = $conn-> prepare("SELECT * FROM users");
                  $query->execute();

                  while($row = $query-> fetch()) {
                        echo "<tr><td>". $row["user_id"]. "</td><td>". $row["email"]. "</td><td>". $row["password"]. "</td></tr>";
                  }

?>
