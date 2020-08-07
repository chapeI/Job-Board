<?php
 session_start();

 if(isset($_SESSION))
 {
      echo '<h3>Login Success, Welcome - '.$_SESSION["username"].'</h3>';
      echo '<br /><br /><a href="logout.php">Logout</a><br/>';
 }
 else
 {
    echo "no guac";
 }
 ?>
