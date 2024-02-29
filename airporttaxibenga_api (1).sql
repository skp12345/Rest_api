-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2023 at 08:39 AM
-- Server version: 5.7.42
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airporttaxibenga_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `sn` int(11) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`sn`, `admin_email`, `admin_pass`) VALUES
(1, 'suraj@gmail.com', '224225');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `img_id` int(50) NOT NULL,
  `title` varchar(500) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `img_path` varchar(100) NOT NULL,
  `img_category_id` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`img_id`, `title`, `desc`, `img_path`, `img_category_id`, `status`, `created_at`) VALUES
(15, 'Her Eyes: The Gateway into the Soul', 'Eyes represent the arts, inner emotions, and the beauty of women, it\'s a gateway into her souls. These pictures tell a story about feelings that are exhibited from her eyes and inner beauty. Girls are the most divine, so she expresses so many things through her eyes because it\'s the most powerful.', 'img15.jpeg', '27', 1, '2023-01-13 02:40:16'),
(16, 'Dream Big & Achieve It', 'Dream big like the sky and ocean, there are no limits, live your dreams and work hard & harder on your dreams, no matter what wings are large or tiny and one day you will definitely achieve them.', 'img13.jpeg', '27', 1, '2023-01-13 02:43:26'),
(17, 'Abstract art of women', 'Abstract art of women figuratively drawing freedom from every single thought in her mind. No matter how many thoughts are in your mind whether it\'s positive or negative, let every thought will go and stay positive, happy, and free because the more you feed your mind with positive thoughts, the more you can attract great things into your life.', 'img7.jpeg', '27', 1, '2023-01-13 02:45:15'),
(18, 'Stacking Books ', 'Life is like a wonderful book and it never ends. You are the author of your own life & sometimes you experience the bad chapters, sometimes enjoy the good ones and some are exciting too. But when you enter into the bad one, don\'t forget to turn a page because you will never know what the next chapter holds.', 'img16.jpeg', '27', 1, '2023-01-13 02:47:24'),
(19, 'Freedom', 'Life without freedom is like a dead body and without freedom, life has no value. So every creature on earth has the freedom to think, freedom to speak, and freedom to choose and live the life you desired to be. Girls are divine things and they are not here to sacrifice their dreams because girls are born to fly.  Don\'t be afraid, don\'t be shy and no matter wings are large or small dream big beyond the sky.', 'img12.jpeg', '27', 1, '2023-01-13 02:50:57'),
(20, 'Oil on canvas abstract landscape', 'Oil on canvas abstract landscape', 'img8.jpeg', '26', 1, '2023-01-13 02:52:50'),
(21, 'Oil on canvas horse painting', 'Oil on canvas horse painting', 'img6.jpeg', '26', 1, '2023-01-13 02:54:40'),
(22, 'Oil on canvas-stormy weather landscape', 'Oil on canvas - stormy weather landscape', 'img9.jpeg', '26', 1, '2023-01-13 02:55:30'),
(23, 'Oil on canvas still life painting', 'Oil on canvas still life painting', 'img10.jpeg', '26', 1, '2023-01-13 02:56:16'),
(24, 'Oil on canvas abstract landscape', 'Oil on canvas abstract landscape', 'img4.jpeg', '26', 1, '2023-01-13 02:57:06'),
(25, 'Buddha painting Charcoal on paper', 'Buddha is a symbol of peace and calmness. According to Vastu experts having the Buddha image in a home increases the positive vibes, and harmonious vibe and also experiences a sense of calmness and peace. \r\n<p>I gave this painting a sculpture-quality look, this has been expressed through sharp contrasts tonal values and emphasized highlights and an unbroken contour line.</P>', 'img1.jpeg', '27', 1, '2023-01-13 02:58:46'),
(26, 'Horse Charcoal Painting', 'Horse paintings signify achievement, progress, strength, and peace. According to Vastu experts hanging horse paintings on the south wall of the office or home bring fame. Horse painting at your office can strengthen your power, authority, and reputation.', 'img14.jpeg', '27', 1, '2023-01-13 03:04:30'),
(27, 'Growth of Positivity in Life', 'Women have qualities of nature, she stands against the storm and rebuilds themselves, then bloom with positive vibes. Her supreme qualities are sensitivity and emotions, she sacrifices her dreams for her family and she makes them strong with positive vibes.', 'img11.jpeg', '27', 1, '2023-01-13 03:06:49'),
(28, 'Golden path of Life', 'Not Available', 'img17.jpeg', '27', 1, '2023-01-13 03:08:06'),
(29, 'Geomatric art with figurative painting', 'Not available', 'img2.jpeg', '26', 1, '2023-01-14 17:28:15'),
(30, 'Mordenistic with tradition', 'Now available', 'img3.jpeg', '26', 1, '2023-01-14 17:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `image_category`
--

CREATE TABLE `image_category` (
  `category_id` int(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image_category`
--

INSERT INTO `image_category` (`category_id`, `category`, `created_at`) VALUES
(26, 'Oil Painting', '2023-01-13 02:22:55'),
(27, 'Charcoal Painting', '2023-01-13 02:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `res_api`
--

CREATE TABLE `res_api` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `res_api`
--

INSERT INTO `res_api` (`id`, `name`, `email`, `mobile`, `course`, `status`, `created_at`) VALUES
(1, 'new 1 updated', 'updated@gmail.com', '234234232', 'MDA', 0, '2022-12-16 10:59:36'),
(2, 'Neeraj Kumar', 'Neeraj@gmail.com', '880883343434', 'Developer', 1, '2022-12-16 11:00:32'),
(3, 'Suneel Kumar', 'Sunil@gmail.com', '880883343344', 'Android Developer', 1, '2022-12-16 11:02:01'),
(4, 'Anuj', 'Anuj@gmail.com', '34535355345', 'MBA', 1, '2022-12-17 05:46:29'),
(7, 'Anuj', 'Anuj@gmail.com', '34535355345', 'MBA', 1, '2022-12-17 05:53:55'),
(9, 'skp', 'skp@gmail.com', '345353454', 'MCA', 1, '2022-12-17 07:07:23'),
(11, '[removed]skp[removed]', 'skp@gmail.com', '345353454', 'MCA', 1, '2022-12-17 07:08:28'),
(12, '&lt;style&gt;done bhai&lt;/style&gt;', 'skp@gmail.com', '345353454', 'MCA', 1, '2022-12-17 07:10:16'),
(13, 'Kamal', 'kamal@gmail.com', '345353454', 'MCA', 1, '2022-12-17 12:51:07'),
(14, 'Kamal', 'kamal@gmail.com', '345353454', 'MCA', 1, '2022-12-17 13:02:08'),
(15, 'Sazid', 'Sazid@gmail.com', '345353454', 'MCA', 1, '2022-12-17 18:21:17'),
(16, 'Sazid', 'Sazid@gmail.com', '345353454', 'MCA', 1, '2022-12-17 18:26:55'),
(17, 'rajj', 'sss@gmail.com', '3324242343', 'dsfds', 1, '2022-12-21 11:00:19'),
(18, 'rajj', 'sss@gmail.com', '3324242343', 'dsfds', 1, '2022-12-21 11:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `role_id` int(11) NOT NULL,
  `token` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `email`, `password`, `status`, `role_id`, `token`) VALUES
(21, 'Kaamal', 'kamal@gmail.com', 'kamal12345@', 1, 12, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImthbWFsQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoia2FtYWwxMjM0NUAifQ.xxn24n7RLHqSgOWc2vHlWhq3yrEF9hOqR431xnUl1TI'),
(22, 'Kamal', 'kamala@gmail.com', 'kamal1345a@', 1, 12, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImthbWFsYUBnbWFpbC5jb20iLCJwYXNzd29yZCI6ImthbWFsMTM0NWFAIn0.H7jbI17jPvK8KHxAEUm7Ft6M9TNiP7G1kZ27AfLupgo'),
(23, 'Don', 'don@gmail.com', 'don123@', 1, 5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRvbkBnbWFpbC5jb20iLCJwYXNzd29yZCI6ImRvbjEyM0AifQ.zjWwDgMfLEyuoo9ddz8Le0sDoOhVwQJjaum9c3blteU'),
(28, 'Don', 'don2@gmail.com', 'don123@', 1, 5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRvbjJAZ21haWwuY29tIiwicGFzc3dvcmQiOiJkb24xMjNAIn0.5yS2_82g6IKPVj3XByyv8kHcuI-QqJc0E9B2X87-VDE'),
(29, 'Don', 'don3@gmail.com', 'don123@', 1, 5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRvbjNAZ21haWwuY29tIiwicGFzc3dvcmQiOiJkb24xMjNAIn0.1bZZ2v6_NiM1MeVb6bTaSsC36BIb9DNmN3xlDGM6l9c'),
(30, 'Don', 'don4@gmail.com', 'don123@', 1, 5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRvbjRAZ21haWwuY29tIiwicGFzc3dvcmQiOiJkb24xMjNAIn0._sprXRbkC-5I_0W7uTy6byjD7xJheMII232xmwltzvk'),
(31, 'Don', 'don5@gmail.com', 'don123@', 1, 5, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImRvbjVAZ21haWwuY29tIiwicGFzc3dvcmQiOiJkb24xMjNAIn0.xq5KHew96Kyk-UfLdmkdwxFGFvhjkrZ6NEyd0D0UvJg'),
(32, 'raj', 'raj@gmail.com', 'rajii123', 1, 0, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InJhakBnbWFpbC5jb20iLCJwYXNzd29yZCI6InJhamlpMTIzIn0._7uslTP62ibFlrQhDwuB0zWn4qOTepEbe4j7pq3NmOo'),
(33, 'raj', 'raj45@gmail.com', 'rajii123', 1, 0, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InJhajQ1QGdtYWlsLmNvbSIsInBhc3N3b3JkIjoicmFqaWkxMjMifQ.5cGEkIJ7XIODsY1mCXBdRE5MCVVI8JY0QK1V9f8aBeM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`sn`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `image_category`
--
ALTER TABLE `image_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `res_api`
--
ALTER TABLE `res_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `img_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `image_category`
--
ALTER TABLE `image_category`
  MODIFY `category_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `res_api`
--
ALTER TABLE `res_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
