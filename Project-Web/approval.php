<?php
include 'config.php';
session_start();


if ($_SESSION["username"] !== 'admin') {
  header('Location: login.php');
  exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (isset($_POST['approve'])) {
    $game_id = $_POST['game_id'];
    $sql = "UPDATE pending_games SET status='approved' WHERE id='$game_id'";
    mysqli_query($link, $sql);
    $sql = "SELECT game_name, description, category, platform, website FROM pending_games WHERE status='approved'";
$result = $link->query($sql);

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $gameName = $row["game_name"];
    $gameDes = $row["description"];
    $gameCat = $row["category"];
    $gamePlat = $row["platform"];
    $gameWebsite = $row["website"];

    $sql = "INSERT INTO games (game_name, game_des, game_cat, game_plat, game_website) VALUES ('$gameName', '$gameDes', '$gameCat', '$gamePlat', '$gameWebsite')";
    if ($link->query($sql) !== TRUE) {
      echo "Error: " . $sql . "<br>" . $link->error;
    }
  }


  $sql = "DELETE FROM pending_games WHERE status='approved'";
  if ($link->query($sql) !== TRUE) {
    echo "Error deleting record: " . $link->error;
  }
}

  } elseif (isset($_POST['deny'])) {
    $game_id = $_POST['game_id'];
    $sql = "UPDATE pending_games SET status='denied' WHERE id='$game_id'";
    mysqli_query($link, $sql);
  }
}

$sql = "SELECT * FROM pending_games";
$result = mysqli_query($link, $sql);
$link->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pending Games</title>
  <link rel="stylesheet" type="text/css" href="css/pendingGames.css">
</head>

<body>
  <table>
    <thead>
      <tr>
        <th>Game Name </th>
        <th>Description </th>
        <th>Category </th>
        <th>Platform </th>
        <th>Website </th>
        <th>Status </th>
        <th>Action </th>
      </tr>
    </thead>
    <tbody>
      <?php while ($row = mysqli_fetch_assoc($result)) { ?>
      <tr>
        <td><?php echo $row['game_name']; ?></td>
        <td><?php echo $row['description']; ?></td>
        <td><?php echo $row['category']; ?></td>
        <td><?php echo $row['platform']; ?></td>
        <td><?php echo $row['website']; ?></td>
        <td><?php echo $row['status']; ?></td>
        <td>
          <?php if ($row['status'] == 'pending') { ?>
          <form method="post">
            <input type="hidden" name="game_id" value="<?php echo $row['id']; ?>">
            <input type="submit" name="approve" value="Approve">
            <input type="submit" name="deny" value="Deny">
          </form>
          <?php }  ?>
        </td>
      </tr>
      <?php }  ?>
    </tbody>
  </table>
  <button id="buttonApprovalHome" onclick="window.location.href='index.php'">Go back to homepage</button>
</body>

</html>
