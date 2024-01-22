-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2023 lúc 05:14 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(255) NOT NULL,
  `client_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `quantity` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_list`
--

CREATE TABLE `category_list` (
  `id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(2, 2, 'Hàng Có Hạn Sử Dụng Lâu', 'Hàng Có Hạn Sử Dụng Lâu', 1, 1, '2022-02-09 11:03:40', '2023-11-12 21:06:29'),
(3, 2, 'Hàng', 'This is a sample Category 102', 1, 1, '2022-02-09 11:05:57', '2023-11-12 21:06:26'),
(4, 2, 'Đồ Hộp và đồ ăn Chế Biến Sẵn', 'Đồ Hộp và đồ ăn Chế Biến Sẵn', 1, 0, '2022-02-09 11:06:10', '2023-11-12 23:12:58'),
(6, 1, 'Thực phẩm tươi sống', 'tpts', 1, 0, '2022-02-09 11:09:36', '2023-11-12 20:36:14'),
(10, 4, 'Gia vị và nguyên liệu nấu ăn', 'bao gồm các gia vị và nguyên liệu nấu ăn', 1, 0, '2023-11-12 20:29:37', NULL),
(11, 5, 'Mỹ Phẩm', 'Mỹ Phẩm nè', 1, 0, '2023-11-12 21:14:27', NULL),
(12, 6, 'Đồ Gia Dụng', 'Đồ Gia Dụng nè', 1, 0, '2023-11-12 22:15:46', NULL),
(13, 7, 'Đồ Uống', 'a', 1, 0, '2023-11-12 22:25:30', NULL),
(14, 8, 'Chăm Sóc Cá Nhân', 'Chăm Sóc Cá Nhân', 1, 0, '2023-11-12 22:45:47', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `client_list`
--

CREATE TABLE `client_list` (
  `id` int(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'Le', 'Trung', 'Duc', 'Nam giới', '09123456789', 'This is only my sample address', 'trungnaduc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/clients/1.png?v=1644386016', 1, 0, '2022-02-09 13:53:36', '2023-11-02 01:12:07'),
(2, '202202-00002', 'test', 'test', 'test', 'Male', '094564654', 'test', 'test@sample.com', '098f6bcd4621d373cade4e832627b4f6', 'uploads/clients/2.png?v=1644471867', 1, 1, '2022-02-10 13:44:26', '2022-02-10 13:44:35'),
(3, '202311-00001', 'Le', 'Trung', 'Duc', 'Nam', '0979132281', '\r\nThanh Xuan', '20111062783@hunre.edu.vn', 'c4ca4238a0b923820dcc509a6f75849b', NULL, 1, 0, '2023-11-12 23:10:59', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_list`
--

CREATE TABLE `order_list` (
  `id` int(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(255) NOT NULL,
  `vendor_id` int(255) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `delivery_address`, `status`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 1, 1, 4500, 'This is only my sample address', 5, '2022-02-10 09:56:49', '2022-02-10 11:52:53'),
(2, '202202-00002', 1, 2, 7359.9, 'This is only my sample address', 0, '2022-02-10 09:56:49', '2022-02-10 09:56:49'),
(3, '202202-00003', 1, 1, 1325, 'This is only my sample address', 4, '2022-02-10 10:29:00', '2023-11-04 21:38:12'),
(4, '202202-00004', 1, 2, 2320.61, 'This is only my sample address', 0, '2022-02-10 10:29:01', '2022-02-10 10:29:01'),
(5, '202311-00001', 1, 1, 8200, 'This is only my sample address', 0, '2023-11-02 13:24:33', '2023-11-02 13:24:33'),
(6, '202311-00002', 1, 2, 1715.94, 'This is only my sample address', 0, '2023-11-02 13:24:33', '2023-11-02 13:24:33'),
(7, '202311-00003', 1, 1, 700, 'This is only my sample address', 5, '2023-11-05 23:57:24', '2023-11-05 23:57:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_list`
--

CREATE TABLE `product_list` (
  `id` int(255) NOT NULL,
  `vendor_id` int(255) DEFAULT NULL,
  `category_id` int(255) DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `name`, `description`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(13, 4, 10, 'Dầu Ăn', '&lt;p class=&quot;MsoNormal&quot;&gt;Dầu ăn l&agrave; một loại chất b&eacute;o lỏng được sản xuất từ c&aacute;c nguồn\r\ngốc thực vật hoặc động vật v&agrave; được sử dụng rộng r&atilde;i trong nấu ăn, chi&ecirc;n v&agrave; nướng.\r\nN&oacute; l&agrave; một th&agrave;nh phần quan trọng trong ẩm thực v&agrave; cung cấp năng lượng, độ ẩm v&agrave;\r\nhương vị cho c&aacute;c m&oacute;n ăn.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;', 57.888, 'uploads/products/15.png?v=1644379888', 1, 0, '2023-11-12 20:31:30', '2023-11-12 20:43:04'),
(14, 4, 10, 'Nước Mắm', 'nuoc mam', 32.989, 'uploads/products/14.png?v=1644379542', 1, 0, '2023-11-12 20:33:58', '2023-11-12 20:39:12'),
(16, 4, 10, 'Sốt ướp đồ nướng', '&lt;p&gt;sốt ướp đồ nướng&lt;/p&gt;', 33.999, 'uploads/products/13.png?v=1644322123', 1, 0, '2023-11-12 20:47:02', '2023-11-12 20:50:07'),
(17, 4, 10, 'Sốt ướp thịt Hàn Quốc', '&lt;p&gt;Sốt ướp thịt đến từ H&agrave;n Quốc&lt;br&gt;&lt;/p&gt;', 48.999, 'uploads/products/12.png?v=1644386753', 1, 0, '2023-11-12 20:48:03', '2023-11-12 20:50:24'),
(18, 4, 10, 'Thịt Nướng Sả', '&lt;p&gt;Thịt Nướng Sả n&egrave;&lt;br&gt;&lt;/p&gt;', 11.222, 'uploads/products/16.png?v=1644309876', 1, 0, '2023-11-12 20:49:19', '2023-11-12 20:50:36'),
(19, 1, 6, 'Cánh Gà ', '&lt;p class=&quot;MsoNormal&quot;&gt;C&aacute;nh g&agrave; l&agrave; một phần thịt ngon từ con g&agrave;, thường được sử dụng\r\ntrong ẩm thực v&agrave; l&agrave; m&oacute;n ăn phổ biến tr&ecirc;n to&agrave;n thế giới. C&aacute;nh g&agrave; c&oacute; vị thịt mềm\r\nmịn, b&eacute;o ngon v&agrave; thường được nướng, chi&ecirc;n hoặc nấu trong c&aacute;c m&oacute;n ăn kh&aacute;c nhau. &lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;\r\n\r\n&lt;p class=&quot;MsoNormal&quot;&gt;C&aacute;nh g&agrave; cũng thường được d&ugrave;ng l&agrave;m nguy&ecirc;n liệu cho c&aacute;c m&oacute;n ăn\r\nkh&aacute;c như m&igrave; x&agrave;o, cơm chi&ecirc;n hoặc nấu canh. Ngo&agrave;i ra, c&oacute; nhiều loại sốt v&agrave; gia vị\r\nc&oacute; thể kết hợp với c&aacute;nh g&agrave;, như sốt barbecue, sốt cay, sốt mật ong v&agrave; tỏi, tạo\r\nra nhiều hương vị đa dạng.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;', 67.999, 'uploads/products/7.png?v=1644309876', 1, 0, '2023-11-12 20:55:25', '2023-11-12 21:00:53'),
(20, 1, 6, 'Phi lê gà sống', '&lt;p class=&quot;MsoNormal&quot;&gt;Phi l&ecirc; g&agrave; sống l&agrave; một phần thịt được lấy từ v&ugrave;ng c&aacute;nh v&agrave; vai\r\ncủa con g&agrave; sống. N&oacute; l&agrave; một phần thịt mềm mịn, gi&agrave;u chất dinh dưỡng v&agrave; thường được\r\nsử dụng trong nhiều m&oacute;n ăn kh&aacute;c nhau. &lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot;&gt;Phi l&ecirc; g&agrave; sống thường được sử dụng trong c&aacute;c m&oacute;n ăn nướng,\r\nx&agrave;o, hầm, chi&ecirc;n, hoặc nấu s&uacute;p. N&oacute; c&oacute; thể được ướp gia vị trước khi chế biến để\r\ntăng hương vị. C&aacute;c loại gia vị phổ biến bao gồm tỏi, gia vị nước mắm, ti&ecirc;u, gia\r\nvị nướng hoặc gia vị cay.&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;', 63.999, 'uploads/products/8.png?v=1644309876', 1, 0, '2023-11-12 20:56:09', '2023-11-12 21:01:09'),
(21, 1, 6, 'Nạc dăm heo nhập khẩu đông lạnh 500g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Nạc dăm heo nhập khẩu đ&ocirc;ng lạnh 500g&lt;/h1&gt;', 52.777, 'uploads/products/17.png?v=1644309876', 1, 0, '2023-11-12 20:57:18', '2023-11-12 21:01:24'),
(22, 1, 6, 'Bò Úc Xay đông lạnh 550g', '&lt;p&gt;B&ograve; &Uacute;c Xay đ&ocirc;ng lạnh 550g&lt;br&gt;&lt;/p&gt;', 79.888, 'uploads/products/18.png?v=1644309876', 1, 0, '2023-11-12 20:58:40', '2023-11-12 21:01:30'),
(23, 1, 6, 'Đùi tỏi gà nhập khẩu đông lạnh 550g - 650g (2-4 cái)', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Đ&ugrave;i tỏi g&agrave; nhập khẩu đ&ocirc;ng lạnh 550g - 650g (2-4 c&aacute;i)&lt;/h1&gt;', 42.025, 'uploads/products/19.png?v=1644309876', 1, 0, '2023-11-12 20:59:20', '2023-11-12 21:01:37'),
(24, 1, 6, 'Cá basa cắt khúc đông lạnh 450-550g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;C&aacute; basa cắt kh&uacute;c đ&ocirc;ng lạnh 450-550g&lt;/h1&gt;', 29.888, 'uploads/products/20.png?v=1644309876', 1, 0, '2023-11-12 20:59:49', '2023-11-12 21:01:45'),
(25, 1, 6, 'Tôm thẻ nguyên con 250g (8 - 12 con)', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;T&ocirc;m thẻ nguy&ecirc;n con 250g (8 - 12 con)&lt;/h1&gt;', 49.999, 'uploads/products/21.png?v=1644309876', 1, 0, '2023-11-12 21:00:14', '2023-11-12 21:01:52'),
(26, 2, 4, 'Cá mòi đóng hộp 250g', '&lt;p&gt;C&aacute; m&ograve;i đ&oacute;ng hộp 250g&lt;br&gt;&lt;/p&gt;', 70.999, 'uploads/products/4.png?v=1644309876', 1, 0, '2023-11-12 21:06:16', '2023-11-12 21:25:53'),
(27, 2, 4, 'Mì spaghetti bò bằm xúc xích LC FOODS gói 270g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;M&igrave; spaghetti b&ograve; bằm x&uacute;c x&iacute;ch LC FOODS g&oacute;i 270g&lt;/h1&gt;', 29.888, 'uploads/products/22.png?v=1644309876', 1, 0, '2023-11-12 21:09:09', '2023-11-12 21:26:06'),
(28, 2, 4, '2 hộp chà bông heo C&B 150g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;2 hộp ch&agrave; b&ocirc;ng heo C&amp;amp;B 150g&lt;/h1&gt;', 136.588, 'uploads/products/23.png?v=1644309876', 1, 0, '2023-11-12 21:09:51', '2023-11-12 21:26:12'),
(29, 2, 4, '2 hộp khô heo sấy tỏi C&B 100g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;2 hộp kh&ocirc; heo sấy tỏi C&amp;amp;B 100g&lt;/h1&gt;', 99.888, 'uploads/products/24.png?v=1644309876', 1, 0, '2023-11-12 21:10:28', '2023-11-12 21:26:18'),
(30, 2, 4, 'Khô gà lá chanh C&B hộp 100g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Kh&ocirc; g&agrave; l&aacute; chanh C&amp;amp;B hộp 100g&lt;/h1&gt;', 90.999, 'uploads/products/25.png?v=1644309876', 1, 0, '2023-11-12 21:11:08', '2023-11-12 21:26:23'),
(31, 2, 4, 'Cơm chiên kim chi SG Food 200g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Cơm chi&ecirc;n kim chi SG Food 200g&lt;/h1&gt;', 25.111, 'uploads/products/26.png?v=1644309876', 1, 0, '2023-11-12 21:11:44', '2023-11-12 21:26:30'),
(32, 2, 4, 'Cơm chiên cá mặn gà xé SG Food 200g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Cơm chi&ecirc;n c&aacute; mặn g&agrave; x&eacute; SG Food 200g&lt;/h1&gt;', 25.555, 'uploads/products/27.png?v=1644309876', 1, 0, '2023-11-12 21:12:13', '2023-11-12 21:26:36'),
(34, 5, 11, 'Cọ khối mũi đầu tròn Vacosi Angle Blending N02', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Cọ khối mũi đầu tr&ograve;n Vacosi Angle Blending N02&lt;/h1&gt;', 99.999, 'uploads/products/28.png?v=1644309876', 1, 0, '2023-11-12 21:16:56', '2023-11-12 22:01:56'),
(40, 5, 11, 'Son dưỡng môi LipIce Sheer Color Ardent hương táo 2.4g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &quot;sans-serif&quot;;&quot;&gt;Son dưỡng m&ocirc;i LipIce Sheer Color Ardent hương t&aacute;o 2.4g&lt;/h1&gt;', 230.999, 'uploads/products/29.png?v=1644309876', 1, 0, '2023-11-12 21:44:40', '2023-11-12 22:32:25'),
(41, 5, 11, 'Cọ phủ đầu tròn bỏ túi Vacosi M05', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &quot;sans-serif&quot;;&quot;&gt;Cọ phủ đầu tr&ograve;n bỏ t&uacute;i Vacosi M05&lt;/h1&gt;', 256.999, 'uploads/products/30.png?v=1644309876', 1, 0, '2023-11-12 22:08:42', '2023-11-12 22:32:08'),
(43, 6, 12, 'Chảo nhôm chống dính Rainy PLATINUM RNVD2022TT 20cm', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Chảo nh&ocirc;m chống d&iacute;nh Rainy PLATINUM RNVD2022TT 20cm&lt;/h1&gt;', 139.999, 'uploads/products/31.png?v=1644309876', 1, 0, '2023-11-12 22:20:22', '2023-11-12 22:32:32'),
(44, 7, 13, 'Nước Ngọt Có GAS', '&lt;p&gt;Nước Ngọt C&oacute; GAS&lt;br&gt;&lt;/p&gt;', 13.888, 'uploads/products/3.png?v=1644309876', 1, 0, '2023-11-12 22:25:47', '2023-11-12 22:32:40'),
(45, 5, 11, 'Tẩy tế bào chết Rosette dành cho da khô 180g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Tẩy tế b&agrave;o chết Rosette d&agrave;nh cho da kh&ocirc; 180g&lt;/h1&gt;', 175.999, 'uploads/products/32.png?v=1644309876', 1, 0, '2023-11-12 22:34:51', '2023-11-12 22:35:24'),
(46, 5, 11, 'Bút kẻ mắt Sivanna Colors Xpess - black HF896', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;B&uacute;t kẻ mắt Sivanna Colors Xpess - black HF896&lt;/h1&gt;', 320.888, 'uploads/products/33.png?v=1644379888', 1, 0, '2023-11-12 22:35:54', '2023-11-12 22:38:04'),
(47, 5, 11, 'Nước tẩy trang Senka Micellar Vibrant White dưỡng ẩm sáng da 230ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Nước tẩy trang Senka Micellar Vibrant White dưỡng ẩm s&aacute;ng da 230ml&lt;/h1&gt;', 109.999, 'uploads/products/34.png?v=1644379888', 1, 0, '2023-11-12 22:37:16', '2023-11-12 22:38:08'),
(48, 7, 13, 'Nước Ép Trái Cây', '&lt;p&gt;Nước &Eacute;p Tr&aacute;i C&acirc;y&lt;br&gt;&lt;/p&gt;', 35.888, 'uploads/products/6.png?v=1644379888', 1, 0, '2023-11-12 22:38:57', '2023-11-12 22:39:24'),
(49, 7, 13, 'Thùng 24 lon bia Tiger lon cao 330ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Th&ugrave;ng 24 lon bia Tiger lon cao 330ml&lt;/h1&gt;', 350.999, 'uploads/products/35.png?v=1644379888', 1, 0, '2023-11-12 22:40:04', '2023-11-12 22:43:47'),
(50, 7, 13, 'Rượu soju Good Day vị đào 13.5% chai 360ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Rượu soju Good Day vị đ&agrave;o 13.5% chai 360ml&lt;/h1&gt;', 60.999, 'uploads/products/36.png?v=1644379888', 1, 0, '2023-11-12 22:41:15', '2023-11-12 22:43:54'),
(51, 7, 13, 'Cà phê Trung Nguyên S chinh phục thành công 500g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;C&agrave; ph&ecirc; Trung Nguy&ecirc;n S chinh phục th&agrave;nh c&ocirc;ng 500g&lt;/h1&gt;', 53.888, 'uploads/products/37.png?v=1644379888', 1, 0, '2023-11-12 22:42:05', '2023-11-12 22:44:01'),
(52, 7, 13, 'Thùng 48 hộp sữa trái cây LiF Kun hương nho 180ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Th&ugrave;ng 48 hộp sữa tr&aacute;i c&acirc;y LiF Kun hương nho 180ml&lt;/h1&gt;', 285.999, 'uploads/products/38.png?v=1644379888', 1, 0, '2023-11-12 22:42:49', '2023-11-12 22:44:05'),
(53, 8, 14, 'Dầu gội Head & Shoulders làm sạch gàu mềm mượt óng ả 625ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Dầu gội Head &amp;amp; Shoulders l&agrave;m sạch g&agrave;u mềm mượt &oacute;ng ả 625ml&lt;/h1&gt;', 139.999, 'uploads/products/39.png?v=1644379888', 1, 0, '2023-11-12 22:46:10', '2023-11-12 22:51:45'),
(54, 8, 14, '2 lốc 12 cuộn giấy vệ sinh không lõi Softly 2 lớp', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;2 lốc 12 cuộn giấy vệ sinh kh&ocirc;ng l&otilde;i Softly 2 lớp&lt;/h1&gt;', 74.555, 'uploads/products/40.png?v=1644379888', 1, 0, '2023-11-12 22:46:44', '2023-11-12 22:51:51'),
(55, 8, 14, 'Băng vệ sinh Kotex Gardenia siêu mỏng có cánh 20 miếng', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Băng vệ sinh Kotex Gardenia si&ecirc;u mỏng c&oacute; c&aacute;nh 20 miếng&lt;/h1&gt;', 49.588, 'uploads/products/41.png?v=1644379888', 1, 0, '2023-11-12 22:47:24', '2023-11-12 22:51:56'),
(56, 8, 14, 'Chai sữa tắm bảo vệ khỏi vi khuẩn Lifebuoy bảo vệ vượt trội 980ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Chai sữa tắm bảo vệ khỏi vi khuẩn Lifebuoy bảo vệ vượt trội 980ml&lt;/h1&gt;', 168.999, 'uploads/products/42.png?v=1644379888', 1, 0, '2023-11-12 22:48:01', '2023-11-12 22:52:00'),
(57, 8, 14, 'Bộ kem và bàn chải đánh răng P/S bảo vệ 123 baking soda & hương thảo 230g', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Bộ kem v&agrave; b&agrave;n chải đ&aacute;nh răng P/S bảo vệ 123 baking soda &amp;amp; hương thảo 230g&lt;/h1&gt;', 29.999, 'uploads/products/43.png?v=1644379888', 1, 0, '2023-11-12 22:48:41', '2023-11-12 22:52:03'),
(58, 8, 14, 'Dung dịch vệ sinh Dạ Hương lavender 120ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Dung dịch vệ sinh Dạ Hương lavender 120ml&lt;/h1&gt;', 55.999, 'uploads/products/44.png?v=1644379888', 1, 0, '2023-11-12 22:50:02', '2023-11-12 22:52:07'),
(59, 8, 14, 'Nước súc miệng Listerine Cool Mint chai 750ml', '&lt;h1 class=&quot;pt-[5px] text-20 font-bold leading-[23px] text-[#222b45]&quot; style=&quot;border: 0px solid rgb(244, 246, 249); font-size: 20px; font-weight: 700; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; line-height: 23px; --tw-text-opacity: 1; font-family: Arial, Helvetica, &amp;quot;sans-serif&amp;quot;;&quot;&gt;Nước s&uacute;c miệng Listerine Cool Mint chai 750ml&lt;/h1&gt;', 99.999, 'uploads/products/45.png?v=1644379888', 1, 0, '2023-11-12 22:50:58', '2023-11-12 22:52:10'),
(60, 6, 12, 'Thép không gỉ giữ công cụ nhà bếp đa chức năng giữ công cụ đứng', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Th&eacute;p kh&ocirc;ng gỉ giữ c&ocirc;ng cụ nh&agrave; bếp đa chức năng giữ c&ocirc;ng cụ đứng&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 198.999, 'uploads/products/46.png?v=1644379888', 1, 0, '2023-11-12 22:59:34', '2023-11-12 23:06:25'),
(61, 6, 12, 'Kệ Đựng Đồ Gia Vị Nhà Bếp 2 Tầng Thông Minh , Kệ Đựng Bát Đũa Đa Năng 88277', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Kệ Đựng Đồ Gia Vị Nh&agrave; Bếp 2 Tầng Th&ocirc;ng Minh , Kệ Đựng B&aacute;t Đũa Đa Năng 88277&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 51.999, 'uploads/products/47.png?v=1644379888', 1, 0, '2023-11-12 23:00:44', '2023-11-12 23:06:36'),
(62, 6, 12, 'Xửng hấp inox SHG103-28 cm Sunhouse chính hãng, Xửng hấp cơm, hấp bánh. Nhiều kích thước', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Xửng hấp inox SHG103-28 cm Sunhouse ch&iacute;nh h&atilde;ng, Xửng hấp cơm, hấp b&aacute;nh. Nhiều k&iacute;ch thước&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 554.76, 'uploads/products/48.png?v=1644379888', 1, 0, '2023-11-12 23:01:38', '2023-11-12 23:06:41'),
(63, 6, 12, 'Nồi Cơm Điện Đa Năng Chigo Công Suất 350w Nấu Siêu Nhanh, Chống Dính 5 Lớp Siêu Bền - OENON', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Nồi Cơm Điện Đa Năng Chigo C&ocirc;ng Suất 350w Nấu Si&ecirc;u Nhanh, Chống D&iacute;nh 5 Lớp Si&ecirc;u Bền - OENON&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 459.999, 'uploads/products/49.png?v=1644379888', 1, 0, '2023-11-12 23:02:15', '2023-11-12 23:06:47'),
(64, 6, 12, 'Chảo Đá Nướng Chống Dính Không Cần Dầu Size 34cm Hàn Quốc Dùng Được Mọi Loại Bếp, Chất Liệu Siêu Cao Cấp', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Chảo Đ&aacute; Nướng Chống D&iacute;nh Kh&ocirc;ng Cần Dầu Size 34cm H&agrave;n Quốc D&ugrave;ng Được Mọi Loại Bếp, Chất Liệu Si&ecirc;u Cao Cấp&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 85.999, 'uploads/products/50.png?v=1644379888', 1, 0, '2023-11-12 23:02:58', '2023-11-12 23:06:51'),
(65, 6, 12, 'Nồi Áp Suất Đa Năng Roman Dung Tích 10L, Kích Thước 28cm, Cơ Chế Làm Nóng Tuần Hoàn Vì Ap Đóng Kín, Tiết Kiệm, An Toàn', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Nồi &Aacute;p Suất Đa Năng Roman Dung T&iacute;ch 10L, K&iacute;ch Thước 28cm, Cơ Chế L&agrave;m N&oacute;ng Tuần Ho&agrave;n V&igrave; Ap Đ&oacute;ng K&iacute;n, Tiết Kiệm, An To&agrave;n&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 249.999, 'uploads/products/51.png?v=1644379888', 1, 0, '2023-11-12 23:03:45', '2023-11-12 23:06:56'),
(66, 6, 12, 'Nồi chiên nhúng điện đơn, chiên gà, khoai tây, các loại thực phẩm', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Nồi chi&ecirc;n nh&uacute;ng điện đơn, chi&ecirc;n g&agrave;, khoai t&acirc;y, c&aacute;c loại thực phẩm&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1.288888, 'uploads/products/52.png?v=1644379888', 1, 0, '2023-11-12 23:05:05', '2023-11-12 23:07:00'),
(67, 6, 12, 'Chảo chống dính vân đá KHÔNG TỪ SUNHOUSE Size 18-30 CT18-30 PLUS', '&lt;p&gt;&lt;span style=&quot;color: rgba(0, 0, 0, 0.8); font-family: &amp;quot;Helvetica Neue&amp;quot;, Helvetica, Arial, 文泉驛正黑, &amp;quot;WenQuanYi Zen Hei&amp;quot;, &amp;quot;Hiragino Sans GB&amp;quot;, &amp;quot;儷黑 Pro&amp;quot;, &amp;quot;LiHei Pro&amp;quot;, &amp;quot;Heiti TC&amp;quot;, 微軟正黑體, &amp;quot;Microsoft JhengHei UI&amp;quot;, &amp;quot;Microsoft JhengHei&amp;quot;, sans-serif; font-size: 20px;&quot;&gt;Chảo chống d&iacute;nh v&acirc;n đ&aacute; KH&Ocirc;NG TỪ SUNHOUSE Size 18-30 CT18-30 PLUS&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 184.999, 'uploads/products/53.png?v=1644379888', 1, 0, '2023-11-12 23:06:00', '2023-11-12 23:07:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(255) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Hàng khô', 0, 1, '2022-02-09 08:49:34', '2023-11-12 22:21:23'),
(2, 'Mỹ phẩm', 1, 0, '2022-02-09 08:49:46', '2023-11-12 20:06:45'),
(3, 'Sản xuất', 0, 1, '2022-02-09 08:50:31', '2023-11-12 22:21:26'),
(4, 'Thực Phẩm', 1, 1, '2022-02-09 08:50:36', '2023-11-12 20:20:38'),
(6, 'Thực Phẩm Tươi Sống', 1, 0, '2023-11-12 20:08:14', NULL),
(7, 'Đồ hộp và đồ ăn chế biến sẵn', 1, 0, '2023-11-12 20:20:21', NULL),
(8, 'Gia vị và nguyên liệu nấu ăn', 1, 0, '2023-11-12 20:20:30', NULL),
(9, 'Đồ khô và ngũ cốc', 1, 0, '2023-11-12 20:20:41', NULL),
(10, 'Đồ uống', 1, 0, '2023-11-12 20:20:51', NULL),
(11, 'Sản phẩm chăm sóc cá nhân', 1, 0, '2023-11-12 20:20:58', NULL),
(12, 'Sản phẩm gia dụng', 1, 0, '2023-11-12 20:21:04', NULL),
(13, 'Đồ điện tử', 1, 0, '2023-11-12 20:21:10', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_info`
--

CREATE TABLE `system_info` (
  `id` int(255) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Hệ Thống Quản Lý Siêu Thị'),
(6, 'short_name', 'MICHU - Supermarket'),
(11, 'logo', 'uploads/logo-1644367440.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1644367404.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/avatar-1.png?v=1644472635', NULL, 1, '2021-01-20 14:02:37', '2023-11-02 12:59:48'),
(11, 'Vien', 'Nhan', 'nv1', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-11.png?v=1644472553', NULL, 2, '2022-02-10 13:55:52', '2023-11-02 12:59:11'),
(12, 'Michu', 'DUC', 'nv2', '202cb962ac59075b964b07152d234b70', NULL, NULL, 2, '2023-11-07 12:50:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(255) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(255) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 6, 'Shop Thực Phẩm Tươi Sống', 'Le Trung Duc', '09123456788', 'shoptpts', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/1.png?v=1644375053', 1, 0, '2022-02-09 10:50:53', '2023-11-12 20:22:47'),
(2, '202202-00002', 7, 'Shop Đồ hộp và đồ ăn chế biến sẵn', 'Oanh', '09123456789', 'shopdh', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2022-02-09 10:52:09', '2023-11-12 20:22:39'),
(4, '202311-00001', 8, 'Shop Gia vị và nguyên liệu nấu ăn', 'Dung', '123456789', 'shopgv', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2023-11-12 20:25:35', '2023-11-12 22:24:25'),
(5, '202311-00002', 2, 'Shop Mỹ phẩm', 'Duong', '1234567', 'shopmp', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2023-11-12 21:13:37', '2023-11-12 22:24:29'),
(6, '202311-00003', 12, 'Shop Đồ Gia Dụng', 'duc', '1234567', 'shopdgd', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2023-11-12 22:14:08', '2023-11-12 22:24:35'),
(7, '202311-00004', 10, 'Shop Đồ uống', 'Linh', '1234567', 'shopdu', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2023-11-12 22:23:35', '2023-11-12 22:24:33'),
(8, '202311-00005', 11, 'Shop Chăm Sóc Cá Nhân', 'Hoang', '1234567', 'shopcscn', 'c4ca4238a0b923820dcc509a6f75849b', 'uploads/vendors/2.png?v=1644375129', 1, 0, '2023-11-12 22:45:26', '2023-11-12 22:58:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Chỉ mục cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE;

--
-- Chỉ mục cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
