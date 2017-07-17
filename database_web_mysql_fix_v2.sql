-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2017 at 11:48 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_pm`
--
CREATE DATABASE IF NOT EXISTS `web_pm` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `web_pm`;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `catalog_id` int(11) NOT NULL,
  `catalog_name` varchar(128) COLLATE utf8_bin NOT NULL,
  `catalog_sort_order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`catalog_id`, `catalog_name`, `catalog_sort_order`) VALUES
(1, 'Sony', 0),
(2, 'ASUS', 0),
(3, 'HTC', 0),
(4, 'Xiaomi', 0),
(5, 'Iphone', 0),
(6, 'Samsung', 0),
(7, 'OPPO', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `trans_id` int(20) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` char(10) COLLATE utf8_bin NOT NULL,
  `orders_qty` int(11) NOT NULL DEFAULT '0',
  `orders_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `orders_data` longtext COLLATE utf8_bin NOT NULL,
  `orders_status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_id`,`trans_id`) USING BTREE,
  KEY `trans_id` (`trans_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `orders`
--



-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` char(10) COLLATE utf8_bin NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `product_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `product_price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `product_content` longtext COLLATE utf8_bin NOT NULL,
  `product_discount` int(11) NOT NULL,
  `product_image_link` longblob NOT NULL,
  `product_created` int(11) NOT NULL DEFAULT '0',
  `product_viewed` int(11) NOT NULL DEFAULT '0',
  `product_rating` int(11) DEFAULT '0',
  PRIMARY KEY (`product_id`,`catalog_id`) USING BTREE,
  KEY `catalog` (`catalog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `catalog_id`, `product_name`, `product_price`, `product_content`, `product_discount`, `product_image_link`, `product_created`, `product_viewed`, `product_rating`) VALUES
('Ximix', 4, 'Xiaomi Mi MIX (6GB/256GB)', '13990000.0000', 'Kể từ khi Mi Mix được giới thiệu thì mình rất háo hức được cầm trên tay một chiếc điện thoại như vậy, một trải nghiệm từ hai năm trước khi mình cầm Sharp Aquos Crystal. Cầm trên tay, thậm chí khi chưa bật màn hình lên thì Mi Mix cho mình nhiều cảm xúc hơn bất kỳ chiếc Xiaomi nào từ trước tới giờ. Cảm giác đó khó tả, nó là vật liệu gốm, là một chiếc máy đẹp, chắc chắn, là màn hình không viền...', 0, 0x6c696e6b, 1, 0, 0),
('IP732', 5, 'Iphone 7 32GB', '21000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('IP7p32', 5, 'Iphone 7 plus 32GB', '22000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('IP7128', 5, 'Iphone 7 128GB', '21000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('IP7p128', 5, 'Iphone 7 plus 128GB', '22000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('IP7256', 5, 'Iphone 7 256GB', '21000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('IP7p256', 5, 'Iphone 7 plus 256GB', '22000000.0000', 'Với thiết kế không quá nhiều thay đổi, vẫn bảo tồn vẻ đẹp truyền thống từ thời iPhone 6 Plus,  iPhone 7 Plus 32GB được trang bị nhiều nâng cấp đáng giá như camera kép, đạt chuẩn chống nước chống bụi cùng cấu hình cực mạnh.', 0, 0x6c696e6b, 1, 0, 0),
('SSGS8', 6, 'Samsung Galaxy S8', '18490000.0000', 'Galaxy S8 là siêu phẩm mới nhất được Samsung ra mắt vào ngày 29/3 với thiết kế nhỏ gọn hoàn toàn mới, màn hình vô cực viền siêu mỏng.', 0, 0x6c696e6b, 1, 0, 0),
('SSGS8p', 6, 'Samsung Galaxy S8 plus', '20490000.0000', 'Galaxy S8 và S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - thiết bị đang có doanh số đặt hàng khủng nhất hiện tại.', 0, 0x6c696e6b, 1, 0, 0),
('SoXZpre', 1, 'Sony Xperia XZ Premium', '18490000.0000', 'Sony Xperia XZ Premium là flagship của Sony trong năm 2017 với vẻ ngoài hào nhoáng, màn hình cao cấp cũng nhiều trang bị hàng đầu khác.', 0, 0x6c696e6b, 1, 0, 0),
('SoXXAu', 1, 'Sony Xperia XA Ultra', '6990000.0000', 'Sony Xperia XA Ultra sở hữu màn hình lớn cùng camera trước có độ phân giải cao cùng nhiều tính năng cao cấp.', 0, 0x6c696e6b, 1, 0, 0),
('SoXX', 1, 'Sony Xperia X', '5500000.0000', 'Sony vừa giới thiệu dòng sản phẩm X Serie mới của hãng trong năm 2016 tại triển lãm MWC. Xperia X là chiếc smartphone tầm trung mới với nhiều điểm nhấn đáng chú ý.', 0, 0x6c696e6b, 1, 0, 0),
('SoXXA1', 1, 'Sony Xperia XA1', '6490000.0000', 'Xperia XA1 là bản nâng cấp của chiếc Xperia XA đã khá thành công ở thị trường nước ta, với thiết kế khá tương đồng siêu phẩm Xperia XZ, cấu hình được trang bị cao hơn và camera có chất lượng tốt hơn.', 0, 0x6c696e6b, 1, 0, 0),
('AsZ3', 2, 'Asus Zenfone 3 ZE520KL', '6990000.0000', 'Zenfone 3 ZE520KL sở hữu thiết kế đẹp, cấu hình khá cùng nhiều nâng cấp đáng giá so với thế hệ Zenfone 2 năm ngoái.', 0, 0x6c696e6b, 1, 0, 0),
('HTC10', 3, 'HTC 10 evo', '5990000.0000', 'HTC 10 evo mang lại cho bạn trải nghiệm về thiết kế, những trang bị cao cấp của một chiếc flagship đến từ HTC nhưng với mức giá chưa tới một nửa.', 0, 0x6c696e6b, 1, 0, 0),
('HTCOne', 3, 'HTC One A9s', '5500000.0000', 'Mẫu smartphone tầm trung mới nhất của HTC là One A9s vừa được nhà sản xuất Đài Loan ra mắt tại triển lãm IFA 2016 với nhiều điểm nâng cấp mạnh mẽ.', 0, 0x6c696e6b, 1, 0, 0),
('AsZ3M5', 2, 'Asus Zenfone 3 Max 5.5\" ', '5500000.0000', 'Asus ZenFone 3 Max (ZC553KL) là một phiên bản biến thể khác của Zenfone 3 Max đã ra đời trước đó, với nhiều điểm cải tiến điển hình là camera 16 MP, hỗ trợ lấy nét laser, dùng bộ xử lý của Qualcomm và màn hình 5.5 inch.', 0, 0x6c696e6b, 1, 0, 0),
('AsZ3M', 2, 'Asus Zenfone 3 Max', '4190000.0000', 'Tiếp nối sự thành công của chiếc Zenfone Max ra đời năm ngoái thì Asus tiếp tục giới thiệu thêm phiên bản kế nhiệm là chiếc Zenfone 3 Max với nhiều thay đổi về ngoài hình cũng như tính năng.', 0, 0x6c696e6b, 1, 0, 0),
('HTCOneE9', 3, 'HTC One E9 Dual', '4490000.0000', 'One E9 Dual mang thiết kế khá quen thuộc từ nhà sản xuất HTC, cấu hình mạnh mẽ, màn hình lớn Full HD kết hợp cùng hệ thống loa Boomsound đặc trưng.', 0, 0x6c696e6b, 1, 0, 0),
('HTCu11', 3, 'HTC U11', '16990000.0000', 'HTC U11 là smartphone cao cấp nhất của HTC trong năm 2017 với nhiều nâng cấp tập trung vào trải nghiệm người dùng thú vị so với model tiền nhiệm.', 0, 0x6c696e6b, 1, 0, 0),
('SSGN5', 6, 'Samsung Galaxy Note 5', '10990000.0000', 'Tiếp theo thành công vang dội của Galaxy Note 4 thì Galaxy Note 5 càng trở nên hoàn thiện và mạnh mẽ hơn.', 0, 0x6c696e6b, 1, 0, 0),
('SSGS7E', 6, 'Samsung Galaxy S7 Edge', '15490000.0000', 'Samsung Galaxy S7 Edge Xanh Coral được kết hợp giữa 2 màu sắc xanh dương và vàng tạo nên một tổng thể thiết kế vô cùng sang trọng và bắt mắt.', 0, 0x6c696e6b, 1, 0, 0),
('IP6p', 5, 'Iphone 6 plus', '11990000.0000', 'Được đổi mới mạnh mẽ về thiết kế, cấu hình cùng một màn hình kích thước lớn đi cùng mang đến nhiều thích thú hơn trong sử dụng.', 0, 0x6c696e6b, 1, 0, 0),
('OPPOF1s', 7, 'OPPO F1s ', '6990000.0000', 'Tiếp nối sự thành công rực rỡ từ người tiền nhiệm OPPO F1s thì mới đây OPPO đã chính thức giới thiệu phiên bản kế nhiệm với nâng cấp nhẹ về cầu hình mang tên OPPO F1s 2017.', 0, 0x6c696e6b, 1, 0, 0),
('OPPO F3', 7, 'OPPO F3', '6990000.0000', 'Cuối cùng thì mẫu \"chuyên gia selfie\" mới OPPO F3 cũng đã chính thức được trình làng với cụm camera trước kép trang bị nhiều tính năng selfie tuyệt vời hứa hẹn sẽ đem đến trải nghiệm đáng giá cho người dùng.', 0, 0x6c696e6b, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `trans_id` int(20) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` char(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `trans_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `trans_payment` varchar(32) COLLATE utf8_bin NOT NULL,
  `trans_payment_info` longtext COLLATE utf8_bin NOT NULL,
  `trans_message` varchar(255) COLLATE utf8_bin NOT NULL,
  `trans_security` varchar(16) COLLATE utf8_bin NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`trans_id`, `status`, `user_id`, `trans_amount`, `trans_payment`, `trans_payment_info`, `trans_message`, `trans_security`, `created`) VALUES
(1, 1, '1', '1.0000', 'card', 'paid', 'white', 'abc', 1),
(2, 1, '2', '1.0000', 'cash', 'paid', 'black', 'xyz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_user`
--

DROP TABLE IF EXISTS `web_user`;
CREATE TABLE IF NOT EXISTS `web_user` (
  `user_id` char(50) COLLATE utf8_bin NOT NULL,
  `user_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_phone` varchar(15) COLLATE utf8_bin NOT NULL,
  `user_address` varchar(128) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `web_user`
--

INSERT INTO `web_user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `user_password`) VALUES
('1', 'Bach', 'bach050296@yahoo.com.vn', '01285688645', 'TPHCM', '123'),
('2', 'Hoang', 'hoang123@yahoo.com.vn', '01258314568', 'TPHCM', '123');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `catalog` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catalog_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `web_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
