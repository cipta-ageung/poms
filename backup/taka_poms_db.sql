-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 34.87.118.154:3306
-- Waktu pembuatan: 11 Jun 2020 pada 14.08
-- Versi server: 5.7.25-google-log
-- Versi PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taka_poms_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `log_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bugs`
--

CREATE TABLE `bugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assign_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bug_comments`
--

CREATE TABLE `bug_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_id` int(11) NOT NULL DEFAULT '0',
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bug_files`
--

CREATE TABLE `bug_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bug_id` int(11) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bug_statuses`
--

CREATE TABLE `bug_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bug_statuses`
--

INSERT INTO `bug_statuses` (`id`, `title`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Confirmed', 1, 0, '2020-04-14 14:43:30', '2020-04-14 14:43:30'),
(2, 'Resolved', 1, 0, '2020-04-14 14:43:30', '2020-04-14 14:43:30'),
(3, 'Unconfirmed', 1, 0, '2020-04-14 14:43:30', '2020-04-14 14:43:30'),
(4, 'In Progress', 1, 0, '2020-04-14 14:43:30', '2020-04-14 14:43:30'),
(5, 'Verified', 1, 0, '2020-04-14 14:43:30', '2020-04-14 14:43:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `check_lists`
--

CREATE TABLE `check_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `client_permissions`
--

CREATE TABLE `client_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `client_permissions`
--

INSERT INTO `client_permissions` (`id`, `client_id`, `project_id`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 2, 1, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-04-14 15:03:13', '2020-04-14 15:03:13'),
(2, 2, 2, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-04-15 23:45:35', '2020-04-15 23:45:35'),
(3, 4, 3, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-04-17 06:25:00', '2020-04-17 06:25:00'),
(4, 13, 4, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-04-20 04:01:21', '2020-04-20 04:01:21'),
(5, 2, 5, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-04-23 04:13:38', '2020-04-23 04:13:38'),
(6, 2, 6, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-05-29 05:40:43', '2020-05-29 05:40:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checklist_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `comment`, `checklist_id`, `task_id`, `user_type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'tes', 8, NULL, 'company', 1, '2020-05-17 13:50:45', '2020-05-17 13:50:45'),
(2, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:41:02', '2020-05-18 17:41:02'),
(3, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:42:56', '2020-05-18 17:42:56'),
(4, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:45:34', '2020-05-18 17:45:34'),
(5, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:47:29', '2020-05-18 17:47:29'),
(6, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:51:33', '2020-05-18 17:51:33'),
(7, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:51:41', '2020-05-18 17:51:41'),
(8, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:52:51', '2020-05-18 17:52:51'),
(9, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:54:30', '2020-05-18 17:54:30'),
(10, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:55:00', '2020-05-18 17:55:00'),
(11, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:55:30', '2020-05-18 17:55:30'),
(12, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:56:32', '2020-05-18 17:56:32'),
(13, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:57:08', '2020-05-18 17:57:08'),
(14, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:57:21', '2020-05-18 17:57:21'),
(15, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:58:04', '2020-05-18 17:58:04'),
(16, 'tes', 8, NULL, 'company', 1, '2020-05-18 17:59:27', '2020-05-18 17:59:27'),
(17, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:01:02', '2020-05-18 18:01:02'),
(18, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:03:24', '2020-05-18 18:03:24'),
(19, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:03:52', '2020-05-18 18:03:52'),
(20, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:04:27', '2020-05-18 18:04:27'),
(21, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:07:22', '2020-05-18 18:07:22'),
(22, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:07:36', '2020-05-18 18:07:36'),
(23, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:08:22', '2020-05-18 18:08:22'),
(24, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:09:22', '2020-05-18 18:09:22'),
(25, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:10:09', '2020-05-18 18:10:09'),
(26, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:10:42', '2020-05-18 18:10:42'),
(27, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:11:53', '2020-05-18 18:11:53'),
(28, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:12:46', '2020-05-18 18:12:46'),
(29, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:16:15', '2020-05-18 18:16:15'),
(30, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:16:58', '2020-05-18 18:16:58'),
(31, 'asf', 8, NULL, 'company', 1, '2020-05-18 18:19:06', '2020-05-18 18:19:06'),
(32, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:22:15', '2020-05-18 18:22:15'),
(33, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:24:54', '2020-05-18 18:24:54'),
(34, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:25:46', '2020-05-18 18:25:46'),
(35, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:27:12', '2020-05-18 18:27:12'),
(36, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:28:39', '2020-05-18 18:28:39'),
(37, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:28:52', '2020-05-18 18:28:52'),
(38, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:29:13', '2020-05-18 18:29:13'),
(39, 'jkhjh', 8, NULL, 'company', 1, '2020-05-18 18:34:12', '2020-05-18 18:34:12'),
(40, 'jkhjh', 8, NULL, 'company', 1, '2020-05-18 18:35:02', '2020-05-18 18:35:02'),
(41, 'tes', 8, NULL, 'company', 1, '2020-05-18 18:40:24', '2020-05-18 18:40:24'),
(42, 'asd', 8, NULL, 'company', 1, '2020-05-18 18:41:17', '2020-05-18 18:41:17'),
(43, 'hkhjkhk', 8, NULL, 'company', 1, '2020-05-18 18:43:27', '2020-05-18 18:43:27'),
(44, 'khjhj', 8, NULL, 'company', 1, '2020-05-18 18:46:32', '2020-05-18 18:46:32'),
(45, 'khjhj', 8, NULL, 'company', 1, '2020-05-18 18:46:54', '2020-05-18 18:46:54'),
(46, 'khjhj', 8, NULL, 'company', 1, '2020-05-18 18:47:11', '2020-05-18 18:47:11'),
(47, 'khkhk', 8, NULL, 'company', 1, '2020-05-18 18:47:30', '2020-05-18 18:47:30'),
(48, 'knmkjk', 8, NULL, 'company', 1, '2020-05-18 18:48:29', '2020-05-18 18:48:29'),
(49, 'jnnjnj', 8, NULL, 'company', 1, '2020-05-18 18:52:30', '2020-05-18 18:52:30'),
(50, 'jnnjnj', 8, NULL, 'company', 1, '2020-05-18 18:53:05', '2020-05-18 18:53:05'),
(51, 'jnnjnj', 8, NULL, 'company', 1, '2020-05-18 18:53:16', '2020-05-18 18:53:16'),
(52, 'jnnjnj', 8, NULL, 'company', 1, '2020-05-18 18:53:38', '2020-05-18 18:53:38'),
(53, 'jnnjnj', 8, NULL, 'company', 1, '2020-05-18 18:54:01', '2020-05-18 18:54:01'),
(54, 'nmnm', 8, NULL, 'company', 1, '2020-05-18 19:00:32', '2020-05-18 19:00:32'),
(55, 'nmnm', 8, NULL, 'company', 1, '2020-05-18 19:00:50', '2020-05-18 19:00:50'),
(56, 'nmnm', 8, NULL, 'company', 1, '2020-05-18 19:01:01', '2020-05-18 19:01:01'),
(57, 'knkjk', 8, NULL, 'company', 1, '2020-05-18 19:01:56', '2020-05-18 19:01:56'),
(58, 'jnnjnjn', 8, NULL, 'company', 1, '2020-05-18 19:04:24', '2020-05-18 19:04:24'),
(59, 'kkhk', 8, NULL, 'company', 1, '2020-05-18 19:05:04', '2020-05-18 19:05:04'),
(60, 'kkhk', 8, NULL, 'company', 1, '2020-05-18 19:07:31', '2020-05-18 19:07:31'),
(61, 'kkhk', 8, NULL, 'company', 1, '2020-05-18 19:07:50', '2020-05-18 19:07:50'),
(62, 'jkjjk', 8, NULL, 'company', 1, '2020-05-18 19:09:43', '2020-05-18 19:09:43'),
(63, 'nnjjn', 8, NULL, 'company', 1, '2020-05-18 19:10:49', '2020-05-18 19:10:49'),
(64, 'jjkhj', 8, NULL, 'company', 1, '2020-05-18 19:15:58', '2020-05-18 19:15:58'),
(65, 'jnnnj', 8, NULL, 'company', 1, '2020-05-18 19:38:45', '2020-05-18 19:38:45'),
(66, 'jnnnj', 8, NULL, 'company', 1, '2020-05-18 19:38:56', '2020-05-18 19:38:56'),
(67, 'kjkjk', 8, NULL, 'company', 1, '2020-05-18 19:40:02', '2020-05-18 19:40:02'),
(68, 'kjkjk', 8, NULL, 'company', 1, '2020-05-18 19:40:41', '2020-05-18 19:40:41'),
(69, 'jkjk', 8, NULL, 'company', 1, '2020-05-18 19:44:41', '2020-05-18 19:44:41'),
(70, 'hjhjhj', 8, NULL, 'company', 1, '2020-05-18 19:56:22', '2020-05-18 19:56:22'),
(71, 'jkjk', 8, NULL, 'company', 1, '2020-05-18 20:44:06', '2020-05-18 20:44:06'),
(72, 'jkjkjk', 8, NULL, 'company', 1, '2020-05-18 20:48:36', '2020-05-18 20:48:36'),
(73, 'jhhj', 8, NULL, 'company', 1, '2020-05-18 20:52:12', '2020-05-18 20:52:12'),
(74, 'hjhj', 8, NULL, 'company', 1, '2020-05-18 20:55:17', '2020-05-18 20:55:17'),
(75, 'hjhj', 8, NULL, 'company', 1, '2020-05-18 20:57:50', '2020-05-18 20:57:50'),
(76, 'hjhjhjh', 8, NULL, 'company', 1, '2020-05-18 20:58:51', '2020-05-18 20:58:51'),
(77, 'knknkn', 8, NULL, 'company', 1, '2020-05-18 20:59:27', '2020-05-18 20:59:27'),
(78, 'nnnnn', 8, NULL, 'company', 1, '2020-05-18 21:13:04', '2020-05-18 21:13:04'),
(79, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:17:22', '2020-05-18 21:17:22'),
(80, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:17:36', '2020-05-18 21:17:36'),
(81, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:17:59', '2020-05-18 21:17:59'),
(82, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:19:27', '2020-05-18 21:19:27'),
(83, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:24:39', '2020-05-18 21:24:39'),
(84, 'knknnk', 8, NULL, 'company', 1, '2020-05-18 21:27:30', '2020-05-18 21:27:30'),
(85, 'jkjkjk', 8, NULL, 'company', 1, '2020-05-18 21:28:29', '2020-05-18 21:28:29'),
(86, 'jkjkjk', 8, NULL, 'company', 1, '2020-05-18 21:32:34', '2020-05-18 21:32:34'),
(87, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:33:58', '2020-05-18 21:33:58'),
(88, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:34:31', '2020-05-18 21:34:31'),
(89, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:34:56', '2020-05-18 21:34:56'),
(90, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:35:18', '2020-05-18 21:35:18'),
(91, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:35:33', '2020-05-18 21:35:33'),
(92, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:36:24', '2020-05-18 21:36:24'),
(93, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:36:50', '2020-05-18 21:36:50'),
(94, 'sad', 8, NULL, 'company', 1, '2020-05-18 21:37:47', '2020-05-18 21:37:47'),
(95, 'cccc', 8, NULL, 'company', 1, '2020-05-18 21:38:21', '2020-05-18 21:38:21'),
(96, 'asddddd', 8, NULL, 'company', 1, '2020-05-18 21:41:03', '2020-05-18 21:41:03'),
(97, 'asd', 8, NULL, 'company', 1, '2020-05-18 21:41:43', '2020-05-18 21:41:43'),
(98, 'qwe', 8, NULL, 'company', 1, '2020-05-18 21:45:51', '2020-05-18 21:45:51'),
(99, 'qwee', 8, NULL, 'company', 1, '2020-05-18 21:47:25', '2020-05-18 21:47:25'),
(100, 'eee', 8, NULL, 'company', 1, '2020-05-18 21:49:07', '2020-05-18 21:49:07'),
(101, 'jjjj', 8, NULL, 'company', 1, '2020-05-18 21:50:46', '2020-05-18 21:50:46'),
(102, 'SZx', 8, NULL, 'company', 1, '2020-05-18 22:00:48', '2020-05-18 22:00:48'),
(103, 'nnnn', 8, NULL, 'company', 1, '2020-05-18 22:11:02', '2020-05-18 22:11:02'),
(104, 'asd', 8, NULL, 'company', 1, '2020-05-18 22:13:52', '2020-05-18 22:13:52'),
(105, 'nnn', 8, NULL, 'company', 1, '2020-05-18 22:16:38', '2020-05-18 22:16:38'),
(106, 'nnn', 8, NULL, 'company', 1, '2020-05-18 22:40:13', '2020-05-18 22:40:13'),
(107, 'nnn', 8, NULL, 'company', 1, '2020-05-18 22:41:49', '2020-05-18 22:41:49'),
(108, 'qqq', 8, NULL, 'company', 1, '2020-05-18 22:47:20', '2020-05-18 22:47:20'),
(109, 'ddd', 8, NULL, 'company', 1, '2020-05-18 22:48:39', '2020-05-18 22:48:39'),
(110, 'mmm', 8, NULL, 'company', 1, '2020-05-18 23:00:16', '2020-05-18 23:00:16'),
(111, 'm', 8, NULL, 'company', 1, '2020-05-18 23:01:57', '2020-05-18 23:01:57'),
(112, 'asss', 8, NULL, 'company', 1, '2020-05-18 23:03:37', '2020-05-18 23:03:37'),
(113, 'q', 8, NULL, 'company', 1, '2020-05-18 23:04:49', '2020-05-18 23:04:49'),
(114, 'a', 8, NULL, 'company', 1, '2020-05-18 23:08:40', '2020-05-18 23:08:40'),
(115, 'nmn', 8, NULL, 'company', 1, '2020-05-18 23:14:02', '2020-05-18 23:14:02'),
(116, 'm', 8, NULL, 'company', 1, '2020-05-18 23:15:20', '2020-05-18 23:15:20'),
(117, 'nnnnn', 8, NULL, 'company', 1, '2020-05-18 23:24:16', '2020-05-18 23:24:16'),
(118, 'k', 8, NULL, 'company', 1, '2020-05-18 23:42:12', '2020-05-18 23:42:12'),
(119, 'p', 8, NULL, 'company', 1, '2020-05-18 23:43:19', '2020-05-18 23:43:19'),
(120, 'p', 8, NULL, 'company', 1, '2020-05-18 23:44:15', '2020-05-18 23:44:15'),
(121, 'p', 8, NULL, 'company', 1, '2020-05-18 23:44:32', '2020-05-18 23:44:32'),
(122, 'p', 8, NULL, 'company', 1, '2020-05-18 23:45:26', '2020-05-18 23:45:26'),
(123, 'p', 8, NULL, 'company', 1, '2020-05-18 23:45:37', '2020-05-18 23:45:37'),
(124, 'p', 8, NULL, 'company', 1, '2020-05-18 23:46:39', '2020-05-18 23:46:39'),
(125, 'p', 8, NULL, 'company', 1, '2020-05-18 23:46:40', '2020-05-18 23:46:40'),
(126, 'asd', 8, NULL, 'company', 1, '2020-05-18 23:47:00', '2020-05-18 23:47:00'),
(127, 'asd', 8, NULL, 'company', 1, '2020-05-18 23:47:14', '2020-05-18 23:47:14'),
(128, 'sd', 8, NULL, 'company', 1, '2020-05-18 23:47:45', '2020-05-18 23:47:45'),
(129, 'sd', 8, NULL, 'company', 1, '2020-05-18 23:47:59', '2020-05-18 23:47:59'),
(130, 'as', 8, NULL, 'company', 1, '2020-05-19 02:16:05', '2020-05-19 02:16:05'),
(131, 'ew', 8, NULL, 'company', 1, '2020-05-19 02:18:37', '2020-05-19 02:18:37'),
(132, 'qwe', 8, NULL, 'company', 1, '2020-05-19 11:37:34', '2020-05-19 11:37:34'),
(133, 'qwe', 8, NULL, 'company', 1, '2020-05-19 11:46:22', '2020-05-19 11:46:22'),
(134, 'bn', 8, NULL, 'company', 1, '2020-05-19 11:56:10', '2020-05-19 11:56:10'),
(135, 'tes', 8, NULL, 'company', 1, '2020-05-19 12:41:34', '2020-05-19 12:41:34'),
(136, 'tes', 8, NULL, 'company', 1, '2020-05-19 12:46:05', '2020-05-19 12:46:05'),
(137, 'gh', 8, NULL, 'company', 1, '2020-05-19 12:52:53', '2020-05-19 12:52:53'),
(138, 'hjh', 8, NULL, 'company', 1, '2020-05-19 12:53:37', '2020-05-19 12:53:37'),
(139, 'jk', 8, NULL, 'company', 1, '2020-05-19 12:54:22', '2020-05-19 12:54:22'),
(140, 'jkj', 8, NULL, 'company', 1, '2020-05-19 12:56:45', '2020-05-19 12:56:45'),
(141, 'hj', 8, NULL, 'company', 1, '2020-05-19 13:00:57', '2020-05-19 13:00:57'),
(142, 'hgh', 8, NULL, 'company', 1, '2020-05-20 19:16:36', '2020-05-20 19:16:36'),
(143, 'nnnn', 8, NULL, 'company', 1, '2020-05-20 19:19:22', '2020-05-20 19:19:22'),
(144, 'nnnn', 8, NULL, 'company', 1, '2020-05-20 19:20:21', '2020-05-20 19:20:21'),
(145, 'nmn', 8, NULL, 'company', 1, '2020-05-20 19:21:17', '2020-05-20 19:21:17'),
(146, 'nmn', 8, NULL, 'company', 1, '2020-05-20 19:21:41', '2020-05-20 19:21:41'),
(147, 'nmn', 8, NULL, 'company', 1, '2020-05-20 19:22:47', '2020-05-20 19:22:47'),
(148, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:34:07', '2020-05-20 19:34:07'),
(149, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:34:37', '2020-05-20 19:34:37'),
(150, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:34:48', '2020-05-20 19:34:48'),
(151, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:35:00', '2020-05-20 19:35:00'),
(152, 'nmn', 8, NULL, 'company', 1, '2020-05-20 19:39:41', '2020-05-20 19:39:41'),
(153, 'mnn', 8, NULL, 'company', 1, '2020-05-20 19:40:53', '2020-05-20 19:40:53'),
(154, 'mnn', 8, NULL, 'company', 1, '2020-05-20 19:41:24', '2020-05-20 19:41:24'),
(155, 'mnn', 8, NULL, 'company', 1, '2020-05-20 19:42:16', '2020-05-20 19:42:16'),
(156, 'nnnn', 8, NULL, 'company', 1, '2020-05-20 19:44:03', '2020-05-20 19:44:03'),
(157, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:46:07', '2020-05-20 19:46:07'),
(158, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:46:20', '2020-05-20 19:46:20'),
(159, 'nnn', 8, NULL, 'company', 1, '2020-05-20 19:47:08', '2020-05-20 19:47:08'),
(160, 'nnn', 8, NULL, 'company', 1, '2020-05-20 19:47:16', '2020-05-20 19:47:16'),
(161, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:48:02', '2020-05-20 19:48:02'),
(162, 'mm', 8, NULL, 'company', 1, '2020-05-20 19:50:30', '2020-05-20 19:50:30'),
(163, 'mm', 8, NULL, 'company', 1, '2020-05-20 19:50:43', '2020-05-20 19:50:43'),
(164, 'mm', 8, NULL, 'company', 1, '2020-05-20 19:50:54', '2020-05-20 19:50:54'),
(165, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:51:50', '2020-05-20 19:51:50'),
(166, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:52:44', '2020-05-20 19:52:44'),
(167, 'nn', 8, NULL, 'company', 1, '2020-05-20 19:55:01', '2020-05-20 19:55:01'),
(168, 'bnb', 8, NULL, 'company', 1, '2020-05-20 21:25:23', '2020-05-20 21:25:23'),
(169, 'tes', 8, NULL, 'company', 1, '2020-05-20 21:26:41', '2020-05-20 21:26:41'),
(170, 'tes', 8, NULL, 'company', 1, '2020-05-22 22:01:39', '2020-05-22 22:01:39'),
(171, 'tes', 8, NULL, 'company', 1, '2020-05-22 22:09:49', '2020-05-22 22:09:49'),
(172, 'tes', 8, NULL, 'company', 1, '2020-05-22 22:15:36', '2020-05-22 22:15:36'),
(173, 'tes', 8, NULL, 'company', 1, '2020-05-22 22:29:56', '2020-05-22 22:29:56'),
(174, 'tes', 8, NULL, 'company', 1, '2020-05-22 22:32:11', '2020-05-22 22:32:11'),
(175, 'asd', 8, NULL, 'company', 1, '2020-05-22 22:41:54', '2020-05-22 22:41:54'),
(176, 'tre', 8, NULL, 'company', 1, '2020-05-22 22:54:37', '2020-05-22 22:54:37'),
(177, 'testernnow', 8, NULL, 'company', 1, '2020-05-29 00:21:51', '2020-05-29 00:21:51'),
(178, 'nmn', 14, NULL, 'company', 1, '2020-05-29 00:57:13', '2020-05-29 00:57:13'),
(179, 'asd', 17, NULL, 'company', 1, '2020-05-29 03:25:30', '2020-05-29 03:25:30'),
(183, 'tees', 23, NULL, 'company', 1, '2020-06-02 08:55:21', '2020-06-02 08:55:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `amount` double(15,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `project` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expenses`
--

INSERT INTO `expenses` (`id`, `category_id`, `description`, `amount`, `date`, `project`, `user_id`, `attachment`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 3, '', 10000000.00, '2020-04-20', 4, 8, NULL, 1, '2020-04-20 04:34:11', '2020-04-20 04:34:11'),
(2, 7, '', 3000000.00, '2020-04-20', 4, 12, NULL, 1, '2020-04-20 04:48:31', '2020-04-20 04:48:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses_categories`
--

CREATE TABLE `expenses_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `expenses_categories`
--

INSERT INTO `expenses_categories` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Snack', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(2, 'Server Charge', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(3, 'Bills', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(4, 'Office', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(5, 'Assests', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(6, 'Petty Cash', 1, '2020-04-20 04:46:21', '2020-04-20 04:46:21'),
(7, 'Gaji Tukang', 1, '2020-04-20 04:47:11', '2020-04-20 04:47:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double(15,2) NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_id`, `project_id`, `status`, `issue_date`, `due_date`, `discount`, `tax_id`, `terms`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2', '2020-04-17', '2020-04-30', 0.00, 1, 'Down Payment sadafaafafa', 1, '2020-04-17 08:02:37', '2020-06-11 12:39:46'),
(2, 2, 0, '3', '2020-04-21', '2020-04-20', 0.00, 1, '', 1, '2020-04-20 05:01:28', '2020-06-11 12:39:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(15,2) NOT NULL,
  `date` date NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `transaction_id`, `invoice_id`, `amount`, `date`, `payment_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 350000000.00, '2020-04-17', 1, 'Payment Part 1', '2020-04-17 08:40:36', '2020-04-17 08:40:36'),
(2, 2, 2, 3850000000.00, '2020-04-21', 2, '', '2020-04-20 05:04:45', '2020-04-20 05:04:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `iteam` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `invoice_id`, `iteam`, `price`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'test Invoice', 400000000.00, 'other', '2020-04-17 11:17:53', '2020-04-17 11:17:53'),
(3, 2, 'Pekerjaan Struktur-Progres 1', 2000000000.00, 'milestone', '2020-04-20 05:03:10', '2020-04-20 05:03:10'),
(4, 2, 'Pek. 3-Progres 1', 1000000000.00, 'milestone', '2020-04-20 05:03:25', '2020-04-20 05:03:25'),
(5, 2, '-Progres 1', 500000000.00, 'milestone', '2020-04-20 05:03:55', '2020-04-20 05:03:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'On Hold', 'bg-red-thunderbird bg-font-red-thunderbird', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(2, 'New', 'bg-yellow-casablanca bg-font-yellow-casablanca', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(3, 'Pending', 'bg-purple-intense bg-font-purple-intense', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(4, 'Loss', 'bg-purple-medium bg-font-purple-medium', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(5, 'Win', 'bg-yellow-soft bg-font-yellow-soft', 1, '2020-04-14 14:43:28', '2020-04-14 14:43:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT '0.00',
  `stage` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `client` int(11) NOT NULL DEFAULT '0',
  `source` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_order` smallint(6) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leads`
--

INSERT INTO `leads` (`id`, `name`, `price`, `stage`, `owner`, `client`, `source`, `created_by`, `notes`, `item_order`, `created_at`, `updated_at`) VALUES
(1, 'cipta lead', 2000000.00, 2, 3, 2, 1, 1, 'cipta lead notes', 0, '2020-04-14 14:46:04', '2020-06-05 10:13:13'),
(2, 'Project Bulu Tangkis', 8500000000.00, 3, 6, 7, 4, 1, 'fadafadfasfasfaga', 1, '2020-04-17 06:52:04', '2020-04-20 03:59:13'),
(3, 'Kyai Maja Prospek', 10000000000.00, 4, 6, 13, 4, 1, 'Proyek meggelegar abad ini', 0, '2020-04-20 03:58:07', '2020-04-20 03:59:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `leadsources`
--

CREATE TABLE `leadsources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leadsources`
--

INSERT INTO `leadsources` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Email', 1, '2020-04-14 14:43:26', '2020-04-14 14:43:26'),
(2, 'Facebook', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(3, 'Google', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(4, 'Phone', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `leadstages`
--

CREATE TABLE `leadstages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leadstages`
--

INSERT INTO `leadstages` (`id`, `name`, `color`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Initial Contact', '#e7505a', 1, 0, '2020-04-14 14:43:25', '2020-04-14 14:43:25'),
(2, 'Qualification', '#F4D03F', 1, 1, '2020-04-14 14:43:25', '2020-04-14 14:43:25'),
(3, 'Proposal', '#32c5d2', 1, 2, '2020-04-14 14:43:25', '2020-04-14 14:43:25'),
(4, 'Close', '#1BBC9B', 1, 3, '2020-04-14 14:43:26', '2020-04-14 14:43:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_18_120310_create_permission_tables', 1),
(4, '2019_10_23_095428_create_settings_table', 1),
(5, '2019_10_23_120558_create_leadstages_table', 1),
(6, '2019_10_24_060326_create_projectstages_table', 1),
(7, '2019_10_24_064028_create_leadsources_table', 1),
(8, '2019_10_24_071154_create_labels_table', 1),
(9, '2019_10_24_074519_create_productunits_table', 1),
(10, '2019_10_24_111452_create_expensescategories_table', 1),
(11, '2019_10_25_042508_create_leads_table', 1),
(12, '2019_11_06_053858_create_projects_table', 1),
(13, '2019_11_06_084310_create_products_table', 1),
(14, '2019_11_06_115449_create_userprojects_table', 1),
(15, '2019_11_07_074239_create_milestones_table', 1),
(16, '2019_11_07_105840_create_activity_log_table', 1),
(17, '2019_11_07_115130_create_project_files_table', 1),
(18, '2019_11_08_051517_create_tasks_table', 1),
(19, '2019_11_12_073012_create_bug_comments_table', 1),
(20, '2019_11_12_073012_create_comments_table', 1),
(21, '2019_11_12_100007_create_bug_files_table', 1),
(22, '2019_11_12_100007_create_task_files_table', 1),
(23, '2019_11_13_051828_create_taxes_table', 1),
(24, '2019_11_13_055026_create_invoices_table', 1),
(25, '2019_11_13_072623_create_expenses_table', 1),
(26, '2019_11_13_091357_create_payments_table', 1),
(27, '2019_11_13_111238_create_invoice_products_table', 1),
(28, '2019_11_13_120015_create_invoice_payments_table', 1),
(29, '2019_11_14_105120_create_check_list_table', 1),
(30, '2019_11_15_104222_create_client_permission_table', 1),
(31, '2019_11_25_041305_create_notes_table', 1),
(32, '2019_12_18_071134_create_timesheets_table', 1),
(33, '2019_12_18_110230_create_bugs_table', 1),
(34, '2019_12_18_112007_create_bug_statuses_table', 1),
(35, '2020_04_12_131307_create_voice_note_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `milestones`
--

CREATE TABLE `milestones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(15,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\User', 1),
(1, 'App\\User', 2),
(3, 'App\\User', 3),
(1, 'App\\User', 4),
(11, 'App\\User', 5),
(11, 'App\\User', 6),
(1, 'App\\User', 7),
(11, 'App\\User', 8),
(7, 'App\\User', 9),
(5, 'App\\User', 10),
(9, 'App\\User', 11),
(10, 'App\\User', 12),
(1, 'App\\User', 13),
(8, 'App\\User', 14),
(1, 'App\\User', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29'),
(2, 'Bank', 1, '2020-04-14 14:43:30', '2020-04-14 14:43:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage user', 'web', '2020-04-14 14:38:51', '2020-04-14 14:38:51'),
(2, 'create user', 'web', '2020-04-14 14:38:52', '2020-04-14 14:38:52'),
(3, 'edit user', 'web', '2020-04-14 14:38:52', '2020-04-14 14:38:52'),
(4, 'delete user', 'web', '2020-04-14 14:38:53', '2020-04-14 14:38:53'),
(5, 'manage language', 'web', '2020-04-14 14:38:53', '2020-04-14 14:38:53'),
(6, 'create language', 'web', '2020-04-14 14:38:54', '2020-04-14 14:38:54'),
(7, 'manage account', 'web', '2020-04-14 14:38:54', '2020-04-14 14:38:54'),
(8, 'edit account', 'web', '2020-04-14 14:38:55', '2020-04-14 14:38:55'),
(9, 'change password account', 'web', '2020-04-14 14:38:55', '2020-04-14 14:38:55'),
(10, 'manage system settings', 'web', '2020-04-14 14:38:56', '2020-04-14 14:38:56'),
(11, 'manage role', 'web', '2020-04-14 14:38:56', '2020-04-14 14:38:56'),
(12, 'create role', 'web', '2020-04-14 14:38:57', '2020-04-14 14:38:57'),
(13, 'edit role', 'web', '2020-04-14 14:38:57', '2020-04-14 14:38:57'),
(14, 'delete role', 'web', '2020-04-14 14:38:58', '2020-04-14 14:38:58'),
(15, 'manage permission', 'web', '2020-04-14 14:38:58', '2020-04-14 14:38:58'),
(16, 'create permission', 'web', '2020-04-14 14:38:59', '2020-04-14 14:38:59'),
(17, 'edit permission', 'web', '2020-04-14 14:38:59', '2020-04-14 14:38:59'),
(18, 'delete permission', 'web', '2020-04-14 14:39:00', '2020-04-14 14:39:00'),
(19, 'manage company settings', 'web', '2020-04-14 14:39:00', '2020-04-14 14:39:00'),
(20, 'manage lead stage', 'web', '2020-04-14 14:39:01', '2020-04-14 14:39:01'),
(21, 'create lead stage', 'web', '2020-04-14 14:39:01', '2020-04-14 14:39:01'),
(22, 'edit lead stage', 'web', '2020-04-14 14:39:02', '2020-04-14 14:39:02'),
(23, 'delete lead stage', 'web', '2020-04-14 14:39:03', '2020-04-14 14:39:03'),
(24, 'manage project stage', 'web', '2020-04-14 14:39:03', '2020-04-14 14:39:03'),
(25, 'create project stage', 'web', '2020-04-14 14:39:04', '2020-04-14 14:39:04'),
(26, 'edit project stage', 'web', '2020-04-14 14:39:05', '2020-04-14 14:39:05'),
(27, 'delete project stage', 'web', '2020-04-14 14:39:06', '2020-04-14 14:39:06'),
(28, 'manage lead source', 'web', '2020-04-14 14:39:06', '2020-04-14 14:39:06'),
(29, 'create lead source', 'web', '2020-04-14 14:39:07', '2020-04-14 14:39:07'),
(30, 'edit lead source', 'web', '2020-04-14 14:39:08', '2020-04-14 14:39:08'),
(31, 'delete lead source', 'web', '2020-04-14 14:39:09', '2020-04-14 14:39:09'),
(32, 'manage label', 'web', '2020-04-14 14:39:09', '2020-04-14 14:39:09'),
(33, 'create label', 'web', '2020-04-14 14:39:10', '2020-04-14 14:39:10'),
(34, 'edit label', 'web', '2020-04-14 14:39:10', '2020-04-14 14:39:10'),
(35, 'delete label', 'web', '2020-04-14 14:39:11', '2020-04-14 14:39:11'),
(36, 'manage product unit', 'web', '2020-04-14 14:39:12', '2020-04-14 14:39:12'),
(37, 'create product unit', 'web', '2020-04-14 14:39:12', '2020-04-14 14:39:12'),
(38, 'edit product unit', 'web', '2020-04-14 14:39:13', '2020-04-14 14:39:13'),
(39, 'delete product unit', 'web', '2020-04-14 14:39:13', '2020-04-14 14:39:13'),
(40, 'manage expense', 'web', '2020-04-14 14:39:14', '2020-04-14 14:39:14'),
(41, 'create expense', 'web', '2020-04-14 14:39:15', '2020-04-14 14:39:15'),
(42, 'edit expense', 'web', '2020-04-14 14:39:15', '2020-04-14 14:39:15'),
(43, 'delete expense', 'web', '2020-04-14 14:39:16', '2020-04-14 14:39:16'),
(44, 'manage client', 'web', '2020-04-14 14:39:17', '2020-04-14 14:39:17'),
(45, 'create client', 'web', '2020-04-14 14:39:18', '2020-04-14 14:39:18'),
(46, 'edit client', 'web', '2020-04-14 14:39:20', '2020-04-14 14:39:20'),
(47, 'delete client', 'web', '2020-04-14 14:39:21', '2020-04-14 14:39:21'),
(48, 'manage lead', 'web', '2020-04-14 14:39:22', '2020-04-14 14:39:22'),
(49, 'create lead', 'web', '2020-04-14 14:39:22', '2020-04-14 14:39:22'),
(50, 'edit lead', 'web', '2020-04-14 14:39:23', '2020-04-14 14:39:23'),
(51, 'delete lead', 'web', '2020-04-14 14:39:23', '2020-04-14 14:39:23'),
(52, 'manage project', 'web', '2020-04-14 14:39:24', '2020-04-14 14:39:24'),
(53, 'create project', 'web', '2020-04-14 14:39:25', '2020-04-14 14:39:25'),
(54, 'edit project', 'web', '2020-04-14 14:39:25', '2020-04-14 14:39:25'),
(55, 'delete project', 'web', '2020-04-14 14:39:26', '2020-04-14 14:39:26'),
(56, 'client permission project', 'web', '2020-04-14 14:39:26', '2020-04-14 14:39:26'),
(57, 'invite user project', 'web', '2020-04-14 14:39:27', '2020-04-14 14:39:27'),
(58, 'manage product', 'web', '2020-04-14 14:39:28', '2020-04-14 14:39:28'),
(59, 'create product', 'web', '2020-04-14 14:39:28', '2020-04-14 14:39:28'),
(60, 'edit product', 'web', '2020-04-14 14:39:29', '2020-04-14 14:39:29'),
(61, 'delete product', 'web', '2020-04-14 14:39:29', '2020-04-14 14:39:29'),
(62, 'show project', 'web', '2020-04-14 14:39:30', '2020-04-14 14:39:30'),
(63, 'manage tax', 'web', '2020-04-14 14:39:30', '2020-04-14 14:39:30'),
(64, 'create tax', 'web', '2020-04-14 14:39:31', '2020-04-14 14:39:31'),
(65, 'edit tax', 'web', '2020-04-14 14:39:31', '2020-04-14 14:39:31'),
(66, 'delete tax', 'web', '2020-04-14 14:39:32', '2020-04-14 14:39:32'),
(67, 'manage invoice', 'web', '2020-04-14 14:39:33', '2020-04-14 14:39:33'),
(68, 'create invoice', 'web', '2020-04-14 14:39:33', '2020-04-14 14:39:33'),
(69, 'edit invoice', 'web', '2020-04-14 14:39:34', '2020-04-14 14:39:34'),
(70, 'delete invoice', 'web', '2020-04-14 14:39:35', '2020-04-14 14:39:35'),
(71, 'show invoice', 'web', '2020-04-14 14:39:35', '2020-04-14 14:39:35'),
(72, 'manage expense category', 'web', '2020-04-14 14:39:36', '2020-04-14 14:39:36'),
(73, 'create expense category', 'web', '2020-04-14 14:39:36', '2020-04-14 14:39:36'),
(74, 'edit expense category', 'web', '2020-04-14 14:39:37', '2020-04-14 14:39:37'),
(75, 'delete expense category', 'web', '2020-04-14 14:39:38', '2020-04-14 14:39:38'),
(76, 'manage payment', 'web', '2020-04-14 14:39:39', '2020-04-14 14:39:39'),
(77, 'create payment', 'web', '2020-04-14 14:39:39', '2020-04-14 14:39:39'),
(78, 'edit payment', 'web', '2020-04-14 14:39:41', '2020-04-14 14:39:41'),
(79, 'delete payment', 'web', '2020-04-14 14:39:41', '2020-04-14 14:39:41'),
(80, 'manage invoice product', 'web', '2020-04-14 14:39:42', '2020-04-14 14:39:42'),
(81, 'create invoice product', 'web', '2020-04-14 14:39:42', '2020-04-14 14:39:42'),
(82, 'edit invoice product', 'web', '2020-04-14 14:39:43', '2020-04-14 14:39:43'),
(83, 'delete invoice product', 'web', '2020-04-14 14:39:44', '2020-04-14 14:39:44'),
(84, 'manage invoice payment', 'web', '2020-04-14 14:39:44', '2020-04-14 14:39:44'),
(85, 'create invoice payment', 'web', '2020-04-14 14:39:47', '2020-04-14 14:39:47'),
(86, 'manage task', 'web', '2020-04-14 14:39:48', '2020-04-14 14:39:48'),
(87, 'create task', 'web', '2020-04-14 14:39:49', '2020-04-14 14:39:49'),
(88, 'edit task', 'web', '2020-04-14 14:39:49', '2020-04-14 14:39:49'),
(89, 'delete task', 'web', '2020-04-14 14:39:50', '2020-04-14 14:39:50'),
(90, 'move task', 'web', '2020-04-14 14:39:50', '2020-04-14 14:39:50'),
(91, 'show task', 'web', '2020-04-14 14:39:51', '2020-04-14 14:39:51'),
(92, 'create checklist', 'web', '2020-04-14 14:39:51', '2020-04-14 14:39:51'),
(93, 'edit checklist', 'web', '2020-04-14 14:39:52', '2020-04-14 14:39:52'),
(94, 'create milestone', 'web', '2020-04-14 14:39:53', '2020-04-14 14:39:53'),
(95, 'edit milestone', 'web', '2020-04-14 14:39:53', '2020-04-14 14:39:53'),
(96, 'delete milestone', 'web', '2020-04-14 14:39:54', '2020-04-14 14:39:54'),
(97, 'view milestone', 'web', '2020-04-14 14:39:55', '2020-04-14 14:39:55'),
(98, 'manage change password', 'web', '2020-04-14 14:39:55', '2020-04-14 14:39:55'),
(99, 'manage note', 'web', '2020-04-14 14:39:56', '2020-04-14 14:39:56'),
(100, 'create note', 'web', '2020-04-14 14:39:57', '2020-04-14 14:39:57'),
(101, 'edit note', 'web', '2020-04-14 14:39:57', '2020-04-14 14:39:57'),
(102, 'delete note', 'web', '2020-04-14 14:39:58', '2020-04-14 14:39:58'),
(103, 'manage bug status', 'web', '2020-04-14 14:39:58', '2020-04-14 14:39:58'),
(104, 'create bug status', 'web', '2020-04-14 14:39:59', '2020-04-14 14:39:59'),
(105, 'edit bug status', 'web', '2020-04-14 14:40:00', '2020-04-14 14:40:00'),
(106, 'delete bug status', 'web', '2020-04-14 14:40:01', '2020-04-14 14:40:01'),
(107, 'move bug status', 'web', '2020-04-14 14:40:01', '2020-04-14 14:40:01'),
(108, 'manage bug report', 'web', '2020-04-14 14:40:02', '2020-04-14 14:40:02'),
(109, 'create bug report', 'web', '2020-04-14 14:40:02', '2020-04-14 14:40:02'),
(110, 'edit bug report', 'web', '2020-04-14 14:40:03', '2020-04-14 14:40:03'),
(111, 'delete bug report', 'web', '2020-04-14 14:40:03', '2020-04-14 14:40:03'),
(112, 'move bug report', 'web', '2020-04-14 14:40:04', '2020-04-14 14:40:04'),
(113, 'manage timesheet', 'web', '2020-04-14 14:40:04', '2020-04-14 14:40:04'),
(114, 'create timesheet', 'web', '2020-04-14 14:40:05', '2020-04-14 14:40:05'),
(115, 'edit timesheet', 'web', '2020-04-14 14:40:05', '2020-04-14 14:40:05'),
(116, 'delete timesheet', 'web', '2020-04-14 14:40:06', '2020-04-14 14:40:06'),
(117, 'payment reminder invoice', 'web', '2020-04-14 14:40:07', '2020-04-14 14:40:07'),
(118, 'send invoice', 'web', '2020-04-14 14:40:08', '2020-04-14 14:40:08'),
(119, 'custom mail send invoice', 'web', '2020-04-14 14:40:08', '2020-04-14 14:40:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `productunits`
--

CREATE TABLE `productunits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `productunits`
--

INSERT INTO `productunits` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Kilogram', 1, '2020-04-14 14:43:28', '2020-04-14 14:43:28'),
(2, 'Piece', 1, '2020-04-14 14:43:28', '2020-04-14 14:43:28'),
(3, 'Set', 1, '2020-04-14 14:43:28', '2020-04-14 14:43:28'),
(4, 'Item', 1, '2020-04-14 14:43:28', '2020-04-14 14:43:28'),
(5, 'Hour', 1, '2020-04-14 14:43:29', '2020-04-14 14:43:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT '0.00',
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `client` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` int(11) NOT NULL DEFAULT '0',
  `lead` int(11) NOT NULL DEFAULT '0',
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on_going',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `projects`
--

INSERT INTO `projects` (`id`, `name`, `price`, `start_date`, `due_date`, `client`, `description`, `label`, `lead`, `status`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Web Company Profile', 12000000.00, '2020-04-16', '2020-04-16', 2, '', 2, 1, 'on_going', 1, 1, '2020-04-15 23:45:35', '2020-04-15 23:45:35'),
(3, 'Beautyful Clinic', 1500000000.00, '2020-04-02', '2020-06-06', 4, 'Renovation of .....sdsaasjfajsaoaso\r\nsasasasajjsaa', 3, 1, 'on_going', 1, 1, '2020-04-17 06:25:00', '2020-04-17 06:25:00'),
(4, 'Kyai Maja', 10000000000.00, '2020-04-21', '2020-06-21', 13, '', 2, 3, 'on_going', 1, 1, '2020-04-20 04:01:21', '2020-04-20 04:01:21'),
(5, 'WIJAYA-1', 150000000.00, '2020-04-23', '2020-06-23', 2, 'Renovasi Kantor Wijaya-1', 2, 1, 'on_going', 1, 1, '2020-04-23 04:13:38', '2020-04-23 04:13:38'),
(6, 'test project', 100000000.00, '2020-05-29', '2020-05-30', 2, '', 4, 1, 'on_going', 1, 1, '2020-05-29 05:40:42', '2020-05-29 05:40:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `projectstages`
--

CREATE TABLE `projectstages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `projectstages`
--

INSERT INTO `projectstages` (`id`, `name`, `color`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'To Do', '#e7505a', 1, 0, '2020-04-14 14:43:26', '2020-04-14 14:43:26'),
(2, 'In Progress', '#F4D03F', 1, 1, '2020-04-14 14:43:26', '2020-04-14 14:43:26'),
(3, 'Issue', '32C5D2', 1, 2, '2020-04-14 14:43:26', '2020-04-19 08:07:26'),
(4, 'Done', '#1BBC9B', 1, 3, '2020-04-14 14:43:26', '2020-04-14 14:43:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_files`
--

CREATE TABLE `project_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'client', 'web', 0, '2020-04-14 14:40:08', '2020-04-14 14:40:08'),
(2, 'company', 'web', 0, '2020-04-14 14:40:42', '2020-04-14 14:40:42'),
(3, 'employee', 'web', 1, '2020-04-14 14:43:01', '2020-04-14 14:43:01'),
(4, 'Project Manager', 'web', 1, '2020-04-17 06:19:41', '2020-04-17 06:19:41'),
(5, 'HO-Admin', 'web', 1, '2020-04-17 06:22:03', '2020-04-17 06:22:03'),
(6, 'Management', 'web', 1, '2020-04-17 06:42:22', '2020-04-17 06:42:22'),
(7, 'Project Control', 'web', 1, '2020-04-20 03:41:45', '2020-04-20 03:41:45'),
(8, 'Site Manager', 'web', 1, '2020-04-20 03:42:39', '2020-04-20 03:42:39'),
(9, 'Finance', 'web', 1, '2020-04-20 03:47:31', '2020-04-20 03:47:31'),
(10, 'Project Admin', 'web', 1, '2020-04-20 03:52:47', '2020-04-20 03:52:47'),
(11, 'Super Admin', 'web', 1, '2020-04-20 05:09:49', '2020-04-20 05:09:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(7, 1),
(8, 1),
(9, 1),
(52, 1),
(62, 1),
(86, 1),
(87, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(119, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(109, 2),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(117, 2),
(118, 2),
(7, 3),
(8, 3),
(9, 3),
(48, 3),
(52, 3),
(62, 3),
(86, 3),
(90, 3),
(91, 3),
(92, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(1, 4),
(2, 4),
(3, 4),
(7, 4),
(8, 4),
(20, 4),
(21, 4),
(22, 4),
(24, 4),
(25, 4),
(26, 4),
(28, 4),
(29, 4),
(30, 4),
(32, 4),
(33, 4),
(34, 4),
(36, 4),
(37, 4),
(38, 4),
(40, 4),
(41, 4),
(42, 4),
(44, 4),
(45, 4),
(46, 4),
(48, 4),
(49, 4),
(52, 4),
(53, 4),
(54, 4),
(55, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(67, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(76, 4),
(77, 4),
(80, 4),
(84, 4),
(92, 4),
(93, 4),
(99, 4),
(100, 4),
(101, 4),
(102, 4),
(108, 4),
(109, 4),
(110, 4),
(111, 4),
(112, 4),
(113, 4),
(114, 4),
(115, 4),
(116, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(7, 5),
(8, 5),
(9, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(19, 5),
(23, 5),
(27, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(47, 5),
(51, 5),
(52, 5),
(54, 5),
(55, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(62, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(67, 5),
(68, 5),
(69, 5),
(70, 5),
(71, 5),
(72, 5),
(73, 5),
(74, 5),
(75, 5),
(76, 5),
(77, 5),
(78, 5),
(79, 5),
(80, 5),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(1, 6),
(7, 6),
(11, 6),
(19, 6),
(20, 6),
(24, 6),
(28, 6),
(32, 6),
(36, 6),
(40, 6),
(44, 6),
(48, 6),
(52, 6),
(58, 6),
(62, 6),
(63, 6),
(67, 6),
(71, 6),
(72, 6),
(76, 6),
(80, 6),
(84, 6),
(86, 6),
(91, 6),
(92, 6),
(99, 6),
(108, 6),
(112, 6),
(113, 6),
(20, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 7),
(25, 7),
(26, 7),
(27, 7),
(28, 7),
(29, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 7),
(34, 7),
(35, 7),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(48, 7),
(49, 7),
(50, 7),
(51, 7),
(52, 7),
(53, 7),
(54, 7),
(55, 7),
(58, 7),
(59, 7),
(60, 7),
(61, 7),
(62, 7),
(20, 8),
(21, 8),
(22, 8),
(23, 8),
(24, 8),
(26, 8),
(28, 8),
(30, 8),
(36, 8),
(37, 8),
(38, 8),
(40, 8),
(41, 8),
(42, 8),
(48, 8),
(49, 8),
(50, 8),
(51, 8),
(52, 8),
(57, 8),
(58, 8),
(60, 8),
(62, 8),
(72, 8),
(73, 8),
(74, 8),
(86, 8),
(88, 8),
(91, 8),
(93, 8),
(99, 8),
(100, 8),
(101, 8),
(102, 8),
(67, 9),
(68, 9),
(69, 9),
(70, 9),
(71, 9),
(76, 9),
(77, 9),
(78, 9),
(79, 9),
(80, 9),
(81, 9),
(82, 9),
(83, 9),
(84, 9),
(85, 9),
(52, 10),
(53, 10),
(54, 10),
(55, 10),
(58, 10),
(59, 10),
(60, 10),
(61, 10),
(62, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(7, 11),
(8, 11),
(9, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11),
(30, 11),
(31, 11),
(32, 11),
(33, 11),
(34, 11),
(35, 11),
(36, 11),
(37, 11),
(38, 11),
(39, 11),
(40, 11),
(41, 11),
(42, 11),
(43, 11),
(44, 11),
(45, 11),
(46, 11),
(47, 11),
(48, 11),
(49, 11),
(50, 11),
(51, 11),
(52, 11),
(53, 11),
(54, 11),
(55, 11),
(58, 11),
(59, 11),
(60, 11),
(61, 11),
(62, 11),
(63, 11),
(64, 11),
(65, 11),
(66, 11),
(67, 11),
(68, 11),
(69, 11),
(70, 11),
(71, 11),
(72, 11),
(73, 11),
(74, 11),
(75, 11),
(76, 11),
(77, 11),
(78, 11),
(79, 11),
(80, 11),
(81, 11),
(82, 11),
(83, 11),
(84, 11),
(85, 11),
(86, 11),
(87, 11),
(88, 11),
(89, 11),
(90, 11),
(91, 11),
(92, 11),
(93, 11),
(99, 11),
(100, 11),
(101, 11),
(102, 11),
(108, 11),
(109, 11),
(110, 11),
(111, 11),
(112, 11),
(113, 11),
(114, 11),
(115, 11),
(116, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'header_text', 'Maxtrindo Project Management System', 1, NULL, NULL),
(2, 'footer_text', 'Matrixindo Multi Kreasi. All Rights Reserved .', 1, NULL, NULL),
(5, 'site_currency', 'Rupiah', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(6, 'site_currency_symbol', 'Rp.', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(7, 'site_currency_symbol_position', 'pre', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(8, 'site_date_format', 'd-m-Y', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(9, 'site_time_format', 'H:i', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(10, 'invoice_prefix', '#INV', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(11, 'bug_prefix', '#ISSUE', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(12, 'invoice_title', '', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(13, 'invoice_text', '', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(14, 'invoice_color', '6676EF', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(33, 'company_name', 'pT. Matrixindo Multi Kreasi', 1, NULL, NULL),
(34, 'company_address', 'Jalan Ceger Raya No 38B Cipayung, Jakarta Timur, DKI Jakarta, Indonesia', 1, NULL, NULL),
(35, 'company_city', 'Jakarta Timur', 1, NULL, NULL),
(36, 'company_state', 'DKI Jakarta', 1, NULL, NULL),
(37, 'company_zipcode', '', 1, NULL, NULL),
(38, 'company_country', 'Indonesia', 1, NULL, NULL),
(39, 'company_telephone', '021 -22876608', 1, NULL, NULL),
(40, 'company_email', 'Info@Matrixindo.Co.Id', 1, NULL, NULL),
(41, 'company_email_from_name', 'info@matrixindo.co.id', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `assign_to` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'todo',
  `stage` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `task_files`
--

CREATE TABLE `task_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `checklist_id` int(11) DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,2) NOT NULL DEFAULT '0.00',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'PPN', 10.00, 1, '2020-04-17 08:01:48', '2020-04-17 08:01:48'),
(2, 'PPH Jasa', 2.00, 1, '2020-04-17 08:02:08', '2020-04-17 08:02:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `task_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT '0.00',
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `timesheets`
--

INSERT INTO `timesheets` (`id`, `project_id`, `user_id`, `task_id`, `date`, `hours`, `remark`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 7, '2020-04-21', 48.00, '', '2020-04-20 04:26:59', '2020-04-20 04:26:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `userprojects`
--

CREATE TABLE `userprojects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `delete_status` int(11) NOT NULL DEFAULT '1',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `created_by`, `delete_status`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$uMPc013eDS0d1gfJ5zzrS.XcZgcV24FqZr4EWOqq4iuOc2V5Nlw0K', 'company', 'admin_1591879255.png', 'id', 0, 1, 1, 'Yz8qcpJae0T8fVxPDgi7C8cwJIysiItW8JK4Wx4JqhzcaH5dgsgcO0m931be', '2020-04-14 14:43:00', '2020-06-11 12:40:55'),
(2, 'cipta client', 'agicipta73@gmail.com', NULL, '$2y$10$n1egF23.k0G141a82fXGrOS7omzISEoXIP1zAr5dLK3seyq4Yl96O', 'client', '', 'en', 1, 1, 1, NULL, '2020-04-14 14:44:22', '2020-04-14 14:44:22'),
(3, 'cipta user', 'cipta_ageung@yahoo.co.id', NULL, '$2y$10$7vx.JljS9Jao3T9R7mxvQOnsJKbU.ct5PH50gcjk0PgsnQN2Uz6D6', 'employee', '', 'en', 1, 1, 1, NULL, '2020-04-14 14:45:10', '2020-04-14 14:45:10'),
(4, 'Dr. Tompi', 'tompi@tompi.com', NULL, '$2y$10$1qoPr8wCJO861WSse7HBXeElziZy8fZgQ770EzXDrpSzHhUVm38PC', 'client', '', 'en', 1, 1, 1, NULL, '2020-04-17 06:14:13', '2020-04-17 06:14:13'),
(5, 'Adi', 'adi@matrixindo.co.id', NULL, '$2y$10$wGnyznyR887QTgYKpiIw5uEi.2751dypvzN422FHiGqDJjdwQQfVK', 'Super Admin', '', 'en', 1, 1, 1, 'PTWqTJwK2DFxYaSvT9RNKL1B1YYNw5HhR1SPZIZfCcaGkKHnYdhKNzz2nusj', '2020-04-17 06:23:58', '2020-04-20 05:10:09'),
(6, 'Belly Ferdiansyah', 'belly@matrixindo.co.id', NULL, '$2y$10$1PxB9i4CDrAPsArVal2Sa.NYCkAZ.VNqsEO../blWlNAVYVEGXoH.', 'Super Admin', '', 'en', 1, 1, 1, NULL, '2020-04-17 06:48:51', '2020-04-20 05:10:31'),
(7, 'Client Bulu Tangkis (Robby)', 'robi@robi.com', NULL, '$2y$10$vzhHL5cwA.uFucEuw9Iz2.D7zzceJVU4Bx5A1mNg/vM476YbpI88C', 'client', '', 'en', 1, 1, 1, NULL, '2020-04-17 06:50:13', '2020-04-17 06:50:13'),
(8, 'Ian', 'ian@matrixindo.co.id', NULL, '$2y$10$WgMxHY88z4ssDf9XWA9qju7Tvcvw8C3atj8ifPjnAnpKfBZm0QfP.', 'Super Admin', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:22:07', '2020-04-20 05:19:16'),
(9, 'Albert', 'albert@matrixindo.co.id', NULL, '$2y$10$wbjfrcVFLXS.vFdJ9XIcGumlqBudW6n2Rl.qFMAxpE1fBgp1Vtx6m', 'Project Control', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:43:12', '2020-04-20 03:43:12'),
(10, 'Ratna', 'ratna@matrixindo.co.id', NULL, '$2y$10$KHwFjaNN8/8R1/2rwc8Tk.tnyoeP3eSyTX0swGfTY.6yUp3V1nBTK', 'HO-Admin', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:46:19', '2020-04-20 03:46:19'),
(11, 'Chyntia', 'chyntia@matrixindo.co.id', NULL, '$2y$10$4UqoV18Cxn3/9vDd9Da1XeAjnjLZAWAKg8NZE6vA1FspRm.zHlUoG', 'Finance', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:49:30', '2020-04-20 03:49:30'),
(12, 'Fizri', 'fizri@matrixindo.co.id', NULL, '$2y$10$SUuMGsF6yzXZlo.yNspeIu3R6LgvYoaqcKqLz1vzEXyDTbh60N6su', 'Project Admin', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:52:13', '2020-04-20 03:53:04'),
(13, 'Bpk Basuki', 'basuki@example.com', NULL, '$2y$10$Cs4teezu8k19bvT6SbOBTuf3bDSpE13Tswr0yIJFXZzWa/xRYGtQW', 'client', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:55:58', '2020-04-20 03:55:58'),
(14, 'Ridwan', 'ridwan@matrixindo.co.id', NULL, '$2y$10$4wFdCGs3k7G4aMRcp.60RuUFQWv3z/tk63UDglsQ8S.0tsVO1O82y', 'Site Manager', '', 'en', 1, 1, 1, 'n4Vcfse7AdREXXfYMOmOP9ue2llKqWIPQ33mwFxhwj7gfcxOJiZglMd0y1Dh', '2020-04-20 04:58:38', '2020-04-23 04:10:55'),
(15, 'Ibu XXX', 'xxx@gmail.com', NULL, '$2y$10$phB64AcoG/nxkh6fTXOnlO8eRdh7zAgIhQPfaOTEUDzTM.GhktpT.', 'client', '', 'en', 1, 1, 1, NULL, '2020-04-23 04:14:25', '2020-04-23 04:14:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voicenotes`
--

CREATE TABLE `voicenotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voicenote` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `checklist_id` int(11) DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `voicenotes`
--

INSERT INTO `voicenotes` (`id`, `voicenote`, `filename`, `task_id`, `checklist_id`, `user_type`, `created_by`, `created_at`, `updated_at`) VALUES
(3, '81590186577_2020-05-22T22:29:36.160Zwav', '81590186577_2020-05-22T22:29:36.160Zwav', 8, NULL, 'company', 1, '2020-05-22 22:29:56', '2020-05-22 22:29:56'),
(4, '81590186719_2020-05-22T22:31:58.218Zwav', '81590186719_2020-05-22T22:31:58.218Zwav', 8, NULL, 'company', 1, '2020-05-22 22:32:12', '2020-05-22 22:32:12'),
(5, '81590187243_2020-05-22T22:40:42.554Zwav', '81590187243_2020-05-22T22:40:42.554Zwav', 8, 19, 'company', 1, '2020-05-22 22:41:54', '2020-05-22 22:41:54'),
(6, '81590188061_2020-05-22T22:54:20.091Zwav', '81590188061_2020-05-22T22:54:20.091Zwav', 8, 19, 'company', 1, '2020-05-22 22:54:37', '2020-05-22 22:54:37'),
(7, '81590711690_2020-05-29T00:21:29.687Zwav', '81590711690_2020-05-29T00:21:29.687Zwav', 8, 19, 'company', 1, '2020-05-29 00:21:51', '2020-05-29 00:21:51'),
(8, '81590713821_2020-05-29T00:57:00.303Zwav', '81590713821_2020-05-29T00:57:00.303Zwav', 8, 14, 'company', 1, '2020-05-29 00:57:13', '2020-05-29 00:57:13'),
(9, '81590722717_29-05-2020-10-25-16.wav', '81590722717_29-05-2020-10-25-16.wav', 8, 17, 'company', 1, '2020-05-29 03:25:30', '2020-05-29 03:25:30'),
(10, '61591071490_2020-06-02T04:18:09.541Z.wav', '61591071490_2020-06-02T04:18:09.541Z.wav', 6, 8, 'company', 1, '2020-06-02 04:18:55', '2020-06-02 04:18:55'),
(11, '61591071490_2020-06-02T04:18:09.541Z.wav', '61591071490_2020-06-02T04:18:09.541Z.wav', 6, 8, 'company', 1, '2020-06-02 04:19:07', '2020-06-02 04:19:07'),
(12, '61591071490_2020-06-02T04:18:09.541Z.wav', '61591071490_2020-06-02T04:18:09.541Z.wav', 6, 7, 'company', 1, '2020-06-02 04:24:03', '2020-06-02 04:24:03'),
(13, 'null', 'null', 10, 23, 'company', 1, '2020-06-02 08:55:21', '2020-06-02 08:55:21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bugs`
--
ALTER TABLE `bugs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bug_comments`
--
ALTER TABLE `bug_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bug_files`
--
ALTER TABLE `bug_files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bug_statuses`
--
ALTER TABLE `bug_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `check_lists`
--
ALTER TABLE `check_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `client_permissions`
--
ALTER TABLE `client_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `expenses_categories`
--
ALTER TABLE `expenses_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leadsources`
--
ALTER TABLE `leadsources`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `leadstages`
--
ALTER TABLE `leadstages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `milestones`
--
ALTER TABLE `milestones`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `productunits`
--
ALTER TABLE `productunits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `projectstages`
--
ALTER TABLE `projectstages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indeks untuk tabel `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `userprojects`
--
ALTER TABLE `userprojects`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `voicenotes`
--
ALTER TABLE `voicenotes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `bugs`
--
ALTER TABLE `bugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bug_comments`
--
ALTER TABLE `bug_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bug_files`
--
ALTER TABLE `bug_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bug_statuses`
--
ALTER TABLE `bug_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `check_lists`
--
ALTER TABLE `check_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `client_permissions`
--
ALTER TABLE `client_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `expenses_categories`
--
ALTER TABLE `expenses_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `leadsources`
--
ALTER TABLE `leadsources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `leadstages`
--
ALTER TABLE `leadstages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `productunits`
--
ALTER TABLE `productunits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `projectstages`
--
ALTER TABLE `projectstages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT untuk tabel `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `userprojects`
--
ALTER TABLE `userprojects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `voicenotes`
--
ALTER TABLE `voicenotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
