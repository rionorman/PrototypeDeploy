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
(1,	'Pendidikan & Kebudayaan',	'2023-07-13 10:06:09',	'2023-09-14 06:20:07'),
(2,	'Ekonomi',	'2023-07-13 10:06:16',	'2023-09-14 06:15:59');

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
(44,	3,	1,	'Anggaran Minim, Perpusnas Optimalkan Kolaborasi untuk Dongkrak Literasi',	'Komisi X Dewan Perwakilan Rakyat menyetujui pagu definitif Perpustakaan Nasional tahun anggaran 2024 sebesar Rp 725 miliar. Usulan tambahan anggaran sekitar Rp 383 miliar untuk penguatan budaya literasi dan kualitas layanan internal tidak terealisasi. Dengan anggaran minim, Perpusnas akan mengoptimalkan kolaborasi dengan berbagai pihak untuk mendongkrak literasi di Tanah Air.\r\n\r\nKepala Perpusnas Muhammad Syarif Bando mengatakan, anggaran tersebut terbilang kecil di tengah tingginya gairah gerakan literasi di berbagai daerah. Permintaan bantuan buku ke Perpusnas dari berbagai pihak pun tidak pernah sepi.\r\n\r\n”Secara de facto, itu (anggaran minim) betul-betul menjadi kendala kami karena permintaan dari daerah untuk membangun dan mengembangkan perpustakaan luar biasa. Hampir setiap hari kami menerima permintaan bantuan buku,” ujarnya seusai menghadiri rapat dengar pendapat bersama Komisi X DPR di Jakarta, Rabu (13/9/2023).\r\n\r\nSyarif menjelaskan, pihaknya berupaya menyiasati keterbatasan itu dengan mengoptimalkan kolaborasi dengan berbagai pihak. Pemerintah daerah, perguruan tinggi, akademisi, dan komunitas diajak bersama-sama memperkuat gerakan literasi di penjuru Nusantara.\r\n\r\n”Yang paling menguntungkan kami adalah (berkolaborasi) dengan komunitas. Mereka selalu punya cara. Walaupun pandemi atau krisis, tetap bergerak. Ini kami rangkul betul sehingga bisa menjangkau seluruh lapisan masyarakat,” katanya.\r\n\r\nKolaborasi dengan komunitas dinilai efektif karena gerakan literasi yang dijalankan dekat dengan warga. Selain itu, komunitas juga berjejaring sehingga diharapkan berdampak lebih luas.',	'1694672553.jpg',	'2023-08-21 14:20:06',	'2023-09-15 01:20:29'),
(48,	3,	2,	'Pertamina Terbitkan 781 Surat Sanksi untuk Penyalur Elpiji',	'PT Pertamina (Persero), per 8 September 2023, menerbitkan total 781 surat sanksi kepada lembaga penyalur dan stasiun pengisian bulk elpiji atau SPBE karena melanggar peraturan terkait distribusi elpiji. Komisi VII DPR menilai diperlukan sanksi lebih tegas dan penguatan sistem dalam pengawasan penyaluran elpiji.\r\n\r\nBerdasarkan data Pertamina dan Direktorat Jenderal Minyak dan Gas Bumi Kementerian Energi dan Sumber Daya Mineral (ESDM), 781 surat sanksi itu terdiri dari 547 surat untuk lembaga penyalur elpiji subsidi dan 15 surat untuk lembaga penyalur elpiji nonsubsidi. Di samping itu, ada 183 SPBE subsidi dan 36 SPBE nonsubsidi yang juga menerima surat sanksi.\r\n\r\nSejumlah pelanggaran yang dilakukan, antara lain, agen tidak melakukan pendataan laporan bulanan di aplikasi Si Melon dan tak melapor adanya perubahan pangkalan. Lalu, agen menjual ke pangkalan dengan harga tidak sesuai ketentuan, pangkalan menjual elpiji 3 kilogram (kg) di atas harga eceran tertinggi, dan adanya temuan verifikasi refill elpiji 3 kg.\r\n\r\nSementara itu, berdasarkan rekapitulasi Kepolisian terkait penyalahgunaan elpiji bersubsidi, hingga kini (tahun 2023), sudah ada 63 kasus, yang terdiri dari administrasi 8 kasus dan pidana 55 kasus. Kabupaten Bogor, Jawa Barat tertinggi dengan 5 kasus, disusul Kota Jakarta Timur, DKI Jakarta, dengan 4 kasus.\r\n\r\nDirektur Utama PT Pertamina Patra Niaga Riva Siahaan dalam rapat dengar pendapat dengan Komisi VII DPR, di Jakarta, Rabu (13/9/2023), mengatakan, pihaknya menerapkan sejumlah sanksi, mulai dari teguran hingga pemutusan hubungan usaha terkait dengan penyaluran elpiji, baik bersubsidi maupun nonsubsidi.\r\n\r\n”(Pelanggaran itu) karena tidak sesuai dengan kesepakatan atau perjanjian antara Pertamina dan penyalur-penyalur tersebut. Pada SPBE, misalnya, surat teguran terkait dengan kinerja operasional, surat peringatan terkait pemenuhan perizinan, surat skorsing, dan surat klaim loses,” kata Riva.',	'1694672252.jpg',	'2023-08-22 10:55:32',	'2023-09-14 06:17:32'),
(49,	3,	2,	'Kesesuaian Keterampilan di Dalam Negeri Tentukan Diaspora Pulang',	'Perkembangan industri dalam negeri yang dianggap belum semaju di luar negeri memengaruhi permintaan keterampilan yang dibawa oleh diaspora Indonesia. Pemerintah diminta menciptakan iklim ketenagakerjaan yang mendukung para diaspora mengaplikasikan keterampilannya di Tanah Air.\r\n\r\n”Banyak diaspora Indonesia sebenarnya ingin kembali ke Tanah Air, tetapi akhirnya harus berhadapan dengan isu kesesuaian keterampilan yang mereka punya dengan lapangan pekerjaan di dalam negeri. Gaji memang penting, tetapi kesesuaian keterampilan jadi faktor yang lebih penting bagi mereka sebelum memutuskan kembali,” ujar Direktur Center of Economic and Law Studies Bhima Yudhistira, Rabu (13/9/2023), di Jakarta.\r\n\r\nUntuk mengatasi permasalahan itu, pemerintah bisa memfasilitasi pelaku industri swasta dalam negeri untuk meningkatkan penelitian yang melibatkan diaspora Indonesia. Industri yang berpartisipasi bisa diberikan insentif pengurangan pajak dari penghasilan bruto paling tinggi (super tax deduction). Pemerintah perlu pula menjaga stabilitas politik supaya iklim investasi tetap menarik.\r\n\r\nPemerintah juga bisa meminta diaspora Indonesia dengan keterampilan yang dimiliki untuk menjadi mentor. Beberapa lembaga pelatihan milik pemerintah membutuhkan tenaga pelatih terampil, tetapi sering kali pemenuhannya tidak optimal.',	'1694672334.jpg',	'2023-08-22 14:23:41',	'2023-09-14 06:18:54'),
(104,	3,	1,	'Libur 2024 Ditetapkan 27 Hari',	'Pemerintah memutuskan total hari libur nasional dan cuti bersama sepanjang tahun 2024 berjumlah 27 hari. Jumlah libur ini belum termasuk libur nasional karena Pemilu 2024. Selain itu, penamaan hari raya umat Kristen dan Katolik juga diubah dari Isa Almasih menjadi Yesus Kristus.\r\n\r\nMenteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan (PMK) Muhadjir Effendy mengatakan, penetapan dilakukan saat ini agar menjadi pedoman bagi masyarakat, pelaku ekonomi dan pariwisata, serta perusahaan swasta untuk menyusun aktivitasnya. Termasuk, pemerintah juga bisa menentukan program kerja sepanjang 2024.\r\n\r\n”Kami memutuskan libur nasional dan cuti bersama sebanyak 27 hari, terdiri dari libur nasional sebanyak 17 hari dan cuti bersama sebanyak 10 hari,” kata Muhadjir dalam konferensi pers di Kantor Kemenko PMK, Jakarta, Selasa (12/9/2023).\r\n\r\nKeputusan ini dituangkan dalam Surat Keputusan Bersama (SKB) 3 Menteri Nomor 855 Tahun 2023, Nomor 3 Tahun 2023, Nomor 4 Tahun 2023 tentang Hari Libur Nasional dan Cuti Bersama Tahun 2024 yang ditandatangani Menteri Ketenagakerjaan Ida Fauziyah, Menteri Pemberdayaan Aparatur Negara dan Reformasi Birokrasi (Menpan RB) Abdullah Azwar Anas, dan Menteri Agama Yaqut Cholil Quomas. Jumlah libur tahun depan pun lebih banyak dari tahun 2023 yang berjumlah 24 hari.',	'1694783983.jpg',	'2023-09-14 04:07:01',	'2023-09-15 13:19:43'),
(105,	3,	2,	'Potensi Konsolidasi Antaroperator Seluler Masih Terbuka',	'Potensi terjadinya konsolidasi baru antarpenyelenggara telekomunikasi masih terbuka. Selain semakin menyehatkan industri, konsolidasi dinilai akan mampu meningkatkan mutu layanan kepada masyarakat.\r\n\r\nVice President for Industry and Regional Research PT Bank Mandiri (Persero) Tbk Dendi Ramdani, Jumat (15/9/2023), di Jakarta, mengatakan, sejumlah negara tidak banyak memiliki operator penyelenggara telekomunikasi dan bahkan ada negara hanya memiliki satu operator. Menurut dia, kebanyakan jumlah operator akan memengaruhi skala ekonomi dan daya jangkau layanan telekomunikasi kepada masyarakat.\r\n\r\n”Saat ini, mobilitas orang dari satu tempat ke tempat lain tergolong tinggi. Begitu pula dengan tingkat ketergantungan mereka terhadap layanan telekomunikasi,” ujarnya.\r\n\r\nPada tahun 2021, dia menyebut konsumsi data seluler (internet) per kapita di Indonesia baru sekitar 14,4 gigabit (GB) per bulan, Malaysia 25,7 GB per bulan dan Thailand 21,9 GB per bulan. Indonesia diproyeksikan masih akan mengalami kenaikan konsumsi internet per kapita pada tahun-tahun mendatang.\r\n\r\nApabila operator berskala kecil, daya jangkau jaringannya tidak luas. Operator seperti ini sebenarnya bisa bekerja sama jaringan dengan operator lain. Namun, Dendi menilai, dalam jangka panjang operator seperti itu tetap perlu konsolidasi.\r\n\r\n”Ditambah lagi, tekanan (persaingan) ketat di industri. Merger akan berdampak efisiensi ke industri dan harga layanan ke konsumen lebih rasional. Ketika industri telekomunikasi tumbuh sehat, pembangunan infrastruktur jaringan bisa bertambah sehingga terjadi kenaikan daya jangkau layanan,” imbuhnya.\r\n\r\nAnggota Komisi Komunikasi dan Edukasi dari Badan Perlindungan Konsumen Indonesia (BPKN), Heru Sutadi, mengatakan, sesuai hasil kajian Kementerian Komunikasi dan Informatika (Kemenkominfo) tahun 2015, sektor industri telekomunikasi seluler cukup diisi tiga hingga empat perusahaan saja. Artinya, kondisi industri sekarang yang terdapat empat operator sebenarnya cukup, tetapi perlu dilihat neraca keuangan masing-masing operator.\r\n\r\nDi antara keempatnya masih ada satu operator yang diduga memiliki kondisi finansial yang berat dan merugi. Dengan demikian, satu tahap lagi konsolidasi memungkinkan terjadi.',	'1694783708.jpg',	'2023-09-15 13:15:08',	'2023-09-15 13:15:08'),
(106,	3,	1,	'Pendidikan Tinggi Vokasi Difasilitasi untuk Lebih Modern',	'Para dosen pendidikan tinggi vokasi dapat mengembangkan inovasi dengan menerapkan teknologi, model, dan strategi pembelajaran yang beragam. Hal ini menjadi bekal yang baik bagi pendidikan tinggi vokasi dalam bertransformasi menjadi lebih modern.\r\n\r\nDirektur Jenderal Pendidikan Vokasi Kementerian Pendidikan, Kebudayaan, Riset, dan Teknologi Kiki Yuliati, di Jakarta, Jumat (15/9/2023), mengatakan, Merdeka Belajar Episode 26: Transformasi Standar Nasional dan Akreditasi Pendidikan Tinggi memberikan kepercayaan terhadap perguruan tinggi vokasi. Peraturan Menteri Pendidikan, Kebudayaan, Riset, dan Teknologi Nomor 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi menjadi bentuk dukungan agar perguruan tinggi vokasi dapat lebih leluasa berinovasi.\r\n\r\nKiki memaparkan, politeknik dan sekolah vokasi di perguruan tinggi harus bertransformasi meninggalkan model-model pembelajaran yang sudah tidak sesuai dengan perkembangan saat ini.\r\n\r\n”Model belajar mastery learning atau menguasai materi secara tuntas pada prinsipnya tidak salah. Namun, ketika strategi dan teknologi pembelajaran semakin membaik, ketersediaan sarana dan prasarana juga semakin baik, para dosen seharusnya bisa lebih berinovasi lagi,” ujar Kiki.\r\n\r\nBaca juga : Dosen Vokasi Belum Produktif Berinovasi\r\n\r\nKini, lanjut Kiki, para dosen dan politeknik tidak perlu khawatir untuk berinovasi dengan model pembelajaran-pembelajaran baru. Sudah ada payung hukum yang jadi menegaskan sekaligus melegitimasi para dosen untuk berinovasi.\r\n\r\n”Perguruan tinggi vokasi bisa menggunakan model pendidikan dual system, tidak harus dengan sistem (perkuliahan) paket lagi,” katanya.',	'1694783892.jpg',	'2023-09-15 13:16:19',	'2023-09-15 13:18:12');

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
(3,	'Admin Back End',	'adminbackend',	'adminbackend@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	'XSnLyFh6b81UAFlqaFfZWQyS8RzyZ251bLVUhLSpuEBxJjU94MrhnqENdaly',	'2023-07-13 09:53:48',	'2023-07-13 09:53:48');

-- 2023-09-22 02:36:47
