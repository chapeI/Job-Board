<?php

$servername = "iyc353.encs.concordia.ca"; // Change this to iyc353.encs.concordia.ca if you have trouble connecting
$username = "iyc353_1";
$password = "folklore";
try {
    $conn = new PDO("mysql:host=$servername;dbname=iyc353_1", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

