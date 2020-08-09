<?php
 session_start();

 if(isset($_SESSION))
 {
     echo $_SESSION["debug"];
      echo '<h3>Login ADMIN VIEW Success, Welcome - '.$_SESSION["username"].'</h3>';
      echo '<br /><br /><a href="logout.php">Logout</a><br/>';
 }
 else
 {
    echo "login unsuccessful";
 }
 ?>
