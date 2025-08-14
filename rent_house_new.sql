

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `uuid` varchar(255) NOT NULL UNIQUE,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `phone` varchar(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` TEXT NOT NULL CHECK (`role` IN ('admin','pemilik','penyewa')) DEFAULT 'penyewa',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
);

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@kosfinder.com', '081234567890', '2025-07-28 18:44:45', '$2y$12$UZyk.9x.JiNLQlLET7WBwOL8Mi/OKPDd4UU3ynMNhVcRvj0rkw4LK', 'admin', NULL, '2025-07-28 18:44:45', '2025-07-28 18:44:45'),
(2, 'Budi Santoso', 'budi@example.com', '081234567890', '2025-07-28 18:58:31', '$2y$12$DtjC7JlENSRhmMKvBMihh.u1nGuGLFlfbyaqjyu4NB4YEbkTiIkci', 'pemilik', NULL, '2025-07-28 18:58:32', '2025-07-28 18:58:32'),
(3, 'Siti Rahayu', 'siti@example.com', '081234567891', '2025-07-28 18:58:32', '$2y$12$C8sCsMM.NF9lnxxfvljvy.v.osbD4iXAiKjCQ.ctk7FAx.FwMLM.6', 'pemilik', NULL, '2025-07-28 18:58:33', '2025-07-28 18:58:33'),
(4, 'Ahmad Wijaya', 'ahmad@example.com', '081234567892', '2025-07-28 18:58:32', '$2y$12$yDT1GJp5uiMPWoL6fror5.RuidPU1YcY6L0lp6HnpnnGntFzmKK.O', 'pemilik', NULL, '2025-07-28 18:58:33', '2025-07-28 18:58:33'),
(5, 'Dewi Lestari', 'dewi@example.com', '081234567893', '2025-07-28 18:58:32', '$2y$12$uZI0f.g4Qux1Jp9jRY38G.h0XKs4TfzZ2LTo6gXFhla/DOT4fHJ8K', 'pemilik', NULL, '2025-07-28 18:58:33', '2025-07-28 18:58:33'),
(6, 'Rudi Hermawan', 'rudi@example.com', '081234567894', '2025-07-28 18:58:32', '$2y$12$aOwR0IXApLESkXtuOssr3OuMpNUl/CfcuUoLbeXRGAqK9xRNQjMhq', 'pemilik', NULL, '2025-07-28 18:58:33', '2025-07-28 18:58:33'),
(7, 'Andi Pratama', 'andi@example.com', '081234567895', '2025-07-28 18:58:33', '$2y$12$4nmWVET6I4uPVVHZQplfYu0l724Pk67bRhgjxS3n2XMStGWT9BSuO', 'penyewa', NULL, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(8, 'Maya Sari', 'maya@example.com', '081234567896', '2025-07-28 18:58:33', '$2y$12$W4wMpuxElJ1Zh6HRsn8G9.07gjQK9.h/PR1D7I5Nyk8Xxuu2M7Q2i', 'penyewa', NULL, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(9, 'Doni Setiawan', 'doni@example.com', '081234567897', '2025-07-28 18:58:33', '$2y$12$o4nqjTIuuMZB1U0ShaFK0Ovx8UU4EiC.1a98LAm8rgOJm4nlSuF1a', 'penyewa', NULL, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(10, 'Rina Wati', 'rina@example.com', '081234567898', '2025-07-28 18:58:34', '$2y$12$JBWV/zY/SaGHmfOIQXc79ulzK3Di6xUlK0d95yhnWKbMXjrD.4Rae', 'penyewa', NULL, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(11, 'Fajar Nugroho', 'fajar@example.com', '081234567899', '2025-07-28 18:58:34', '$2y$12$AORteSfhEoHaEN0LGDDDy.2oo5W2XCxr619ltdAsVh1DpHTYzHrzO', 'penyewa', NULL, '2025-07-28 18:58:34', '2025-07-28 18:58:34');



CREATE TABLE `kos` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `nama_kos` varchar(255) NOT NULL,
  `lokasi` varchar(500) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `harga` decimal(12,2) NOT NULL,
  `fasilitas` text,
  `deskripsi` text,
  `status_ketersediaan` TEXT NOT NULL CHECK (`status_ketersediaan` IN ('tersedia','tidak_tersedia')) DEFAULT 'tersedia',
  `user_id` bigint UNSIGNED NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

INSERT INTO `kos` (`id`, `nama_kos`, `lokasi`, `latitude`, `longitude`, `harga`, `fasilitas`, `deskripsi`, `status_ketersediaan`, `user_id`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 'Kos Melati Indah', 'Jl. Melati No. 15, Yogyakarta', 1.47636100, 102.11581100, 800000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, Meja Belajar', 'Kos nyaman dan strategis dekat dengan kampus UGM. Lingkungan aman dan tenang, cocok untuk mahasiswa. Tersedia dapur bersama dan area parkir.', 'tersedia', 2, 1, '2025-07-28 18:58:34', '2025-08-09 05:56:42'),
(2, 'Kos Mawar Residence', 'Jl. Mawar Raya No. 22, Jakarta Selatan', NULL, NULL, 1200000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, TV, Kulkas Mini', 'Kos modern dengan fasilitas lengkap di area Jakarta Selatan. Dekat dengan stasiun MRT dan pusat perbelanjaan. Keamanan 24 jam.', 'tersedia', 3, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(3, 'Kos Anggrek Putih', 'Jl. Anggrek No. 8, Bandung', NULL, NULL, 600000.00, 'WiFi, Kamar Mandi Dalam, Kasur, Lemari', 'Kos sederhana dan terjangkau di pusat kota Bandung. Dekat dengan ITB dan berbagai tempat kuliner. Lingkungan bersih dan nyaman.', 'tersedia', 4, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(4, 'Kos Dahlia Premium', 'Jl. Dahlia No. 45, Surabaya', NULL, NULL, 1000000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, Meja Belajar, Balkon', 'Kos premium dengan view kota Surabaya. Fasilitas lengkap dan modern. Dekat dengan kampus dan pusat bisnis. Tersedia laundry service.', 'tersedia', 5, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(5, 'Kos Kenanga Asri', 'Jl. Kenanga No. 12, Malang', NULL, NULL, 500000.00, 'WiFi, Kamar Mandi Luar, Kasur, Lemari', 'Kos ekonomis di kota Malang yang sejuk. Cocok untuk mahasiswa dengan budget terbatas. Lingkungan asri dan dekat dengan kampus.', 'tersedia', 6, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(6, 'Kos Tulip Garden', 'Jl. Tulip No. 33, Semarang', NULL, NULL, 750000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, Taman', 'Kos dengan konsep garden yang asri dan sejuk. Dilengkapi taman yang indah untuk bersantai. Dekat dengan UNDIP dan pusat kota.', 'tersedia', 2, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(7, 'Kos Sakura Modern', 'Jl. Sakura No. 18, Depok', NULL, NULL, 900000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, Meja Belajar, CCTV', 'Kos modern dengan keamanan terjamin di Depok. Dekat dengan UI dan stasiun kereta. Fasilitas lengkap dan lingkungan aman.', 'tersedia', 3, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(8, 'Kos Flamboyan', 'Jl. Flamboyan No. 7, Solo', NULL, NULL, 550000.00, 'WiFi, Kamar Mandi Dalam, Kasur, Lemari, Dapur Bersama', 'Kos dengan suasana kekeluargaan di Solo. Tersedia dapur bersama untuk memasak. Dekat dengan UNS dan pusat kota Solo.', 'tersedia', 4, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(9, 'Kos Bougenville', 'Jl. Bougenville No. 25, Medan', NULL, NULL, 650000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari', 'Kos nyaman di pusat kota Medan. Akses mudah ke berbagai tempat. Lingkungan bersih dan aman untuk mahasiswa dan pekerja.', 'tersedia', 5, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(10, 'Kos Lavender Hills', 'Jl. Lavender No. 40, Bogor', NULL, NULL, 700000.00, 'WiFi, Kamar Mandi Dalam, Kasur, Lemari, Teras, Parkir Motor', 'Kos dengan udara sejuk khas Bogor. Dilengkapi teras untuk bersantai. Dekat dengan IPB dan tempat wisata Bogor.', 'tersedia', 6, 1, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(12, 'Kos Teratai Indah', 'Jl. Teratai No. 88, Tangerang', NULL, NULL, 850000.00, 'AC, WiFi, Kamar Mandi Dalam, Kasur, Lemari, Kolam Renang', 'Kos dengan fasilitas kolam renang di Tangerang. Cocok untuk yang ingin tinggal dengan fasilitas rekreasi.', 'tersedia', 3, 0, '2025-07-28 18:58:34', '2025-07-28 18:58:34'),
(14, 'tes map', 'jl pramuka', 1.45588700, 102.14452300, 500000.00, 'WiFi, AC, Kamar Mandi Dalam, Kasur, Lemari, Kursi, Meja Belajar, Parkir Motor', 'sedap', 'tersedia', 2, 1, '2025-08-09 05:54:05', '2025-08-10 04:04:48'),
(15, 'tes foto', 'jl pramuka', 1.45588700, 102.14452300, 500000.00, 'Kamar Mandi Dalam, Kasur', 'A', 'tersedia', 2, 0, '2025-08-10 03:29:58', '2025-08-10 03:31:40'),
(17, 'tes kakajj', 'jl pramuka', NULL, NULL, 5000000.00, 'WiFi, AC, Kamar Mandi Dalam, Parkir Motor', 'fafafaf', 'tersedia', 2, 0, '2025-08-10 04:26:03', '2025-08-10 04:26:03'),
(18, 'tes kttt', 'jl pramuka', 1.45588700, 102.14452300, 5000000.00, 'Kasur', 't', 'tersedia', 2, 1, '2025-08-10 04:27:38', '2025-08-10 05:29:21');



CREATE TABLE `kos_photos` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `kos_id` bigint UNSIGNED NOT NULL,
  `foto_path` varchar(255) NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE
);

INSERT INTO `kos_photos` (`id`, `kos_id`, `foto_path`, `is_main`, `created_at`, `updated_at`) VALUES
(17, 14, 'uploads/kos/1754826946_main.jpeg', 1, '2025-08-10 04:55:46', '2025-08-10 04:55:46'),
(18, 14, 'uploads/kos/1754826946_689888c2ab1ba.png', 0, '2025-08-10 04:55:46', '2025-08-10 04:55:46'),
(19, 14, 'uploads/kos/1754826946_689888c2ad4d2.jpeg', 0, '2025-08-10 04:55:46', '2025-08-10 04:55:46'),
(20, 14, 'uploads/kos/1754826946_689888c2ae772.jpg', 0, '2025-08-10 04:55:46', '2025-08-10 04:55:46'),
(21, 6, 'uploads/kos/1754828207_main.jpg', 1, '2025-08-10 05:16:47', '2025-08-10 05:16:47'),
(22, 6, 'uploads/kos/1754828207_68988dafb9fda.jpg', 0, '2025-08-10 05:16:47', '2025-08-10 05:16:47'),
(23, 6, 'uploads/kos/1754828207_68988dafbb62a.jpg', 0, '2025-08-10 05:16:47', '2025-08-10 05:16:47'),
(24, 6, 'uploads/kos/1754828207_68988dafbcc49.jpg', 0, '2025-08-10 05:16:47', '2025-08-10 05:16:47');



CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL PRIMARY KEY,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
);


INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_28_183942_create_kos_table', 1),
(6, '2025_07_28_184003_create_transaksis_table', 1),
(7, '2025_07_29_060000_add_status_kontak_to_transaksis_table', 2),
(8, '2025_07_29_000001_remove_foto_column_from_kos_table', 3);



CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL PRIMARY KEY,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
);



CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL UNIQUE,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
);



CREATE TABLE `transaksis` (
  `id` bigint UNSIGNED NOT NULL PRIMARY KEY,
  `kos_id` bigint UNSIGNED NOT NULL,
  `penyewa_id` bigint UNSIGNED NOT NULL,
  `status_transaksi` TEXT NOT NULL CHECK (`status_transaksi` IN ('pending','dibatalkan','selesai')) DEFAULT 'pending',
  `status_kontak` TEXT NOT NULL CHECK (`status_kontak` IN ('pending','contacted','closed')) DEFAULT 'pending',
  `catatan` text,
  `balasan_pemilik` text,
  `tanggal_balasan` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  FOREIGN KEY (`kos_id`) REFERENCES `kos` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`penyewa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);


INSERT INTO `transaksis` (`id`, `kos_id`, `penyewa_id`, `status_transaksi`, `status_kontak`, `catatan`, `balasan_pemilik`, `tanggal_balasan`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 'pending', 'contacted', 'Halo, saya tertarik dengan kos ini. Apakah masih tersedia kamar untuk bulan depan?', 'Halo Andi, terima kasih atas minatnya. Kamar masih tersedia untuk bulan depan. Silakan hubungi saya di 081234567890 untuk jadwal lihat kamar.', '2025-07-27 10:30:00', '2025-07-26 18:58:34', '2025-07-27 10:30:00'),
(2, 2, 8, 'selesai', 'closed', 'Selamat pagi, saya ingin menanyakan tentang fasilitas yang tersedia di kos ini.', 'Selamat pagi Maya, fasilitas lengkap tersedia termasuk AC, WiFi, TV, dan kulkas mini. Sudah termasuk listrik dan air. Silakan datang langsung untuk melihat kamar.', '2025-07-24 09:15:00', '2025-07-23 18:58:34', '2025-07-25 18:58:34'),
(3, 3, 9, 'pending', 'pending', 'Apakah bisa lihat kamar dulu sebelum memutuskan untuk sewa?', NULL, NULL, '2025-07-27 18:58:34', '2025-07-27 18:58:34'),
(4, 4, 10, 'selesai', 'contacted', 'Saya mahasiswa baru, apakah ada diskon untuk kontrak tahunan?', 'Halo Rina, untuk kontrak tahunan ada diskon 5%. Harga menjadi Rp 950.000/bulan. Silakan hubungi saya untuk diskusi lebih lanjut.', '2025-07-22 14:20:00', '2025-07-21 18:58:34', '2025-07-24 18:58:34'),
(5, 5, 11, 'pending', 'pending', 'Halo pak/bu, saya ingin tanya apakah kos ini dekat dengan halte busway?', NULL, NULL, '2025-07-28 12:58:34', '2025-07-28 12:58:34'),
(6, 6, 7, 'dibatalkan', 'contacted', 'sasas', 'Halo Andi, kos ini memiliki taman yang asri dan nyaman. Sayangnya sepertinya Anda sudah menemukan kos lain. Terima kasih atas minatnya.', '2025-07-19 16:45:00', '2025-07-18 18:58:34', '2025-08-10 05:12:42'),
(7, 7, 8, 'pending', 'contacted', 'Apakah ada slot parkir motor yang tersedia?', 'Halo Maya, parkir motor tersedia dan aman dengan CCTV 24 jam. Tidak ada biaya tambahan untuk parkir. Silakan datang lihat lokasi parkir.', '2025-07-28 08:30:00', '2025-07-28 06:58:34', '2025-07-28 08:30:00'),
(8, 8, 9, 'selesai', 'closed', 'Saya pekerja shift malam, apakah ada aturan khusus untuk keluar masuk?', 'Halo Doni, tidak ada aturan khusus untuk pekerja shift. Akses 24 jam tersedia. Lingkungan aman dan tenang untuk istirahat siang hari.', '2025-07-26 11:00:00', '2025-07-25 18:58:34', '2025-07-27 18:58:34');


