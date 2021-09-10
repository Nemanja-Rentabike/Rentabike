<?php
session_start();
include('includes/config.php');

// Make sure email and hash variables aren't empty
if(isset($_GET['email']) && !empty($_GET['email']) AND isset($_GET['hash']) && !empty($_GET['hash']))
{
    $email = $_GET['email'];
    $hash = $_GET['hash'];

    $sql ="SELECT * FROM tblusers WHERE EmailId=:email and hash=:hash";
    $query= $dbh -> prepare($sql);
    $query-> bindParam(':email', $email, PDO::PARAM_STR);
    $query-> bindParam(':hash', $hash, PDO::PARAM_STR);
    $query-> execute();
    $results = $query -> fetchAll(PDO::FETCH_OBJ);

    if($query->rowCount() == 0) {

        $_SESSION['message'] = "<div class='text-center alert alert-danger'>The account is already activated or the link is inaccessible !</div>";
        header("location: index.php");
    }
    else {
        $_SESSION['active'] = 1;
        $_SESSION['message'] = "<div class='text-center alert alert-success'>Account is activated !</div>";

        $con="update tblusers set status='1' where EmailId=:email";
        $chngpwd1 = $dbh->prepare($con);
        $chngpwd1-> bindParam(':email', $email, PDO::PARAM_STR);
        $chngpwd1->execute();
        header("location: index.php");
    }
}
else {
    $_SESSION['message'] = "<div class='text-center alert alert-danger'>Incorrect data !</div>";
    header("location: index.php");
}