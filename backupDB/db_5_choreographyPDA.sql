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
('5513308f-af19-444e-8d55-fd773c51a073',	'Ekonomi',	'2023-08-28 14:21:55',	'2023-09-21 00:50:53'),
('777f0402-3b91-420b-aa66-f23085ac412a',	'Polhuk',	'2023-08-28 14:19:51',	'2023-08-29 07:13:40'),
('b900b555-8be5-4e55-8b95-4504b057b101',	'Opini',	'2023-08-28 14:22:55',	'2023-08-29 07:14:00');

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
('70a4cf18-3e05-4ac8-9c59-6455786d5d20',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'Resmi! Pemerintah Perluas Subsidi Motor Listrik, Satu NIK Satu Unit',	'Pemerintah resmi mengeluarkan kebijakan terbarunya mengenai perluasan penerima program bantuan untuk pembelian motor listrik baru berbasis baterai. \r\n\r\nKebijakan tersebut tersebut dituangkan dalam Peraturan Menteri Perindustrian Nomor 21 Tahun 2023 tentang Perubahan atas Permenperin Nomor 6 Tahun 2023 tentang Pedoman Pemberian Bantuan Pemerintah untuk Pembelian Kendaraan Bermotor Listrik Berbasis Baterai Roda Dua.\r\n\r\n\"Dasar utama perubahan kebijakan ini adalah untuk percepatan dalam membangun ekosistem kendaraan listrik di dalam negeri serta mewujudkan Indonesia yang lebih bersih. Tujuan tersebut, tentu akan berdampak terhadap peningkatan investasi, memacu produktivitas dan daya saing industri, serta perluasan tenaga kerja,\" kata Menteri Perindustrian Agus Gumiwang Kartasasmita dalam keterangannya di Jakarta, Selasa (29/8/2023).\r\n\r\nDalam aturan terbaru itu, disebutkan program bantuan diberikan untuk satu kali pembelian motor listrik yang dilakukan oleh masyarakat dengan satu nomor induk kependudukan (NIK) yang sama. \"Artinya, masyarakat yang ingin mendapatkan program bantuan pemerintah ini syaratnya adalah WNI berusia paling rendah 17 tahun dan memiliki KTP elektronik. Satu NIK KTP bisa membeli satu unit motor listrik,\" kata Agus.',	'1693294978.jpg',	'2023-08-29 07:42:58',	'2023-08-29 07:42:58'),
('75427dfb-cba4-4338-af98-c1d72722853e',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'Kemenparekraf Dukung Pungutan bagi Wisman di Pulau Bali',	'Pemerintah Provinsi Bali bakal memberlakukan pungutan sebesar Rp 150.000 atau sekitar 10 dollar AS per orang bagi wisatawan mancanegara yang berlibur ke Bali. Pungutan itu adalah bentuk kontribusi pada upaya perlindungan alam dan budaya Bali serta peningkatan kualitas pariwisata Bali secara berkelanjutan.\r\n\r\nLangkah tersebut didukung oleh Kementerian Pariwisata dan Ekonomi Kreatif yang akan membantu menarasikan pungutan tersebut. Menteri Pariwisata dan Ekonomi Kreatif Sandiaga Uno mengatakan, Kemenparekraf akan habis-habisan (all out) dalam menyampaikan narasi positif perihal pungutan sebagai upaya Bali menuju pariwisata berkualitas dan berkelanjutan berbasis budaya.\r\n\r\nKemenparekraf menugaskan Kepala Biro Komunikasi Kemenparekraf I Gusti Ayu Dewi Hendriyani untuk berkoordinasi dengan Dinas Pariwisata Bali dalam menyampaikan dan menarasikan pungutan bagi wisman yang akan diterapkan Bali dalam waktu dekat ini.\r\n\r\nHal itu disampaikan Sandiaga dalam The Weekly Brief with Sandi Uno yang diadakan secara dalam jaringan (daring), Senin (4/9/2023). Acara itu dihadiri Gubernur Bali Wayan Koster secara daring dari Denpasar, Bali.\r\n\r\nGubernur Koster menerangkan, pengenaan pungutan bagi wisman ke Bali diamanatkan dalam Undang-Undang Nomor 15 Tahun 2023 tentang Provinsi Bali dan Peraturan Daerah Provinsi Bali Nomor 6 Tahun 2023 tentang Pungutan bagi Wisatawan Asing untuk Pelindungan Kebudayaan dan Lingkungan Alam Bali.',	'1693887600.jpg',	'2023-09-05 04:20:00',	'2023-09-21 01:16:01'),
('bf870a4e-9791-4bed-a634-4bd1bde2572d',	1,	'b900b555-8be5-4e55-8b95-4504b057b101',	'Antibudaya dalam Demokrasi Kita',	'Bisakah politik kita berjalan tanpa politik uang? Jawabnya membentang di antara bisa dan tidak bisa. Di atas semua itu, ikhtiar untuk menjawab pertanyaan ini ranahnya ialah budaya demokrasi.\r\n\r\nMembahas budaya demokrasi dalam konteks pemilu sebagai pesta demokrasi akbar 2024 merupakan hal yang mendasar. Pemilu sebagai implementasi demokrasi substansial merupakan indikator utama negara demokrasi bergerak maju atau mundur.\r\n\r\nPemilu itu jantungnya negara demokrasi modern. Kesehatannya perlu terus-menerus dijaga. Pembuluh darah demokrasi kita tak boleh tersumbat oleh perilaku antibudaya.\r\n\r\nM Dawam Rahardjo pernah melontarkan kontradiksi dalam kalimat ”budaya korupsi” atau ”korupsi yang membudaya”. Kalimat itu tidak tepat, justru karena korupsi itu perbuatan yang antibudaya. Budaya dan kebudayaan berkonotasi mulia. Budaya menopang hadirnya peradaban tinggi.\r\n\r\nTak ada budaya rendah, semua budaya ialah budaya tinggi. Budaya bukan sekadar kebiasaan yang netral, tetapi melekat di dalamnya sesuatu yang adiluhung atau mulia. Barangkali pengertian semacam ini segera menghadirkan pendapat berbeda. Namun, tulisan ini sepakat dengan pendapat tersebut.\r\n\r\nMerujuk pada itu, budaya demokrasi ialah perilaku yang mengutamakan nilai-nilai atau substansi demokrasi yang adiluhung. Sudah lazim mengemuka dalam berbagai orientasi kepemimpinan dan politik, pemahaman demokrasi diberangkatkan pada nilai-nilai atau substansinya.\r\n\r\nDemokrasi substansial lebih mendasar ketimbang prosedural. Demokrasi substansial merentangkan sejumlah nilai atau prinsip mulia, seperti egalitarianisme, antidiskriminasi, menghargai perbedaan, menjunjung tinggi HAM, antiotoritarianisme, antikorupsi, hingga kesetaraan di muka hukum.',	'1693295752.jpg',	'2023-08-29 07:55:52',	'2023-08-29 07:55:52'),
('c5d31540-ea82-49ba-935a-392e386cf3f5',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'OJK Beberkan Banyak Ibu-Ibu Jadi Korban Pinjol Ilegal dan Rentenir',	'Otoritas Jasa Keuangan (OJK) meminta para pelaku UMKM tidak terjebak dalam penggunaan pinjaman online (pinjol) ilegal dan rentenir. Kepala Eksekutif Pengawas Perilaku Pelaku Usaha Jasa Keuangan, Edukasi, dan Pelindungan Konsumen OJK Friderica Widyasari Dewi mengungkapkan banyak pelaku UMKM terutama kaum ibu yang menjadi korban pinjol ilegal.\r\n\r\n“Saya tahu banyak yang butuh pembiayaan dan akses keuangan tapi jangan sampai terjerat pinjol ilegal. Banyak ibu-ibu jadi korban jadi hati-hati,” kata Friderica dalam Literasi Keuangan Indonesia Terdepan (Like It) Series 2 yang disiarkan secara daring, Selasa (29/8/2023).\r\n\r\nOJK Minta Pelaku UMKM tak Perlu Berkenalan dengan Rentenir OJK: RI Kurangi 60 Persen Emisi Karbon Lewat Sektor Alam Ini Manfaat Penting SLIK OJK\r\n\r\nFriderica menegaskan, saat ini skema skema penipuan banyak sekali macamnya. Dia menuturkan, OJK bersama kementerian lain sudah menutup lebih dari 5.800 pinjol ilegal. Dia menuturkan, kerugian yang disebabkan oleh investasi ilegal sudah lebih dari Rp 100 triliun.\r\n\r\n“Jadi ibu-ibu harus hati-hati jangan sanmpai masuk kepada skema seperti ini,” tutur Friderica.\r\n\r\nAgar tidak terjebak pinjol ilegal, Friderica menekankan masyarakat hanya perlu memastikan dua hal yaitu legalitas dan logisnya. Jika mendapatkan tawaran pinjol atau investasi ilegal harus dicek terlebih dahulu legalitasnya dengan menghubungi OJK pada nomor kontak 157 dan perhatikan sisi logis keuntungannya.',	'1693293769.jpg',	'2023-08-29 04:27:45',	'2023-08-29 07:46:55'),
('dc8bccbe-6ee9-4844-a822-fe271646a03b',	1,	'b900b555-8be5-4e55-8b95-4504b057b101',	'Polusi dan WFH',	'Pemerintah Provinsi DKI Jakarta menerapkan kebijakan bekerja dari rumah (WFH) bagi 50 persen aparatur sipil negara (ASN) selama 21 Agustus 2023-21 Oktober 2023 untuk mengurangi buruknya kualitas udara Jakarta. Menurut survei, kualitas udara Jakarta terburuk di dunia dan sumber polutan terbesar (44 persen) dari kendaraan. Tujuan lain WFH, untuk kenyamanan pelaksanaan KTT ASEAN.\r\n\r\nKita ingat WFH dan pembelajaran jarak jauh (PJJ) saat pandemi berhasil mengurangi polusi udara, tidak hanya di Jakarta, tetapi juga di dunia.\r\n\r\nSaat itu media memberitakan langit biru di seluruh dunia, bahkan beberapa gunung yang selalu tertutup awan tampak jelas.\r\n\r\nNamun, beberapa pengamat mengatakan, kebijakan kali ini tidak efektif karena yang melakukan mobilisasi di Jakarta bukan hanya ASN, melainkan juga pegawai swasta, pekerja sektor informal, pelajar, dan mahasiswa. Akibatnya, meski WFH diterapkan, Jakarta tetap macet dan polusi masih seperti biasanya.\r\n\r\nPerilaku kita selalu mencari celah melanggar aturan sehingga, meski WFH, bisa saja ASN keluar rumah dengan berbagai alasan. Kalau dipantau, toh bisa Zoom sebagai bukti tetap kerja.',	'1693295610.jpg',	'2023-08-29 07:53:31',	'2023-08-29 07:53:31');

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
(1,	'Portal Berita A',	'adminpba',	'adminpba@gmail.com',	NULL,	'$2y$10$oKiYZu/7HyvKSEVAd9XdT.VBUY6QQQsWN.oHrJMXsgNSAko2KqX8C',	'3vtRxPLnj5KjuXY7NELZ3ki6AGH7CWbkEO1scXygMtxQcv9i395N6SYtIX1G',	'2023-08-28 09:59:31',	'2023-08-28 09:59:31');

-- 2023-09-22 02:36:39
