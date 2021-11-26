-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2021 at 10:41 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeguru`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', '12344446', 'first post', '2021-10-13 22:29:03'),
(2, 'sachin', 'tes@gmail.com', '13465645', 'please i beg you\r\ntransfer the data to the database', NULL),
(3, 'sachin', 'tes@gmail.com', '123465778', 'this time i am sure this will work :)', '2021-10-13 23:51:45'),
(4, 'sachin sarma', 'sachin@gmail.com', '1122334455', 'hi there, this is a test message to test whether the sqlalchemy is working or not \r\nthank you!!\r\n\r\nYours Truly\r\nSachin', '2021-10-27 13:35:18'),
(5, 'sachin', 'tes@gmail.com', '123465', 'test before class name change', '2021-10-31 10:34:28'),
(6, 'sachin', 'jkasd@123', '80115656', 'hi this mail is to check the flask_mail module', '2021-11-10 13:02:42'),
(7, 'sachin', 'jkasd@123', '80115656', 'hi this mail is to check the flask_mail module', '2021-11-10 13:05:09'),
(8, 'sachin', 'sachin@gmail.com', '80115656', 'hi this message is to test weather the i cam send mail to any one or not', '2021-11-10 13:07:37'),
(9, 'sachin', 'jkasd@123', '80115656', 'hi again this one is to test again please dont bother to reply', '2021-11-10 13:11:45'),
(10, 'hi bro', 'tes@gmail.com', '', '', '2021-11-10 13:22:35'),
(11, 'sachin', 'tes@gmail.com', '13465645', 'sadasdsad', '2021-11-10 13:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `img` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `img`, `content`, `date`) VALUES
(2, 'Electric car', 'electric-car', 'https://upload.wikimedia.org/wikipedia/commons/b/bb/Nissan_Leaf_%26_Landglider_001.JPG', 'An electric car or battery electric car is an automobile that is propelled by one or more electric motors, using energy stored in batteries. Compared to internal combustion engine (ICE) vehicles, electric cars are quieter, have no exhaust emissions, and lower emissions overall.[1] In the United States and the European Union, as of 2020, the total cost of ownership of recent electric vehicles is cheaper than that of equivalent ICE cars, due to lower fueling and maintenance costs.[2][3] Charging an electric car can be done at a variety of charging stations; these charging stations can be installed in both houses and public areas.[4]\r\n\r\nOut of all cars sold in 2020, 4.6% were plug-in electric, and by the end of that year there were more than 10 million plug-in electric cars on the world\'s roads, according the International Energy Agency.[5] Despite rapid growth, only about 1% of cars on the world\'s roads were fully electric and plug-in hybrid cars by the end of 2020.[5] Many countries have established government incentives for plug-in electric vehicles, tax credits, subsidies, and other non-monetary incentives while several countries have legislated to phase-out sales of fossil fuel cars,[6][7] to reduce air pollution and limit climate change.[8]\r\n\r\nThe Tesla Model 3 became the world\'s all-time best-selling electric car in early 2020,[9] and in June 2021, became the first electric car to pass 1 million global sales.[10] Earlier models with widespread adoption include the Japanese Mitsubishi i-MiEV and the Nissan Leaf.', '2021-11-11 20:15:55'),
(3, 'Solar energy', 'solar-energy', 'https://www.build-review.com/wp-content/uploads/2021/02/solar-panels.jpg', 'Solar power is energy from the sun that is converted into thermal or electrical energy. Solar energy is the cleanest and most abundant renewable energy source available, and the U.S. has some of the richest solar resources in the world. Solar technologies can harness this energy for a variety of uses, including generating electricity, providing light or a comfortable interior environment, and heating water for domestic, commercial, or industrial use.', '2021-11-13 22:13:43'),
(4, 'Wind Energy', 'wind-energy', 'https://www.airswift.com/hubfs/wind%20turbines%20farm.jpg', 'Wind power is one of the fastest-growing renewable energy technologies. Usage is on the rise worldwide, in part because costs are falling. Global installed wind-generation capacity onshore and offshore has increased by a factor of almost 75 in the past two decades, jumping from 7.5 gigawatts (GW) in 1997 to some 564 GW by 2018, according to IRENA\'s latest data. Production of wind electricity doubled between 2009 and 2013, and in 2016 wind energy accounted for 16% of the electricity generated by renewables. Many parts of the world have strong wind speeds, but the best locations for generating wind power are sometimes remote ones. Offshore wind power offers tremendous potential.', '2021-11-17 14:29:35'),
(5, 'Tidal Energy', 'tidal-energy', 'https://www.altenergymag.com/images/upload/images/Depositphotos_7245369_s-2019.jpg', 'Tidal energy is a form of hydropower that converts energy obtained from tides into useful forms of power, such as electricity.  Tides are created by the gravitational effect of the moon and the sun on the earth causing cyclical movement of the seas.  One of the strengths of harnessing power from tidal ranges and tidal streams over other forms of renewable energy is that the process is entirely predictable.  \r\n \r\nTidal range technologies make use of the vertical difference in height between high tide and low tide.  Projects take the form of tidal barrages or lagoons that use turbines in the barrier or lagoon to generate electricity as the tide floods into a reservoir.   When the tide outside the barrier recedes the water retained can then be released through turbines, which generates electricity.', '2021-11-19 14:54:40'),
(6, 'Hydrogen Fuel', 'hydrogen-fuel', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hydrogen-cars-1598551533.jpg', 'Hydrogen is a clean fuel that, when consumed in a fuel cell, produces only water. Hydrogen can be produced from a variety of domestic resources, such as natural gas, nuclear power, biomass, and renewable power like solar and wind. These qualities make it an attractive fuel option for transportation and electricity generation applications. It can be used in cars, in houses, for portable power, and in many more applications.', '2021-11-25 18:48:10'),
(8, 'Hybrid electric vehicles', 'hybrid-car', 'https://mechanicalboost.com/wp-content/uploads/2021/03/hybrid-car.jpg', 'Hybrid electric vehicles are powered by an internal combustion engine and an electric motor, which uses energy stored in batteries. A hybrid electric vehicle cannot be plugged in to charge the battery. Instead, the battery is charged through regenerative braking and by the internal combustion engine. The extra power provided by the electric motor can potentially allow for a smaller engine. The battery can also power auxiliary loads and reduce engine idling when stopped. Together, these features result in better fuel economy without sacrificing performance', '2021-11-25 18:53:01'),
(9, 'Alternative Fuels', 'alternative-fuel', 'https://www.ciiblog.in/wp-content/uploads/2019/05/Blog_Alternative_Fuel_1.jpg', 'More than a dozen alternative fuels are in production or under development for use in alternative fuel vehicles and advanced technology vehicles. Government and private-sector vehicle fleets are the primary users for most of these fuels and vehicles, but individual consumers are increasingly interested in them. Using alternative fuels and advanced vehicles instead of conventional fuels and vehicles helps the United States conserve fuel and lower vehicle emissions.', '2021-11-25 21:38:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
