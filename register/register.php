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

    if(isset($_POST['add_user']))
    {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $stmt = $conn->prepare('INSERT INTO users (email,password) VALUES (?, ?)');
        $stmt->execute([
            $email, $password
        ]);
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

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>

              <form method="POST" class="user">
                <div class="form-group row">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="exampleInputEmail" name = "email" placeholder="Email Address">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" name = "password" id="exampleInputPassword" placeholder="Password">
                  </div>
                  <br><br>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div>
                </div>
                <br><br>
                <input type="submit" name="add_user" class="btn btn-info float-right" value="Register" />
                <br><br><br><br><br><br>
              </form>
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Employer</th>
                      <th>Time Posted</th>
                      <th>Title</th>
                      <th>Description</th>
                      <th>Number of Openings</th>
                    </tr>
                  </thead>
                  <tbody>

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
                    $query_string = "SELECT * FROM users";
                        $query = $conn-> prepare($query_string);
                        $query->execute();
                        while($row = $query-> fetch()) {
                            echo "<tr><td>". $row["user_id"]. "</td><td>". $row["email"].
                                "</td><td>". $row["password"];
                        }
                    ?>
                  </tbody>
                </table>
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
