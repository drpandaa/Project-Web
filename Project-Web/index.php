<?php
include 'config.php';
session_start();

if (!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== TRUE) {
  header('Location: '.'login.php');
  exit;
}


$username = $_SESSION["username"];
$sql = "SELECT id FROM users WHERE username = '$username'";
$result = mysqli_query($link, $sql);
$row = mysqli_fetch_assoc($result);
$user_id = $row["id"];

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User login system</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Audiowide&display=swap" rel="stylesheet">
  <link rel="shortcut icon" href="./img/favicon-16x16.png" type="image/x-icon">
</head>

<body>
  <div class="container">
    <div class="alert alert-success my-5">
      Welcome ! You are now signed in to your account.
    </div>
    <div class="row justify-content-center">
      <div class="col-lg-5 text-center">
        <h4> Hello,</h4><h4 class="my-4"><?= htmlspecialchars($_SESSION["username"]); ?></h4>
      
        <button id="buttonsAddandPend" onclick="location.href='addingGames.php'">Add Your Games</button>
        <br>
        <?php

        if ($user_id == 1) {
            echo "<button id=buttonsAddandPend onclick=\"location.href='approval.php'\">Pending Games Approval</button>";
        } else {
          $sql = "SELECT game_name, game_des, game_cat, game_plat, game_website FROM games";
          $result = $link->query($sql);
        }
        ?>
<!DOCTYPE html>
<html>
  <head>
    <title>Games</title>
    <script src="js/search.js"></script>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/searchColor.css">
    
    

  </head>
  <body>
 
      
      <?php
      if ($user_id != 1) {
        echo '<input type="text" id="search-input" onkeyup="searchTable()" placeholder="Search...">';
        echo "<a class=\"logoutFromUser\" href=\"./logout.php\" >Log Out of User</a>";
        echo "<h1 id=\"games-title\">List Of Games</h1>" ;
        echo "<div class=\"tableContainer\">";
        echo "<table id=\"games-table\">";
        echo "<thead>";
        echo "<tr>";
        echo "<th>Game Name</th>";
        echo "<th>Game Description</th>";
        echo "<th>Game Category</th>";
        echo "<th>Game Platform</th>";
        echo "<th>Game Website</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
      }

      ?>
          <?php
          if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
              echo "<tr>";
              echo "<td>" . htmlspecialchars($row["game_name"]) . "</td>";
              echo "<td>" . htmlspecialchars($row["game_des"]) . "</td>";
              echo "<td>" . htmlspecialchars($row["game_cat"]) . "</td>";
              echo "<td>" . htmlspecialchars($row["game_plat"]) . "</td>";
              echo "<td>" . htmlspecialchars($row["game_website"]) . "</td>";
              echo "</tr>";
            }
          } else {
            echo "<tr><td colspan='5'>0 results</td></tr>";
          }
          ?>
        </tbody>
      </table>
    </div>
  </body>
</html>

<?php
$link->close();
?>  
      </div>
    </div>
  </div>

<?php
if ($user_id == 1) {
  echo "<a id=\"logoutAdmin\" href=\"./logout.php\" >Log Out</a>";
}
?>
</body>
</html>
