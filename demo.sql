-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2021 at 01:41 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `items` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `paymentType` varchar(255) DEFAULT 'COD',
  `status` varchar(255) DEFAULT 'order_placed',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerId`, `items`, `phone`, `address`, `paymentType`, `status`, `createdAt`, `updatedAt`) VALUES
(9, 1, '[null,{\"id\":1,\"name\":\"neck chain\"},{\"id\":2,\"name\":\"Allure Elegant\"},{\"id\":3,\"name\":\"Necklace\"}]', 'kb', 'kbk', 'COD', 'order_placed', '2021-06-04 16:49:51', '2021-06-04 16:49:51'),
(10, 1, '[null,{\"id\":1,\"name\":\"neck chain\"},{\"id\":2,\"name\":\"Allure Elegant\"},{\"id\":3,\"name\":\"Necklace\"}]', 'jhvhj', 'mhbhj', 'COD', 'order_placed', '2021-06-04 16:51:42', '2021-06-04 16:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `content`) VALUES
(1, 'about', 'About Us', '<p>eCommerce is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>'),
(2, 'contact', 'Contact Us', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d58911.87500168799!2d88.39522544634136!3d22.65407989591108!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f89e6c605d82ff%3A0x1f6779d05c4879ee!2sDum+Dum%2C+Kolkata%2C+West+Bengal!5e0!3m2!1sen!2sin!4v1524345317520\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\n\n<address>\n<strong>Dumdum, Kolkata</strong><br>\nWest Bengal, INDIA<br>\nPin: 700030<br>\n<abbr title=\"Phone\">Phone:</abbr> +91 9647 5724 19<br>\n<abbr title=\"Email\">Email:</abbr> sendmail2krrish@gmail.com\n</address>');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `productSKU` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  `productShortDesc` varchar(1000) DEFAULT NULL,
  `productLongDesc` text DEFAULT NULL,
  `productImage` varchar(100) DEFAULT NULL,
  `productCategoryID` int(11) DEFAULT NULL,
  `productUpdateDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `productStock` float DEFAULT NULL,
  `productLive` tinyint(1) DEFAULT NULL,
  `productUnlimited` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productSKU`, `productName`, `productPrice`, `productShortDesc`, `productLongDesc`, `productImage`, `productCategoryID`, `productUpdateDate`, `productStock`, `productLive`, `productUnlimited`) VALUES
(1, '123', 'neck chain', 500, 'neck chian for man', 'chian for mans made by still', 'product5', 2, '2021-05-03 13:03:03', 1, 1, 0),
(2, '124', 'Allure Elegant', 500, 'Allure Elegant for woman', 'Allure Elegant for woman', 'product5', 2, '2021-05-03 13:02:58', 1, 1, 0),
(3, '125', 'Necklace', 600, 'Necklace for woman', 'Necklace for woman with diamond', 'product5', 2, '2021-05-03 13:02:51', 1, 1, 0),
(4, '123', 'Circlets', 500, 'circlet is a jewelry piece for the head', 'A circlet is a jewelry piece for the head and looks similar to a diadem. Circlets were traditionally used as a word for the base of the coronet or crowns. They resemble open crowns that have no arches and were used by successors to the throne.\r\n\r\nThey have been recorded during the Greek era where people with affluence in the community often worn them in a social setting. Circlets were often known as the Stephanos, which is a laurel wreath. This was similar to crowns made of thorns that were rumored to have been placed on the head of Jesus. This is depicted in many paintings and statues of Jesus Christ throughout history.\r\n', 'product5', 1, '2021-05-03 12:57:23', 1, 1, 0),
(5, '123', 'Tiaras', 500, 'tiara is traditionally worn by women as ornamental jewelry', 'A tiara is traditionally worn by women as ornamental jewelry. They are worn only on formal occasions where the dress code is usually a white tie. They were worn in ancient times to signify high status, especially during the Persian era, where they were worn by kings. Tiaras are a significant part of British history, as Queen Elizabeth II was known to have the biggest and most valuable collection of tiaras in history. They have always been associated with Royalty but are now often used in formal events and parties.\r\n', 'Tiaras', 1, '0000-00-00 00:00:00', 1, 1, 0),
(6, '123', 'Anklets', 500, 'Anklets have been worn by women for decades in India', 'Anklets have been worn by women for decades in India, where they are known as “payals”. They hold strong importance in the culture which is why they are used during Indian weddings and are paired with saris. They have also been documented in the Egyptian Civilization where women wore them in pre-dynastic times. In Western popular culture, they are usually made from leather and even come in formal designs. They also come with small bells, which makes a pleasant sound when the person is walking.\r\n', 'Anklets', 6, '0000-00-00 00:00:00', 1, 1, 0),
(7, '123', 'Earings', 500, 'Earrings are the most popular piece of jewelry across the globe', 'Earrings are the most popular piece of jewelry across the globe. They are mostly attached to the earlobe via a piercing but are also attached to other parts of the ear such as the helix, industrial, rook, daith, conch, snug, and many others. They have been used in different civilizations throughout history and were most famously worn by the Minoan Civilization. They come in all sorts of designs like studs, drop, hoop, dangle, barbell, ear threads, ear spikes, and huggy earrings.\r\nThe most expensive pair of earrings is known as Apollo and Artemis after the Greek twin gods. They include a 14.54-carat blue diamond and a 16-carat pink diamond. They have been polished perfectly into a pear shape and were sold for $57.4 million. They are hailed as one of the most “chemically pure” diamonds in the world.\r\n', 'Earings', 2, '0000-00-00 00:00:00', 1, 1, 0),
(8, '123', 'Statement Necklace', 500, 'Go risqué with a statement necklace which can help you stand out from the crowd with your steely persona', 'Go risqué with a statement necklace which can help you stand out from the crowd with your steely persona and eccentric style sense. These necklaces can definitely lure in the attention of the fashion police. However, you can stun them too by pairing it up with simple garments so that the necklace serves as the focal point of attention.\r\n\r\nLength: 16”-19”\r\nAvailable in:  silver, rubies, stones, beads\r\nSuitable Neckline: sweetheart, plunging neck\r\nWhen to Wear: evening parties, cocktail parties', 'Statement Necklace', 2, '0000-00-00 00:00:00', 1, 1, 0),
(9, '123', 'Chain Necklace', 500, 'Wish to keep your entire look simple yet sophisticated?', 'Wish to keep your entire look simple yet sophisticated? Then think no more and opt for a chain necklace which as the name signifies comprises of a beautiful chain in necklace format. These look good with dainty dresses having solid color shades.\r\n\r\nLength: 17”-19”\r\nAvailable in: silver, gold, platinum, rose gold\r\nSuitable Neckline: all necklines\r\nWhen to Wear: casual', 'Chain Necklace', 2, '0000-00-00 00:00:00', 1, 1, 0),
(10, '123', 'Sautoir Necklace', 500, 'The french word ‘Sautoir’ refers to a long necklace which suspends over the bust area in the form of a tassel or ornamental pendant.', 'The french word ‘Sautoir’ refers to a long necklace which suspends over the bust area in the form of a tassel or ornamental pendant. This necklace gained popularity under the Art Deco movement of the twentieth century. Previously pearls and twisted ropes served as the favorite components of sautoir necklaces which has currently taken the shape of geometric diamond. The long nature of sautoir necklaces opens up greater possibilities of styling the same as a headpiece or even an amulet.\r\n\r\nLength: 30”-36”\r\nAvailable in: geometric diamonds, pearls, beads\r\nSuitable Neckline: off-shoulder, scoop neck, V-neck\r\nWhen to Wear: brunches, formal events', 'Sautoir Necklace', 2, '0000-00-00 00:00:00', 1, 1, 0),
(11, '123', 'Rivière Necklace', 500, 'Riviere necklace comprises of precious or semi-precious gemstones falling under the same category which either have similar dimensions or graduate smoothly from one size to another.', 'Riviere necklace comprises of precious or semi-precious gemstones falling under the same category which either have similar dimensions or graduate smoothly from one size to another. Usually this form of necklace does not have any ornamentation which accentuates the true beauty of the gemstones. You might even come across Rivieres concealing hinged loops from which pendants can be suspended. They come in either princess or collar length variants.\r\n\r\nLength: 14”-16”\r\nAvailable in: gemstones, diamonds\r\nSuitable Neckline: V-neck, strapless\r\nWhen to Wear: evening parties, cocktail parties, wedding', 'Rivière Necklace', 2, '0000-00-00 00:00:00', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('WMGxuh6K6rqnz_OkADEDynk3vCbBVWw8', '2021-06-05 17:03:09', '{\"cookie\":{\"originalMaxAge\":86399998,\"expires\":\"2021-06-05T16:53:58.555Z\",\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"cart\":{\"items\":{\"1\":{\"item\":{\"productID\":1,\"productSKU\":\"123\",\"productName\":\"neck chain\",\"productPrice\":500,\"productShortDesc\":\"neck chian for man\",\"productLongDesc\":\"chian for mans made by still\",\"productImage\":\"product5\",\"productCategoryID\":2,\"productUpdateDate\":\"2021-05-03T13:03:03.000Z\",\"productStock\":1,\"productLive\":1,\"productUnlimited\":0},\"qty\":3},\"2\":{\"item\":{\"productID\":2,\"productSKU\":\"124\",\"productName\":\"Allure Elegant\",\"productPrice\":500,\"productShortDesc\":\"Allure Elegant for woman\",\"productLongDesc\":\"Allure Elegant for woman\",\"productImage\":\"product5\",\"productCategoryID\":2,\"productUpdateDate\":\"2021-05-03T13:02:58.000Z\",\"productStock\":1,\"productLive\":1,\"productUnlimited\":0},\"qty\":3},\"3\":{\"item\":{\"productID\":3,\"productSKU\":\"125\",\"productName\":\"Necklace\",\"productPrice\":600,\"productShortDesc\":\"Necklace for woman\",\"productLongDesc\":\"Necklace for woman with diamond\",\"productImage\":\"product5\",\"productCategoryID\":2,\"productUpdateDate\":\"2021-05-03T13:02:51.000Z\",\"productStock\":1,\"productLive\":1,\"productUnlimited\":0},\"qty\":2}},\"totalQty\":8,\"totalPrice\":4200},\"passport\":{\"user\":1}}', '2021-06-03 02:54:23', '2021-06-04 17:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `mobile`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'shivam soni', '9549585231', 'shivam@gmail.com', '$2b$10$F7Z3TFgpvNOnSOmDRd3Ov.GoKIi/3Rt6/duanCHS0DTXWwjdTqes6', '2021-05-13 06:48:56', '2021-05-13 06:48:56'),
(2, 'shivam soni', '9549585231', 'shivam@gmail.com', '$2b$10$8Or0H/y6W8leldkJtcdZF.zCYPrtlDM57Mts5ATEYk/bPVlvNscSS', '2021-05-13 06:51:17', '2021-05-13 06:51:17'),
(3, 'shivam soni', '843984759', 'shivam@gmail.com', '$2b$10$Qv8iZ9FBBLMtnc3c.cobjOAI/bleDKZSi3aaG4tAOCWlQyw8gVs/S', '2021-05-13 10:11:54', '2021-05-13 10:11:54'),
(4, 'dfsd', 'sd', 'shivam@gmail.com', '$2b$10$0ZgC3VansDm6lekcgY0SfedVSKaS8ZLHwR6z/ob9aKhIxjrng8c/6', '2021-05-13 10:13:07', '2021-05-13 10:13:07'),
(5, 'ghd', 'dfg', 'shivam@gmail.com', '$2b$10$/pY/oSWcq.ZXaZ3I7DztHu/DcmLIdg2HSz3flZnlzDO95e5J0d2NK', '2021-05-13 10:15:05', '2021-05-13 10:15:05'),
(6, 'dh', 'gh', 'shivam@gmail.com', '$2b$10$lq2GwCxHz7KQfqgtc1CR4uvy3nMvJ/hAjlIGfWyMUwZ0v9nMU0dnm', '2021-05-13 10:16:32', '2021-05-13 10:16:32'),
(7, 'sasd', 'asd', 'shivam@gmail.com', '$2b$10$PujTrZ5cqCy/alWOpJaozOb90RILbqkQ0yoxFXycushTocwQBoYgy', '2021-05-13 10:16:39', '2021-05-13 10:16:39'),
(8, 'e', 'df', 'shivam@gmail.com', '$2b$10$OaXAdoCbK6v.Lm/w6TDbPeHr.cI1X6is8E4eDvGbIhv/w.zHwcchy', '2021-05-13 10:17:01', '2021-05-13 10:17:01'),
(9, 'shivam soni', '9549585231', 'shivam@gmail.com', '$2b$10$/ctIxM2OuFQlUlUGOIAZFedsOgp8LEJbFuhgLUJ.G6CxydDnteGG.', '2021-05-14 16:22:54', '2021-05-14 16:22:54'),
(10, 'shivam ', 'aiudg', 'shivam@gmail.com', '$2b$10$HaLqR5OKP.j20qYXKkTSO.l0CTIBWCkgL2JFQWc3HoyJ5js/fyoaO', '2021-05-14 16:23:51', '2021-05-14 16:23:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `productCategoryID` (`productCategoryID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
