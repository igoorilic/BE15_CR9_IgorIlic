-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2022 at 05:35 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `BE15_CR9_famazon_IgorIlic`
--
CREATE DATABASE IF NOT EXISTS `BE15_CR9_famazon_IgorIlic` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `BE15_CR9_famazon_IgorIlic`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountId` int(11) NOT NULL,
  `username` char(30) NOT NULL,
  `address` char(30) NOT NULL,
  `fk_customerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountId`, `username`, `address`, `fk_customerId`) VALUES
(1, 'JohnBoy', 'Somethinggasse 1', 1),
(2, 'MaryGirl', 'Somethingsstrasse 2', 2),
(3, 'Igor3', 'Wehlistrasse 3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyId` int(11) NOT NULL,
  `companyName` char(30) NOT NULL,
  `companyAddress` char(30) NOT NULL,
  `orderId` int(11) NOT NULL,
  `fk_productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyId`, `companyName`, `companyAddress`, `orderId`, `fk_productId`) VALUES
(1, 'Apple Inc', 'California', 1, 1),
(2, 'Samsung', 'Suwan', 2, 2),
(3, 'Huawei', 'Shenzen', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `fName` char(50) NOT NULL,
  `lName` char(50) NOT NULL,
  `fk_shippingId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `fName`, `lName`, `fk_shippingId`) VALUES
(1, 'John', 'Doe', 1),
(2, 'Mary', 'May', 2),
(3, 'Igor', 'Ilic', 3);

-- --------------------------------------------------------

--
-- Table structure for table `famazon`
--

CREATE TABLE `famazon` (
  `famazonId` int(11) NOT NULL,
  `fk_customerId` int(11) NOT NULL,
  `fk_productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `famazon`
--

INSERT INTO `famazon` (`famazonId`, `fk_customerId`, `fk_productId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `fk_orderId` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoiceId`, `fk_orderId`, `price`) VALUES
(1, 1, 899),
(2, 2, 799),
(3, 3, 699);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `orderDate` date NOT NULL,
  `fk_companyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`orderId`, `orderDate`, `fk_companyId`) VALUES
(1, '2022-03-01', 1),
(2, '2022-03-02', 2),
(3, '2022-03-03', 3);

-- --------------------------------------------------------

--
-- Table structure for table `paymentMethod`
--

CREATE TABLE `paymentMethod` (
  `paymentId` int(11) NOT NULL,
  `fk_accountId` int(11) NOT NULL,
  `paymentMethod` char(30) NOT NULL,
  `verified` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymentMethod`
--

INSERT INTO `paymentMethod` (`paymentId`, `fk_accountId`, `paymentMethod`, `verified`) VALUES
(1, 1, 'Paypal', 'Yes'),
(2, 2, 'Credit Card', 'Yes'),
(3, 3, 'Prepaid Card', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `brand` char(30) NOT NULL,
  `productName` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `brand`, `productName`) VALUES
(1, 'Apple', 'iPhone 13'),
(2, 'Samsung', 'Galaxy S20'),
(3, 'Huawei', 'P90');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `shippingId` int(11) NOT NULL,
  `deliveryTime` int(11) NOT NULL,
  `fk_shippingCompanyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`shippingId`, `deliveryTime`, `fk_shippingCompanyId`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shippingCompany`
--

CREATE TABLE `shippingCompany` (
  `shippingCompanyId` int(11) NOT NULL,
  `shippingCompanyName` char(30) NOT NULL,
  `fk_companyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingCompany`
--

INSERT INTO `shippingCompany` (`shippingCompanyId`, `shippingCompanyName`, `fk_companyId`) VALUES
(1, 'Post', 1),
(2, 'DHL', 2),
(3, 'DPD', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shippingDetails`
--

CREATE TABLE `shippingDetails` (
  `shipppingDetailsId` int(11) NOT NULL,
  `fk_shippingId` int(11) NOT NULL,
  `shippingDate` date NOT NULL,
  `shippingMethod` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shippingDetails`
--

INSERT INTO `shippingDetails` (`shipppingDetailsId`, `fk_shippingId`, `shippingDate`, `shippingMethod`) VALUES
(1, 1, '2022-03-02', 'Express'),
(2, 2, '2022-03-03', 'Express'),
(3, 3, '2022-03-04', 'Standard');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountId`),
  ADD KEY `fk_customerId` (`fk_customerId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyId`),
  ADD KEY `fk_productId` (`fk_productId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `fk_shippingId` (`fk_shippingId`);

--
-- Indexes for table `famazon`
--
ALTER TABLE `famazon`
  ADD PRIMARY KEY (`famazonId`),
  ADD KEY `fk_customerId` (`fk_customerId`),
  ADD KEY `fk_productId` (`fk_productId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `fk_orderId` (`fk_orderId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `fk_companyId` (`fk_companyId`);

--
-- Indexes for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `fk_accountId` (`fk_accountId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shippingId`),
  ADD KEY `fk_shippingCompanyId` (`fk_shippingCompanyId`);

--
-- Indexes for table `shippingCompany`
--
ALTER TABLE `shippingCompany`
  ADD PRIMARY KEY (`shippingCompanyId`),
  ADD KEY `fk_companyId` (`fk_companyId`);

--
-- Indexes for table `shippingDetails`
--
ALTER TABLE `shippingDetails`
  ADD PRIMARY KEY (`shipppingDetailsId`),
  ADD KEY `fk_shippingId` (`fk_shippingId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shippingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shippingDetails`
--
ALTER TABLE `shippingDetails`
  MODIFY `shipppingDetailsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`fk_customerId`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_shippingId`) REFERENCES `shipping` (`shippingId`);

--
-- Constraints for table `famazon`
--
ALTER TABLE `famazon`
  ADD CONSTRAINT `famazon_ibfk_1` FOREIGN KEY (`fk_customerId`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `famazon_ibfk_2` FOREIGN KEY (`fk_productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_orderId`) REFERENCES `order` (`orderId`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_companyId`) REFERENCES `company` (`companyId`);

--
-- Constraints for table `paymentMethod`
--
ALTER TABLE `paymentMethod`
  ADD CONSTRAINT `paymentmethod_ibfk_1` FOREIGN KEY (`fk_accountId`) REFERENCES `account` (`accountId`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`fk_shippingCompanyId`) REFERENCES `shippingCompany` (`shippingCompanyId`);

--
-- Constraints for table `shippingCompany`
--
ALTER TABLE `shippingCompany`
  ADD CONSTRAINT `shippingcompany_ibfk_1` FOREIGN KEY (`fk_companyId`) REFERENCES `company` (`companyId`);

--
-- Constraints for table `shippingDetails`
--
ALTER TABLE `shippingDetails`
  ADD CONSTRAINT `shippingdetails_ibfk_1` FOREIGN KEY (`fk_shippingId`) REFERENCES `shipping` (`shippingId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
