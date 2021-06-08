-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- test2 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test2`;

-- 테이블 test2.tb_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `contents` varchar(300) DEFAULT NULL,
  `indate` date DEFAULT current_timestamp(),
  `COUNT` int(100) DEFAULT 0,
  `writer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 테이블 데이터 test2.tb_board:~16 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` (`idx`, `title`, `contents`, `indate`, `COUNT`, `writer`) VALUES
	(2, '수정', '수정', '2021-06-07', 8, '수정'),
	(3, 'ㅎㅇ', '가즈아', '2021-06-07', 7, '잉어'),
	(11, 'd', 'd', '2021-06-07', 3, 'd'),
	(13, 'ㅇ', 'ㅇ', '2021-06-08', 1, 'ㅇ'),
	(14, 'ㅎㅎ', 'ㅎㅎ', '2021-06-08', 0, 'ㅎㅎ'),
	(15, 'ㄷㄷ', 'ㄷㄷ', '2021-06-08', 0, 'ㄷㄷ'),
	(16, 'ㅎ', 'ㄴㅇㄹㄴㅇㄹ', '2021-06-08', 0, 'ㄷㄹ'),
	(17, 'ㄴㅇ', 'ㄴㅇㄹㄴㅇㄹ', '2021-06-08', 0, 'ㄴㅇㄹㄴㅇ'),
	(18, 'ㄴㅇㄹ', 'ㄴㅇㄹㄴㅇㄹ', '2021-06-08', 0, 'ㄴㅇㄹ'),
	(19, 'gg', 'gg', '2021-06-08', 0, 'gg'),
	(20, 'sdf', 'sdf', '2021-06-08', 0, 'sdf'),
	(21, 'e', 'e', '2021-06-08', 0, 'e'),
	(22, 'e', 'qqq', '2021-06-08', 0, 'eqw'),
	(23, 'ss', 'ssss', '2021-06-08', 0, 's'),
	(24, 'sdf', 'sdf', '2021-06-08', 0, 'sdf'),
	(25, 'sdf', 'sdf', '2021-06-08', 0, 'sdfs');
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;

-- 테이블 test2.tb_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_user` (
  `user_id` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 test2.tb_user:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`user_id`, `password`, `user_name`) VALUES
	('admin', 'manager', '관리자'),
	('guest2', 'guest2', '사용자2'),
	('guset', 'guest', '사용자');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
