<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Jobs!</title>
</head>
<body>

<?php
$servername = "iyc353.encs.concordia.ca";
$username = "iyc353_1";
$password = "folklore";
$dbname = "iyc353_1";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM goal";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
while($row = $result->fetch_assoc()) {
echo "id: " . $row["author"]. "<br>";
}
} else {
echo "0 results";
}
$conn->close();
?>

</body>
</html>
