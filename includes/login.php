<?php
$currentpage=$_SERVER['REQUEST_URI'];
if(isset($_POST['login'])) {
    $email=trim($_POST['email']);
    if (filter_var($email, FILTER_VALIDATE_EMAIL)===false) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=wrong_email'; </script>";
        exit();
    }

    if(isset($_POST['password']))
    {
        if(strlen(trim($_POST['password']))<=0){
            echo "<script type='text/javascript'> document.location = 'index.php?message=empty_password'; </script>";
            exit();
        } elseif (strlen(trim($_POST['password'])) < 5 || strlen(trim($_POST['password'])) > 10) {
            echo "<script type='text/javascript'> document.location = 'index.php?message=wrong_length'; </script>";
            exit();
        }
    }

    $sql ="SELECT EmailId,Password,FullName FROM tblusers WHERE EmailId=:email AND status = '1' ";
    $query= $dbh -> prepare($sql);
    $query-> bindParam(':email', $email, PDO::PARAM_STR);
    $query-> execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    if($query->rowCount() > 0) {
        foreach ($results as $result) {
            if (password_verify(trim($_POST['password']), $result->Password)) {

                $_SESSION['login'] = $_POST['email'];
                $_SESSION['fname'] = $results->FullName;
                $_SESSION['active'] = 1;
                echo "<script type='text/javascript'> document.location = 'index.php?message=successful_login'; </script>";
                exit();
            } else {
                echo "<script type='text/javascript'> document.location = 'index.php?message=invalid_details'; </script>";
                exit();
            }
        }
    } else {
        echo "<script type='text/javascript'> document.location = 'index.php?message=invalid_details'; </script>";
        exit();
    }

}

?>

<div class="modal fade" id="loginform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Login</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="login_wrap">
            <div class="col-md-12 col-sm-6">
              <form method="post" name="login_form">
                <div class="form-group">
                  <input type="email" class="form-control" name="email" placeholder="Email address*">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password*">
                </div>
                <div class="form-group checkbox">
                  <input type="checkbox" id="remember">
               
                </div>
                <div class="form-group">
                  <input type="submit" name="login" value="Login" class="btn btn-block">
                </div>
              </form>
            </div>
           
          </div>
        </div>
      </div>
      <div class="modal-footer text-center">
        <p>Don't have an account? <a href="#signupform" data-toggle="modal" data-dismiss="modal">Signup Here</a></p>
        <p><a href="#forgotpassword" data-toggle="modal" data-dismiss="modal">Forgot Password ?</a></p>
      </div>
    </div>
  </div>
</div>