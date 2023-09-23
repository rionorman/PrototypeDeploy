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
(1,	'Wawancara',	'2023-09-18 14:19:19',	'2023-09-18 14:19:19'),
(3,	'Kuliner',	'2023-07-13 10:06:09',	'2023-09-18 14:18:16'),
(4,	'Kesehatan',	'2023-09-18 14:21:34',	'2023-09-18 14:21:34');

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
(1,	1,	1,	'Menjaga Kereta Komuter Tetap Melaju',	'Pandemi tidak menghentikan laju kereta komuter. Di tengah kondisi pengguna yang sempat anjlok hingga 80 persen di masa pandemi Covid-19, kerumitan pelayanan justru meningkat. Sebagai Direktur Utama PT Kereta Commuter Indonesia, Wiwik Widayanti (57) mengomandoi satu per satu perbaikan pelayanan sebagai respons kebutuhan pengguna di tengah situasi tak menentu ini.\r\n\r\nBerikut petikan wawancara Kompas dengan Wiwik Widayanti yang menjabat pucuk pimpinan PT Kereta Commuter Indonesia (PT KCI) sejak 16 April 2018, pada Selasa (16/3/2021).\r\n\r\nBagaimana operasional KRL di masa pandemi?\r\n\r\nDi awal pandemi, kami hampir setiap hari rapat dengan pemerintah pusat, pemerintah daerah, dan Satgas Covid-19 dalam rangka mengawal yang terbaik untuk pengangkutan orang dan masyarakat di masa pandemi. Enam bulan pertama kami lakukan penyesuaian. Ada banyak masalah, seperti kepadatan penumpang di stasiun dan kereta, lalu kami perbaiki. Sampai sekarang, perbaikan terus kami lakukan.\r\n\r\nMungkin hanya di Indonesia, orang mau naik kereta komuter harus berbaris masuk stasiun. Hal ini untuk mengurangi kepadatan di peron. Sampai sekarang belum semua orang menaati aturan-aturan itu. Kalau kereta yang datang sudah penuh, tetap saja ada yang memaksa masuk. Semua alasannya mengejar jam kerja.\r\n\r\nDi sisi lain, sebagian penumpang juga terbiasa dengan pengaturan di stasiun. Malah mereka bilang kalau ada garis marka yang hilang di stasiun ini-itu. Sekarang sudah ada perubahan di masyarakat untuk lebih tertib.\r\n\r\nBanyak hal berubah di masa pandemi. Kebijakan menggunakan masker berubah beberapa kali. Pertama, masker diwajibkan hanya untuk yang sakit. Akhirnya, semua orang wajib pakai masker. Awalnya semua jenis masker boleh dipakai. Lalu, KCI yang pertama melarang scuba dan buff. Kami konsultasi dengan ahli epidemiologi terkait hal ini. Semula, kebijakan ini sempat diprotes berbagai pihak. Akan tetatpi, terus kami terapkan. Akhirnya, Kementerian Kesehatan juga mengeluarkan aturan soal masker ini.\r\n\r\nPenumpang lansia dan balita juga kami atur karena mereka tergolong kelompok rentan. Lansia hanya boleh pada pukul 10.00-14.00, sedangkan anak balita tidak diperkenankan.\r\n\r\nUntuk menerapkan pembatasan kapasitas penumpang di kereta juga tidak mudah. Kami harus memastikan jumlah penumpang di setiap kereta sesuai batas yang diperbolehkan.\r\n\r\nAkhirnya, ada kuota per stasiun. Stasiun besar dikasih kuota lebih banyak. Sekarang kuota ini kami tinjau ulang karena penumpang di stasiun yang pada awal pandemi kosong, sudah tumbuh.\r\n\r\nDulu kami bisa atur karena orang belajar dan bekerja dari rumah. Sekarang bekerja dari kantor boleh 75 persen. Tempat wisata sudah mulai buka. Mal dan tempat hiburan sampai jam 21.00. Otomatis orang lebih banyak bergerak. Kami juga buat wastafel di 80 stasiun, sesuai perintah Pemprov DKI.\r\n\r\nSetelah kereta selesai dinas, langsung disemprotkan disinfektan. Petugas kebersihan di kereta membersihkan fasilitas kereta dan stasiun, terutama di tempat yang sering dipegang orang. Prosedur standar operasi juga tersedia kalau ada penumpang yang tiba-tiba ketahuan terinfeksi Covid-19.\r\n\r\nSebelum pandemi, kami melayani sekitar 1 juta penumpang sehari. Di awal pandemi, sempat di bawah 200.000 penumpang sehari. Sekarang, 300.000-400.000 penumpang per hari. Meskipun jumlahnya berkurang jauh, pelayanan tetap tidak mudah karena ada banyak ketentuan yang harus kami jalani.',	'1695088650.jpg',	'2023-09-19 01:57:30',	'2023-09-19 01:57:30'),
(2,	1,	3,	'Dimanja Kuliner Italia dan Nusantara',	'Makan malam menjadi istimewa biasanya lantaran dua hal, menu makanan yang lezat dan obrolan yang nyaman, ”gayeng” sepanjang acara.\r\n\r\nTerkait makanan lezat, pilihannya bisa sangat beragam. Setiap tempat dan latar budaya punya banyak kuliner jagoannya. Dalam dua kesempatan berbeda, Kompas diundang mencicipi pilihan menu makan malam dari dua negara berbeda.\r\n\r\nMakan malam pertama bermenu hidangan Italia, terutama kawasan Italia utara, di Restoran Il Mare, Hotel Mulia Jakarta, Jumat (3/3/2023). Lalu yang kedua di Restoran Bel Étage, Hotel St Regis, Jakarta, Rabu (8/3), dengan menu andalan kuliner Tanah Air.\r\n\r\nDinaungi atmosfer restoran bernuansa elegan, penerangan temaram, tetapi memadai dan lembut dalam pandangan mata, sejumlah menu pilihan khas Italia disajikan di Il Mare berformat fine dining.\r\n\r\nMenurut Direktur Food and Beverage Hotel Mulia Senayan Maurizio Moncalvo, mereka menawarkan beragam olahan pasta, daging, dan sajian penutup manis. Kuliner Negeri Pizza dan Pasta ini cukup populer di Indonesia dibandingkan kuliner sesama negara Eropa, macam Perancis.\r\n\r\nRagam masakannya pun variatif dan mengandalkan hasil alamnya, seperti juga kuliner Tanah Air. Lantaran bentuk geografis yang sekitar 40 persen pegunungan subur, wilayah-wilayah di Italia terbilang mandiri dengan mengandalkan hasil bumi sendiri.\r\n\r\nKawasan Italia utara identik dengan area pegunungan. Ragam kulinernya mayoritas berbahan olahan daging hewan ternak dan produk olahan susu (dairy). Sementara untuk kuliner di kawasan selatan, yang berpantai dan berada di wilayah Laut Mediterania, ragam kulinernya identik dengan aneka ragam hasil laut (seafood).\r\n\r\nSalah satu menu utama (main course) yang disajikan di santap malam kali ini berupa daging panggang, Bistecca. Berbahan daging sapi wagyu bagian iga (rib eye) yang dipanggang di oven arang kayu. Saat disajikan cita rasa daging Bistecca diperkaya dengan siraman saus kuah (gravy) dengan tambahan lada.',	'1695089332.jpg',	'2023-09-19 02:08:52',	'2023-09-19 02:08:52'),
(3,	1,	1,	'Sudirman Said Merawat Kemanusiaan di PMI',	'Sudirman sejenak tertegun saat seorang staf sekonyong-konyong memasuki ruangannya di Jakarta. Ia dengan tergesa-gesa membuka pintu lalu menerobos begitu saja. Padahal, Sudirman sedang menerima tamu. ”Asalamualaikum. Sori. Boleh ke sini? Ini penting sekali dengan beliau,” ucap pria paruh baya itu di pengujung Oktober 2021.\r\n\r\nSekejap, Sudirman sudah menguasai diri. Ia menjawab salam sambil tersenyum dan menyambut stafnya. Tak sampai 5 menit, urusan sudah rampung. ”Saya selalu cari beliau ke mana-mana. Enggak apa-apa, ya. Bahas laporan tahunan,” ujar staf tersebut setengah nyerocos sebelum berlalu.\r\n\r\nBegitulah, menurut mantan profesional yang pernah malang melintang di berbagai BUMN papan atas itu, perbedaannya dengan iklim perusahaan. ”Di organisasi sosial seperti PMI, orang sangat beragam. Niat sama, mengabdi kepada kemanusiaan. Kita harus bisa merangkul semua warna. Semua karakter,” ucapnya.\r\n\r\nTanggung jawab di PMI begitu besar, tetapi otoritasnya terbatas. Sentralistik ego berikut kegusarannya harus dikubur dalam-dalam. ”Gabung PMI bukan untuk uang dan kekuasaan. Pasti dilandasi dorongan terbesar pengin jadi pelayan. Penolong kemanusiaan,” katanya.\r\n\r\nJauh berbeda dibandingkan dengan profesional yang berorientasi profit, pendekatan kali ini didasari hati nurani. Jangan harap berebut rezeki dan jabatan di PMI. ”Apakah orang enggak punya perbedaan? Punya. Tersinggung sekali-sekali? Ya. Tetap ada yang begitu. Kayak, kok, saya dilewatin,” katanya.\r\n\r\nSudirman harus ndlosor lagi, istilah Jawa yang ia ungkapkan untuk meluncur turun. Mereka yang pernah berperangai tak mengenakkan malah disowani ke kantornya. ”Niat saya buat sebanyak-banyaknya kebaikan. Kalau ada yang punya pandangan lain, itu urusan mereka,” katanya.\r\n\r\nKiprah Sudirman memang sangat berliku-liku. Publik mulai mengenal penggila buku itu lewat Masyarakat Transparansi Indonesia (MTI) yang dibentuk pada 1998. Dukungan para sejawat yang mengantar ia mengetuai MTI sejatinya turut mengukuhkan kepala batu Sudirman soal antikorupsi. Mereka terus menggedor pemerintah mempercepat pembentukan Komisi Pemberantasan Korupsi (KPK). Kasus-kasus besar tak henti pula dikawal.',	'1695089949.jpg',	'2023-09-19 02:19:09',	'2023-09-19 02:19:09'),
(4,	1,	4,	'Standar Terapi Berbasis Sel Punca Disiapkan',	'Pemanfaatan sel punca di bidang kedokteran selama ini masih sebatas untuk riset berbasis layanan terapi. Namun, pemerintah kini sedang menyiapkan aturan mengenai standar terapi berbasis sel punca agar pemanfaatannya bisa semakin luas di masyarakat.\r\n\r\nDirektur Tata Kelola Pelayanan Kesehatan Kementerian Kesehatan Sunarto dalam kegiatan public hearing Rancangan Peraturan Pemerintah (RPP) terkait Undang-Undang Kesehatan: Pelayanan Sel Punca di Jakarta, Senin (18/9/2023), mengatakan, terapi berbasis sel ataupun sel punca dapat memberikan manfaat bagi masyarakat. Terapi ini dapat meningkatkan upaya penyembuhan penyakit, pemulihan kesehatan, dan peningkatan kualitas hidup dari pasien.\r\n\r\n”Sel punca sudah hampir 10-15 tahun berkembang di Indonesia. Namun, standar pelayanan itu belum ada. Semua pelayanan masih diberikan melalui penelitian berbasis layanan. Jadi, RPP ini akan mengatur standar agar keselamatan pasien dalam pelayanan berbasis sel atau sel punca bisa terjamin,” tuturnya.\r\n\r\nTerapi berbasis sel dan atau sel punca menjadi bagian yang diatur dalam Undang-Undang Nomor 17 Tahun 2023 tentang Kesehatan. Dalam undang-undang itu, terapi berbasis sel punca diatur pada pasal 135-136 dengan ketentuan lebih lanjut yang diatur dalam peraturan pemerintah.\r\n\r\nIa menyampaikan, penyelenggaraan terapi berbasis sel dan sel punca pada prinsipnya hanya dapat dilakukan untuk tujuan penyembuhan penyakit dan pemulihan kesehatan. Terapi berbasis sel dan sel punca dilarang digunakan untuk tujuan reproduksi. Terapi ini pun bisa dilakukan jika sudah terbukti keamanan, khasiat, dan kemanfaatannya. Diatur pula bahwa sel punca yang digunakan tidak boleh berasal dari sel punca embrionik.\r\n\r\n”Sel punca dan sel yang diatur untuk pelayanan terapi merupakan pelayanan yang sudah ada standarnya. Ada beberapa usulan yang masuk ke Kementerian Kesehatan, misalnya, sel punca untuk estetik atau kecantikan, bedah plastik, dan ortopedi. Itu sekarang masih dibahas di Kementerian Kesehatan,” katanya.\r\n\r\nSunarto mengatakan, aturan juga akan disiapkan untuk pemanfaatan sel punca dan sel untuk penelitian berbasis pelayanan yang dapat diselenggarakan di rumah sakit yang ditetapkan oleh Menteri Kesehatan.',	'1695090164.jpg',	'2023-09-19 02:22:44',	'2023-09-19 02:22:44');

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
(1,	'Admin Portal B',	'adminportalB',	'adminportalB@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	'NULL',	'2023-07-13 09:53:48',	'2023-07-13 09:53:48'),
(2,	'Admin Portal Utama',	'adminportalutama',	'adminportalutama@gmail.com',	NULL,	'$2y$10$Nv46qM/EV4Zl6H8cGlr9TOokLAUIbEbCqe0ZbqKge29s/eyNGeLYW',	'NULL',	'2023-07-13 10:03:57',	'2023-07-13 10:03:57');

-- 2023-09-22 02:36:25
