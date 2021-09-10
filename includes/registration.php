<?php

//error_reporting(0);
if(isset($_POST['signup']))
{
$fname=trim($_POST['fullname']);
$email=trim($_POST['emailid']);
$mobile=trim($_POST['mobileno']);
$password=trim($_POST['password']);
$confpwd=trim($_POST['confirmpassword']);
$hash = md5(rand(0,200));

if (filter_var($email, FILTER_VALIDATE_EMAIL)===false) {
    echo "<script type='text/javascript'> document.location = 'index.php?message=wrong_email'; </script>";
    exit();
}

if(isset($_POST['password'])) {
    if (strlen(trim($password)) <= 0) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=empty_password'; </script>";
        exit();
    } elseif (strlen(trim($password)) < 5 || strlen(trim($password)) > 10) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=wrong_length'; </script>";
        exit();
    }

    if(isset($confpwd)) {
        if($password != $confpwd) {
            echo "<script type='text/javascript'> document.location = 'index.php?message=no_match'; </script>";
            exit();
        }
    }

}

if(isset($mobile)) {
    if(!is_numeric($mobile)) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=not_numeric'; </script>";
        exit();
    } elseif (strlen(trim($mobile)) < 6) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=wrong_length_number'; </script>";
        exit();
    }
}

if(isset($fname)) {
    if(strlen(trim($fname)) < 0) {
        echo "<script type='text/javascript'> document.location = 'index.php?message=empty_name'; </script>";
        exit();
    }
}

$password=password_hash(($_POST['password']), PASSWORD_BCRYPT);
$sql="INSERT INTO  tblusers(FullName,EmailId,ContactNo,Password, Hash) VALUES(:fname,:email,:mobile,:password, :hash)";
$query = $dbh->prepare($sql);
$query->bindParam(':fname',$fname,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
$query->bindParam(':password',$password,PDO::PARAM_STR);
$query->bindParam(':hash',$hash,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
    $to      = $email;
    $subject = 'Verification';
    $message_body = '
        Dear '.$email.',
        Thanks for the registration!
        Click the link below to activate your account:
        http://localhost/bikerental/verify.php?email='.$email.'&hash='.$hash;

    mail( $to, $subject, $message_body );
    echo "<script type='text/javascript'> document.location = 'index.php?message=registration_successful'; </script>";
    exit();
}
else 
{
    echo "<script type='text/javascript'> document.location = 'index.php?message=invalid_details'; </script>";
    exit();
}
}

?>


<script>
function checkAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'emailid='+$("#emailid").val(),
type: "POST",
success:function(data){
$("#user-availability-status").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>
<script type="text/javascript">
function valid()
{
if(document.signup.password.value != document.signup.confirmpassword.value)
{
alert("Password and Confirm Password Field do not match  !!");
document.signup.confirmpassword.focus();
return false;
}
return true;
}
</script>
<div class="modal fade" id="signupform">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="signup_wrap">
            <div class="col-md-12 col-sm-6">
              <form  method="post" name="signup" onSubmit="return valid();">
                <div class="form-group">
                  <input type="text" class="form-control" name="fullname" placeholder="Full Name" required="required">
                </div>
                      <div class="form-group">
                  <input type="text" class="form-control" name="mobileno" placeholder="Mobile Number" maxlength="10" required="required">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="emailid" id="emailid" onBlur="checkAvailability()" placeholder="Email Address" required="required">
                   <span id="user-availability-status" style="font-size:12px;"></span> 
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Confirm Password" required="required">
                </div>
                <div class="form-group">
                  <input type="submit" value="Sign Up" name="signup" id="submit" class="btn btn-block">
                </div>
              </form>
            </div>
            
          </div>
        </div>
      </div>
      <div class="modal-footer text-center">
        <p>Already got an account? <a href="#loginform" data-toggle="modal" data-dismiss="modal">Login Here</a></p>
      </div>
    </div>
  </div>
</div>