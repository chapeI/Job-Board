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


//    $stmt = $conn->prepare('INSERT INTO posting (employer_id, posting_id, title, description) VALUES (?, ?, ?, ?)');
//    $stmt->execute([
//        2, 8, 'IT ', 'plug in more wires'
//    ]);

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
                 echo '<p>Wrong admin password or email</p>';
            }
    }



      if(isset($_POST["employer_login"]))
      {
          $employer_id = $_POST['employer_id'];
          $name = $_POST['name'];
          $query = "SELECT * FROM employer WHERE employer_id= '$employer_id' AND employer_name = '$name'";
          $statement = $conn->prepare($query);
          $statement->execute(
              array(
                  'username' => $employer_id,
                  'password' => $name
              )
          );

          $row = $statement->fetch();
          $employer_name = $row['employer_name'];


          $count = $statement->rowCount();
          if($count > 0)
          {
              $_SESSION['employer_name'] = $employer_name;
              $_SESSION['employer_id'] = $employer_id;
              $_SESSION['debug'] = 'debugging';
    //                              $_SESSION['employer_name'] = 'Google';
              header('location:../employer/index.php');
          }
          else
          {
              echo '<p>Wrong Employer ID or Employer Name</p>';
          }
      }



      if(isset($_POST["user_login"]))
      {
          $username = $_POST['username'];
          $password = $_POST['password'];
          $query = "SELECT * FROM users WHERE user_id= '$username' AND password = '$password'";
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
              echo '<p>Wrong user password or email</p>';
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

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body >

  <div class="container" style="border: 1px solid red">

    <!--    Admin Login  -->
    <div class="header">
      <h2>Admin Login</h2>
    </div>
    <form method="post">
      <label for="username">Admin ID : </label>
      <input type="text" name="username">

      <label for="password">password : </label>
      <input type="password" name="password">
      <input type="submit" name="login" class="btn btn-info" value="Login!" />

    </form>

  </div>

  <div class="container" style="border: 1px solid blue; margin-top: 100px">

      <!--    Employer Login  -->
      <div class="header" >
          <h2>Employer Login</h2>
      </div>
      <form method="post">
          <label for="employer_id">Employer ID : </label>
          <input type="text" name="employer_id">

          <label for="name">Employer Name : </label>
          <input type="text" name="name">
          <input type="submit" name="employer_login" class="btn btn-info" value="Login!" />

      </form>

  </div>



  <div class="container" style="border: 1px solid green; margin-top: 100px">

      <!--    Employer Login  -->
      <div class="header" >
          <h2>User Login</h2>
      </div>
      <form method="post">
          <label for="username">User ID : </label>
          <input type="text" name="username">

          <label for="password">password : </label>
          <input type="password" name="password">
          <input type="submit" name="user_login" class="btn btn-info" value="Login!" />

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

