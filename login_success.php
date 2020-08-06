<?php

echo 'debug1';

session_start();
echo 'debug2';

if(isset($_SESSION["username"]))
{
    echo 'debug3';
    echo '<h3>login success, welcome '._SESSION["username"].'</h3>';
}

?>
