SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `films` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

INSERT INTO `films` (`id`, `name`, `status_id`) VALUES
(1, 'Железный человек 3', 1),
(2, 'Великий Гэтсби', 1),
(3, 'Форсаж 6', 2),
(4, 'Иллюзия', 2),
(5, 'Гадкий я 2', 3),
(6, 'Тихоокеанский рубеж', 3),
(7, 'Одинокий рейнджер', 3),
(8, 'Университет монстров', 3),
(9, 'Война миров Z', 3),
(10, 'Мы - Миллеры', 3);

CREATE TABLE IF NOT EXISTS `films_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  KEY `genre_id` (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

INSERT INTO `films_genre` (`id`, `film_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 3, 4),
(7, 3, 1),
(8, 3, 2),
(9, 4, 1),
(10, 5, 6),
(11, 6, 2),
(12, 6, 3),
(13, 6, 7),
(14, 7, 2),
(15, 7, 7),
(16, 7, 8),
(17, 8, 6),
(18, 8, 7),
(19, 9, 6);

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

INSERT INTO `genre` (`id`, `name`) VALUES
(2, 'Боевик'),
(8, 'Вестерн'),
(4, 'Драма'),
(6, 'Комедия'),
(5, 'Мелодрама'),
(7, 'Приключения'),
(1, 'Триллер'),
(3, 'Фантастика');

CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `status` (`id`, `name`) VALUES
(2, 'архивный'),
(1, 'в прокате'),
(3, 'скоро на экранах');


ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

ALTER TABLE `films_genre`
  ADD CONSTRAINT `films_genre_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  ADD CONSTRAINT `films_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
