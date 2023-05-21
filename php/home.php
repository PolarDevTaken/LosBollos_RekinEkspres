<?php
// Start the session
session_start();

Check if the user is logged in
if (!isset($_SESSION["username"])) {
    // Redirect to the login page
    header("Location: login_page.php");
    exit();
}

// Display the welcome message

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona główna</title>
    <link rel="stylesheet" href="home_styles.css">
</head>
<body>
    <div class="calosc">
        <header>
            <img class="malpa" src="malpa.png" alt="logo firmy">
            <h2 class="maintxt">REGINEXPRESS</h2>
            <div class="dobra">
            <?php
            echo "Welcome, " . $_SESSION["username"] . "!";
            ?>
            </div>
            <a href="account.php"><img class="pfp" src="pfp.png" alt="profile picture"></a>
        </header>
        <section class="main">
            
            <div class="first">
                <h3>Ship With<span class="orange"> US</span></h3>
                <h5>For lightning fast delivery</h5>
            </div>

            <div class="button">
                <p>Start now!</p>
            </div>
        </section>
    </div>

</body>
</html>
