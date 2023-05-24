<?php
// Start the session
session_start();

// Check if the user is logged in
if (!isset($_SESSION["user_id"])) {
    // Redirect to the login page
    header("Location: index.php");
    exit();
}

// Establish a database connection
$servername = "localhost";
$database = "delivery";
$username_db = "root";
$password_db = "";

// Create a new PDO instance
$conn = new PDO("mysql:host=$servername;dbname=$database", $username_db, $password_db);

// Prepare and execute the query to fetch user credentials
$stmt = $conn->prepare("SELECT * FROM users WHERE id = :id");
$stmt->bindParam(":id", $_SESSION["user_id"]);
$stmt->execute();
$user = $stmt->fetch();

// Handle form submission for updating credentials
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $newUsername = $_POST["newUsername"];
    $newPassword = $_POST["newPassword"];

    // Update the user's credentials in the database
    $updateStmt = $conn->prepare("UPDATE users SET username = :username, password = :password WHERE id = :id");
    $updateStmt->bindParam(":username", $newUsername);
    $updateStmt->bindParam(":password", password_hash($newPassword, PASSWORD_DEFAULT));
    $updateStmt->bindParam(":id", $_SESSION["user_id"]);
    $updateStmt->execute();

    $role = "";
    if ($user["role"] == 3) {
        $role = "Admin";
    } elseif ($user["role"] == 2) {
        $role = "Deliveryman";
    } elseif ($user["role"] == 1) {
        $role = "User";
    }

    // Redirect to account.php
    header("Location: account.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Account Management</title>
    <link rel="stylesheet" href="../css/account_styles.css">
</head>
<body>
    <div class="main_container">
    <h1>Account Management</h1>


    <div class="pfp_container">
        <div class="pfp"></div>
        <h3 class="rank"><?php     
                if ($user["role"] == 3) {
                    echo("ADMIN");
                } elseif ($user["role"] == 2) {
                    echo("DELIVERY");
                } elseif ($user["role"] == 1) {
                    echo("USER");
                }
            ?></h3>
    </div>



    <p class="greeting">Welcome, <?php echo $user["username"]; ?>!</p>
    
    <h3>Change Credentials</h3>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
        <div class="txt_field">
            <input type="text" id="newUsername" name="newUsername" required>
            <span></span>
            <label for="newUsername">New Username:</label>
        </div>
        <div class="txt_field">
        <input type="password" id="newPassword" name="newPassword" required>
        <span></span>
        <label for="newPassword">New Password:</label>
        </div>
        <input type="submit" value="Change Credentials">
    </form>
    </div>
    <script src="../js/roles.js"></script>
</body>
</html>
