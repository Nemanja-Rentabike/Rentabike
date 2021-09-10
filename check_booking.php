<?php
session_start();
require_once("includes/config.php");
// code user email availablity
if(!empty($_POST["testimonial"])) {
    $testimonial= trim($_POST["testimonial"]);
    $date = date('Y-m-d H:i:s');
    if (strlen(trim($testimonial)) < 20) {
        echo "Field must contain at least 20 characters!";
        exit();
    } else {
        $sql ="SELECT userEmail FROM tblbooking WHERE userEmail=:email AND status = '1' ";
        $query= $dbh -> prepare($sql);
        $query-> bindParam(':email', $_SESSION['login'], PDO::PARAM_STR);
        $query-> execute();
        $results = $query -> fetchAll(PDO::FETCH_OBJ);
        $cnt=1;
        if($query -> rowCount() > 0)
        {

            $sql_check_date = "SELECT PostingDate FROM tbltestimonial WHERE userEmail=:email ORDER BY PostingDate DESC LIMIT 1";
            $query_1= $dbh -> prepare($sql_check_date);
            $query_1-> bindParam(':email', $_SESSION['login'], PDO::PARAM_STR);
            $query_1-> execute();
            $result = $query_1 -> fetchColumn();
            $cnt=1;
            if($query_1 -> rowCount() > 0) {
                $diff = abs(strtotime($date) - strtotime($result));
                $years   = floor($diff / (365*60*60*24));
                $months  = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));
                $days    = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));
                $hours   = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24)/ (60*60));

                if($hours == 0) {
                    echo "<div class='alert alert-danger'>It is not possible to post two comments in a short period of time!</div>";
                    echo "<script>document.getElementById('testimonial').value = ''</script>";
                    exit();
                }

                $sql="INSERT INTO  tbltestimonial(UserEmail,Testimonial,PostingDate) VALUES(:email,:testimonial,:postingdate)";
                $query = $dbh->prepare($sql);
                $query->bindParam(':email',$_SESSION['login'],PDO::PARAM_STR);
                $query->bindParam(':testimonial',$testimonial,PDO::PARAM_STR);
                $query->bindParam(':postingdate',$date,PDO::PARAM_STR);
                $query->execute();
                $lastInsertId = $dbh->lastInsertId();

                if($lastInsertId) {
                    echo "<div class='alert alert-success'>Successfully added!</div>";
                    echo "<script>document.getElementById('testimonial').value = ''</script>";
                } else {
                    echo "<div class='alert alert-danger'>Something went wrong!</div>";
                    echo "<script>document.getElementById('testimonial').value = ''</script>";
                }

            } else {
                $sql="INSERT INTO  tbltestimonial(UserEmail,Testimonial,PostingDate) VALUES(:email,:testimonial,:postingdate)";
                $query = $dbh->prepare($sql);
                $query->bindParam(':email',$_SESSION['login'],PDO::PARAM_STR);
                $query->bindParam(':testimonial',$testimonial,PDO::PARAM_STR);
                $query->bindParam(':postingdate',$date,PDO::PARAM_STR);
                $query->execute();
                $lastInsertId = $dbh->lastInsertId();

                if($lastInsertId) {
                    echo "<div class='alert alert-success'>Successfully added!</div>";
                    echo "<script>document.getElementById('testimonial').value = ''</script>";
                } else {
                    echo "<div class='alert alert-danger'>Something went wrong!</div>";
                    echo "<script>document.getElementById('testimonial').value = ''</script>";
                }
            }
        } else{
            echo "<div class='alert alert-danger'>You must have at least one booking before leaving a comment!</div>";
            echo "<script>document.getElementById('testimonial').value = ''</script>";
        }
    }
} else {
    echo "Field cannot be empty!";
    exit();
}
?>
