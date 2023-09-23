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
(1,	'Sosok',	'2023-09-18 14:19:19',	'2023-09-18 14:19:19'),
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
(27,	1,	1,	'Ali Rokhman dan Nurul Iman, Menata Senyum Wajah Desa',	'Ali Rokhman mengajak Nurul Iman menggerakkan anak muda di sekitar Waduk Penjalin, Desa Winduaji, Kecamatan Paguyangan, Kabupaten Brebes, Jawa Tengah, untuk mengangkut sampah yang menggunung di salah satu sudut waduk itu. Gerakan ini melahirkan dampak berlapis, mulai dari kebersihan lingkungan, pariwisata, hingga peningkatan ekonomi warga. Ribuan orang kini menyerbu Waduk Penjalin dan sekitarnya untuk berwisata ke desa yang kini tersenyum ramah.\r\n\r\nPada suatu pagi, seratusan warga antre untuk menuju tangga pelanggi menuju tanggul Waduk Penjalin. Sementara tak jauh dari mereka, puluhan warga lainnya joging mengitari bibir waduk. Dari atas bibir waduk itu terlihat puluhan tenda teratap terpal memenuhi jalan yang mengelilingi waduk. Jerit klakson sepeda motor dan mobil meningkahi suara-suara orang yang sibuk menjajakan makanan dan mainan anak.\r\n\r\nBegitu sekilas potret puncak keramaian Waduk Penjalin dan sekitarnya. Dari keramaian itu bisa dibayangkan perputaran ekonomi yang berimbas langsung untuk warga. Di sana kini berdiri 25 toko, 20-an stan temporer, dan 20-an penjual menggunakan sepeda motor. ”Pada saat bazar Ramadhan tahun ini ada sekitar 150 stan. Ramai sekali,” kata Nurul Iman, Ketua Kelompok Sadar Wisata (Pokdarwis) Desa Wisata Waduk Penjalin, Jumat (2/09/2023).\r\n\r\nDi luar Ramadhan, keramaian Waduk Penjalin terjadi pada Sabtu dan Minggu. Jumlah pengunjung pada akhir pekan tersebut bisa mencapai 1.000 orang yang berdatangan sejak matahari membuka mata sampai dia rebah di barat. Di hari-hari biasa juga banyak yang datang meskipun tidak seramai akhir pekan. Mereka bukan hanya warga Winduaji atau Paguyangan, melainkan juga datang dari luar Kabupaten Brebes, seperti Semarang dan Tegal. Sebagian besar tergoda menikmati pemandangan alamnya. Memang indah. Saat senja, pengunjung bisa melihat matahari menghilang perlahan sambal memantulkan diri di permukaan air danau.\r\n\r\nKeindahan alam di Waduk Penjalin itu baru dapat dirasakan pada 2017. Sebelumnya, lokasi waduk jarang dijamah orang. Paling-paling mereka datang hanya untuk membuang sampah. Inilah yang memilukan hati Ali Rokhman yang saat itu menjadi Dekan Fakultas Ilmu Sosial dan Ilmu Politik Universitas Jenderal Soedirman.\r\n\r\nPada 2016, dia berkunjung ke Mokpo, Korea Selatan, dan melihat aspal jalan di tepi pantai yang dicat warna-warni. Dia terpikir mengecat jalan di sekitar Waduk Penjalin agar tidak kusam dan jorok seperti yang dia kesankan waktu itu. Dia lalu mengunggah foto di Mokpo itu untuk memprovokasi anak muda sekitar. Dalam takarir foto itu dia menulis, ”Di Pantai Mokpo Korea Selatan. Kalau aspal di Waduk Penjalin kita cat seperti ini pasti lebih menarik.”\r\n\r\nSepulang dari Mokpo, dosen yang hobi fotografi ini mengumpulkan anak-anak muda untuk bergerak membersihkan Waduk Penjalin. Dia menggandeng Nurul, yang juga hobi fotografi, dan menjadikannya sebagai Ketua Kelompok Sadar Wisata (Pokdarwis) Waduk Penjalin.',	'1695047537.jpg',	'2023-09-18 14:26:30',	'2023-09-18 14:32:17'),
(30,	1,	3,	'Bingtanghulu, Si Penyegar Tubuh dan Jiwa',	'Kombinasi manis dan asam sudah cukup untuk membuat lidah ketagihan. Di China ada sebuah camilan tradisional bernama bingtanghulu atau tanghulu yang menawarkan rasa yang seru itu. Orang muda dan tua menjadi penggemarnya.\r\n\r\nGao Shixiang (64) mengambil bubuk gula putih lalu menaruhnya dalam wajan panas berisi air. Buih perlahan muncul dari permukaan air gula itu. Asap membubung tinggi sehingga aroma manis menyeruak ke hidung puluhan pengunjung yang mengelilingi stan Qingdao Gao\'s Ice-Sugar Gourd di Qingdao SCODA Pearl International Expo Center, Qingdao, Shandong, China, Senin (22/5/2023).\r\n\r\nSemua mata tertuju pada wajan. Gao terus mengaduk dengan sabar agar air menguap habis. Lama kelamaan air gula berwarna kuning keemasan itu mengental. Ia mengambil tusuk bambu, mencelup ke dalam wajan, dan menaruh tusuk bambu itu di air dingin sejenak untuk dicicipi. Sedikit lagi tingkat kematangannya pas.\r\n\r\nGao kemudian mengambil satu tusuk bambu yang ditancapkan tiga butir buah haw (hawthorn). Warna buah itu merah segar menggoda. Pria itu lalu memiringkan wajan dan mencelup buah tersebut ke dalam gula cair panas yang telah siap. Setelah itu, buah haw di tusukan bambu itu Gao taruh di atas wajan berisi taburan wijen di samping kompor agar mengering.\r\n\r\nPertunjukan belum selesai. Gao meminta semua pengunjung yang sibuk menonton untuk mundur sekitar 1,5 meter dari wajan. Ia lalu menyelimuti tusukan buah haw dan membalik tusukan itu ke arah lantai. Dengan telapak tangannya, ia memutar tusukan itu sehingga lapisan gula cair berubah bentuk menyerupai benang-benang halus.\r\n\r\nDecak kagum keluar dari mulut penonton. Gao terlihat puas dengan dirinya sendiri. Tangannya lanjut memutar-mutar tusukan buah haw agar bentuknya menjadi seperti gula kapas. Dia langsung memberikan tusukan itu ke salah pengunjung yang terlihat girang.\r\n\r\nMasyarakat China menyebut tusukan buah haw berbalut gula itu bingtanghulu atau tanghulu, yaitu semacam buah dilapisi gula es. Camilan ini populer di berbagai wilayah di China. Seumur hidupnya, Gao adalah satu dari sekian orang yang menjalankan bisnis keluarga sebagai penjual bingtanghulu.\r\n\r\n”Tidak hanya anak-anak, orang dewasa juga menyukai camilan ini. Bingtanghulu yang saya jual dalam sehari jumlahnya tak terhitung,” kata Gao di sela-sela acara Peluncuran Travelogue of China.',	'1695079093.jpg',	'2023-09-18 23:18:13',	'2023-09-18 23:18:13'),
(31,	1,	1,	'Wijaya Bodro Wardani, Sanitasi Aman untuk Warga',	'Mengubah perilaku warga untuk tidak buang air besar sembarangan bukan perkara mudah. Wijaya Bodro Wardani (58) tahu benar soal itu ketika terlibat dalam program pembangunan jamban aman di permukiman padat penduduk di Kota Magelang.\r\n\r\nDani, begitu ia disapa, berprofesi sebagai wirausaha tanaman hias. Namun, setahun terakhir ia lebih sering mengurusi jamban warga miskin yang belum aman.\r\n\r\n”Saya pernah menunggui pengurasan bak di bawah tanah yang selama bertahun-tahun jadi bak penampung tinja di rumah salah seorang warga di Magelang,” ujar Sekretaris Forum Tembang Tidar (FTT) Kota Magelang itu, Kamis (31/8/2023). Tembang Tidar merupakan akronim dari Temu Rembuk Babagan Pembangunan Sanitasi dan Air Minum dan Perilaku Hygiene, sebuah forum gerakan warga yang memperjuangkan sanitasi aman dan perilaku hidup higienis.\r\n\r\nKetika itu pengurasan dilakukan karena pemilik rumah, seorang ibu lansia yang sehari-hari bekerja sebagai tukang pijat, melapor kepada Dani bahwa WC di rumahnya berbau tidak sedap karena penampungnya sudah penuh. Ketika Dani dan pengurus FTT mengecek, mereka menemukan tangki septik ternyata hanya berupa bak penampung tinja di bawah tanah.\r\n\r\nTim FTT pun menguras bak itu dan membangun tangki septik aman dan kedap. Kisah seperti itu ditemui Dani di beberapa tempat. Dia dan kawan-kawan FTT pun terpaksa harus menguras bak tinja dan membuatkan tangki septik aman.\r\n\r\nDi tempat yang lain, Dani menemukan ada warga yang sudah membuat tangki septik, tetapi pipa paralon penyambungnya pecah. Saat tangki septik dibongkar, ternyata kondisinya bersih dan kering lantaran tinja mengalir ke selokan lewat pipa yang pecah. Hal itu bertahun-tahun tidak disadari oleh si pemilik rumah. FTT akhirnya membongkar dan membantu warga untuk mengganti pipa paralon yang pecah tersebut.\r\n\r\nTidak semua masalah di lapangan bisa diselesaikan. Di salah satu kelurahan, ada warga membangun saluran pembuangan dari kamar mandi langsung ke kolam ikan. Sekalipun tahu yang ia lakukan tidak benar, warga itu bersikeras tidak mau mengubahnya karena buangan dari kamar mandi dibutuhkan untuk kolam lele miliknya.\r\n\r\nSejumlah temuan FTT di atas makin membuka mata Dani bahwa banyak warga yang masih belum tahu atau tidak peduli dengan sanitasi sehat dan aman. Hal ini juga terkonfirmasi dari hasil survei yang dilakukan FTT pada 2022 bahwa 50 persen responden atau sekitar 2.000 keluarga di Kota Magelang masih buang air besar sembarangan (BABS).',	'1695085540.jpg',	'2023-09-19 01:05:40',	'2023-09-19 01:05:40'),
(32,	1,	4,	'Tenaga Medis Didayagunakan untuk Kejar Pemerataan',	'”Pendayagunaan tenaga medis dan tenaga kesehatan WNI lulusan luar negeri dilaksanakan sesuai dengan perencanaan kebutuhan secara nasional dalam rangka pemenuhan tenaga medis dan tenaga kesehatan,” ujarnya.\r\n\r\nSecara teknis, proses penerimaan tenaga kesehatan WNI lulusan luar negeri diawali dengan evaluasi kompetensi dengan memiliki kelengkapan administrasi. Kebutuhan administrasi sudah lengkap, proses berikutnya dengan uji kompetensi. Jika telah dinyatakan kompeten, tenaga kesehatan tersebut dapat melakukan adaptasi di fasilitas pelayanan kesehatan yang ditunjuk maksimal satu tahun dengan pemberian surat izin praktik (SIP) dan surat tanda registrasi (STR).\r\n\r\nSelama proses adaptasi, tenaga kesehatan dan tenaga medis lulusan luar negeri tetap mendapatkan insentif. Setelah selesai menjalani proses adaptasi, mereka ditempatkan di rumah sakit yang membutuhkan.\r\n\r\nNamun, WNI lulusan luar negeri dari penyelenggara pendidikan yang diakui Kementerian Kesehatan ataupun WNI lulusan luar negeri yang ahli atau pakar dalam layanan unggulan tertentu tidak perlu melakukan uji kompetensi dan adaptasi. Setelah keperluan administrasi dilengkapi, tenaga kesehatan tersebut cukup melakukan penilaian portofolio. Jika dinyatakan kompeten, dapat langsung ditempatkan di rumah sakit yang membutuhkan dengan diawali masa orientasi sistem pelayanan kesehatan di Indonesia.\r\n\r\nSementara itu, Anna menyatakan, aturan yang berbeda diberlakukan untuk tenaga medis dan tenaga kesehatan WNA. Proses penerimaan untuk pendayagunaan SDM kesehatan WNA hampir serupa dengan WNI lulusan luar negeri. Namun, pengalaman praktik yang ditentukan minimal tiga tahun.\r\n\r\nKetua Umum Asosiasi Rumah Sakit Swasta Seluruh Indonesia (ARSSI) Ichsan Hanafi berharap peran rumah sakit swasta bisa ditingkatkan untuk mendukung pemerataan dan distribusi tenaga kesehatan dan tenaga medis. Selain itu, RS swasta pun diharapkan bisa mendapatkan akses yang lebih besar untuk mendidik dokter spesialis.\r\n\r\n”Sejauh ini, aturan yang berlaku masih fokus pada rumah sakit milik pemerintah, tidak ada yang fokus ke fasilitas kesehatan swasta. Padahal, kami di fasilitas swasta merupakan bagian yang tidak terpisahkan untuk meningkatkan kesehatan masyarakat,” ucapnya.',	'1695085653.jpg',	'2023-09-19 01:07:33',	'2023-09-19 01:07:33'),
(34,	1,	3,	'Dimanja Kuliner Italia dan Nusantara',	'Makan malam menjadi istimewa biasanya lantaran dua hal, menu makanan yang lezat dan obrolan yang nyaman, ”gayeng” sepanjang acara.\r\n\r\nTerkait makanan lezat, pilihannya bisa sangat beragam. Setiap tempat dan latar budaya punya banyak kuliner jagoannya. Dalam dua kesempatan berbeda, Kompas diundang mencicipi pilihan menu makan malam dari dua negara berbeda.\r\n\r\nMakan malam pertama bermenu hidangan Italia, terutama kawasan Italia utara, di Restoran Il Mare, Hotel Mulia Jakarta, Jumat (3/3/2023). Lalu yang kedua di Restoran Bel Étage, Hotel St Regis, Jakarta, Rabu (8/3), dengan menu andalan kuliner Tanah Air.\r\n\r\nDinaungi atmosfer restoran bernuansa elegan, penerangan temaram, tetapi memadai dan lembut dalam pandangan mata, sejumlah menu pilihan khas Italia disajikan di Il Mare berformat fine dining.\r\n\r\nMenurut Direktur Food and Beverage Hotel Mulia Senayan Maurizio Moncalvo, mereka menawarkan beragam olahan pasta, daging, dan sajian penutup manis. Kuliner Negeri Pizza dan Pasta ini cukup populer di Indonesia dibandingkan kuliner sesama negara Eropa, macam Perancis.\r\n\r\nRagam masakannya pun variatif dan mengandalkan hasil alamnya, seperti juga kuliner Tanah Air. Lantaran bentuk geografis yang sekitar 40 persen pegunungan subur, wilayah-wilayah di Italia terbilang mandiri dengan mengandalkan hasil bumi sendiri.\r\n\r\nKawasan Italia utara identik dengan area pegunungan. Ragam kulinernya mayoritas berbahan olahan daging hewan ternak dan produk olahan susu (dairy). Sementara untuk kuliner di kawasan selatan, yang berpantai dan berada di wilayah Laut Mediterania, ragam kulinernya identik dengan aneka ragam hasil laut (seafood).\r\n\r\nSalah satu menu utama (main course) yang disajikan di santap malam kali ini berupa daging panggang, Bistecca. Berbahan daging sapi wagyu bagian iga (rib eye) yang dipanggang di oven arang kayu. Saat disajikan cita rasa daging Bistecca diperkaya dengan siraman saus kuah (gravy) dengan tambahan lada.',	'1695089331.jpg',	'2023-09-19 02:08:51',	'2023-09-19 02:08:51'),
(35,	1,	4,	'Standar Terapi Berbasis Sel Punca Disiapkan',	'Pemanfaatan sel punca di bidang kedokteran selama ini masih sebatas untuk riset berbasis layanan terapi. Namun, pemerintah kini sedang menyiapkan aturan mengenai standar terapi berbasis sel punca agar pemanfaatannya bisa semakin luas di masyarakat.\r\n\r\nDirektur Tata Kelola Pelayanan Kesehatan Kementerian Kesehatan Sunarto dalam kegiatan public hearing Rancangan Peraturan Pemerintah (RPP) terkait Undang-Undang Kesehatan: Pelayanan Sel Punca di Jakarta, Senin (18/9/2023), mengatakan, terapi berbasis sel ataupun sel punca dapat memberikan manfaat bagi masyarakat. Terapi ini dapat meningkatkan upaya penyembuhan penyakit, pemulihan kesehatan, dan peningkatan kualitas hidup dari pasien.\r\n\r\n”Sel punca sudah hampir 10-15 tahun berkembang di Indonesia. Namun, standar pelayanan itu belum ada. Semua pelayanan masih diberikan melalui penelitian berbasis layanan. Jadi, RPP ini akan mengatur standar agar keselamatan pasien dalam pelayanan berbasis sel atau sel punca bisa terjamin,” tuturnya.\r\n\r\nTerapi berbasis sel dan atau sel punca menjadi bagian yang diatur dalam Undang-Undang Nomor 17 Tahun 2023 tentang Kesehatan. Dalam undang-undang itu, terapi berbasis sel punca diatur pada pasal 135-136 dengan ketentuan lebih lanjut yang diatur dalam peraturan pemerintah.\r\n\r\nIa menyampaikan, penyelenggaraan terapi berbasis sel dan sel punca pada prinsipnya hanya dapat dilakukan untuk tujuan penyembuhan penyakit dan pemulihan kesehatan. Terapi berbasis sel dan sel punca dilarang digunakan untuk tujuan reproduksi. Terapi ini pun bisa dilakukan jika sudah terbukti keamanan, khasiat, dan kemanfaatannya. Diatur pula bahwa sel punca yang digunakan tidak boleh berasal dari sel punca embrionik.\r\n\r\n”Sel punca dan sel yang diatur untuk pelayanan terapi merupakan pelayanan yang sudah ada standarnya. Ada beberapa usulan yang masuk ke Kementerian Kesehatan, misalnya, sel punca untuk estetik atau kecantikan, bedah plastik, dan ortopedi. Itu sekarang masih dibahas di Kementerian Kesehatan,” katanya.\r\n\r\nSunarto mengatakan, aturan juga akan disiapkan untuk pemanfaatan sel punca dan sel untuk penelitian berbasis pelayanan yang dapat diselenggarakan di rumah sakit yang ditetapkan oleh Menteri Kesehatan.',	'1695090164.jpg',	'2023-09-19 02:22:44',	'2023-09-19 02:22:44');

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
(1,	'Admin Portal A',	'adminportalA',	'adminportalA@gmail.com',	NULL,	'$2y$10$1lW1IbEL4YxJwmJH58d1D.BpcrYAL7DDOkis0opVuUN/feSXoHVPi',	'Vb8IYPnVwZsl1ojYHp0A1lWBeaKoYeryStgDZFPN5y6ne6FJ4822bIslHumU',	'2023-07-13 09:53:48',	'2023-07-13 09:53:48'),
(2,	'Admin Portal Utama',	'adminportalutama',	'adminportalutama@gmail.com',	NULL,	'$2y$10$Nv46qM/EV4Zl6H8cGlr9TOokLAUIbEbCqe0ZbqKge29s/eyNGeLYW',	NULL,	'2023-07-13 10:03:57',	'2023-07-13 10:03:57');

-- 2023-09-22 02:36:21
