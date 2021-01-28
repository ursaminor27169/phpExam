-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 28 2021 г., 12:59
-- Версия сервера: 8.0.23
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cx85014_test4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int NOT NULL,
  `answer` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `expert_sessions`
--

CREATE TABLE `expert_sessions` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `expert_sessions`
--

INSERT INTO `expert_sessions` (`id`, `title`, `user_id`, `is_open`, `created_at`, `updated_at`, `deleted_at`) VALUES
(22, 'Тест 1', 3, 1, '2021-01-28', '2021-01-28', '2021-01-28'),
(23, 'Тест 1', 3, 1, '2021-01-28', '2021-01-28', '2021-01-28'),
(24, 'Вопрос 1', 3, 1, '2021-01-28', '2021-01-28', '2021-01-28'),
(25, 'Тест 1', 3, 1, '2021-01-28', '2021-01-28', '2021-01-28'),
(26, 'Тест 1', 3, 1, '2021-01-28', '2021-01-28', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `expert_session_answers`
--

CREATE TABLE `expert_session_answers` (
  `id` int NOT NULL,
  `answer_json` json NOT NULL,
  `author_ip` text NOT NULL,
  `expert_session_link_id` int NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `expert_session_links`
--

CREATE TABLE `expert_session_links` (
  `id` int NOT NULL,
  `random_id` text NOT NULL,
  `expert_session_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `expert_session_links`
--

INSERT INTO `expert_session_links` (`id`, `random_id`, `expert_session_id`) VALUES
(22, 'd492d4c1ae9fc6838e459b2bdd1360fdc127a1e792449ec6398ee235c6c2dc9e', 22);

-- --------------------------------------------------------

--
-- Структура таблицы `expert_session_questions`
--

CREATE TABLE `expert_session_questions` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `type` text NOT NULL,
  `options` text NOT NULL,
  `expert_session_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `expert_session_questions`
--

INSERT INTO `expert_session_questions` (`id`, `title`, `type`, `options`, `expert_session_id`) VALUES
(19, 'Вопрос 1', '1', '', 23),
(20, 'Вопрос 1', '1', '', 24);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `role` set('1','2','3','4') DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `role`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'mozg1694', '$2y$10$brnPS5Ffu8dQlcX8dU4uHOv2HVTDrZSZ7.3KArr2fCZkxUlc2jedC', '1', '2021-01-28', '2021-01-28', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `expert_sessions`
--
ALTER TABLE `expert_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `expert_session_answers`
--
ALTER TABLE `expert_session_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expert_session_link_id` (`expert_session_link_id`);

--
-- Индексы таблицы `expert_session_links`
--
ALTER TABLE `expert_session_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expert_session_id` (`expert_session_id`);

--
-- Индексы таблицы `expert_session_questions`
--
ALTER TABLE `expert_session_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expert_session_id` (`expert_session_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `expert_sessions`
--
ALTER TABLE `expert_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `expert_session_answers`
--
ALTER TABLE `expert_session_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `expert_session_links`
--
ALTER TABLE `expert_session_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `expert_session_questions`
--
ALTER TABLE `expert_session_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `expert_sessions`
--
ALTER TABLE `expert_sessions`
  ADD CONSTRAINT `expert_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `expert_session_answers`
--
ALTER TABLE `expert_session_answers`
  ADD CONSTRAINT `expert_session_answers_ibfk_1` FOREIGN KEY (`expert_session_link_id`) REFERENCES `expert_session_links` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `expert_session_links`
--
ALTER TABLE `expert_session_links`
  ADD CONSTRAINT `expert_session_links_ibfk_1` FOREIGN KEY (`expert_session_id`) REFERENCES `expert_sessions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `expert_session_questions`
--
ALTER TABLE `expert_session_questions`
  ADD CONSTRAINT `expert_session_questions_ibfk_1` FOREIGN KEY (`expert_session_id`) REFERENCES `expert_sessions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
