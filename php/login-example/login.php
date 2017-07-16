<?php
session_start();

include 'includes/dbconnect.php';

if (isset($_POST["username"]) && isset($_POST["password"])) {
  $user_login = preg_replace('#[^A-Za-z0-9]#i', '', $_POST["username"]);
  $password_login = preg_replace('#[^A-Za-z0-9]#i', '', $_POST["password"]);
  $sql = mysqli_query($db, "SELECT id FROM users WHERE username='$user_login'AND password='$password_login' LIMIT 1") or die(mysqli_error($db));
  $userCount = mysqli_num_rows($sql);
  if ($userCount == 1) {
    while ($row = mysqli_fetch_array($sql)) { #Not sure about this loop
      $id = $row["id"];
    }

    $_SESSION['username'] = $user_login;
    header("Location: welcome.php");
  }
  else {
    echo '<div class="echo">Username/Password is incorrect</div>';
    include 'login.html';
    exit();
  }
}

?>
