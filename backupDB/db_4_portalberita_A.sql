-- Adminer 4.8.1 MySQL 8.1.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
(1,	'Kendara',	'2023-09-19 04:05:58',	'2023-09-19 04:05:58'),
(2,	'Gawai',	'2023-09-19 04:08:07',	'2023-09-19 04:08:07');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(3,	'2014_10_12_100000_create_password_resets_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2023_07_12_044043_create_categories_table',	1),
(7,	'2023_07_12_045140_create_posts_table',	1);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `cat_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_cat_id_foreign` (`cat_id`),
  CONSTRAINT `posts_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `user_id`, `cat_id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'Mitsubishi Xforce, Faktor X di Segmen SUV Kompak',	'Segmen sport utility vehicle (SUV) kompak di pasar otomotif Tanah Air saat ini menjadi segmen paling meriah dan panas setelah segmen lowmulti-purpose vehicle (MPV). Baru saja persaingan di segmen ini ”diusik” Toyota Yaris Cross, kini Mitsubishi masuk gelanggang dengan mengandalkan Mitsubishi Xforce.\r\n\r\nJika dicermati, hampir semua pabrikan saat ini punya jagoan masing-masing di segmen SUV kompak dengan lima tempat duduk ini. Yang pertama tentu saja Honda dengan HR-V, lalu ada Hyundai Creta, Kia Seltos, Nissan Kicks ePower, Mazda CX-3, dan Wuling Alvez.\r\n\r\nMitsubishi Xforce menjadi salah satu mobil baru yang diluncurkan di ajang pameran otomotif Gaikindo Indonesia International Auto Show (GIIAS) 2023 di ICE BSD City, Kabupaten Tangerang, Banten, Kamis (10/8/2023). Tak tanggung-tanggung, peluncuran Xforce dilakukan oleh Presiden dan CEO Mitsubishi Motor Corporation Takao Kato yang membawa delegasi pejabat dari kantor pusat Mitsubishi di Jepang.\r\n\r\nKato mengatakan, Xforce ini dikembangkan sejak tiga tahun lalu di Indonesia dengan target memenuhi kebutuhan pasar di negara-negara ASEAN. ”Compact SUV ini dikembangkan untuk menjawab kebutuhan pengemudi di kawasan ASEAN dan telah melalui uji coba secara berulang di kawasan ini,” ungkap Kato dalam peluncuran mobil baru tersebut.\r\n\r\nBeberapa bulan sebelumnya, PT Mitsubishi Motors Kramayudha Sales Indonesia (MMKSI), selaku distributor resmi kendaraan penumpang dan niaga ringan Mitsubishi di Indonesia, telah meluncurkan sejumlah teaser akan munculnya mobil baru ini dengan merilis foto-foto siluet dan melansir sebagian fitur andalan mobil tersebut.\r\n\r\nXforce dikembangkan dari mobil konsep Mitsubishi XFC Concept yang dipajang pada pameran otomotif Indonesia International Motor Show (IIMS) 2023, Februari lalu. Mobil konsep ini pertama kali dipamerkan di Vietnam, Oktober 2022. Namun, saat itu pihak PT MMKSI belum mengungkapkan di negara mana versi produksi massal dari XFC Concept akan dibuat dan dipasarkan.\r\n\r\nKini terjawab sudah, Mitsubishi Xforce diproduksi oleh PT Mitsubishi Motors Krama Yudha Indonesia (MMKI) di Cikarang, Kabupaten Bekasi, Jawa Barat, dan dipasarkan pertama kali di Indonesia sebelum nantinya diekspor ke negara lain.',	'1695096565.jpg',	'2023-09-19 04:09:25',	'2023-09-19 04:09:25');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Portal Berita A',	'portalberitaa',	'portalberitaa@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	NULL,	'2023-07-13 09:53:48',	'2023-07-13 09:53:48');

-- 2023-09-22 02:36:28
