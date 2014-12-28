-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Дек 09 2014 г., 21:31
-- Версия сервера: 5.6.19
-- Версия PHP: 5.6.3-1~dotdeb.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `study`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `parent_id` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`) VALUES
(3, 'Итальянская кухня', 0),
(4, 'Китайская кухня', 0),
(5, 'Пицца', 3),
(6, 'Русская кухня', 0),
(7, 'Супы', 6),
(11, 'Салаты', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(5) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `name`, `price`, `category_id`, `available`, `description`, `image`) VALUES
(4, 'Борщ', '180.00', 7, 1, 'Вкусный', '/uploads/items/1e38b6c430d03e8fb0ca34fcfe89cb64.jpg'),
(5, 'Шашлык', '200.00', 6, 1, 'ывф', '/uploads/items/9b4d2318488e28345f4a4eba7a2a7808.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `status` text NOT NULL,
  `user_id` int(5) NOT NULL,
  `contact` text NOT NULL,
  `price` double NOT NULL,
  `time` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `order_item`
--

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `label`, `title`) VALUES
(1, 'admin', 'Администратор'),
(2, 'user', 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(64) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`session_id`, `data`) VALUES
('dog4nl7769456ao7h8gg9qfok6', 'user|a:1:{s:4:"data";a:8:{s:2:"id";s:1:"1";i:0;s:1:"1";s:5:"login";s:5:"admin";i:1;s:5:"admin";s:8:"password";s:32:"e10adc3949ba59abbe56e057f20f883e";i:2;s:32:"e10adc3949ba59abbe56e057f20f883e";s:8:"contacts";s:0:"";i:3;s:0:"";}}is_auth|b:1;'),
('dog4nl7769456ao7h8gg9qfok6', 'user|a:1:{s:4:"data";a:8:{s:2:"id";s:1:"1";i:0;s:1:"1";s:5:"login";s:5:"admin";i:1;s:5:"admin";s:8:"password";s:32:"e10adc3949ba59abbe56e057f20f883e";i:2;s:32:"e10adc3949ba59abbe56e057f20f883e";s:8:"contacts";s:0:"";i:3;s:0:"";}}is_auth|b:1;'),
('dc44gpdo2nj3rq2u6no3fh5up3', 'user|a:1:{s:4:"data";a:10:{s:2:"id";s:1:"1";i:0;s:1:"1";s:5:"login";s:5:"admin";i:1;s:5:"admin";s:8:"password";s:32:"e10adc3949ba59abbe56e057f20f883e";i:2;s:32:"e10adc3949ba59abbe56e057f20f883e";s:8:"contacts";s:0:"";i:3;s:0:"";s:4:"role";s:5:"admin";i:4;s:5:"admin";}}is_auth|b:1;');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `login` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `contacts` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `contacts`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users_roles`
--

CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
