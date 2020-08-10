<?php
    session_start();

    require('../database.php');

    if(isset($_POST["login"]))
    {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $query = "SELECT * 
                  FROM admin
                  WHERE admin_id= '$username' AND password = '$password'";
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
          $query = "SELECT * 
                    FROM employer
                        JOIN bill ON (employer.employer_id=bill.user_id)
                        JOIN payment ON (payment.user_id=employer.employer_id)
                    WHERE employer_id= '$employer_id' AND employer_name = '$name'";
          $statement = $conn->prepare($query);
          $statement->execute(
              array(
                  'username' => $employer_id,
                  'password' => $name
              )
          );

          $row = $statement->fetch();
          $employer_name = $row['employer_name'];
//          $employer_bill = $row['bill_amount'];


          $count = $statement->rowCount();
          if($count > 0)
          {
              $_SESSION['applicant_count'] = $count;
              $_SESSION['employer_name'] = $employer_name;
              $_SESSION['employer_id'] = $employer_id;
              $_SESSION['employer_bill'] = $row['bill_amount'];
              $_SESSION['employer_payment'] = $row['payment_amount'];
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
              $_SESSION["user_id"] = $_POST['username'];
             header("location:../user/index.php");
          }
          else
          {
              echo '<p>Wrong user password or email</p>';
          }
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
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>


<body class="bg-gradient-info">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">

                        <div class="col-lg-4">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">User Login</h1>
                                </div>
                                <form class="user" method="post">
                                    <div class="form-group">
                                        <input type="number" class="form-control form-control-user" name="username" placeholder="User ID">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">Remember Me</label>
                                        </div>
                                    </div>
                                    <input type="submit" name="user_login" class="btn btn-user btn-primary btn-block" value="Login" />
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="create_user.php">Create User Account</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Employer Login</h1>
                                </div>
                                <form class="user" method="post">
                                    <div class="form-group">
                                        <input type="number" class="form-control form-control-user" name="employer_id" placeholder="Employer ID">
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="name" placeholder="Employer Name">
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">Remember Me</label>
                                        </div>
                                    </div>
                                    <input type="submit" name="employer_login" class="btn btn-facebook btn-user btn-block" value="Login" />
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="create_employee.php">Create an Employer Account</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Admin Login</h1>
                                </div>
                                <form class="user" method="post">
                                    <div class="form-group">
                                        <input type="number" class="form-control form-control-user" name="username" placeholder="Admin ID">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="password" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">Remember Me</label>
                                        </div>
                                    </div>
                                    <input type="submit" name="login" class="btn btn-google btn-user btn-block" value="Login!" />
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

</body>

</html>

