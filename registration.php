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
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>

  <div class="container">
    <div class="header">
      <h2>Register</h2>
    </div>
    <form action="registration.php">
      <label for="username">Username : </label>
      <input type="text" name="username">

      <label for="email">email : </label>
      <input type="email" name="email">

      <label for="password">password : </label>
      <input type="password" name="password">

      <button type="submit" name="reg_name">Submit</button>

      Already a user?  <a href="login.php">Login</a>
      <br/>
      <a href="server.php">go to server</a>
    </form>

  </div>

</body>

</html>

