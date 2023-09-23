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
('277d7f25-84fa-40cc-a527-cf0e11dd071b',	'Kesehatan',	'2023-09-08 04:11:09',	'2023-09-21 03:21:22'),
('e4c137dc-5a09-444e-81fe-95dcb1e05b70',	'Gaya Hidup',	'2023-08-28 15:08:40',	'2023-08-29 09:13:03'),
('e7331b0e-fe5e-4237-9e6f-40e592b692ff',	'Riset',	'2023-08-28 15:13:05',	'2023-08-29 09:13:21');

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
(8,	'2014_10_12_000000_create_users_table',	1),
(9,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(10,	'2014_10_12_100000_create_password_resets_table',	1),
(11,	'2019_08_19_000000_create_failed_jobs_table',	1),
(12,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(13,	'2023_07_12_044043_create_categories_table',	1),
(14,	'2023_07_12_045140_create_posts_table',	1);

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
('036b51d6-c05b-4a78-b4a4-94ed156bce33',	1,	'277d7f25-84fa-40cc-a527-cf0e11dd071b',	'Komunikasi, Kunci Mencegah Resistensi Antimikroba di Ruang ICU Rumah Sakit',	'Keterlibatan pasien dan keluarganya saat dirawat di ruang perawatan intensif atau ICU sangat penting bagi dokter untuk memutuskan tindakan medis yang diambil. Dokter pun harus membangun komunikasi yang efektif dengan pasien dan keluarga walau kondisi sedang gawat darurat.\r\n\r\nSebab berurusan dengan ICU bukanlah hal yang mudah bagi pasien serta keluarganya dan dokter harus mengambil keputusan dengan cepat dan tepat agar nyawa pasien bisa terselamatkan. Belum lagi ada ancaman resistensi antimikroba (AMR) yang membuat bakteri, jamur atau virus penyebab infeksi pada tubuh seseorang lebih sulit ditangani dengan antibiotik, antijamur, atau antiviral. Ini akan membuat pasien sulit sembuh dan perlu dirawat lebih lama.\r\n\r\nDokter spesialis anestesi dan konsultan perawatan intensif dari Eka Hospital, Vannesi T Silalahi, mengatakan, komunikasi dua arah akan meningkatkan pemahaman pihak pasien, dan mendorong diskusi lanjutan yang lebih baik mengenai rekomendasi medis dari tenaga kesehatan. Dengan begitu, pemberian antibiotik pun menjadi lebih jitu di ICU, hingga berujung pada meningkatnya kualitas perawatan yang diterima pasien dan menurunnya risiko AMR.\r\n\r\n\"Memang kami dikenal dokter paling cerewet di dunia kalau pasien dan keluarganya belum paham bagaimana kami mengambil keputusan. Saya selalu bilang masuk ke sini (ICU) itu karena mengancam nyawa jadi harus cepat, jangan lama-lama. Makanya kita perlu penggunaan antibiotik yang jitu, tepat guna dan tepat waktu,\" kata Vannesi dalam seminar yang digelar oleh Pfizer Indonesia dan Eka Hospital di Tangerang Selatan, Rabu (9/6/2023).',	'1694146404.jpg',	'2023-09-08 04:13:24',	'2023-09-21 03:23:21'),
('89f78bcd-9dd0-4426-a929-c69efef78856',	1,	'e7331b0e-fe5e-4237-9e6f-40e592b692ff',	'Polemik Buangan Air Pengolahan Limbah Radioaktif ke Lautan Pasifik',	'Langkah Pembangkit Listrik Tenaga Nuklir Fukushima Daiichi membuang air olahan limbah radioaktif ke Samudra Pasifik menuai polemik. Selain mendapat tekanan dari warga setempat, langkah ini juga mendapat protes dari sejumlah negara, seperti China dan negara-negara di wilayah Pasifik. Meskipun demikian, air limbah radioaktif itu tetap dilepas dengan diperkuat hasil kajian ilmiah.\r\n\r\nKasus pembuangan limbah radioaktif tersebut merupakan serangkaian proses panjang pascabencana alam 12 tahun silam. Pada 11 Maret 2011, Jepang dilanda gempa besar berkekuatan magnitudo 9 yang memicu tsunami di sebagian wilayah pantai Jepang. Bahkan, di kawasan pantai timur laut Jepang terjadi tsunami dengan ketinggian lebih dari 10 meter. Akibatnya, terjadi kehancuran infrastruktur yang sangat besar, menimbulkan korban tewas hingga sekitar 20.000 jiwa, serta menyebabkan korban luka-luka lebih dari 6.000 orang.\r\n\r\nSalah satu infrastruktur yang terdampak dari tsunami itu adalah Fukushima Daiichi Nuclear Power Station (FDNPS) yang dioperasikan oleh Tokyo Electric Power Company (Tepco). Gempa bumi dan tsunami saat itu telah menyebabkan kerusakan infrastruktur operasional dan pendukung keselamatan di lokasi FDNPS. Selain itu juga terjadi kerusakan jalur listrik di sekitar Fukushima Daiichi sehingga suplai listrik terputus baik dari dalam maupun luar lokasi FDNPS.\r\n\r\nTerputusnya suplai listrik itu sangat berbahaya karena memiliki fungsi vital untuk stabilisasi mendinginkan tabung reaktor. Dalam standar operasi pembangkit energi nuklir, suplai listrik untuk keamanan reaktor itu terdiri atas tiga hal, yakni listrik dari grid jaringan, genset listrik untuk cadangan apabila jaringan grid terputus, dan baterai listrik untuk backup akhir. Sayangnya, pada kasus bencana alam Jepang itu, ketiga suplai listrik untuk FDNPS terputus dan mati. Akibatnya, reaksi nuklir terus terjadi di dalam tabung reaktor yang pendinginnya tidak berfungsi sehingga suhu panasnya terus meningkat. Proses ini dapat menyebabkan tabung reaktor meleleh atau bahkan meledak sehingga menyebabkan radiasi nuklir di sekitarnya.',	'1693300532.jpg',	'2023-08-29 09:15:32',	'2023-08-29 09:15:32'),
('d6c8656d-b9ac-4c5d-85b7-35b0dfadc5ba',	1,	'e4c137dc-5a09-444e-81fe-95dcb1e05b70',	'Kuliner Jember yang Menggoyang Lidah',	'Jalan-jalan ke Jember kurang lengkap rasanya jika tidak mencicipi kulinernya. Di tempat yang dikenal dengan perhelatan Jember Fashion Carnaval ini, ada beberapa makanan legendaris yang mampu menggoyang lidah para pencinta kuliner.\r\n\r\nMenu nasi pecel menjadi kekhasan kuliner di wilayah Jawa Timur. Hampir setiap kota memiliki keunikan pecel. Begitu pula di Kota Jember, pecel disandingkan dengan menu lain. Pecel dengan banyak pilihan lauk sungguh menggoda para penyuka sayur berbumbu kacang ini.\r\n\r\nPada pagi hari, menu sarapan di Jember yang cocok untuk membuka hari adalah pecel lodeh Wali Songo. Lokasi warung berada di Jalan Sultan Agung, di ujung Gang III, atau persisnya di samping toko Wali Songo I. Tempat makannya berupa kursi yang mengular di sepanjang gang menuju belakang.\r\n\r\n”Untuk yang makan di sini, langsung masuk ambil nomor antrean itu dan cari tempat duduk di dalam,” kata salah seorang pekerja. Pengunjung pun diarahkan untuk mencari tempat duduk di belakang warung. Pelayan warung nantinya akan mendatangi satu per satu pengunjung yang duduk antre dan menanyakan ingin makan apa.\r\n\r\nAdapun pembeli yang ingin membungkus makanan harus antre berdiri di depan warung. Warung buka pukul 05.30 hingga sekitar pukul 12.00.',	'1693300466.jpg',	'2023-08-29 09:14:26',	'2023-08-29 09:14:26');

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
(1,	'Portal Berita C',	'adminpbc',	'adminpbc@gmail.com',	NULL,	'$2y$10$WEDDLfe1.XDoDMEwEMzTtucnTvdq9RDiHD08QPTcCcJZoK3lt33re',	NULL,	'2023-08-28 15:04:28',	'2023-08-28 15:04:28');

-- 2023-09-22 02:36:44
