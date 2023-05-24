<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the submitted username and password
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Establish a database connection
    $servername = "localhost";
    $database = "delivery";
    $username_db = "root";
    $password_db = "id20804996_regindatabase";

    // Create a new PDO instance
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username_db, $password_db);

    // Prepare and execute the query to fetch user credentials
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username");
    $stmt->bindParam(":username", $username);
    $stmt->execute();
    $user = $stmt->fetch();

    // Check if the user exists and the password is correct
    if ($user && $password === $user['password']) {
        // Start a new session
        session_start();

        // Store the user ID in the session
        $_SESSION["user_id"] = $user["id"];

        // Redirect to the home page or any other protected page
        header("Location: account.php");
        exit();
    } else {
        // Display an error message
        echo "Invalid username or password.";
    }
}
?>

