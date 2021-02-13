-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 13 2021 г., 15:36
-- Версия сервера: 8.0.21
-- Версия PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `books`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `author`) VALUES
(1, 'Пушкин'),
(3, 'Гетте'),
(4, 'Птушкин '),
(5, 'Новиков '),
(6, 'Захаров'),
(7, 'Черный'),
(8, 'Белый'),
(9, 'Пестрых '),
(10, 'Молчалина'),
(11, 'Хабенский'),
(12, 'Йорксер'),
(13, 'Камю'),
(14, 'Федотов'),
(15, 'Зайцевский'),
(16, 'Ясная'),
(17, 'Дорога'),
(18, 'Жилин'),
(19, 'Венеранская'),
(20, 'Ложкин');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `book`) VALUES
(1, 'Поле'),
(2, 'Луга и рощи'),
(3, 'Наука научная'),
(4, 'Хвост лисицы'),
(5, 'Хворост намок'),
(6, 'Приключения Электрона'),
(7, 'Цветы для Эла'),
(8, 'Коты и голуби'),
(9, '2000 км под водой'),
(10, 'Зоопарк для дедушки'),
(11, 'Фигуры на песке или как написать эссе'),
(12, 'Холодные руки горячей поверхности'),
(13, 'В мире животных и людей'),
(14, 'Немного поэзии'),
(15, 'Фиолетовые дни на Луне'),
(16, 'Ботаника для самых маленьких '),
(17, 'Феникс Гарри'),
(18, 'Дворцовый клуб'),
(19, 'Цемент и травы'),
(20, 'Залив Святого Фредерика'),
(21, 'Эврика '),
(22, 'Жадность муравья сгубила'),
(23, 'Дочерние фазы сна'),
(24, 'Психология и психосоматика навязчивых состояний'),
(25, 'Юла, Бобик и корова'),
(26, 'Сыктывкарские рассказы старого клоуна'),
(27, 'Породы гусей'),
(28, 'Энциклопедия по поиски красивых листочков'),
(29, 'Утро вечера мудренее'),
(30, 'Золото недр'),
(31, 'Обширное состояние разума'),
(32, 'Хозяин леса и рафта'),
(33, 'Как научить собаку гавкать '),
(34, 'Жженые спички'),
(35, 'Грибы и ягоды Казахстана'),
(36, 'Ужин на природе в темноте'),
(37, 'Проблемы современных тиктокеров'),
(38, 'Выскочка из трущоб'),
(39, 'Пробоина в судне'),
(40, 'Самосплав как выход');

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id_a` int NOT NULL,
  `id_b` int NOT NULL,
  KEY `id_a` (`id_a`),
  KEY `id_b` (`id_b`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id_a`, `id_b`) VALUES
(1, 4),
(1, 16),
(1, 22),
(1, 38),
(1, 9),
(2, 6),
(2, 11),
(2, 15),
(2, 25),
(2, 35),
(2, 3),
(2, 8),
(3, 9),
(3, 1),
(3, 16),
(3, 14),
(3, 23),
(3, 34),
(4, 5),
(4, 31),
(5, 17),
(5, 37),
(5, 20),
(6, 7),
(6, 21),
(6, 29),
(7, 12),
(8, 10),
(8, 12),
(8, 35),
(9, 18),
(10, 24),
(11, 26),
(13, 40),
(12, 39),
(12, 28),
(13, 13),
(13, 15),
(14, 40),
(14, 19),
(14, 35),
(15, 26),
(15, 13),
(16, 36),
(17, 30),
(17, 13),
(18, 32),
(18, 33),
(19, 27),
(19, 40),
(20, 32),
(20, 23),
(20, 38);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`id_b`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`id_a`) REFERENCES `authors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
