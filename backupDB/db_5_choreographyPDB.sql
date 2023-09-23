-- Adminer 4.8.1 MySQL 8.1.0 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `category`, `created_at`, `updated_at`) VALUES
('26e06a7c-3e64-4553-90f9-d4a629af01a2',	'Nusantara',	'2023-08-29 09:05:39',	'2023-08-29 09:05:39'),
('4ef40c8f-8183-4f95-a158-b3b3f4930153',	'Sports Football',	'2023-08-28 14:54:29',	'2023-08-28 14:54:29');

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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `cat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
('914badfb-14a8-4bb1-8cb1-f9f238bb2160',	1,	'4ef40c8f-8183-4f95-a158-b3b3f4930153',	'Catatan BRI Liga 1: Hujan Kartu Merah dan Tradisi Madura United',	'Setelah memasuki pekan ke-10, BRI Liga 1 2023-2024 menghadirkan lima catatan menarik. Madura United yang berada di puncak klasemen kembali membuktikan kedigdayaan mereka di setiap paruh pertama kompetisi. Di sisi lain, PSM Makassar, tim juara bertahan, masih tertahan di papan tengah karena terlalu mudah mendapatkan kartu merah.\r\n\r\nKartu merah hampir terjadi di setiap pekan\r\n\r\nDari 10 pekan yang telah terlaksana, sebanyak delapan pekan di antaranya tentu menyajikan pertandingan yang membuat wasit mengeluarkan kartu merah dari saku celananya. Hanya di pekan keenam dan kesepuluh, wasit tidak memberikan hukuman kartu merah kepada pemain.\r\n\r\nBek Persikabo 1973, Andy Setyo, adalah pemain pertama yang mendapatkan kartu merah di kompetisi kasta tertinggi Indonesia edisi 2023-2024. Kartu itu diterima ketika timnya tumbang, 1-2, dari RANS Nusantara pada pekan pembuka.\r\n\r\nSebanyak 19 kartu merah telah dikeluarkan sang pengadil di musim ini. PSM Makassar menjadi tim yang paling banyak menerima kartu merah. Empat pemain “Juku Eja” telah merasakan harus keluar lapangan sebelum peluit akhir laga.',	'1693299818.jpg',	'2023-08-29 09:03:38',	'2023-08-29 09:04:24'),
('b3371cc3-43e1-440f-ba94-52073a8f68e0',	1,	'26e06a7c-3e64-4553-90f9-d4a629af01a2',	'Lindungi Pekerja Anak di Pengolahan Sampah Elektronik',	'Save the Children meluncurkan program Sirkular Jenius di Makassar, Sulawesi Selatan. Program ini berupaya melindungi anak dan keluarga yang bekerja di sektor sampah elektronik. Nantinya, sampah elektronik yang bisa menjadi ancaman akan dikelola menjadi peluang ekonomi yang berkelanjutan.\r\n\r\nPeluncuran program dilakukan di Makassar, Selasa (29/8/2022). Dalam program ini, Save the Children menggandeng Pemerintah Kota Makassar dan Accenture. Makassar menjadi percontohan daerah mengatasi sampah elektronik.\r\n\r\nSejauh ini, bank sampah dan Mallsampah telah hadir dan berperan aktif dalam pengolahan sampah di Makassar. Namun, kesadaran sebagian warga untuk memilah atau memperlakukan sampah masih kurang. Oleh karena itu, program ini diharapkan ikut mengurangi dampak buruk pada lingkungan, melindungi manusia di sekitarnya, hingga mendorong ekonomi warga menjadi lebih baik.\r\n\r\n”Kami berharap ada perubahan signifikan terkait sistem pengelolaan sampah elektronik lokal dengan menjadikannya lebih efisien dan ramah lingkungan. Selain itu, pengelolaan sampah ini menawarkan peluang penghidupan layak bagi para keluarga yang bekerja di industri ini yang kelak akan berdampak pada kesejahteraan anak-anak di Kota Makassar,” kata Ihwana Mustafa, Program Manager Save the Children Indonesia di Makassar.',	'1693299972.jpg',	'2023-08-29 09:06:12',	'2023-08-29 09:06:12');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `role`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Portal Berita B',	'adminpbb',	'adminpbb@gmail.com',	NULL,	'user',	'$2y$10$fJm/xHBVLqRE9J5t2xkd1O2z5l/6xGYuMqHB3vMwhA2HhlSMWPJlu',	NULL,	'2023-08-28 14:52:57',	'2023-08-28 14:52:57');

-- 2023-09-22 02:36:41
