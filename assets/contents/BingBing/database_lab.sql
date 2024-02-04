-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bing_bing
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `Game_ID` int NOT NULL AUTO_INCREMENT,
  `Winner` int NOT NULL,
  `Loser` int NOT NULL,
  `Game_date` date NOT NULL,
  `Battle_duration` time NOT NULL,
  `Game_mode_ID` varchar(255) NOT NULL,
  `Arena` varchar(255) NOT NULL,
  PRIMARY KEY (`Game_ID`),
  UNIQUE KEY `Game_ID` (`Game_ID`),
  KEY `game_ibfk_1` (`Game_mode_ID`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`Game_mode_ID`) REFERENCES `game_mode` (`Game_mode_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,1,2,'2020-01-01','00:30:23','GM001','Replican'),(2,3,10,'2020-01-05','00:04:23','GM001','TDM'),(3,9,4,'2020-02-02','00:03:23','GM003','TDM'),(4,7,6,'2020-02-23','00:23:23','GM002','Champion'),(5,5,8,'2020-03-02','00:12:23','GM002','Replican');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_mode`
--

DROP TABLE IF EXISTS `game_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_mode` (
  `Game_mode_ID` varchar(255) NOT NULL,
  `Mode_type` varchar(255) NOT NULL,
  PRIMARY KEY (`Game_mode_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_mode`
--

LOCK TABLES `game_mode` WRITE;
/*!40000 ALTER TABLE `game_mode` DISABLE KEYS */;
INSERT INTO `game_mode` VALUES ('GM001','Brawl'),('GM002','Human vs AI'),('GM003','Classic');
/*!40000 ALTER TABLE `game_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero` (
  `Hero_ID` varchar(255) NOT NULL,
  `Hero_name` varchar(255) NOT NULL,
  `Hero_role` varchar(255) NOT NULL,
  `Hero_speciality` varchar(255) NOT NULL,
  `In_diamonds` int DEFAULT NULL,
  `In_battle_points` int DEFAULT NULL,
  PRIMARY KEY (`Hero_ID`),
  UNIQUE KEY `Hero_ID` (`Hero_ID`),
  UNIQUE KEY `Hero_name` (`Hero_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero`
--

LOCK TABLES `hero` WRITE;
/*!40000 ALTER TABLE `hero` DISABLE KEYS */;
INSERT INTO `hero` VALUES ('H001','Rafaela','Fighter','Charge',250,2500),('H002','Fanny','Fighter','Charge',250,2500),('H003','Dark Rose','Assassin','Reap',320,3200),('H004','Tigreal','Assassin','Reap',250,2500),('H005','Estes','Tank','Regen',150,1500),('H006','Cyclope','Tank','Regen',180,1800),('H007','Lolita','Support','stealth',200,2000),('H008','Clint','Assassin','Reap',290,2900);
/*!40000 ALTER TABLE `hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_skin`
--

DROP TABLE IF EXISTS `hero_skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero_skin` (
  `PH_ID` varchar(255) NOT NULL,
  `Skin_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`PH_ID`,`Skin_ID`),
  KEY `Skin_ID` (`Skin_ID`),
  CONSTRAINT `hero_skin_ibfk_1` FOREIGN KEY (`PH_ID`) REFERENCES `player_hero` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hero_skin_ibfk_2` FOREIGN KEY (`Skin_ID`) REFERENCES `skin` (`Skin_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_skin`
--

LOCK TABLES `hero_skin` WRITE;
/*!40000 ALTER TABLE `hero_skin` DISABLE KEYS */;
INSERT INTO `hero_skin` VALUES ('PH006','SK0010'),('PH002','SK003'),('PH005','SK005'),('PH002','SK006'),('PH003','SK007'),('PH005','SK008'),('PH004','SK009');
/*!40000 ALTER TABLE `hero_skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_chosen`
--

DROP TABLE IF EXISTS `mode_chosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mode_chosen` (
  `Player_ID` int NOT NULL,
  `Game_mode_ID` varchar(255) NOT NULL,
  KEY `Player_ID` (`Player_ID`),
  KEY `Game_mode_ID` (`Game_mode_ID`),
  CONSTRAINT `mode_chosen_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mode_chosen_ibfk_2` FOREIGN KEY (`Game_mode_ID`) REFERENCES `game_mode` (`Game_mode_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_chosen`
--

LOCK TABLES `mode_chosen` WRITE;
/*!40000 ALTER TABLE `mode_chosen` DISABLE KEYS */;
INSERT INTO `mode_chosen` VALUES (2,'GM001'),(5,'GM003'),(4,'GM002'),(3,'GM001'),(3,'GM003');
/*!40000 ALTER TABLE `mode_chosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_statistics`
--

DROP TABLE IF EXISTS `personal_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_statistics` (
  `Player_ID` int NOT NULL,
  `Most_used_hero` varchar(255) NOT NULL,
  `Previous_game_result` varchar(255) NOT NULL,
  `Additional_result` varchar(255) NOT NULL,
  PRIMARY KEY (`Player_ID`),
  CONSTRAINT `personal_statistics_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_statistics`
--

LOCK TABLES `personal_statistics` WRITE;
/*!40000 ALTER TABLE `personal_statistics` DISABLE KEYS */;
INSERT INTO `personal_statistics` VALUES (2,'H001','lose','score=0'),(4,'H003','lose','score=9'),(5,'H004','lose','score=3'),(6,'H007','win','score=40'),(7,'H002','lose','score=4'),(8,'H006','win','score=30'),(9,'H006','lose','score=4');
/*!40000 ALTER TABLE `personal_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_ID` int NOT NULL AUTO_INCREMENT,
  `Player_name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Online_status` bit(20) DEFAULT NULL,
  `Global_level` int NOT NULL,
  `Diamonds_collected` int DEFAULT NULL,
  `Battle_points` int DEFAULT NULL,
  PRIMARY KEY (`Player_ID`),
  UNIQUE KEY `Player_ID` (`Player_ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (2,'Suraz','suraz332@gmail.com','suraz',_binary '\0\0',74,1250,220),(3,'Sandy','giri32@gmail.com','sandy77',_binary '\0\0\0',44,950,3342),(4,'Ronal','Ronal7@gmail.com','Ronal7',_binary '\0\0',54,440,2222),(5,'Sandesh','sandesh12@gmail.com','sandesh12',_binary '\0\0',34,240,1422),(6,'Lionel','lionel10@gmail.com','lionel10',_binary '\0\0\0',54,556,4422),(7,'Wade Wilson','wilson20@gmail.com','Wilson20',_binary '\0\0',33,556,422),(8,'Erangle','erangle@gmail.com','erangle',_binary '\0\0\0',3,6,42),(9,'Steve Rogers','rogers@gmail.com','rogers',_binary '\0\0\0',4,33,122);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_hero`
--

DROP TABLE IF EXISTS `player_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_hero` (
  `PH_ID` varchar(255) NOT NULL,
  `Player_ID` int NOT NULL,
  `Hero_ID` varchar(255) NOT NULL,
  `Hero_level` int NOT NULL,
  PRIMARY KEY (`PH_ID`),
  UNIQUE KEY `PH_ID` (`PH_ID`),
  KEY `Player_ID` (`Player_ID`),
  KEY `Hero_ID` (`Hero_ID`),
  CONSTRAINT `player_hero_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_hero_ibfk_2` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`Hero_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_hero`
--

LOCK TABLES `player_hero` WRITE;
/*!40000 ALTER TABLE `player_hero` DISABLE KEYS */;
INSERT INTO `player_hero` VALUES ('PH001',2,'H001',12),('PH0010',8,'H006',3),('PH0011',7,'H002',24),('PH002',3,'H005',22),('PH003',2,'H002',32),('PH004',3,'H002',42),('PH005',5,'H004',12),('PH006',4,'H003',11),('PH007',6,'H007',33),('PH008',6,'H008',33),('PH009',9,'H006',23);
/*!40000 ALTER TABLE `player_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin`
--

DROP TABLE IF EXISTS `skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin` (
  `Skin_ID` varchar(255) NOT NULL,
  `Skin_name` varchar(255) NOT NULL,
  `Skin_price` int NOT NULL,
  `Hero_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`Skin_ID`),
  UNIQUE KEY `Skin_ID` (`Skin_ID`),
  KEY `skin_ibfk_1` (`Hero_ID`),
  CONSTRAINT `skin_ibfk_1` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`Hero_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin`
--

LOCK TABLES `skin` WRITE;
/*!40000 ALTER TABLE `skin` DISABLE KEYS */;
INSERT INTO `skin` VALUES ('SK001','Recon',234,'H001'),('SK0010','L&Q Chicken',450,'H003'),('SK002','Glaciar',134,'H002'),('SK003','Lizard',100,'H002'),('SK004','zadiac',40,'H005'),('SK005','Epic',330,'H008'),('SK006','Dragon',220,'H006'),('SK007','Bit Unicorn',270,'H007'),('SK008','Mauve Avenger',350,'H007'),('SK009','Desert Fossil',400,'H004');
/*!40000 ALTER TABLE `skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `Team_ID` int NOT NULL AUTO_INCREMENT,
  `Game_mode_ID` varchar(255) NOT NULL,
  `Game_ID` int DEFAULT NULL,
  PRIMARY KEY (`Team_ID`),
  UNIQUE KEY `Team_ID` (`Team_ID`),
  KEY `Game_mode_ID` (`Game_mode_ID`),
  KEY `Game_ID` (`Game_ID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`Game_mode_ID`) REFERENCES `game_mode` (`Game_mode_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`Game_ID`) REFERENCES `game` (`Game_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'GM001',1),(2,'GM001',1),(3,'GM001',2),(4,'GM003',3),(5,'GM002',5),(6,'GM002',4),(7,'GM002',4),(8,'GM002',5),(9,'GM003',3),(10,'GM001',2);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_player`
--

DROP TABLE IF EXISTS `team_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_player` (
  `Team_ID` int NOT NULL,
  `Player_ID` int NOT NULL,
  `Hero_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`Team_ID`,`Player_ID`,`Hero_ID`),
  KEY `team_player_ibfk_2` (`Player_ID`),
  KEY `team_player_ibfk_3` (`Hero_ID`),
  CONSTRAINT `team_player_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `team` (`Team_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_player_ibfk_2` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_player_ibfk_3` FOREIGN KEY (`Hero_ID`) REFERENCES `hero` (`Hero_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_player`
--

LOCK TABLES `team_player` WRITE;
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;
INSERT INTO `team_player` VALUES (1,2,'H002'),(1,3,'H007'),(2,4,'H006'),(1,5,'H008'),(2,6,'H005'),(1,7,'H004'),(1,9,'H001');
/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-25 16:19:15
