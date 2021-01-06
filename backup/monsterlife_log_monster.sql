-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: monsterlife_log
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `monster`
--

DROP TABLE IF EXISTS `monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monster` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `info` varchar(255) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `leaf1` varchar(45) NOT NULL,
  `leaf2` varchar(45) NOT NULL,
  `selected_counter` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster`
--

LOCK TABLES `monster` WRITE;
/*!40000 ALTER TABLE `monster` DISABLE KEYS */;
INSERT INTO `monster` VALUES (0,'각성한 락 스피릿','스페셜','모든 스탯 5 증가','SS','락 스피릿','부조화의 정령',0),(1,'검은 바이킹','스페셜','민첩 5, 데미지 2% 증가','SS','바이킹 군단','진지한 바이킹',0),(2,'쁘띠 아카이럼','스페셜','버프 지속시간 5% 증가','SS','타이머','이계의 사제',0),(3,'토토','스페셜','이동속도 5 증가','SS','다크 엘리쟈','대장 블러드투스',0),(4,'양철 나무꾼','스페셜','몬스터 방어율 무시 6% 증가','SS','내면의 분노','빅터',0),(5,'허수아비','스페셜','데미지 4% 증가','SS','도둑까마귀','쁘띠 아카이럼',0),(6,'쁘띠 힐라','스페셜','크리티컬 데미지 2% 증가','SS','리치','엘리트 블러드투스',0),(7,'거대 거미','스페셜','상태이상 내성 3% 증가','SS','타란튤로스','새끼 거미',0),(8,'겁에 질린 사자','스페셜','피격시 3% 확률로 3초 동안 무적효과','SS','풍선쥐','쁘띠 반 레온',0),(9,'쁘띠 라니아','스페셜','쁘띠 루미너스(빛/어둠/이퀼리브리엄)가 모두 있다면 모든 스탯 20 증가','SS','쁘띠 루미너스(이퀼리브리엄)','쁘띠 시그너스',0),(10,'쁘띠 랑','스페셜','쁘띠 은월이 있다면 보스 공격 시 데미지 8% 증가','SS','구미호','쁘띠 오르카',0),(11,'검은 마법사의 그림자','스페셜','공격력 6, 마력 6 증가','SS','마스터 오멘','쁘띠 루미너스(어둠)',0),(12,'라즐리','스페셜','크리티컬 확률 5% 증가','SS','시간의 눈','쁘띠 힐라',0),(13,'라피스','스페셜','몬스터 방어율 5% 증가','SS','시간의 눈','이프리트',0),(14,'빅 펌킨','스페셜','소환수 지속시간 6% 증가','SS','할로윈 펌프킨','거인',0),(15,'킹 캐슬 골렘','스페셜','방어력 150, 최대 HP 750 증가','SS','캐슬 골렘','거인',0),(16,'쁘띠 매그너스','스페셜','몬스터 방어율 무시 5% 증가','SS','크림슨 발록','푸소',0),(17,'군단장 윌','스페셜','버프 지속시간 6% 증가','SS','거대 거미','큰 운영자의 벌룬',0),(18,'쁘띠 시그너스','스페셜','데미지 3% 증가','SS','신수','오베론',0),(19,'쁘띠 혼테일','스페셜','크리티컬 확률 3% 증가','SS','레비아탄','설산의 마녀',0),(20,'쁘띠 은월','스페셜','4% 확률 스킬 재사용 대기시간 미적용','SS','쁘띠 팬텀','쁘띠 루미너스(빛)',0),(21,'타란튤로스','스페셜','상태이상 내성 1 증가','SS','킹크랑','쓰레기통',0),(22,'티폰','스페셜','공격력 1, 마력 1 증가','SS','크세르크세스','프리저',0),(24,'마스터 잭슨','스페셜','모든 스탯 5 증가','SS','캡틴 블랙 슬라임','도도',0),(25,'마스터 히삽','스페셜','운 15 증가','SS','마족 약탈자','에레고스',0),(26,'마스터 렐릭','스페셜','민첩 15 증가','SS','마족 추적자','구와르의 잔재',0),(27,'마스터 마르가나','스페셜','지능 15 증가','SS','마족 환술사','호박기사',0),(28,'쁘띠 자쿰','스페셜','피격시 3% 확률로 가드','SS','퍼펫골렘','프랑켄로이드',0),(29,'작은 운영자 벌룬','스페셜','쵀대 HP 2% 증가','SS','피에르','총리대신',0),(30,'큰 운영자의 벌룬','스페셜','2% 확률 스킬 재사용 대기시간 미적용','SS','작은 운영자 벌룬','작은 운영자 벌룬',0),(31,'쁘띠 팬텀','스페셜','크리티컬 확률 4% 증가','SS','월묘 도둑','로맨티스트 킹슬라임',0),(32,'로맨티스트 킹슬라임','스페셜','크리티컬 확률 3% 증가','SS','킹슬라임','사랑에 빠진 커플예티',0),(33,'핑크빈','스페셜','데미지 2% 증가','SS','몬스터 상자','몬스터 상자',0),(34,'쁘띠 메르세데스','스페셜','캐릭터의 획득 경험치 3% 증가','SS','강화형 베릴','에피네아',0),(35,'자이언트 다크소울','스페셜','최대 HP 500 증가','SS','다크소울','거인',0),(36,'강화형 베릴','스페셜','모든 스탯 6 증가','SS','베릴','아우프헤벤',0),(37,'무공의 분신','스페셜','공격력 3 증가','SS','선인인형','태륜',0),(38,'에피네아','스페셜','마력 3 증가','SS','픽시맘','고대 슬라임',0),(39,'내면의 분노','스페셜','최대 HP 500 증가','SS','락 스피릿','이상한 몬스터',0),(40,'반반','스페셜','버프 지속시간 5% 증가','SS','그리프','핑크빈',0),(41,'피에르','스페셜','파이널 어택류의 데미지 15% 증가','SS','주니어 발록','타르가',0),(42,'성장한 미르','스페셜','모든 스탯 20 증가','SS','성장 중인 미르','성장 중인 미르',0),(43,'쁘띠 루미너스(이퀼리브리엄)','스페셜','캐릭터 레벨 20 당 공격력 1, 마력 1 증가, 공격력/마력 % 증가 효과 미적용','SS','쁘띠 루미너스(빛)','쁘띠 루미너스(어둠)',0),(44,'쁘띠 루미너스(어둠)','스페셜','공격력 5, 마력 5 증가','SS','파풀라투스의 시계','킹슬라임',0),(45,'쁘띠 루미너스(빛)','스페셜','다수 공격 스킬의 공격대상 +1, 공격대상의 수에 비례한 기능 적용불가','SS','몬스터 상자','몬스터 상자',0),(46,'성장 중인 미르','스페셜','상태이상 내성 5 증가','SS','미르','미르',0),(47,'미르','스페셜','공격력 5, 마력 5 증가','SS','마뇽','루팡돼지',0),(48,'쁘띠 반 레온','스페셜','보스 공격 시 데미지 5% 증가','SS','릴리노흐','장난감 흑기사',0),(49,'쁘띠 오르카','스페셜','캐릭터의 획득 경험치 3% 증가','SS','거대 스노우맨','쌍둥이 월묘',0),(50,'바이킹 군단','스페셜','노곤한/피곤한/넉넉한/진지한 바이킹이 모두 있다면 데미지 3% 증가','S','몬스터 상자','몬스터 상자',0),(51,'오베론','스페셜','모든 스탯 5 증가','S','듀나스','빛의 정령',0),(52,'게오르크','스페셜','방어력 150, 이동속도 5 증가','S','거대 루 몬스터','제노',0),(53,'주니어 발록','스페셜','피격시 무적시간 1초 증가','S','미니빈','사신 스펙터',0),(55,'푸소','스페셜','파이널 어택류의 데미지 10% 증가','S','몬스터 상자','몬스터 상자',0),(56,'몰킹','스페셜','이동속도 10 증가','S','양파라고라','순무라고라',0),(57,'사랑에 빠진 커플예티','스페셜','소환수 지속시간 7% 증가','S','골드예티와 페페킹','사랑에 빠진 판다곰',0),(58,'베릴','스페셜','모든 스탯 5 증가','S','몬스터 상자','몬스터 상자',0),(59,'월묘 도둑','스페셜','메소 획득량 4% 상승','S','월묘','달빛도둑',0),(60,'릴리노흐','스페셜','민첩 10 증가','S','몬스터 상자','몬스터 상자',0),(61,'타이머','스페셜','지능 10 증가','S','몬스터 상자','몬스터 상자',0),(62,'크림슨 발록','스페셜','피격시 5% 확률로 3초 동안 무적효과','S','잭오랜턴','해적왕 바르보사',0),(63,'신수','스페셜','공격시 10% 확률로 HP 20, MP 20 회복','S','피닉스','라이카',0),(64,'파풀라투스의 시계','스페셜','모든 스탯 5 증가','S','파풀라투스','킹 롬바드',0),(65,'쌍둥이 월묘','스페셜','농장 몬스터의 획득 경험치 2 증가','A+','월묘','100일 맞은 커플버섯',0),(66,'아우프헤벤','스페셜','농장건물의 단위 시간당 생산량 1 증가','A+','머신 MT-09','이루워터',0),(67,'프랑켄로이드','스페셜','힘 10 증가','A+','몬스터 상자','몬스터 상자',0),(68,'듀나스','스페셜','행운 10 증가','A+','몬스터 상자','몬스터 상자',0),(69,'월묘','스페셜','농장 몬스터의 획득 경험치 1 증가','A','몬스터 상자','몬스터 상자',0),(70,'이루워터','스페셜','최대 MP 50 증가','A','몬스터 상자','몬스터 상자',0),(71,'예티 파라오','스페셜','농장의 획득 경험치 5 증가','A','예티와 페페','파라오 미이라',0),(72,'설산의 마녀','스페셜','최대 MP 250 증가','A','몬스터 상자','몬스터 상자',0),(73,'킹크랑','스페셜','방어력 75 증가','A','몬스터 상자','몬스터 상자',0),(74,'도도','스페셜','최대 HP 250 증가','A','몬스터 상자','몬스터 상자',0),(75,'새끼 거미','스페셜','소환수 지속시간 1% 증가','B+','몬스터 상자','몬스터 상자',0),(76,'세르프','스페셜','아이템 드롭률 2% 상승','B+','몬스터 상자','몬스터 상자',0),(77,'비급','스페셜','데미지 1% 증가','B+','몬스터 상자','몬스터 상자',0),(78,'풍선쥐','스페셜','방어력 50 증가','B','몬스터 상자','몬스터 상자',0),(79,'갈색 모래토끼','스페셜','이동속도 5 증가','B','몬스터 상자','몬스터 상자',0),(80,'주니어 씰','스페셜','최대 HP 100 증가','B','몬스터 상자','몬스터 상자',0),(81,'박쥐는 사탕을 좋아해','스페셜','농장 레벨 상승시 100 와르 획득','B','박쥐는 호박을 좋아해','핑크테니',0),(82,'애벌레','스페셜','이동속도 1 증가','C','몬스터 상자','몬스터 상자',0),(83,'박쥐는 호박을 좋아해','스페셜','최대 이동속도 상한 3 증가','C','몬스터 상자','몬스터 상자',0),(84,'흰 모래토끼','스페셜','점프력 3 증가','C','몬스터 상자','몬스터 상자',0),(85,'락 스피릿','악마','민첩 5, 행운 5 증가','A+','일반 조합','일반 조합',0),(86,'다크소울','악마','민첩 6, 행운 6 증가','S','일반 조합','일반 조합',0),(87,'미니빈','악마','민첩 6, 행운 6 증가','S','일반 조합','일반 조합',0),(88,'파풀라투스','악마','민첩 6, 행운 6 증가','S','일반 조합','일반 조합',0),(89,'부조화의 정령','에르다스','아케인리버 지역 몬스터 처치 시 아이템 드롭률 6% 상승','S','일반 조합','일반 조합',0),(90,'진지한 바이킹','조류','민첩 12 증가','S','일반 조합','일반 조합',0),(91,'도둑까마귀','조류','민첩 6 증가','B+','일반 조합','일반 조합',0),(92,'프리저','조류','민첩 12 증가','S','일반 조합','일반 조합',0),(93,'그리프','조류','민첩 14 증가','SS','일반 조합','일반 조합',0),(94,'피닉스','조류','민첩 12 증가','S','일반 조합','일반 조합',0),(95,'이계의 사제','파충류','민첩 6, 지능 6 증가','S','일반 조합','일반 조합',0),(96,'교도관 아니','파충류','민첩 7, 지능 7 증가','SS','일반 조합','일반 조합',0),(98,'다크 엘리쟈','고양이','행운 14 증가','SS','일반 조합','일반 조합',0),(99,'이상한 몬스터','고양이','행운 14 증가','SS','일반 조합','일반 조합',0),(100,'달빛도둑','고양이','행운 8 증가','A','일반 조합','일반 조합',0),(101,'대장 블러드투스','개','힘 6, 행운 6 증가','S','일반 조합','일반 조합',0),(102,'엘리트 블러드투스','개','힘 6, 행운 6 증가','S','일반 조합','일반 조합',0),(103,'구미호','개','힘 7, 행운 7 증가','SS','일반 조합','일반 조합',0),(104,'빅터','인공생명체','스킬의 MP 소모량 7% 감소','SS','일반 조합','일반 조합',0),(105,'시간의 눈','인공생명체','스킬의 MP 소모량 4% 감소','A','일반 조합','일반 조합',0),(106,'쓰레기통','인공생명체','스킬의 MP 소모량 7% 감소','SS','일반 조합','일반 조합',0),(107,'거대 스노우맨','인공생명체','스킬의 MP 소모량 7% 감소','SS','일반 조합','일반 조합',0),(108,'거대 루 몬스터','인공생명체','스킬의 MP 소모량 6% 감소','S','일반 조합','일반 조합',0),(109,'리치','언데드','사망 패널티 지속시간 6% 감소','S','일반 조합','일반 조합',0),(110,'에레고스','언데드','사망 패널티 지속시간 7% 감소','SS','일반 조합','일반 조합',0),(111,'파라오 미이라','언데드','사망 패널티 지속시간 5% 감소','A+','일반 조합','일반 조합',0),(112,'마스터 오멘','정령','지능 7, 행운 7 증가','SS','일반 조합','일반 조합',0),(113,'이프리트','정령','지능 7, 행운 7 증가','SS','일반 조합','일반 조합',0),(114,'빛의 정령','정령','지능 6, 행운 6 증가','S','일반 조합','일반 조합',0),(115,'할로윈 펌프킨','유령','몬스터 처치시 10% 확률로 MP 20 회복','B','일반 조합','일반 조합',0),(116,'호박기사','유령','몬스터 처치시 10% 확률로 MP 70 회복','SS','일반 조합','일반 조합',0),(117,'잭오랜턴','유령','몬스터 처치시 10% 확률로 MP 60 회복','S','일반 조합','일반 조합',0),(118,'거인','골렘','방어력 105 증가','SS','일반 조합','일반 조합',0),(119,'캐슬 골렘','골렘','방어력 30 증가','B','일반 조합','일반 조합',0),(120,'퍼펫골렘','골렘','방어력 90 증가','S','일반 조합','일반 조합',0),(121,'킹 롬바드','골렘','방어력 90 증가','S','일반 조합','일반 조합',0),(122,'레비아탄','용','몬스터 처치시 10% 확률로 HP 60 회복','S','일반 조합','일반 조합',0),(123,'마뇽','용','몬스터 처치시 10% 확률로 HP 70 회복','SS','일반 조합','일반 조합',0),(124,'크세르크세스','소','힘 14 증가','SS','일반 조합','일반 조합',0),(125,'라이카','소','힘 12 증가','S','일반 조합','일반 조합',0),(126,'마족 역사','솔져','힘 5, 지능 5 증가','A+','일반 조합','일반 조합',0),(127,'마족 약탈자','솔져','힘 5, 지능 5 증가','A+','일반 조합','일반 조합',0),(128,'마족 추격자','솔져','힘 5, 지능 5 증가','A+','일반 조합','일반 조합',0),(129,'마족 환술사','솔져','힘 5, 지능 5 증가','A+','일반 조합','일반 조합',0),(130,'사신 스펙터','솔져','힘 6, 지능 6 증가','S','일반 조합','일반 조합',0),(131,'해적왕 바르보사','솔져','힘 6, 지능 6 증가','S','일반 조합','일반 조합',0),(132,'캡틴 블랙 슬라임','슬라임과 달팽이','10초마다 MP 210 추가 회복','SS','일반 조합','일반 조합',0),(133,'킹슬라임','슬라임과 달팽이','10초마다 MP 210 추가 회복','SS','일반 조합','일반 조합',0),(134,'고대 슬라임','슬라임과 달팽이','10초마다 MP 180 추가 회복','S','일반 조합','일반 조합',0),(135,'구와르의 잔재','식물','10초마다 HP 210 추가 회복','SS','일반 조합','일반 조합',0),(136,'양파라고라','식물','10초마다 HP 150 추가 회복','A+','일반 조합','일반 조합',0),(137,'순무라고라','식물','10초마다 HP 150 추가 회복','A+','일반 조합','일반 조합',0),(138,'총리대신','버섯','몬스터 라이프 상점 상품 7% 할인','SS','일반 조합','일반 조합',0),(139,'100일 맞은 커플버섯','버섯','몬스터 라이프 상점 상품 6% 할인','S','일반 조합','일반 조합',0),(140,'태륜','원숭이와 곰','민첩 12 증가','S','일반 조합','일반 조합',0),(141,'사랑에 빠진 판다곰','원숭이와 곰','민첩 10 증가','A+','일반 조합','일반 조합',0),(142,'선인인형','장난감','메소 획득량 6% 상승','S','일반 조합','일반 조합',0),(143,'타르가','장난감','메소 획득량 7% 상승','SS','일반 조합','일반 조합',0),(144,'장난감 흑기사','장난감','메소 획득량 6% 상승','S','일반 조합','일반 조합',0),(145,'핑크테니','장난감','메소 획득량 3% 상승','B+','일반 조합','일반 조합',0),(146,'픽시맘','요정','최대 MP 300 증가','S','일반 조합','일반 조합',0),(147,'루팡돼지','돼지','최대 HP 350 증가','SS','일반 조합','일반 조합',0),(148,'제노','아인종','지능 14 증가','SS','일반 조합','일반 조합',0),(149,'머신 MT-09','아인종','지능 12 증가','S','일반 조합','일반 조합',0),(150,'골드예티와 페페킹','예티와 페페','소환수 지속시간 6% 증가','S','일반 조합','일반 조합',0),(151,'예티와 페페','예티와 페페','소환수 지속시간 4% 증가','A','일반 조합','일반 조합',0);
/*!40000 ALTER TABLE `monster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-06  3:21:57