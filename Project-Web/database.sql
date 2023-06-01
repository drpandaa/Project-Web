-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 11:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `regsiter`
--
CREATE DATABASE IF NOT EXISTS `regsiter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `regsiter`;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_name` varchar(50) NOT NULL,
  `game_des` text NOT NULL,
  `game_cat` varchar(50) NOT NULL,
  `game_plat` varchar(50) NOT NULL,
  `game_website` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `game_name`, `game_des`, `game_cat`, `game_plat`, `game_website`) VALUES
(45, 'sdfdsf', 'dfdfd', 'Multiplayer online battle arena (MOBA)', 'dfdfdf', 'https://evil.com');

-- --------------------------------------------------------

--
-- Table structure for table `pending_games`
--

CREATE TABLE `pending_games` (
  `id` int(11) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(50) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `website` varchar(255) NOT NULL,
  `status` enum('pending','approved','denied') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT current_timestamp(),
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `reg_date`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$zfj2iMT33f82FEaMwR9YF./bRo0ccBccNZf0gDJdVLyOFxEz/s5vK', '0000-00-00 00:00:00'),
(17, 'test', 'test@test.com', '$2y$10$phl5PmSzy5z0yXBlbevrAuoc4S4pZAk3GkpmXYpRzcSgqdo2znsXm', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pending_games`
--
ALTER TABLE `pending_games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pending_games`
--
ALTER TABLE `pending_games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Grand Theft Auto V", "An action-adventure video game developed by Rockstar North.", "Action", "PlayStation 4", "https://www.rockstargames.com/V");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Minecraft", "A sandbox video game created by Markus Persson.", "Adventure", "PC", "https://www.minecraft.net");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("The Legend of Zelda: Breath of the Wild", "An action-adventure game developed and published by Nintendo.", "Adventure", "Nintendo Switch", "https://www.zelda.com/breath-of-the-wild");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("FIFA 21", "A football simulation video game published by Electronic Arts.", "Sports", "Xbox One", "https://www.ea.com/fifa-21");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Fortnite", "A battle royale game developed and published by Epic Games.", "Shooter", "iOS", "https://www.epicgames.com/fortnite");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Red Dead Redemption 2", "An action-adventure game developed and published by Rockstar Games.", "Action", "Xbox One", "https://www.rockstargames.com/reddeadredemption2");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Call of Duty: Modern Warfare", "A first-person shooter game developed by Infinity Ward.", "Shooter", "PlayStation 5", "https://www.callofduty.com/modernwarfare");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Among Us", "A multiplayer online game developed and published by InnerSloth.", "Party", "Android", "https://www.innersloth.com/gameAmongUs.php");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Super Mario Odyssey", "A platform game published by Nintendo for the Nintendo Switch.", "Platformer", "Nintendo Switch", "https://www.nintendo.com/super-mario-odyssey");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Overwatch", "A team-based multiplayer first-person shooter game developed and published by Blizzard Entertainment.", "Shooter", "PC", "https://playoverwatch.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Assassin's Creed Valhalla", "An action role-playing game developed and published by Ubisoft.", "Action", "Xbox Series X", "https://www.ubisoft.com/en-us/game/assassins-creed/valhalla");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Genshin Impact", "An action role-playing game developed and published by miHoYo.", "Adventure", "PlayStation 4", "https://genshin.mihoyo.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("The Last of Us Part II", "An action-adventure game developed by Naughty Dog.", "Action", "PlayStation 4", "https://www.thelastofus.playstation.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("League of Legends", "A multiplayer online battle arena game developed and published by Riot Games.", "MOBA", "PC", "https://www.leagueoflegends.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Mortal Kombat 11", "A fighting game developed by NetherRealm Studios.", "Fighting", "Nintendo Switch", "https://www.mortalkombat.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Animal Crossing: New Horizons", "A life simulation game developed and published by Nintendo.", "Simulation", "Nintendo Switch", "https://www.animal-crossing.com/new-horizons");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Cyberpunk 2077", "An open-world action-adventure game developed and published by CD Projekt.", "RPG", "PC", "https://www.cyberpunk.net");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Among Trees", "An adventure game developed and published by FJRD Interactive.", "Adventure", "PC", "https://www.amongtreesgame.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Final Fantasy VII Remake", "A role-playing game developed and published by Square Enix.", "RPG", "PlayStation 4", "https://www.finalfantasyviiremake.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Super Smash Bros. Ultimate", "A crossover fighting game published by Nintendo for the Nintendo Switch.", "Fighting", "Nintendo Switch", "https://www.smashbros.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("The Witcher 3: Wild Hunt", "An action role-playing game developed and published by CD Projekt.", "Action", "Xbox One", "https://www.thewitcher.com");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Apex Legends", "A free-to-play battle royale game developed by Respawn Entertainment.", "Shooter", "PC", "https://www.ea.com/apex-legends");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Pokémon Sword and Shield", "Role-playing games developed by Game Freak and published by Nintendo and The Pokémon Company.", "RPG", "Nintendo Switch", "https://www.pokemon.com/sword-shield");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Assassin's Creed Valhalla", "An action role-playing game developed and published by Ubisoft.", "Action", "PlayStation 5", "https://www.ubisoft.com/en-us/game/assassins-creed/valhalla");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("FIFA 22", "A football simulation video game published by Electronic Arts.", "Sports", "PC", "https://www.ea.com/fifa-22");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Cyberpunk 2077", "An action role-playing game developed and published by CD Projekt.", "RPG", "Xbox Series X", "https://www.cyberpunk.net");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Super Smash Bros. Ultimate", "A crossover fighting game published by Nintendo.", "Fighting", "Nintendo Switch", "https://www.smashbros.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("The Witcher 3: Wild Hunt", "An action role-playing game developed and published by CD Projekt.", "RPG", "PC", "https://thewitcher.com/witcher3");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("League of Legends", "A multiplayer online battle arena video game developed and published by Riot Games.", "MOBA", "PC", "https://na.leagueoflegends.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Resident Evil Village", "A survival horror game developed and published by Capcom.", "Horror", "PlayStation 5", "https://www.residentevil.com/village/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Hades", "An action roguelike game developed and published by Supergiant Games.", "Action", "Nintendo Switch", "https://www.supergiantgames.com/games/hades/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Madden NFL 22", "An American football video game published by Electronic Arts.", "Sports", "Xbox Series X", "https://www.ea.com/madden-nfl-22");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Star Wars Jedi: Fallen Order", "An action-adventure game developed by Respawn Entertainment and published by Electronic Arts.", "Action", "PlayStation 4", "https://www.ea.com/starwars/jedi-fallen-order");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Minecraft Dungeons", "An action role-playing game developed by Mojang Studios.", "Adventure", "PC", "https://www.minecraft.net/en-us/about-dungeons/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("God of War", "An action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment.", "Action", "PlayStation 4", "https://www.playstation.com/en-us/games/god-of-war/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Final Fantasy VII Remake", "A role-playing game developed and published by Square Enix.", "RPG", "PlayStation 4", "https://ffvii-remake.square-enix-games.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("World of Warcraft", "A massively multiplayer online role-playing game developed and published by Blizzard Entertainment.", "MMORPG", "PC", "https://worldofwarcraft.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Genshin Impact", "An action role-playing game developed and published by miHoYo.", "RPG", "Android", "https://genshin.mihoyo.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("F1 2021", "A racing video game published by Electronic Arts.", "Racing", "Xbox Series X", "https://www.formula1game.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Borderlands 3", "A first-person shooter game developed by Gearbox Software.", "Shooter", "PC", "https://borderlands.com/en-US/games/borderlands-3/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("NBA 2K22", "A basketball simulation video game developed by Visual Concepts.", "Sports", "PlayStation 5", "https://nba.2k.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Sea of Thieves", "An action-adventure game developed by Rare and published by Xbox Game Studios.", "Adventure", "Xbox Series X", "https://www.seaofthieves.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Sekiro: Shadows Die Twice", "An action-adventure game developed by FromSoftware and published by Activision.", "Action", "PC", "https://www.sekirothegame.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("The Elder Scrolls V: Skyrim", "An action role-playing game developed by Bethesda Game Studios.", "RPG", "PlayStation 4", "https://elderscrolls.bethesda.net/en/skyrim");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Crash Bandicoot 4: It's About Time", "A platform game developed by Toys for Bob and published by Activision.", "Platformer", "PlayStation 5", "https://www.crashbandicoot.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Valorant", "A free-to-play first-person shooter game developed and published by Riot Games.", "Shooter", "PC", "https://playvalorant.com/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Sims 4", "A life simulation game developed by Maxis and published by Electronic Arts.", "Simulation", "PC", "https://www.ea.com/games/the-sims/the-sims-4");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Tom Clancy's Rainbow Six Siege", "A tactical first-person shooter game developed and published by Ubisoft.", "Shooter", "Xbox One", "https://www.ubisoft.com/en-us/game/rainbow-six/siege");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Monster Hunter Rise", "An action role-playing game developed and published by Capcom.", "RPG", "Nintendo Switch", "https://www.monsterhunter.com/rise/us/");
INSERT INTO games (game_name, game_des, game_cat, game_plat,game_website) values ("Death Stranding", "An action game developed by Kojima Productions and published by Sony Interactive Entertainment.", "Action", "PlayStation 4", "https://www.kojimaproductions.jp/en/death_stranding.html");