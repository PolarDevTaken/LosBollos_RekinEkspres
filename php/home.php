<?php
// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION["username"])) {
    // Redirect to the login page
    header("Location: login_page.php");
    exit();
}

// Display the welcome message
echo "Welcome, " . $_SESSION["username"] . "!";
?>
