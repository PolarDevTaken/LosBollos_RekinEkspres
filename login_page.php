<!DOCTYPE html>
<html>
<head>
    <title>Login to your account</title>
    <link rel="stylesheet" href="../css/loginstyles.css">
</head>
<body>

<div class="center">
<h1>Login</h1>
    <form method="post" action="login.php">

        <div class="txt_field">
            <input type="text" id="username" name="username" required>
            <span></span>
            <label>Username:</label>
        </div>

        <div class="txt_field">
            <input type="password" id="password" name="password" required>
            <span></span>
            <label>Password</label>
        </div>

        <div class="pass">Forgot Password?</div>


        <div class="signup_link">
          <a href="#">Not a member? Sign up!</a>
          </div>
        <input type="submit" value="Login">

    </form>
    </div>
</body>
</html>