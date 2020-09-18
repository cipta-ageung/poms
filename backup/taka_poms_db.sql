-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 18 Sep 2020 pada 07.11
-- Versi server: 10.3.23-MariaDB
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u8325732_taka_poms_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `log_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bugs`
--

CREATE TABLE `bugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `assign_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
  `bug_id` int(11) NOT NULL DEFAULT 0,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
  `created_by` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bug_statuses`
--

INSERT INTO `bug_statuses` (`id`, `title`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Confirmed', 1, 2, '2020-04-14 14:43:30', '2020-09-11 03:35:52'),
(2, 'Resolved', 1, 3, '2020-04-14 14:43:30', '2020-09-11 03:35:52'),
(3, 'Unconfirmed', 1, 4, '2020-04-14 14:43:30', '2020-09-11 03:35:52'),
(4, 'In Progress', 1, 5, '2020-04-14 14:43:30', '2020-09-11 03:35:52'),
(5, 'Verified', 1, 6, '2020-04-14 14:43:30', '2020-09-11 03:35:52'),
(6, 'Backlog', 1, 1, '2020-07-08 00:11:21', '2020-09-11 03:35:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checklist_comments`
--

CREATE TABLE `checklist_comments` (
  `id` bigint(20) NOT NULL,
  `checklist_id` bigint(20) NOT NULL,
  `comment` text NOT NULL,
  `voice_notes` varchar(255) DEFAULT NULL,
  `checklist_files` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `check_lists`
--

CREATE TABLE `check_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percentage` double(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `client_permissions`
--

CREATE TABLE `client_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(6, 2, 6, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-05-29 05:40:43', '2020-05-29 05:40:43'),
(7, 15, 7, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 04:59:24', '2020-06-29 04:59:24'),
(8, 2, 8, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 06:01:53', '2020-06-29 06:01:53'),
(9, 2, 9, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 06:54:51', '2020-06-29 06:54:51'),
(10, 2, 10, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 06:57:52', '2020-06-29 06:57:52'),
(11, 2, 11, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 07:12:08', '2020-06-29 07:12:08'),
(12, 2, 12, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 11:29:44', '2020-06-29 11:29:44'),
(13, 2, 13, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 11:31:49', '2020-06-29 11:31:49'),
(14, 2, 14, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-29 12:19:20', '2020-06-29 12:19:20'),
(15, 2, 15, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-30 05:00:26', '2020-06-30 05:00:26'),
(16, 18, 16, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-30 05:10:59', '2020-06-30 05:10:59'),
(18, 20, 17, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-06-30 06:21:07', '2020-06-30 06:21:07'),
(19, 20, 18, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-07-07 22:29:09', '2020-07-07 22:29:09'),
(22, 22, 18, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-07-08 00:06:03', '2020-07-08 00:06:03'),
(24, 23, 19, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-08-03 21:28:58', '2020-08-03 21:28:58'),
(25, 23, 17, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-08-03 21:35:44', '2020-08-03 21:35:44'),
(26, 24, 20, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-02 05:26:44', '2020-09-02 05:26:44'),
(27, 25, 21, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-06 21:53:01', '2020-09-06 21:53:01'),
(28, 20, 22, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-08 07:09:21', '2020-09-08 07:09:21'),
(29, 27, 23, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-08 20:39:42', '2020-09-08 20:39:42'),
(30, 24, 24, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-11 19:34:13', '2020-09-11 19:34:13'),
(31, 24, 25, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-12 12:12:01', '2020-09-12 12:12:01'),
(32, 24, 26, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 05:52:26', '2020-09-13 05:52:26'),
(33, 24, 27, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 06:25:58', '2020-09-13 06:25:58'),
(34, 24, 28, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 06:34:27', '2020-09-13 06:34:27'),
(35, 24, 29, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 06:36:41', '2020-09-13 06:36:41'),
(36, 24, 30, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 06:39:29', '2020-09-13 06:39:29'),
(37, 24, 31, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-13 19:17:35', '2020-09-13 19:17:35'),
(38, 24, 32, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-16 16:06:59', '2020-09-16 16:06:59'),
(39, 24, 33, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 00:08:36', '2020-09-17 00:08:36'),
(40, 24, 34, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 05:42:53', '2020-09-17 05:42:53'),
(41, 31, 35, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 06:03:33', '2020-09-17 06:03:33'),
(42, 24, 36, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 11:47:59', '2020-09-17 11:47:59'),
(43, 24, 37, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 11:50:48', '2020-09-17 11:50:48'),
(44, 24, 38, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 16:18:58', '2020-09-17 16:18:58'),
(45, 24, 39, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 16:40:11', '2020-09-17 16:40:11'),
(46, 24, 40, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 16:51:26', '2020-09-17 16:51:26'),
(47, 24, 41, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 16:52:52', '2020-09-17 16:52:52'),
(48, 24, 42, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 17:07:05', '2020-09-17 17:07:05'),
(49, 24, 43, ',show activity,show milestone,create milestone,edit milestone,delete milestone,show task,create task,edit task,delete task,move task,create checklist,edit checklist,delete checklist,show checklist,show uploading,manage bug report,create bug report,edit bug report,delete bug report,move bug report,manage timesheet,create timesheet,edit timesheet,delete timesheet', '2020-09-17 17:08:23', '2020-09-17 17:08:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(15,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `project` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expenses_categories`
--

CREATE TABLE `expenses_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
(7, 'Gaji Tukang', 1, '2020-04-20 04:47:11', '2020-04-20 04:47:11'),
(8, 'Project Expense', 1, '2020-06-30 05:49:59', '2020-06-30 05:49:59'),
(9, 'Supplier Order', 1, '2020-06-30 05:50:12', '2020-06-30 05:50:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double(15,2) NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `iteam` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `stage` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  `client` int(11) NOT NULL DEFAULT 0,
  `source` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_order` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Struktur dari tabel `leadsources`
--

CREATE TABLE `leadsources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
(4, 'Phone', 1, '2020-04-14 14:43:27', '2020-04-14 14:43:27'),
(5, 'Referensi Internal', 1, '2020-06-30 05:39:36', '2020-06-30 05:39:36'),
(6, 'Referensi Eksternal', 1, '2020-06-30 05:39:49', '2020-06-30 05:39:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `leadstages`
--

CREATE TABLE `leadstages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `leadstages`
--

INSERT INTO `leadstages` (`id`, `name`, `color`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Initial Contact', '#e7505a', 1, 0, '2020-04-14 14:43:25', '2020-04-14 14:43:25'),
(2, 'Qualification', '#F4D03F', 1, 1, '2020-04-14 14:43:25', '2020-07-08 00:49:05'),
(3, 'Proposal', '#32c5d2', 1, 2, '2020-04-14 14:43:25', '2020-07-08 00:49:48'),
(4, 'Close', '#1BBC9B', 1, 4, '2020-04-14 14:43:26', '2020-09-11 03:20:52');

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
  `project_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'App\\User', 23),
(1, 'App\\User', 24),
(1, 'App\\User', 25),
(1, 'App\\User', 27),
(1, 'App\\User', 31),
(2, 'App\\User', 1),
(3, 'App\\User', 3),
(4, 'App\\User', 30),
(5, 'App\\User', 10),
(7, 'App\\User', 9),
(9, 'App\\User', 11),
(10, 'App\\User', 12),
(11, 'App\\User', 5),
(11, 'App\\User', 6),
(11, 'App\\User', 26);

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

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ian@matrixindo.co.id', '$2y$10$UbeGvyybvvS0sPWm/Mhwqe77d.KPkZ2RCvmmo8KTCRyoEgQ0QJtCW', '2020-09-08 20:12:29'),
('fajar@takatech.co.id', '$2y$10$9n1xl2FZgOZwXLuZza5wrevysaOrtwBWSZQLWcnhKIWF5xJIwyUaC', '2020-09-08 20:14:55'),
('admin@example.com', '$2y$10$NJeEjTVDzZqQNU51v5cRAOD2nAjoGJrYFoatW1ZhwA7hAnjVfWSoq', '2020-09-14 05:51:53');

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
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
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
  `created_by` int(11) NOT NULL DEFAULT 0,
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
  `price` double(15,2) NOT NULL DEFAULT 0.00,
  `start_date` date NOT NULL,
  `due_date` date NOT NULL,
  `client` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` int(11) NOT NULL DEFAULT 0,
  `lead` int(11) NOT NULL DEFAULT 0,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on_going',
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projectstages`
--

CREATE TABLE `projectstages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `projectstages`
--

INSERT INTO `projectstages` (`id`, `name`, `color`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'To Do', '#e7505a', 1, 1, '2020-04-14 14:43:26', '2020-06-30 07:10:44'),
(2, 'In Progress', '#F4D03F', 1, 2, '2020-04-14 14:43:26', '2020-06-30 07:10:44'),
(3, 'Issue', '32C5D2', 1, 3, '2020-04-14 14:43:26', '2020-06-30 07:10:44'),
(4, 'Done', '#1BBC9B', 1, 4, '2020-04-14 14:43:26', '2020-06-30 07:10:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `project_files`
--

CREATE TABLE `project_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
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
  `created_by` int(11) NOT NULL DEFAULT 0,
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
(4, 'Project Manager', 'web', 1, '2020-04-17 06:19:41', '2020-09-14 06:25:37'),
(5, 'HO-Admin', 'web', 1, '2020-04-17 06:22:03', '2020-04-17 06:22:03'),
(6, 'Management', 'web', 1, '2020-04-17 06:42:22', '2020-04-17 06:42:22'),
(7, 'Project Control', 'web', 1, '2020-04-20 03:41:45', '2020-04-20 03:41:45'),
(8, 'Site Manager', 'web', 1, '2020-04-20 03:42:39', '2020-04-20 03:42:39'),
(9, 'Finance', 'web', 1, '2020-04-20 03:47:31', '2020-04-20 03:47:31'),
(10, 'Project Admin', 'web', 1, '2020-04-20 03:52:47', '2020-04-20 03:52:47'),
(11, 'Super Admin', 'web', 1, '2020-04-20 05:09:49', '2020-04-20 05:09:49'),
(13, 'Test Role', 'web', 1, '2020-06-30 06:10:27', '2020-06-30 06:10:27'),
(14, 'Site Manager Asst.', 'web', 1, '2020-07-07 22:04:48', '2020-07-07 22:04:48');

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
(1, 2),
(1, 4),
(1, 5),
(1, 6),
(1, 11),
(2, 2),
(2, 4),
(2, 5),
(2, 11),
(3, 2),
(3, 4),
(3, 5),
(3, 11),
(4, 2),
(4, 5),
(4, 11),
(5, 2),
(6, 2),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 11),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 11),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 11),
(10, 2),
(11, 2),
(11, 5),
(11, 6),
(11, 11),
(12, 2),
(12, 5),
(12, 11),
(13, 2),
(13, 5),
(13, 11),
(14, 2),
(14, 5),
(14, 11),
(19, 2),
(19, 5),
(19, 6),
(19, 11),
(20, 2),
(20, 4),
(20, 6),
(20, 7),
(20, 8),
(20, 11),
(20, 13),
(21, 2),
(21, 4),
(21, 7),
(21, 8),
(21, 11),
(21, 13),
(22, 2),
(22, 4),
(22, 7),
(22, 8),
(22, 11),
(22, 13),
(23, 2),
(23, 5),
(23, 7),
(23, 8),
(23, 11),
(23, 13),
(24, 2),
(24, 4),
(24, 6),
(24, 7),
(24, 8),
(24, 11),
(24, 14),
(25, 2),
(25, 4),
(25, 7),
(25, 11),
(26, 2),
(26, 4),
(26, 7),
(26, 8),
(26, 11),
(27, 2),
(27, 5),
(27, 7),
(27, 11),
(28, 2),
(28, 4),
(28, 6),
(28, 7),
(28, 8),
(28, 11),
(29, 2),
(29, 4),
(29, 7),
(29, 11),
(30, 2),
(30, 4),
(30, 7),
(30, 8),
(30, 11),
(31, 2),
(31, 5),
(31, 7),
(31, 11),
(32, 2),
(32, 4),
(32, 5),
(32, 6),
(32, 7),
(32, 11),
(33, 2),
(33, 4),
(33, 5),
(33, 7),
(33, 11),
(34, 2),
(34, 4),
(34, 5),
(34, 7),
(34, 11),
(35, 2),
(35, 5),
(35, 7),
(35, 11),
(36, 2),
(36, 4),
(36, 5),
(36, 6),
(36, 7),
(36, 8),
(36, 11),
(37, 2),
(37, 4),
(37, 5),
(37, 7),
(37, 8),
(37, 11),
(38, 2),
(38, 4),
(38, 5),
(38, 7),
(38, 8),
(38, 11),
(39, 2),
(39, 5),
(39, 7),
(39, 11),
(40, 2),
(40, 4),
(40, 5),
(40, 6),
(40, 8),
(40, 11),
(41, 2),
(41, 4),
(41, 5),
(41, 8),
(41, 11),
(42, 2),
(42, 4),
(42, 5),
(42, 8),
(42, 11),
(43, 2),
(43, 5),
(43, 11),
(44, 2),
(44, 4),
(44, 5),
(44, 6),
(44, 11),
(45, 2),
(45, 4),
(45, 5),
(45, 11),
(46, 2),
(46, 4),
(46, 5),
(46, 11),
(47, 2),
(47, 5),
(47, 11),
(48, 2),
(48, 3),
(48, 4),
(48, 6),
(48, 7),
(48, 8),
(48, 11),
(48, 13),
(49, 2),
(49, 4),
(49, 7),
(49, 8),
(49, 11),
(49, 13),
(50, 2),
(50, 7),
(50, 8),
(50, 11),
(50, 13),
(51, 2),
(51, 5),
(51, 7),
(51, 8),
(51, 11),
(52, 1),
(52, 2),
(52, 3),
(52, 4),
(52, 5),
(52, 6),
(52, 7),
(52, 8),
(52, 10),
(52, 11),
(52, 13),
(52, 14),
(53, 2),
(53, 4),
(53, 7),
(53, 10),
(53, 11),
(53, 13),
(54, 2),
(54, 4),
(54, 5),
(54, 7),
(54, 10),
(54, 11),
(54, 13),
(55, 2),
(55, 4),
(55, 5),
(55, 7),
(55, 10),
(55, 11),
(55, 13),
(56, 2),
(57, 2),
(57, 8),
(58, 2),
(58, 4),
(58, 5),
(58, 6),
(58, 7),
(58, 8),
(58, 10),
(58, 11),
(59, 2),
(59, 4),
(59, 5),
(59, 7),
(59, 10),
(59, 11),
(60, 2),
(60, 4),
(60, 5),
(60, 7),
(60, 8),
(60, 10),
(60, 11),
(61, 2),
(61, 4),
(61, 5),
(61, 7),
(61, 10),
(61, 11),
(62, 1),
(62, 2),
(62, 3),
(62, 4),
(62, 5),
(62, 6),
(62, 7),
(62, 8),
(62, 10),
(62, 11),
(62, 13),
(62, 14),
(63, 2),
(63, 4),
(63, 5),
(63, 6),
(63, 11),
(64, 2),
(64, 5),
(64, 11),
(65, 2),
(65, 5),
(65, 11),
(66, 2),
(66, 5),
(66, 11),
(67, 2),
(67, 4),
(67, 5),
(67, 6),
(67, 9),
(67, 11),
(68, 2),
(68, 5),
(68, 9),
(68, 11),
(69, 2),
(69, 5),
(69, 9),
(69, 11),
(70, 2),
(70, 5),
(70, 9),
(70, 11),
(71, 2),
(71, 4),
(71, 5),
(71, 6),
(71, 9),
(71, 11),
(72, 2),
(72, 4),
(72, 5),
(72, 6),
(72, 8),
(72, 11),
(73, 2),
(73, 4),
(73, 5),
(73, 8),
(73, 11),
(74, 2),
(74, 4),
(74, 5),
(74, 8),
(74, 11),
(75, 2),
(75, 5),
(75, 11),
(76, 2),
(76, 4),
(76, 5),
(76, 6),
(76, 9),
(76, 11),
(77, 2),
(77, 4),
(77, 5),
(77, 9),
(77, 11),
(78, 2),
(78, 5),
(78, 9),
(78, 11),
(79, 2),
(79, 5),
(79, 9),
(79, 11),
(80, 2),
(80, 4),
(80, 5),
(80, 6),
(80, 9),
(80, 11),
(81, 2),
(81, 5),
(81, 9),
(81, 11),
(82, 2),
(82, 5),
(82, 9),
(82, 11),
(83, 2),
(83, 5),
(83, 9),
(83, 11),
(84, 2),
(84, 4),
(84, 5),
(84, 6),
(84, 9),
(84, 11),
(85, 2),
(85, 5),
(85, 9),
(85, 11),
(86, 1),
(86, 2),
(86, 3),
(86, 6),
(86, 8),
(86, 11),
(86, 14),
(87, 1),
(87, 2),
(87, 8),
(87, 11),
(87, 14),
(88, 2),
(88, 8),
(88, 11),
(88, 14),
(89, 2),
(89, 11),
(90, 1),
(90, 2),
(90, 3),
(90, 8),
(90, 11),
(91, 1),
(91, 2),
(91, 3),
(91, 6),
(91, 8),
(91, 11),
(91, 14),
(92, 1),
(92, 2),
(92, 3),
(92, 4),
(92, 6),
(92, 11),
(93, 1),
(93, 2),
(93, 4),
(93, 8),
(93, 11),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(99, 3),
(99, 4),
(99, 6),
(99, 8),
(99, 11),
(100, 1),
(100, 2),
(100, 3),
(100, 4),
(100, 8),
(100, 11),
(101, 1),
(101, 2),
(101, 3),
(101, 4),
(101, 8),
(101, 11),
(102, 1),
(102, 2),
(102, 3),
(102, 4),
(102, 8),
(102, 11),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 1),
(108, 2),
(108, 3),
(108, 4),
(108, 6),
(108, 11),
(108, 14),
(109, 1),
(109, 2),
(109, 3),
(109, 4),
(109, 11),
(109, 14),
(110, 1),
(110, 2),
(110, 3),
(110, 4),
(110, 11),
(110, 14),
(111, 1),
(111, 2),
(111, 3),
(111, 4),
(111, 11),
(112, 1),
(112, 2),
(112, 3),
(112, 4),
(112, 6),
(112, 11),
(113, 1),
(113, 2),
(113, 3),
(113, 4),
(113, 6),
(113, 11),
(113, 14),
(114, 1),
(114, 2),
(114, 3),
(114, 4),
(114, 11),
(114, 14),
(115, 1),
(115, 2),
(115, 3),
(115, 4),
(115, 11),
(115, 14),
(116, 1),
(116, 2),
(116, 3),
(116, 4),
(116, 11),
(117, 2),
(118, 2),
(119, 1);

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
(2, 'footer_text', 'Matrixindo Multi Kreasi. All Rights Reserved.', 1, NULL, NULL),
(5, 'site_currency', 'Rupiah', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(6, 'site_currency_symbol', 'Rp.', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(7, 'site_currency_symbol_position', 'pre', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(8, 'site_date_format', 'd-m-Y', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(9, 'site_time_format', 'H:i', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(10, 'invoice_prefix', '#INV', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(11, 'bug_prefix', '#ISSUE', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(12, 'invoice_title', '', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(13, 'invoice_text', 'PT. Matrixindo Multi Kreasi', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(14, 'invoice_color', '6676EF', 1, '2020-04-14 23:16:38', '2020-04-14 23:16:38'),
(33, 'company_name', 'PT. Matrixindo Multi Kreasi', 1, NULL, NULL),
(34, 'company_address', 'Jalan Ceger Raya No 38B Cipayung', 1, NULL, NULL),
(35, 'company_city', 'Jakarta Timur', 1, NULL, NULL),
(36, 'company_state', 'DKI Jakarta', 1, NULL, NULL),
(37, 'company_zipcode', '13820', 1, NULL, NULL),
(38, 'company_country', 'Indonesia', 1, NULL, NULL),
(39, 'company_telephone', '021 -22876608', 1, NULL, NULL),
(40, 'company_email', 'admin@matrixindo.co.id', 1, NULL, NULL),
(41, 'company_email_from_name', 'info@matrixindo.co.id', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double(15,2) NOT NULL DEFAULT 0.00,
  `bobot` double(15,2) NOT NULL DEFAULT 0.00,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `assign_to` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'todo',
  `stage` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
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
  `rate` double(15,2) NOT NULL DEFAULT 0.00,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `rate`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 'No Tax', 0.00, 1, '2020-09-08 21:50:30', '2020-09-08 21:50:30'),
(6, 'ppn', 10.00, 1, '2020-09-17 06:07:38', '2020-09-17 06:07:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `timesheets`
--

CREATE TABLE `timesheets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `hours` double(8,2) NOT NULL DEFAULT 0.00,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `userprojects`
--

CREATE TABLE `userprojects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `project_id` int(11) NOT NULL DEFAULT 0,
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
  `created_by` int(11) NOT NULL DEFAULT 0,
  `delete_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `created_by`, `delete_status`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$gU7.XjT8dgD/EIB5cDHdmuDxJ7k548oezLj.G/CSwto5HSovIfQLO', 'company', 'idea_1593526079_1600070453.png', 'en', 0, 1, 1, 'oU7p9DsJiav7pAr0EFn07A5Hoxp590XBUMYwRCGrBN8q4yBJnQtgGi5Vdmsc', '2020-04-14 14:43:00', '2020-09-14 01:01:55'),
(3, 'cipta ageung', 'cipta_ageung@yahoo.co.id', NULL, '$2y$10$/56GTq.aQkqZkeagOoLQo.zR3geVsMRBA5M1rfYIjdWhElSiqPrJS', 'Super Admin', '', 'en', 1, 1, 1, 'vBFjiVngAxKY9clS5TPG0hYfDInddmKdlsEttedWRMBy8DkV3s1qwdnwtc6Z', '2020-04-14 14:45:10', '2020-09-14 06:14:26'),
(5, 'Adi', 'adi@matrixindo.co.id', NULL, '$2y$10$wGnyznyR887QTgYKpiIw5uEi.2751dypvzN422FHiGqDJjdwQQfVK', 'Super Admin', '', 'en', 1, 1, 1, 'PTWqTJwK2DFxYaSvT9RNKL1B1YYNw5HhR1SPZIZfCcaGkKHnYdhKNzz2nusj', '2020-04-17 06:23:58', '2020-04-20 05:10:09'),
(6, 'Belly Ferdiansyah', 'belly@matrixindo.co.id', NULL, '$2y$10$1PxB9i4CDrAPsArVal2Sa.NYCkAZ.VNqsEO../blWlNAVYVEGXoH.', 'Super Admin', '', 'en', 1, 1, 1, NULL, '2020-04-17 06:48:51', '2020-04-20 05:10:31'),
(9, 'Albert', 'albert@matrixindo.co.id', NULL, '$2y$10$wbjfrcVFLXS.vFdJ9XIcGumlqBudW6n2Rl.qFMAxpE1fBgp1Vtx6m', 'Project Control', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:43:12', '2020-04-20 03:43:12'),
(10, 'Ratna', 'ratna@matrixindo.co.id', NULL, '$2y$10$KHwFjaNN8/8R1/2rwc8Tk.tnyoeP3eSyTX0swGfTY.6yUp3V1nBTK', 'HO-Admin', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:46:19', '2020-04-20 03:46:19'),
(11, 'Chyntia', 'chyntia@matrixindo.co.id', NULL, '$2y$10$4UqoV18Cxn3/9vDd9Da1XeAjnjLZAWAKg8NZE6vA1FspRm.zHlUoG', 'Finance', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:49:30', '2020-04-20 03:49:30'),
(12, 'Fizri', 'fizri@matrixindo.co.id', NULL, '$2y$10$SUuMGsF6yzXZlo.yNspeIu3R6LgvYoaqcKqLz1vzEXyDTbh60N6su', 'Project Admin', '', 'en', 1, 1, 1, NULL, '2020-04-20 03:52:13', '2020-04-20 03:53:04'),
(23, 'Prasojo', 'hello.b5code@gmail.com', NULL, '$2y$10$0jErfW/YIfnTk2xQ684AdeUgL3gFy1oyre3Z.zO0E1zPKpOrMciFa', 'client', '', 'en', 1, 1, 1, NULL, '2020-07-22 01:09:03', '2020-09-17 06:01:13'),
(24, 'cipta client', 'agicipta73@gmail.com', NULL, '$2y$10$.bdewkEaAZdpDiDvMDJ8LOqeGEhelRXPD5uciqCyNHlEuhB97oYqm', 'client', '', 'en', 1, 1, 1, NULL, '2020-09-02 05:25:44', '2020-09-02 05:25:44'),
(25, 'Rendra Safutra', 'rendra@takatech.co.id', NULL, '$2y$10$gwadLeeauZhUGLzhxiqAA.HJNl6s3b27VyRg8IsRV.GXFx62CNi4G', 'client', '', 'en', 1, 1, 1, NULL, '2020-09-06 21:49:40', '2020-09-06 21:49:40'),
(26, 'Ian', 'ian@matrixindo.co.id', NULL, '$2y$10$WJx/0J1AFW63dta5H6dzCOEjxxWcenkbzNEqLPwAIO8/IZYTMHKXy', 'Super Admin', '', 'en', 1, 1, 1, NULL, '2020-09-08 20:20:56', '2020-09-08 20:20:56'),
(27, 'Dewi - Condet', 'client1@matrixindo.co.id', NULL, '$2y$10$CuzyueEfwQWB7TsURvqaT.gVJ2eWzzcBvbRJVdC0H6OA4ItcDnCEa', 'client', '', 'en', 1, 1, 1, NULL, '2020-09-08 20:26:57', '2020-09-08 20:26:57'),
(29, 'cipta admin', 'agi.cipta73@gmail.com', NULL, '$2y$10$tDzhJGGzXQ1cNu3jNXHIUOLpyFi28ZC0/4RAyPz/ei/95Yzou4LuK', 'company', 'idea_1593526079_1600070453.png', 'en', 0, 1, 1, '', '2020-04-14 14:43:00', '2020-09-14 01:01:55'),
(30, 'Fajar', 'sebastian.fajr@gmail.com', NULL, '$2y$10$6bH6OiVxt/V8bcul.xhw3.pdFVI.Sz5n/PoDaJTpZkTS5rx5tnvie', 'Project Manager', '', 'en', 1, 1, 1, '60pjrbqCks42bhqJhAJftxvVIRdLwH2kGA4yD4hZKzBHueuqyyrWva1kdhHr', '2020-09-14 05:55:39', '2020-09-14 06:26:21'),
(31, 'Edar', 'edarin.net@gmail.com', NULL, '$2y$10$fsWgvDq62OtjiqiWfL/K4uHFGsaqOJrHCghqV5mBSzU5bnh/u0YIe', 'client', '', 'en', 1, 1, 1, NULL, '2020-09-17 06:01:42', '2020-09-17 06:01:42');

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
-- Indeks untuk tabel `checklist_comments`
--
ALTER TABLE `checklist_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checklist_id` (`checklist_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT untuk tabel `bugs`
--
ALTER TABLE `bugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bug_comments`
--
ALTER TABLE `bug_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `bug_files`
--
ALTER TABLE `bug_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bug_statuses`
--
ALTER TABLE `bug_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `checklist_comments`
--
ALTER TABLE `checklist_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `check_lists`
--
ALTER TABLE `check_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT untuk tabel `client_permissions`
--
ALTER TABLE `client_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `expenses_categories`
--
ALTER TABLE `expenses_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `leadsources`
--
ALTER TABLE `leadsources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `leadstages`
--
ALTER TABLE `leadstages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `milestones`
--
ALTER TABLE `milestones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=424;

--
-- AUTO_INCREMENT untuk tabel `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `projectstages`
--
ALTER TABLE `projectstages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT untuk tabel `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=912;

--
-- AUTO_INCREMENT untuk tabel `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `userprojects`
--
ALTER TABLE `userprojects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
