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

      <!--    User Login  -->
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
