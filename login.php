<?php
session_start();
                  $servername = "iyc353.encs.concordia.ca";
                  $username = "iyc353_1";
                  $password = "folklore";
                  $dbname = "iyc353_1";


                  try {
                    $conn = new PDO("mysql:host=$servername; dbname=$dbname", $username, $password);
                    // set the PDO error mode to exception
                    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                    if(isset($_POST["login"]))
                    {
                        $username = $_POST['username'];
                        $password = $_POST['password'];
                        $query = "SELECT * FROM admin WHERE admin_id= '$username' AND password = '$password'";
                        $statement = $conn->prepare($query);
                        $statement->execute(
                            array(
                                'username' => $username,
                                'password' => $password
                            )
                        );
                        $count = $statement->rowCount();
                        if($count > 0)
                            {
                                 $_SESSION["username"] = $username;
                                 header("location:login_success.php");
                            }
                        else
                            {
                                 echo '<p>Wrong password or email</p>';
                            }
                    }
                  } catch(PDOException $e) {
                    echo "Connection failed: " . $e->getMessage();
                  }

?>


<!DOCTYPE html>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - K+LOGIN</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body >

  <div class="container">
    <div class="header">
      <h2>Login</h2>
    </div>
    <form method="post">
      <label for="username">Username : </label>
      <input type="text" name="username">

      <label for="password">password : </label>
      <input type="password" name="password">
      <input type="submit" name="login" class="btn btn-info" value="Login!" />

    </form>

  </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>

