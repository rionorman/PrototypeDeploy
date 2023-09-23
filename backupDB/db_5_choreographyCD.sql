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
('277d7f25-84fa-40cc-a527-cf0e11dd071b',	'Kesehatan',	'2023-09-08 04:11:09',	'2023-09-21 03:21:22'),
('4ef40c8f-8183-4f95-a158-b3b3f4930153',	'Sports Football',	'2023-08-28 14:54:45',	'2023-08-28 14:54:45'),
('5513308f-af19-444e-8d55-fd773c51a073',	'Ekonomi',	'2023-08-28 14:21:55',	'2023-09-21 00:50:53'),
('777f0402-3b91-420b-aa66-f23085ac412a',	'Polhuk',	'2023-08-28 14:19:51',	'2023-08-29 07:14:34'),
('b900b555-8be5-4e55-8b95-4504b057b101',	'Opini',	'2023-08-28 14:23:12',	'2023-08-29 07:14:34'),
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
(13,	'2023_08_27_093452_create_categories_table',	1),
(14,	'2023_08_28_093443_create_posts_table',	1);

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
('036b51d6-c05b-4a78-b4a4-94ed156bce33',	1,	'277d7f25-84fa-40cc-a527-cf0e11dd071b',	'Komunikasi, Kunci Mencegah Resistensi Antimikroba di Ruang ICU Rumah Sakit',	'Keterlibatan pasien dan keluarganya saat dirawat di ruang perawatan intensif atau ICU sangat penting bagi dokter untuk memutuskan tindakan medis yang diambil. Dokter pun harus membangun komunikasi yang efektif dengan pasien dan keluarga walau kondisi sedang gawat darurat.\r\n\r\nSebab berurusan dengan ICU bukanlah hal yang mudah bagi pasien serta keluarganya dan dokter harus mengambil keputusan dengan cepat dan tepat agar nyawa pasien bisa terselamatkan. Belum lagi ada ancaman resistensi antimikroba (AMR) yang membuat bakteri, jamur atau virus penyebab infeksi pada tubuh seseorang lebih sulit ditangani dengan antibiotik, antijamur, atau antiviral. Ini akan membuat pasien sulit sembuh dan perlu dirawat lebih lama.\r\n\r\nDokter spesialis anestesi dan konsultan perawatan intensif dari Eka Hospital, Vannesi T Silalahi, mengatakan, komunikasi dua arah akan meningkatkan pemahaman pihak pasien, dan mendorong diskusi lanjutan yang lebih baik mengenai rekomendasi medis dari tenaga kesehatan. Dengan begitu, pemberian antibiotik pun menjadi lebih jitu di ICU, hingga berujung pada meningkatnya kualitas perawatan yang diterima pasien dan menurunnya risiko AMR.\r\n\r\n\"Memang kami dikenal dokter paling cerewet di dunia kalau pasien dan keluarganya belum paham bagaimana kami mengambil keputusan. Saya selalu bilang masuk ke sini (ICU) itu karena mengancam nyawa jadi harus cepat, jangan lama-lama. Makanya kita perlu penggunaan antibiotik yang jitu, tepat guna dan tepat waktu,\" kata Vannesi dalam seminar yang digelar oleh Pfizer Indonesia dan Eka Hospital di Tangerang Selatan, Rabu (9/6/2023).',	'1694146418.jpg',	'2023-09-08 04:13:38',	'2023-09-21 03:23:21'),
('0961dd0c-57b4-11ee-8c99-0242ac120002',	1,	'e7331b0e-fe5e-4237-9e6f-40e592b692ff',	'Polemik Buangan Air Pengolahan Limbah Radioaktif ke Lautan Pasifik',	'Langkah Pembangkit Listrik Tenaga Nuklir Fukushima Daiichi membuang air olahan limbah radioaktif ke Samudra Pasifik menuai polemik. Selain mendapat tekanan dari warga setempat, langkah ini juga mendapat protes dari sejumlah negara, seperti China dan negara-negara di wilayah Pasifik. Meskipun demikian, air limbah radioaktif itu tetap dilepas dengan diperkuat hasil kajian ilmiah.\r\n\r\nKasus pembuangan limbah radioaktif tersebut merupakan serangkaian proses panjang pascabencana alam 12 tahun silam. Pada 11 Maret 2011, Jepang dilanda gempa besar berkekuatan magnitudo 9 yang memicu tsunami di sebagian wilayah pantai Jepang. Bahkan, di kawasan pantai timur laut Jepang terjadi tsunami dengan ketinggian lebih dari 10 meter. Akibatnya, terjadi kehancuran infrastruktur yang sangat besar, menimbulkan korban tewas hingga sekitar 20.000 jiwa, serta menyebabkan korban luka-luka lebih dari 6.000 orang.\r\n\r\nSalah satu infrastruktur yang terdampak dari tsunami itu adalah Fukushima Daiichi Nuclear Power Station (FDNPS) yang dioperasikan oleh Tokyo Electric Power Company (Tepco). Gempa bumi dan tsunami saat itu telah menyebabkan kerusakan infrastruktur operasional dan pendukung keselamatan di lokasi FDNPS. Selain itu juga terjadi kerusakan jalur listrik di sekitar Fukushima Daiichi sehingga suplai listrik terputus baik dari dalam maupun luar lokasi FDNPS.\r\n\r\nTerputusnya suplai listrik itu sangat berbahaya karena memiliki fungsi vital untuk stabilisasi mendinginkan tabung reaktor. Dalam standar operasi pembangkit energi nuklir, suplai listrik untuk keamanan reaktor itu terdiri atas tiga hal, yakni listrik dari grid jaringan, genset listrik untuk cadangan apabila jaringan grid terputus, dan baterai listrik untuk backup akhir. Sayangnya, pada kasus bencana alam Jepang itu, ketiga suplai listrik untuk FDNPS terputus dan mati. Akibatnya, reaksi nuklir terus terjadi di dalam tabung reaktor yang pendinginnya tidak berfungsi sehingga suhu panasnya terus meningkat. Proses ini dapat menyebabkan tabung reaktor meleleh atau bahkan meledak sehingga menyebabkan radiasi nuklir di sekitarnya.',	'1693300533.jpg',	'2023-08-29 09:15:33',	'2023-08-29 09:15:33'),
('70a4cf18-3e05-4ac8-9c59-6455786d5d20',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'Resmi! Pemerintah Perluas Subsidi Motor Listrik, Satu NIK Satu Unit',	'Pemerintah resmi mengeluarkan kebijakan terbarunya mengenai perluasan penerima program bantuan untuk pembelian motor listrik baru berbasis baterai. \r\n\r\nKebijakan tersebut tersebut dituangkan dalam Peraturan Menteri Perindustrian Nomor 21 Tahun 2023 tentang Perubahan atas Permenperin Nomor 6 Tahun 2023 tentang Pedoman Pemberian Bantuan Pemerintah untuk Pembelian Kendaraan Bermotor Listrik Berbasis Baterai Roda Dua.\r\n\r\n\"Dasar utama perubahan kebijakan ini adalah untuk percepatan dalam membangun ekosistem kendaraan listrik di dalam negeri serta mewujudkan Indonesia yang lebih bersih. Tujuan tersebut, tentu akan berdampak terhadap peningkatan investasi, memacu produktivitas dan daya saing industri, serta perluasan tenaga kerja,\" kata Menteri Perindustrian Agus Gumiwang Kartasasmita dalam keterangannya di Jakarta, Selasa (29/8/2023).\r\n\r\nDalam aturan terbaru itu, disebutkan program bantuan diberikan untuk satu kali pembelian motor listrik yang dilakukan oleh masyarakat dengan satu nomor induk kependudukan (NIK) yang sama. \"Artinya, masyarakat yang ingin mendapatkan program bantuan pemerintah ini syaratnya adalah WNI berusia paling rendah 17 tahun dan memiliki KTP elektronik. Satu NIK KTP bisa membeli satu unit motor listrik,\" kata Agus.',	'1693294978.jpg',	'2023-08-29 07:42:58',	'2023-08-29 07:42:58'),
('75427dfb-cba4-4338-af98-c1d72722853e',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'Kemenparekraf Dukung Pungutan bagi Wisman di Bali',	'Pemerintah Provinsi Bali bakal memberlakukan pungutan sebesar Rp 150.000 atau sekitar 10 dollar AS per orang bagi wisatawan mancanegara yang berlibur ke Bali. Pungutan itu adalah bentuk kontribusi pada upaya perlindungan alam dan budaya Bali serta peningkatan kualitas pariwisata Bali secara berkelanjutan.\r\n\r\nLangkah tersebut didukung oleh Kementerian Pariwisata dan Ekonomi Kreatif yang akan membantu menarasikan pungutan tersebut. Menteri Pariwisata dan Ekonomi Kreatif Sandiaga Uno mengatakan, Kemenparekraf akan habis-habisan (all out) dalam menyampaikan narasi positif perihal pungutan sebagai upaya Bali menuju pariwisata berkualitas dan berkelanjutan berbasis budaya.\r\n\r\nKemenparekraf menugaskan Kepala Biro Komunikasi Kemenparekraf I Gusti Ayu Dewi Hendriyani untuk berkoordinasi dengan Dinas Pariwisata Bali dalam menyampaikan dan menarasikan pungutan bagi wisman yang akan diterapkan Bali dalam waktu dekat ini.\r\n\r\nHal itu disampaikan Sandiaga dalam The Weekly Brief with Sandi Uno yang diadakan secara dalam jaringan (daring), Senin (4/9/2023). Acara itu dihadiri Gubernur Bali Wayan Koster secara daring dari Denpasar, Bali.\r\n\r\nGubernur Koster menerangkan, pengenaan pungutan bagi wisman ke Bali diamanatkan dalam Undang-Undang Nomor 15 Tahun 2023 tentang Provinsi Bali dan Peraturan Daerah Provinsi Bali Nomor 6 Tahun 2023 tentang Pungutan bagi Wisatawan Asing untuk Pelindungan Kebudayaan dan Lingkungan Alam Bali.',	'1693887600.jpg',	'2023-09-05 04:20:00',	'2023-09-21 01:14:59'),
('914badfb-14a8-4bb1-8cb1-f9f238bb2160',	1,	'4ef40c8f-8183-4f95-a158-b3b3f4930153',	'Catatan BRI Liga 1: Hujan Kartu Merah dan Tradisi Madura United',	'Setelah memasuki pekan ke-10, BRI Liga 1 2023-2024 menghadirkan lima catatan menarik. Madura United yang berada di puncak klasemen kembali membuktikan kedigdayaan mereka di setiap paruh pertama kompetisi. Di sisi lain, PSM Makassar, tim juara bertahan, masih tertahan di papan tengah karena terlalu mudah mendapatkan kartu merah.\r\n\r\nKartu merah hampir terjadi di setiap pekan\r\n\r\nDari 10 pekan yang telah terlaksana, sebanyak delapan pekan di antaranya tentu menyajikan pertandingan yang membuat wasit mengeluarkan kartu merah dari saku celananya. Hanya di pekan keenam dan kesepuluh, wasit tidak memberikan hukuman kartu merah kepada pemain.\r\n\r\nBek Persikabo 1973, Andy Setyo, adalah pemain pertama yang mendapatkan kartu merah di kompetisi kasta tertinggi Indonesia edisi 2023-2024. Kartu itu diterima ketika timnya tumbang, 1-2, dari RANS Nusantara pada pekan pembuka.\r\n\r\nSebanyak 19 kartu merah telah dikeluarkan sang pengadil di musim ini. PSM Makassar menjadi tim yang paling banyak menerima kartu merah. Empat pemain “Juku Eja” telah merasakan harus keluar lapangan sebelum peluit akhir laga.',	'1693299818.jpg',	'2023-08-29 09:03:38',	'2023-08-29 09:04:24'),
('b3371cc3-43e1-440f-ba94-52073a8f68e0',	1,	'26e06a7c-3e64-4553-90f9-d4a629af01a2',	'Lindungi Pekerja Anak di Pengolahan Sampah Elektronik',	'Save the Children meluncurkan program Sirkular Jenius di Makassar, Sulawesi Selatan. Program ini berupaya melindungi anak dan keluarga yang bekerja di sektor sampah elektronik. Nantinya, sampah elektronik yang bisa menjadi ancaman akan dikelola menjadi peluang ekonomi yang berkelanjutan.\r\n\r\nPeluncuran program dilakukan di Makassar, Selasa (29/8/2022). Dalam program ini, Save the Children menggandeng Pemerintah Kota Makassar dan Accenture. Makassar menjadi percontohan daerah mengatasi sampah elektronik.\r\n\r\nSejauh ini, bank sampah dan Mallsampah telah hadir dan berperan aktif dalam pengolahan sampah di Makassar. Namun, kesadaran sebagian warga untuk memilah atau memperlakukan sampah masih kurang. Oleh karena itu, program ini diharapkan ikut mengurangi dampak buruk pada lingkungan, melindungi manusia di sekitarnya, hingga mendorong ekonomi warga menjadi lebih baik.\r\n\r\n”Kami berharap ada perubahan signifikan terkait sistem pengelolaan sampah elektronik lokal dengan menjadikannya lebih efisien dan ramah lingkungan. Selain itu, pengelolaan sampah ini menawarkan peluang penghidupan layak bagi para keluarga yang bekerja di industri ini yang kelak akan berdampak pada kesejahteraan anak-anak di Kota Makassar,” kata Ihwana Mustafa, Program Manager Save the Children Indonesia di Makassar.',	'1693299988.jpg',	'2023-08-29 09:06:28',	'2023-08-29 09:06:28'),
('bf870a4e-9791-4bed-a634-4bd1bde2572d',	1,	'b900b555-8be5-4e55-8b95-4504b057b101',	'Antibudaya dalam Demokrasi Kita',	'Bisakah politik kita berjalan tanpa politik uang? Jawabnya membentang di antara bisa dan tidak bisa. Di atas semua itu, ikhtiar untuk menjawab pertanyaan ini ranahnya ialah budaya demokrasi.\r\n\r\nMembahas budaya demokrasi dalam konteks pemilu sebagai pesta demokrasi akbar 2024 merupakan hal yang mendasar. Pemilu sebagai implementasi demokrasi substansial merupakan indikator utama negara demokrasi bergerak maju atau mundur.\r\n\r\nPemilu itu jantungnya negara demokrasi modern. Kesehatannya perlu terus-menerus dijaga. Pembuluh darah demokrasi kita tak boleh tersumbat oleh perilaku antibudaya.\r\n\r\nM Dawam Rahardjo pernah melontarkan kontradiksi dalam kalimat ”budaya korupsi” atau ”korupsi yang membudaya”. Kalimat itu tidak tepat, justru karena korupsi itu perbuatan yang antibudaya. Budaya dan kebudayaan berkonotasi mulia. Budaya menopang hadirnya peradaban tinggi.\r\n\r\nTak ada budaya rendah, semua budaya ialah budaya tinggi. Budaya bukan sekadar kebiasaan yang netral, tetapi melekat di dalamnya sesuatu yang adiluhung atau mulia. Barangkali pengertian semacam ini segera menghadirkan pendapat berbeda. Namun, tulisan ini sepakat dengan pendapat tersebut.\r\n\r\nMerujuk pada itu, budaya demokrasi ialah perilaku yang mengutamakan nilai-nilai atau substansi demokrasi yang adiluhung. Sudah lazim mengemuka dalam berbagai orientasi kepemimpinan dan politik, pemahaman demokrasi diberangkatkan pada nilai-nilai atau substansinya.\r\n\r\nDemokrasi substansial lebih mendasar ketimbang prosedural. Demokrasi substansial merentangkan sejumlah nilai atau prinsip mulia, seperti egalitarianisme, antidiskriminasi, menghargai perbedaan, menjunjung tinggi HAM, antiotoritarianisme, antikorupsi, hingga kesetaraan di muka hukum.',	'1693295816.jpg',	'2023-08-29 07:56:56',	'2023-08-29 07:56:56'),
('c5d31540-ea82-49ba-935a-392e386cf3f5',	1,	'5513308f-af19-444e-8d55-fd773c51a073',	'OJK Beberkan Banyak Ibu-Ibu Jadi Korban Pinjol Ilegal dan Rentenir',	'Otoritas Jasa Keuangan (OJK) meminta para pelaku UMKM tidak terjebak dalam penggunaan pinjaman online (pinjol) ilegal dan rentenir. Kepala Eksekutif Pengawas Perilaku Pelaku Usaha Jasa Keuangan, Edukasi, dan Pelindungan Konsumen OJK Friderica Widyasari Dewi mengungkapkan banyak pelaku UMKM terutama kaum ibu yang menjadi korban pinjol ilegal.\r\n\r\n“Saya tahu banyak yang butuh pembiayaan dan akses keuangan tapi jangan sampai terjerat pinjol ilegal. Banyak ibu-ibu jadi korban jadi hati-hati,” kata Friderica dalam Literasi Keuangan Indonesia Terdepan (Like It) Series 2 yang disiarkan secara daring, Selasa (29/8/2023).\r\n\r\nOJK Minta Pelaku UMKM tak Perlu Berkenalan dengan Rentenir OJK: RI Kurangi 60 Persen Emisi Karbon Lewat Sektor Alam Ini Manfaat Penting SLIK OJK\r\n\r\nFriderica menegaskan, saat ini skema skema penipuan banyak sekali macamnya. Dia menuturkan, OJK bersama kementerian lain sudah menutup lebih dari 5.800 pinjol ilegal. Dia menuturkan, kerugian yang disebabkan oleh investasi ilegal sudah lebih dari Rp 100 triliun.\r\n\r\n“Jadi ibu-ibu harus hati-hati jangan sanmpai masuk kepada skema seperti ini,” tutur Friderica.\r\n\r\nAgar tidak terjebak pinjol ilegal, Friderica menekankan masyarakat hanya perlu memastikan dua hal yaitu legalitas dan logisnya. Jika mendapatkan tawaran pinjol atau investasi ilegal harus dicek terlebih dahulu legalitasnya dengan menghubungi OJK pada nomor kontak 157 dan perhatikan sisi logis keuntungannya.',	'1693293769.jpg',	'2023-08-29 04:27:45',	'2023-08-29 07:46:55'),
('dc8bccbe-6ee9-4844-a822-fe271646a03b',	1,	'b900b555-8be5-4e55-8b95-4504b057b101',	'Polusi dan WFH',	'Pemerintah Provinsi DKI Jakarta menerapkan kebijakan bekerja dari rumah (WFH) bagi 50 persen aparatur sipil negara (ASN) selama 21 Agustus 2023-21 Oktober 2023 untuk mengurangi buruknya kualitas udara Jakarta. Menurut survei, kualitas udara Jakarta terburuk di dunia dan sumber polutan terbesar (44 persen) dari kendaraan. Tujuan lain WFH, untuk kenyamanan pelaksanaan KTT ASEAN.\r\n\r\nKita ingat WFH dan pembelajaran jarak jauh (PJJ) saat pandemi berhasil mengurangi polusi udara, tidak hanya di Jakarta, tetapi juga di dunia.\r\n\r\nSaat itu media memberitakan langit biru di seluruh dunia, bahkan beberapa gunung yang selalu tertutup awan tampak jelas.\r\n\r\nNamun, beberapa pengamat mengatakan, kebijakan kali ini tidak efektif karena yang melakukan mobilisasi di Jakarta bukan hanya ASN, melainkan juga pegawai swasta, pekerja sektor informal, pelajar, dan mahasiswa. Akibatnya, meski WFH diterapkan, Jakarta tetap macet dan polusi masih seperti biasanya.\r\n\r\nPerilaku kita selalu mencari celah melanggar aturan sehingga, meski WFH, bisa saja ASN keluar rumah dengan berbagai alasan. Kalau dipantau, toh bisa Zoom sebagai bukti tetap kerja.',	'1693295611.jpg',	'2023-08-29 07:53:31',	'2023-08-29 07:53:31'),
('f8545bd4-57b3-11ee-8c99-0242ac120002',	1,	'e4c137dc-5a09-444e-81fe-95dcb1e05b70',	'Kuliner Jember yang Menggoyang Lidah',	'Jalan-jalan ke Jember kurang lengkap rasanya jika tidak mencicipi kulinernya. Di tempat yang dikenal dengan perhelatan Jember Fashion Carnaval ini, ada beberapa makanan legendaris yang mampu menggoyang lidah para pencinta kuliner.\r\n\r\nMenu nasi pecel menjadi kekhasan kuliner di wilayah Jawa Timur. Hampir setiap kota memiliki keunikan pecel. Begitu pula di Kota Jember, pecel disandingkan dengan menu lain. Pecel dengan banyak pilihan lauk sungguh menggoda para penyuka sayur berbumbu kacang ini.\r\n\r\nPada pagi hari, menu sarapan di Jember yang cocok untuk membuka hari adalah pecel lodeh Wali Songo. Lokasi warung berada di Jalan Sultan Agung, di ujung Gang III, atau persisnya di samping toko Wali Songo I. Tempat makannya berupa kursi yang mengular di sepanjang gang menuju belakang.\r\n\r\n”Untuk yang makan di sini, langsung masuk ambil nomor antrean itu dan cari tempat duduk di dalam,” kata salah seorang pekerja. Pengunjung pun diarahkan untuk mencari tempat duduk di belakang warung. Pelayan warung nantinya akan mendatangi satu per satu pengunjung yang duduk antre dan menanyakan ingin makan apa.\r\n\r\nAdapun pembeli yang ingin membungkus makanan harus antre berdiri di depan warung. Warung buka pukul 05.30 hingga sekitar pukul 12.00.',	'1693300476.jpg',	'2023-08-29 09:14:36',	'2023-08-29 09:14:36');

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
(1,	'Admin Portal Utama',	'adminportalutama',	'adminportalutama@gmail.com',	NULL,	'$2y$10$mdqmcx1tKUq9SRXKpF.gyO8XXDjMjh92BCvtcePDjlWJ7IMQH3u3q',	NULL,	'2023-08-28 11:37:40',	'2023-08-28 11:37:40');

-- 2023-09-22 02:35:28
