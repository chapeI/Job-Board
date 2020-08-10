<?php
session_start();
require('../database.php');
$user_id = $_SESSION['user_id'];
//$app_id = $_SESSION['app_count'] + 1;
$employer_id = $_GET['employer_id'];
$posting_id = $_GET['posting_id'];
//echo $user_id;
//echo '<br/>';
////echo $app_id;
//echo '<br/>';
//echo $employer_id;
//echo '<br/>';
//echo $posting_id;
//echo '<br/>';


    $sql_ = 'SELECT * FROM application';
    $statement_ = $conn->prepare($sql_);
    $statement_->execute();
    $count = $statement_->rowCount();
//    echo $count;
//    echo '<br/>';

    $app_id = $count +1;
//    echo $app_id;

    $sql = 'INSERT INTO application(job_seeker_id, application_id, employer_id, posting_id) VALUES (?, ?, ?, ?)';
    $statement = $conn->prepare($sql);

    if($statement->execute([$user_id, $app_id, $employer_id, $posting_id])){
        $message = 'Applied';
//        echo $message;
    }

    ?>

<!DOCTYPE html>

<html lang="en">

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">

<div class="card" style="width: 18rem; margin: 100px">
    <div class="card-body">
        <h1 class="card-title">Application Successful</h1>
        <p class="card-text">Go back to Previous Page!</p>
    </div>
</div>


</html>
