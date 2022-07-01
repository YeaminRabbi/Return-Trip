-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 03:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `return_trip`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follow_to` bigint(20) UNSIGNED NOT NULL,
  `follow_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `follow_to`, `follow_by`, `created_at`, `updated_at`) VALUES
(7, 11, 12, '2022-07-01 02:11:17', '2022-07-01 02:11:17'),
(8, 14, 12, '2022-07-01 02:16:43', '2022-07-01 02:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `follow_pages`
--

CREATE TABLE `follow_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follow_pages`
--

INSERT INTO `follow_pages` (`id`, `page_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 12, '2022-07-01 02:26:41', '2022-07-01 02:26:41'),
(2, 4, 12, '2022-07-01 02:29:57', '2022-07-01 02:29:57'),
(3, 6, 12, '2022-07-01 02:30:35', '2022-07-01 02:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2022_07_01_063345_add_access_token_to_users_table', 3),
(11, '2022_07_01_070156_create_pages_table', 4),
(12, '2022_07_01_074616_create_followers_table', 5),
(13, '2022_07_01_081507_create_follow_pages_table', 6),
(14, '2022_07_01_124322_create_user_posts_table', 7),
(15, '2022_07_01_125317_create_page_posts_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('57c5da82dd99ed2b65987eb30c6464e102eaf61f903a05f36af8d6d4cbd7772ae7799dd0fc12e397', 14, 1, 'sakib@gmail.com', '[]', 0, '2022-07-01 02:05:55', '2022-07-01 02:05:55', '2023-07-01 08:05:55'),
('9796f43ab89b984c247d3da69c0b74a1154240f1a67b4fd20b0e18c605e09795d1b46a2f96c4dfa0', 13, 1, 'sabbir@gmail.com', '[]', 0, '2022-07-01 02:05:35', '2022-07-01 02:05:35', '2023-07-01 08:05:35'),
('a0ccfbc8f9387e0bae5cb54d9e1f88f926406b10e0c2f355ab66906c358dc76b9b070148d5a2a990', 11, 1, 'jellyfish@gmail.com', '[]', 0, '2022-07-01 00:50:27', '2022-07-01 00:50:27', '2023-07-01 06:50:27'),
('bcc9be1260f18e0963cc9400f7ab9b9c41a8ae7ef9feac4c791e158768ff098453dd05d285e1aac7', 16, 1, 'tanha@gmail.com', '[]', 0, '2022-07-01 02:06:51', '2022-07-01 02:06:51', '2023-07-01 08:06:51'),
('de084c7afaf523c8004de6e247c692008f1e8a62b018c4e02bdd50c6604567cb11f44b9560d3da0c', 12, 1, 'yeaminrabbi308@gmail.com', '[]', 0, '2022-07-01 00:51:24', '2022-07-01 00:51:24', '2023-07-01 06:51:24'),
('e8fe6ff2e85ce3c0417eb387a49bce13f8977ac3524ab6747256081ffe36210001d5e7669cfa5c9c', 15, 1, 'raisul@gmail.com', '[]', 0, '2022-07-01 02:06:16', '2022-07-01 02:06:16', '2023-07-01 08:06:16'),
('f3112ac709b7d039653327a1be1ad96125acef1a05e0f69245573f6f83ee46154ca2df56eaf7bac8', 10, 1, 'jellyfish@gmail.com', '[]', 0, '2022-07-01 00:49:34', '2022-07-01 00:49:34', '2023-07-01 06:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'bwzdQvAeXcjyaHq7gd8jaXcDIrTxDFUvA1bgvJ5i', NULL, 'http://localhost', 1, 0, 0, '2022-06-30 23:31:47', '2022-06-30 23:31:47'),
(2, NULL, 'Laravel Password Grant Client', 'XP9YYzQjEuR4M4uL2dvWhm3UQ4W5UTP1hUh73knx', 'users', 'http://localhost', 0, 1, 0, '2022-06-30 23:31:47', '2022-06-30 23:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-06-30 23:31:47', '2022-06-30 23:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name`, `creator_id`, `created_at`, `updated_at`) VALUES
(3, 'Helly Poper', 12, '2022-07-01 01:45:17', '2022-07-01 01:45:17'),
(4, 'Sicence School', 12, '2022-07-01 02:25:58', '2022-07-01 02:25:58'),
(5, 'IT Section', 12, '2022-07-01 02:26:10', '2022-07-01 02:26:10'),
(6, 'TechArtist', 11, '2022-07-01 02:26:19', '2022-07-01 02:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `page_posts`
--

CREATE TABLE `page_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_posts`
--

INSERT INTO `page_posts` (`id`, `post_content`, `user_id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, 'This is an article about laravel', 12, 3, '2022-07-01 07:03:11', '2022-07-01 07:03:11'),
(2, 'I am from Dhaka, bangladesh', 12, 5, '2022-07-01 07:07:29', '2022-07-01 07:07:29'),
(3, 'This page is from USA', 12, 5, '2022-07-01 07:27:48', '2022-07-01 07:27:48'),
(4, 'Page is for Web Development', 12, 5, '2022-07-01 07:28:02', '2022-07-01 07:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `access_token`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 'Jelly', 'Fish', 'jellyfish@gmail.com', 'FqYb66NnuaOXQIVbots6UTQiGv3AiJSpJmCpy3T3uyeuSW4A1V', '$2y$10$EKh42OA.U9NiR27dGUszIemesPeB4Mb567U2GPYK995hISv0i7Ds.', NULL, '2022-07-01 00:50:26', '2022-07-01 00:56:49'),
(12, 'Yeamin Rabbi', 'Bin Akram', 'yeaminrabbi308@gmail.com', 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck', '$2y$10$d/ovdeSU24zmtQzHvwhNS./L3F.otAoJvFclnPQWB4L/iMhIdDXzW', NULL, '2022-07-01 00:51:24', '2022-07-01 01:18:02'),
(13, 'Sabbir', 'Ahmed', 'sabbir@gmail.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTc5NmY0M2FiODliOTg0YzI0N2QzZGE2OWMwYjc0YTExNTQyNDBmMWE2N2I0ZmQyMGIwZTE4YzYwNWUwOTc5NWQxYjQ2YTJmOTZjNGRmYTAiLCJpYXQiOjE2NTY2NjI3MzUuNTk1NjY5LCJuYmYiOjE2NTY2NjI3MzUuNTk1Njg3LCJleHAiOjE2ODgxOTg3MzUuNTQyMjE1LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.DjeuaIX8953Jj0XbW-2EpVOMr97nxVI0ewO755UJr-8lHG8CHa__bKr6TtK1ZV3wd5CBUy1wK347EAQ95ca5mwC27eVz2QVeeKjbHHuWzBlKYWA0MI0wzT-j5wK-piS_dX4qS1lnZ1VDkYpYk5QKBfCj4a8ykaqsob9iHcVqLcC7qGKpCZk1tSnk2519cdBR4yNNMRvaheeuRq1ZMG-Yhtj6LG7hhWMV9iDTTlaJUi3Nr2nznBa-cXWrckw_HKk1rS-qy1q_A7r_-9VgMgTowYaUJtTUVKnwumGB_exSv11UTb2mNfhW06MB0RE4CtqWwVxyodO1elV1Uev9327m8qxLJc9C5gnvBgSeLmUoai5GBiJjkukmWrG2o6ZC1DiJ1PxUzYBKOji6sGI9acLjl0-SsJklMgbCHoeGvWqInsWSqw1yD-qnCqeeb9pkbINOm5wkNMmWb2ECBK6Mg39I4nUF7FGhJdaQM_zS_sGzf_LJIeEq8QsCe1Nhk1V3VGoReQ6V1TJO55b6wKAMoziPAh-IQfsXACaWGCXzGPiGfh0BlSamgwofWGov0c57gPUNaVsGJXT2kwnJj4OxJblC74rrLSvrJJYg9EnpUwSHCrEHhTHXaHOM6Rveol_KUygG_wuYAusOLQEdZbE0hKRVzMNDcOK6RxJN_PmFtnUM9gE', '$2y$10$KHWVFVfBorq0Dy77JdbsMuWiq5ESWbXHxEyQH2jDxXtJPl5LH3/PS', NULL, '2022-07-01 02:05:35', '2022-07-01 02:05:35'),
(14, 'Sakib', 'Ahmed', 'sakib@gmail.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTdjNWRhODJkZDk5ZWQyYjY1OTg3ZWIzMGM2NDY0ZTEwMmVhZjYxZjkwM2EwNWYzNmFmOGQ2ZDRjYmQ3NzcyYWU3Nzk5ZGQwZmMxMmUzOTciLCJpYXQiOjE2NTY2NjI3NTUuMjM5NTc4LCJuYmYiOjE2NTY2NjI3NTUuMjM5NTgyLCJleHAiOjE2ODgxOTg3NTUuMTk0NTIzLCJzdWIiOiIxNCIsInNjb3BlcyI6W119.PJKPdPdF8TFKWVURkcx6lEk3KwIqfp7Fb7g6dj2DJo8BKcx28tOIVBAx1yRIDZgP666guDlGicHcu_hbHn-6RFSehVSp54jl9D6JyQsx9Hoa5UeRXmP3V-kezctT8-BkkRdQ4qT2wPBbqtZ0l5tW6Jq_ePz0ndarQqHw3lyVOsAitJB0Y5Ycb-Rt7ZdYC6ZRpRBpvpaI05EQHJd_N2r_gfCXL24I9vpya1VKS7Ji2pX4H8wSf7ECMjMxux_N4_zYZEQAl54yWEJvuUXSIOgIkibd9iYeTz-ipgL_-SoPE0ZXRz4OIAW1k1083Hmh-rk5Wb8qBWcAajIRTLJndoidCK6SNO9_PMAtGIUjWJKIPHx5J3T4UzkgMMTsSpVEyFBX6ci_1r6HITl_cdDx9iSocMDnv_N024m2O-iim3Q286vvtBYOXcX5XsT_GQUpv9cOboCjdChtE2a-GVetJ5E5bSrtqhGEbWa_iB6q_zHha7Ia3Fen5XhVoCx1o8PDpYMe58JeuW5ivN9-sHjqBuTWuJON9eVf-w9IwjA2HMtJk8TpUuEA9zkIR5IDC-rD27k4KimaOXl7sGvqaO6K9onv3T2rVGfoRNSFPS7irxTX-182UlIauOhQircMmYTyb4QiOK7xBE6kDMgjk9gV-l74WWaqfATkZS6DRd81kDLm4Z0', '$2y$10$14cZcI58vA2mzQUsZ9PSjOOfGTN1ZlsmvdAdN0x0HRlxxzqXthIY2', NULL, '2022-07-01 02:05:54', '2022-07-01 02:05:55'),
(15, 'Raisul', 'Islam', 'raisul@gmail.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZThmZTZmZjJlODVjZTNjMDQxN2ViMzg3YTQ5YmNlMTNmODk3N2FjMzUyNGFiNjc0NzI1NjA4MWZmZTM2MjEwMDAxZDVlNzY2OWNmYTVjOWMiLCJpYXQiOjE2NTY2NjI3NzYuNDcyMzc0LCJuYmYiOjE2NTY2NjI3NzYuNDcyMzg1LCJleHAiOjE2ODgxOTg3NzYuNDE2ODcyLCJzdWIiOiIxNSIsInNjb3BlcyI6W119.kBjBSVXpAuvNIO4MX1uju1WCsw8dMwsVrhQVohO_GrzunsTE9F7dEhAFTrV5JDJ0GY1ui5vx7L2iBUKPkNCs0VCX4khwFSVJ0nNWzaveRIPkTewZYsJGkQkO5P7o6JswqqmBxxipEZ9yJGTZFBRhkj8ZVgRJLyIa6NB_6d09bCQP9apjp4tq366yHC9UEjdpb2G2gssnvpK3ddHn19TGukjSqvjKAXRyAOm1GO-Ha-z1ug5kzSvmFYpRraDbPs6cUXo3jiDVuRGN4XmocRu9QqANfF2Rj3LMnKJLViKXnQV5kapESfmpExMwYxA-uiw3jY7-POUxFBqawMki6cfMeto4mM0B8G56X7JnvbC_CWrif3GTTjB8jerlHh9wJwNYWvfyYJYDorr0zpMsMiPnAl_PGBGjsNr2SfjTeUbsbh0T9o0vvhIvjhk6TnbPiCzQzfRG-5MGZmUfcCu2_p_uvCm3br76s4TDUbE5EXxfXJc-7pho-sACGOYtDuOKJkzXRPh-imG9KhnVSfEF2VB5gavg20bAg8afcZE_Y4vGSAtKWpa1hDglPh6EhwrEjy2AtdALgMIEbodkg_QDzgny1O5ZquvNNbjNVYEutJeJIVzMLRTspi52GGM05s0t6GXaPKm9V0R2_KGFuXj1pHj6nBvNXQ70oTS93xOypGFoBUU', '$2y$10$uVJenvbAw4bma.9hYcWQfeTEpM7E.uuHS0nCedqr3GXfNPPKwQGcG', NULL, '2022-07-01 02:06:16', '2022-07-01 02:06:16'),
(16, 'Jaria', 'Tanha', 'tanha@gmail.com', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYmNjOWJlMTI2MGYxOGUwOTYzY2M5NDAwZjdhYjliOWM0MWE4YWU3ZWY5ZmVhYzRjNzkxZTE1ODc2OGZmMDk4NDUzZGQwNWQyODVlMWFhYzciLCJpYXQiOjE2NTY2NjI4MTEuNTQ0Mzk1LCJuYmYiOjE2NTY2NjI4MTEuNTQ0NCwiZXhwIjoxNjg4MTk4ODExLjQ2ODM3MSwic3ViIjoiMTYiLCJzY29wZXMiOltdfQ.RHCOZMPpRRaY7wYgL2k7henW82blpauuBpGEmYb3yEPGvMCoJhU_C0RAALEFLHIpz44mCNRLbNX-y0yzqzuOhYeAkta0vXsEDxhPhvuQ4zQt97S10FUGXXn_pGt_5nIwMLsIddJose17yr2kHFT6X_3ncuu1DuVqp7KexpQWNo8czKmhuHTH78Cw_95YDrS3FJTRx_koNaaU1oj0c0cSYjLIny1weENy8-hZR38eNA1pmspcEKIzmOCuEafkI_dQOzculhrF6dYTr4X-UcEn1A-C6uv48ZR-Z6LgPyWb9tBRhdZJwSv3KxJMAw5nZ5GAxmMJkhOQMsLDKzxVTmPd40DlS4vzzkjZ65TnSPxgF2LamTdYKjD_ACuG3r-0O1P2XI_MSUcV4e2T_eueYVIU4QkaI3hcsaBpNmbTlwpkInhqxRqS7qSGMTXOQC6IO2pne2tgEGxYZZxgsuJfV6acJygttg69mYSjxYOGK5woeX0zmltXjHiM4TLM4qVRnz-jbHWe3Casfn6p_ogeD9ySvKCqXcc8xAi2L5ESl02xtFrZ9vcgzmGZnYz11O_K3Ujyld69vc0dNHdih-IhfbYMsYyMM5QBL6kGe-utrZf8q6TvbhzQr40F_OvFV7fAj9YIPRlG81pTGTX6uPopdFWgLmdIi_ywU-Aobkv655hEaFU', '$2y$10$PBfdu4mZZ8ZlfqcNRJBb2.zuFy56c.sKBokrvzAQtrBV7ZUHdfvzm', NULL, '2022-07-01 02:06:51', '2022-07-01 02:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_posts`
--

CREATE TABLE `user_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_posts`
--

INSERT INTO `user_posts` (`id`, `post_content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Padma Setu BD', 12, '2022-07-01 06:49:49', '2022-07-01 06:49:49'),
(2, 'The natural Beauty Sajek', 12, '2022-07-01 06:50:21', '2022-07-01 06:50:21'),
(3, 'Travel to Cox\'s Bazar', 12, '2022-07-01 06:51:33', '2022-07-01 06:51:33'),
(4, 'Hello From my channel', 12, '2022-07-01 07:00:30', '2022-07-01 07:00:30'),
(5, 'I am from BD', 12, '2022-07-01 07:26:50', '2022-07-01 07:26:50'),
(6, 'I am from Australia', 12, '2022-07-01 07:27:00', '2022-07-01 07:27:00'),
(7, 'I went for a world Tour', 12, '2022-07-01 07:27:13', '2022-07-01 07:27:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_pages`
--
ALTER TABLE `follow_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_posts`
--
ALTER TABLE `page_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_posts`
--
ALTER TABLE `user_posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `follow_pages`
--
ALTER TABLE `follow_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page_posts`
--
ALTER TABLE `page_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_posts`
--
ALTER TABLE `user_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
