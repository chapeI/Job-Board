<?php
session_start();
require('../database.php');
$user_id = $_SESSION['user_id'];
//$app_id = $_SESSION['app_count'] + 1;
$employer_id = $_GET['employer_id'];
$posting_id = $_GET['posting_id'];
//echo $user_id;
//echo '<br/>';
//echo $app_id;
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
        echo $message;
    }


