<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $required_fields = ['game_name', 'game_des', 'game_cat', 'game_plat', 'game_website'];
    $error_messages = [];
    foreach ($required_fields as $field) {
        if (empty($_POST[$field])) {
            $error_messages[] = "The $field field is required.";
        }
    }
    
    if (empty($error_messages)) {
      $game_name = htmlspecialchars($_POST['game_name']);
      $game_des = htmlspecialchars($_POST['game_des']);
      $game_cat = htmlspecialchars($_POST['game_cat']);
      if ($game_cat === 'Other') {
          $game_cat = htmlspecialchars($_POST['other_game_cat']);
      }
      $game_plat = htmlspecialchars($_POST['game_plat']);
      $game_website = htmlspecialchars($_POST['game_website']);
  
      $sql = "INSERT INTO pending_games (game_name, description, category, platform, website, status)
      VALUES ('$game_name', '$game_des', '$game_cat', '$game_plat', '$game_website', 'Pending')";
  
      if ($link->query($sql) === TRUE) {
          echo "<script>alert('waiting for admin approval');</script>";
      } else {
          echo "Error: " . $sql . "<br>" . $link->error;
      }
  } else {
        foreach ($error_messages as $message) {
            echo "<p>" . htmlspecialchars($message) . "</p>";
        }
    }

    $link->close();
}
?>
<link rel="stylesheet" type="text/css" href="css/AddGames.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Audiowide&display=swap" rel="stylesheet">
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
  <label for="game_name">Game Name:</label>
  <input type="text" name="game_name" id="game_name" required>
  
  <label for="game_des">Game Description:</label>
  <textarea name="game_des" id="game_des" required></textarea>
  
  <label for="game_cat">Game Category:</label>
  <select name="game_cat" id="game_cat">
    <option value="Sandbox">Sandbox</option>
    <option value="Real-time strategy (RTS)">Real-time strategy (RTS)</option>
    <option value="Shooters (FPS and TPS)">Shooters (FPS and TPS)</option>
    <option value="Multiplayer online battle arena (MOBA)">Multiplayer online battle arena (MOBA)</option>
    <option value="Role-playing (RPG, ARPG, and More)">Role-playing (RPG, ARPG, and More)</option>
    <option value="Simulation and sports">Simulation and sports</option>
    <option value="Puzzlers and party games">Puzzlers and party games</option>
    <option value="Action-adventure">Action-adventure</option>
    <option value="Survival and horror">Survival and horror</option>
    <option value="Platformer">Platformer</option>
    <option value="Other">Other</option>
  </select>
  <input type="text" name="other_game_cat" id="other_game_cat" placeholder="Enter other category" style="display:none;">
  
  <script>
    const gameCatDropdown = document.getElementById("game_cat");
    const otherGameCatInput = document.getElementById("other_game_cat");
    gameCatDropdown.addEventListener("change", function() {
      if (gameCatDropdown.value === "Other") {
        otherGameCatInput.style.display = "block";
        otherGameCatInput.setAttribute("required", true);
      } else {
        otherGameCatInput.style.display = "none";
        otherGameCatInput.removeAttribute("required");
      }
    });
  </script>
  
  <label for="game_plat">Game Platform:</label>
  <input type="text" name="game_plat" id="game_plat" required>
  
  <label for="game_website">Game Website:</label>
  <input type="url" name="game_website" id="game_website" required>
  
  <input type="submit" value="Submit">
  <button class="button" onclick="window.location.href='index.php'">Go back to homepage</button>

</form>