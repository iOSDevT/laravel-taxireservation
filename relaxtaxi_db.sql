-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 07, 2019 at 10:30 AM
-- Server version: 10.1.40-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.3.7-2+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `relaxtaxi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 'demo@relaxtaxi.me', NULL, '$2y$10$aJyz3Mevf3zxpFeqwXyYZetJ0AK9s0fYIkJ2J5MzmLao9hs70wDcq', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_password_resets`
--

CREATE TABLE `account_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `picture`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tranxit', 'admin@relaxtaxi.me', '$2y$10$stAsPdk..8ofY401a.lU4.QIooxIaIqbT1nLQez9V9fsKQpwJMLMi', NULL, 0, NULL, NULL, '2019-08-05 08:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `apps_countries`
--

CREATE TABLE `apps_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `apps_countries`
--

INSERT INTO `apps_countries` (`id`, `country_code`, `country_name`, `created_at`, `updated_at`) VALUES
(122, 'LB', 'Lebanon', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_four` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('up','pu') COLLATE utf8_unicode_ci NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pushes`
--

CREATE TABLE `custom_pushes` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_to` enum('ALL','USERS','PROVIDERS') COLLATE utf8_unicode_ci NOT NULL,
  `condition` enum('ACTIVE','LOCATION','RIDES','AMOUNT','INSTANT','ALL') COLLATE utf8_unicode_ci NOT NULL,
  `condition_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent_to` int(11) NOT NULL DEFAULT '0',
  `schedule_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_pushes`
--

INSERT INTO `custom_pushes` (`id`, `send_to`, `condition`, `condition_data`, `message`, `sent_to`, `schedule_at`, `created_at`, `updated_at`) VALUES
(1, 'ALL', 'ACTIVE', NULL, 'test122', 0, NULL, '2019-08-03 18:08:51', '2019-08-03 18:08:51'),
(2, 'ALL', 'ACTIVE', NULL, 'test12', 0, NULL, '2019-08-03 18:09:22', '2019-08-03 18:09:22'),
(3, 'ALL', 'ACTIVE', NULL, 'test', 0, NULL, '2019-08-03 18:10:07', '2019-08-03 18:10:07'),
(4, 'USERS', 'ALL', NULL, 'kkk', 0, NULL, '2019-08-03 18:10:21', '2019-08-03 18:10:21'),
(5, 'ALL', 'ACTIVE', NULL, '123', 0, NULL, '2019-08-03 18:10:45', '2019-08-03 18:10:45'),
(6, 'ALL', 'ACTIVE', NULL, 'mmm', 0, NULL, '2019-08-03 21:41:56', '2019-08-03 21:41:56'),
(7, 'ALL', 'ACTIVE', NULL, 'm', 0, NULL, '2019-08-03 21:42:15', '2019-08-03 21:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `dispatchers`
--

CREATE TABLE `dispatchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dispatchers`
--

INSERT INTO `dispatchers` (`id`, `name`, `email`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 'demo@relaxtaxi.me', NULL, '$2y$10$4434Z.drZvqyT7MwzJ/EUea1OKEpYJOFiFaZPc2P1YTOcYbL40u0q', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher_password_resets`
--

CREATE TABLE `dispatcher_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('DRIVER','VEHICLE') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Driving Licence', 'DRIVER', NULL, NULL),
(2, 'Bank Passbook', 'DRIVER', NULL, NULL),
(3, 'Joining Form', 'DRIVER', NULL, NULL),
(4, 'Work Permit', 'DRIVER', NULL, NULL),
(5, 'Registration Certificate', 'VEHICLE', NULL, NULL),
(6, 'Insurance Certificate', 'VEHICLE', NULL, NULL),
(7, 'Fitness Certificate', 'VEHICLE', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `favourite_locations`
--

CREATE TABLE `favourite_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `type` enum('home','work','recent','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'others',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favourite_locations`
--

INSERT INTO `favourite_locations` (`id`, `user_id`, `address`, `latitude`, `longitude`, `type`, `created_at`, `updated_at`) VALUES
(1, 113, 'Guindy Metro Rail Station, Guindy Flyover, Race View Colony, Guindy, Chennai, Tamil Nadu 600032, India', 13.00920632, 80.21316480, 'home', '2019-07-23 13:12:36', '2019-07-23 13:12:36'),
(2, 113, 'Vadapalani, Chennai, Tamil Nadu, India', 13.04997110, 80.21213060, 'work', '2019-07-23 13:13:01', '2019-07-23 13:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `fleets`
--

CREATE TABLE `fleets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fleets`
--

INSERT INTO `fleets` (`id`, `name`, `email`, `password`, `company`, `mobile`, `otp`, `logo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo', 'demo@relaxtaxi.me', '$2y$10$Ehvyz/AfMdcokeyFFiyCQuGjVvrdu3HHEf9UW4ErmIpwEiIHwdcqy', NULL, NULL, NULL, NULL, 't2w1VHI91756J9zwsYWZoUKFyX7sJ2RiWSCTSnivCNv5jWWOAqLJSUIMv1Mg', NULL, '2019-07-23 10:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `fleet_devices`
--

CREATE TABLE `fleet_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `fleet_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fleet_password_resets`
--

CREATE TABLE `fleet_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fleet_vehicles`
--

CREATE TABLE `fleet_vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `fleet_id` int(11) DEFAULT NULL,
  `vehicle_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geo_fencings`
--

CREATE TABLE `geo_fencings` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ranges` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `geo_fencings`
--

INSERT INTO `geo_fencings` (`id`, `city_name`, `ranges`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Lebanon', '[{\"lat\":\"34.687241\",\"lng\":\"35.892429\"},{\"lat\":\"34.736912\",\"lng\":\"36.546115\"},{\"lat\":\"34.202528\",\"lng\":\"36.804294\"},{\"lat\":\"33.344106\",\"lng\":\"35.991306\"},{\"lat\":\"33.045317\",\"lng\":\"35.529880\"},{\"lat\":\"33.026897\",\"lng\":\"35.420017\"},{\"lat\":\"33.091351\",\"lng\":\"35.019016\"},{\"lat\":\"34.411254\",\"lng\":\"35.546359\"}]', '2019-07-20 01:36:46', '2019-07-20 01:36:46', NULL),
(3, 'India', '[{\"lat\":\"21.837519\",\"lng\":\"69.688180\"},{\"lat\":\"25.141788\",\"lng\":\"68.457711\"},{\"lat\":\"29.206342\",\"lng\":\"73.906930\"},{\"lat\":\"31.631387\",\"lng\":\"75.488961\"},{\"lat\":\"30.804593\",\"lng\":\"80.147164\"},{\"lat\":\"27.504846\",\"lng\":\"83.574899\"},{\"lat\":\"25.538956\",\"lng\":\"89.287789\"},{\"lat\":\"23.055962\",\"lng\":\"89.815133\"},{\"lat\":\"20.937312\",\"lng\":\"88.233102\"},{\"lat\":\"18.121300\",\"lng\":\"83.399118\"},{\"lat\":\"15.598155\",\"lng\":\"81.201852\"},{\"lat\":\"11.669973\",\"lng\":\"79.707711\"},{\"lat\":\"10.029963\",\"lng\":\"79.444039\"},{\"lat\":\"8.120668\",\"lng\":\"78.916696\"},{\"lat\":\"8.033649\",\"lng\":\"77.158883\"},{\"lat\":\"10.980543\",\"lng\":\"75.225289\"},{\"lat\":\"16.274253\",\"lng\":\"73.643258\"},{\"lat\":\"18.871448\",\"lng\":\"71.533883\"}]', '2019-07-23 13:19:55', '2019-07-23 13:21:00', NULL),
(4, 'jounieh', '[{\"lat\":\"34.057735\",\"lng\":\"35.644481\"},{\"lat\":\"34.032701\",\"lng\":\"35.754344\"},{\"lat\":\"33.939328\",\"lng\":\"35.754344\"},{\"lat\":\"33.886903\",\"lng\":\"35.671946\"},{\"lat\":\"33.943885\",\"lng\":\"35.617015\"}]', '2019-07-24 15:36:52', '2019-07-24 15:36:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2015_08_25_172600_create_settings_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2017_01_11_180503_create_admins_table', 1),
(11, '2017_01_11_180511_create_providers_table', 1),
(12, '2017_01_11_181312_create_cards_table', 1),
(13, '2017_01_11_181357_create_chats_table', 1),
(14, '2017_01_11_181558_create_promocodes_table', 1),
(15, '2017_01_11_182454_create_provider_documents_table', 1),
(16, '2017_01_11_182536_create_provider_services_table', 1),
(17, '2017_01_11_182649_create_user_requests_table', 1),
(18, '2017_01_11_182717_create_request_filters_table', 1),
(19, '2017_01_11_182738_create_service_types_table', 1),
(20, '2017_01_25_172422_create_documents_table', 1),
(21, '2017_01_31_122021_create_provider_devices_table', 1),
(22, '2017_02_02_192703_create_user_request_ratings_table', 1),
(23, '2017_02_06_080124_create_user_request_payments_table', 1),
(24, '2017_02_14_135859_create_provider_profiles_table', 1),
(25, '2017_02_21_131429_create_promocode_usages_table', 1),
(26, '2017_06_07_045207_add_social_login_to_providers_tables', 1),
(27, '2017_06_17_151030_create_dispatchers_table', 1),
(28, '2017_06_17_151031_create_dispatcher_password_resets_table', 1),
(29, '2017_06_17_151145_create_fleets_table', 1),
(30, '2017_06_17_151146_create_fleet_password_resets_table', 1),
(31, '2017_06_17_151150_add_fleet_to_providers_table', 1),
(32, '2017_06_19_130022_add_booking_id_to_user_request', 1),
(33, '2017_06_19_155736_add_cancel_reason_to_user_request', 1),
(34, '2017_06_20_154148_create_accounts_table', 1),
(35, '2017_06_20_154149_create_account_password_resets_table', 1),
(36, '2017_08_03_194354_create_custom_pushes_table', 1),
(37, '2017_09_01_190333_create_wallet_passbooks_table', 1),
(38, '2017_09_01_190355_create_promocode_passbooks_table', 1),
(39, '2017_09_15_145235_add_travel_tracking_distance_to_user_requests_table', 1),
(40, '2017_09_15_152718_add_provider_payments_to_user_request_payments_table', 1),
(41, '2017_09_19_104042_add_genders_to_providers_table', 1),
(42, '2017_09_19_104042_add_genders_to_users_table', 1),
(43, '2017_09_26_144027_add_travel_time_to_user_requests_table', 1),
(44, '2017_09_26_160101_create_favourite_locations_table', 1),
(45, '2018_04_20_114546_create_package_types_table', 1),
(46, '2018_04_28_175507_add_minute_to_user_request_payments', 1),
(47, '2018_05_19_200255_change_user_requests_otp_to_nullable', 1),
(48, '2018_05_21_151900_CreateRoles', 1),
(49, '2018_05_30_195122_CreateRolePermissions', 1),
(50, '2018_06_13_152724_CreateUserDevices', 1),
(51, '2018_06_28_182145_create_times_table', 1),
(52, '2018_06_28_194415_create_time_prices_table', 1),
(53, '2018_06_29_174517_create_works_table', 1),
(54, '2018_08_28_163357_create_geo_fencing_table', 1),
(55, '2018_08_28_201840_create_service_types_geo_fencing_table', 1),
(56, '2018_08_29_142916_add_servicetype_geo_to_service_types_geo_fencings', 1),
(57, '2018_08_30_161632_add_geo_fencing_detail_to_user_requests_table', 1),
(58, '2018_08_30_185807_add_geo_fencing_total_to_user_request_payments_table', 1),
(59, '2018_08_30_202513_add_geo_fencing_time_to_user_requests_table', 1),
(60, '2018_08_30_220233_add_geo_fencing_time_to_user_request_payments_table', 1),
(61, '2018_09_01_121937_add_emergency_to_users_table', 1),
(62, '2018_09_01_122141_add_emergency_to_providers_table', 1),
(63, '2018_09_01_124136_add_current_to_provider_devices_table', 1),
(64, '2018_09_01_124808_UpdateUsersProvider', 1),
(65, '2018_09_01_134217_add_current_to_user_devices_table', 1),
(66, '2018_09_03_201928_UpdateServiceNightFare', 1),
(67, '2018_09_03_210841_UpdateUserPaymentsNightFare', 1),
(68, '2018_09_04_140250_create_apps_countries_table', 1),
(69, '2018_09_11_184149_add_non_geo_price_to_service_types_geo_fencings_table', 1),
(70, '2018_09_11_200525_add_non_geo_price_to_user_request_payments_table', 1),
(71, '2018_09_11_201211_add_between_km_to_service_types_table', 1),
(72, '2018_09_11_212042_add_return_travel_fare_to_user_request_payments_table', 1),
(73, '2018_09_11_225950_add_city_limits_to_service_types_geo_fencings_table', 1),
(74, '2018_10_27_181057_UpdateUserRequestsSchedule', 1),
(75, '2018_10_29_130149_UpdateScheduleStatusUserrequest', 1),
(76, '2018_11_12_141246_UpdatePeakTimeToServiceTypeTable', 1),
(77, '2018_11_15_123957_UpdateInstantrideOptionToUserrequests', 1),
(78, '2018_11_16_211605_UpdateSoftdeleteUser', 1),
(79, '2018_11_16_215953_UpdateSoftdeleteProvider', 1),
(80, '2018_12_07_160633_UpdateServiceTypeRoundtrip', 1),
(81, '2018_12_07_180013_UpdateUserRequestsInvoice', 1),
(82, '2018_12_11_205518_UpdateUserRequestBroadcastingfield', 1),
(83, '2018_12_17_173159_create_fleet_devices_table', 1),
(84, '2018_12_17_181722_update_fleet', 1),
(85, '2018_12_18_130141_create_fleet_vehicles_table', 1),
(86, '2018_12_18_184216_update_fleet_vehicle', 1),
(87, '2018_12_26_171029_UpdateProviderServiceStatusHold', 1),
(88, '2018_12_27_180109_UpdateVoiptokenFieldProviderdevice', 1),
(89, '2019_01_21_151900_create_service_rental_hour_packages_table', 1),
(90, '2019_01_21_171552_UpdateRentalHourKmPriceserviceType', 1),
(91, '2019_01_23_113709_UpdatePromocodeAddUsedCountAndFromDate', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('019d8efbfb31b88e6c9da8031455bad88a704f3cc80a7b23fef996263ca10330a43893c0a7a4d8b1', 128, 2, NULL, '[]', 0, '2019-07-30 09:24:14', '2019-07-30 09:24:14', '2019-08-14 11:24:14'),
('064452c0c06825f6b4e97fe35af1fc035908dc03ca24f16e44ca398a75e19248a032798a15a1f467', 127, 2, NULL, '[]', 0, '2019-07-29 09:52:44', '2019-07-29 09:52:44', '2019-08-13 11:52:44'),
('06e0ffc41decd482ef2939c0f87deecfa3996a8af4f6dabdd38451c1ea87cec1a88fe7c7aada81d8', 123, 2, NULL, '[]', 0, '2019-07-27 11:56:03', '2019-07-27 11:56:03', '2019-08-11 13:56:03'),
('09618b873d6fdf6c6fda1d43f939f09ef1d37d5764870d41d8eaf9ea35c1f11f4eb070a65cabb495', 128, 2, NULL, '[]', 0, '2019-07-30 14:58:17', '2019-07-30 14:58:17', '2019-08-14 16:58:16'),
('09c3f26e8422edfe264267f3d61e8e19b3119bb6aa2faa931317723dab77e442fd10b9340f10c7bd', 123, 2, NULL, '[]', 0, '2019-07-25 18:39:26', '2019-07-25 18:39:26', '2019-08-09 20:39:26'),
('0c889d991d784db68e991d736e10dbece094bf307c4508e47f9fea8e00a18135f8a26e9948c8fc8f', 108, 2, NULL, '[]', 0, '2019-07-22 10:18:58', '2019-07-22 10:18:58', '2019-08-06 12:18:58'),
('0cee5ecacab61be341fb23693d22d59f7115ad2f44fdfb1d47d0841ff7058a077a4a4f55f36eeefb', 123, 2, NULL, '[]', 0, '2019-07-29 20:46:50', '2019-07-29 20:46:50', '2019-08-13 22:46:50'),
('0fdf1f656f9e77ad6f6605c5b0071e94f302930de0ac1d61f01ba077d660d685e72956e6ad6a90e7', 128, 1, 'My APP', '[]', 0, '2019-07-30 08:02:58', '2019-07-30 08:02:58', '2029-07-30 10:02:58'),
('102fc616ed0f15faeed5eebbbc51d471e04bbb454e25955b6680e2e1c822b313f0f32b164a5c5937', 123, 2, NULL, '[]', 0, '2019-07-25 15:47:08', '2019-07-25 15:47:08', '2019-08-09 17:47:08'),
('1187f27d4263afae76addb75f2a9821b600671fddbd77fc97772eceb7d4512e18ad884e332e8d514', 121, 1, 'My APP', '[]', 0, '2019-07-24 00:14:25', '2019-07-24 00:14:25', '2029-07-24 02:14:25'),
('126b0d2c5e3c9c14ee5d53d278810fee3e25d6434a1116f376f5567900a16b07279cf56798723f8e', 131, 2, NULL, '[]', 0, '2019-08-02 15:33:16', '2019-08-02 15:33:16', '2019-08-17 17:33:16'),
('12f7fcbb9ad5a980a659e6bfd9a05658e9fdf574b0dd2709c8fe8eabf70f455bf57fd4927da20d6a', 126, 1, 'My APP', '[]', 0, '2019-07-27 12:50:28', '2019-07-27 12:50:28', '2029-07-27 14:50:28'),
('1430378d0a39b92d4694df61cc73bcc0ab16db24d65ebff74ee5c1a70e910e796595d0a03def494a', 106, 1, 'My APP', '[]', 0, '2019-07-20 02:51:27', '2019-07-20 02:51:27', '2029-07-20 04:51:27'),
('15a0ec4d1692e270623495caec3b6094be8341a70128328025e92235d4dec16894060c4231d43835', 139, 2, NULL, '[]', 0, '2019-08-03 09:43:29', '2019-08-03 09:43:29', '2019-08-18 11:43:29'),
('1969a8a1be117f667181b543732c762a8c9bc9bfc6e27c904a5b9008a1b0131e1680c8fbd1f11f1b', 117, 1, 'My APP', '[]', 0, '2019-07-23 23:38:19', '2019-07-23 23:38:19', '2029-07-24 01:38:19'),
('1c125e0529f36102b5975682d708d9a400952e4a7c3bd7a911b7d781680906024f5e08514f105936', 143, 1, 'My APP', '[]', 0, '2019-08-06 14:15:51', '2019-08-06 14:15:51', '2029-08-06 16:15:51'),
('1e94d4e02abafa58054d20b6e887efe1fbb3b84e99d89a0b8d5f9b40b0202f9d4450e4471e7d93d4', 118, 1, 'My APP', '[]', 0, '2019-07-23 23:41:32', '2019-07-23 23:41:32', '2029-07-24 01:41:32'),
('1ebcba8a6c8f15b1219aa01cde407fa5bb06f2706a1ba959925af093f9acf64c164d190a6364feb8', 123, 2, NULL, '[]', 0, '2019-07-29 09:13:39', '2019-07-29 09:13:39', '2019-08-13 11:13:39'),
('25c8584dc916a703c2efeb6bf801b45299a55464438505d60db9af0136e1eb51fdaba8e00e910d0e', 123, 2, NULL, '[]', 0, '2019-07-26 09:48:36', '2019-07-26 09:48:36', '2019-08-10 11:48:36'),
('2760cf02d3b5ba493a0b55630a544a3a4a173ca2b1e2aa67e3a7900355d21ed16e78058e07c46c51', 123, 2, NULL, '[]', 0, '2019-07-25 12:46:12', '2019-07-25 12:46:12', '2019-08-09 14:46:12'),
('2bf31a308b5455b668e10b19d7e920c18e3585816bf7dbb46891165807d98980b225cd5989916e7a', 108, 2, NULL, '[]', 0, '2019-07-22 01:05:46', '2019-07-22 01:05:46', '2019-08-06 03:05:46'),
('2d30070588b8811d15b465267f10638498d726c0c11ae46f48484df439fe107052efba94a350c641', 127, 1, 'My APP', '[]', 0, '2019-07-29 08:08:57', '2019-07-29 08:08:57', '2029-07-29 10:08:57'),
('2e946aa72f0192d44329aadfc4083529478064258a21acd58607024db0ac2ed141615073b3f0f507', 131, 2, NULL, '[]', 0, '2019-08-02 15:42:05', '2019-08-02 15:42:05', '2019-08-17 17:42:05'),
('2eaab4bfc0094efc7e6c31927fb30f3e42c2f0a2804e213a6e3f605e7b43a84993403699da9dd879', 108, 2, NULL, '[]', 0, '2019-07-23 09:47:14', '2019-07-23 09:47:14', '2019-08-07 11:47:14'),
('34140b67b8a0f3ab5d6fcf543b3c3fde5b51e1d8caead33b65cc78ddd2bf0a0ecee5d5e1586a48d9', 123, 2, NULL, '[]', 0, '2019-07-25 12:34:46', '2019-07-25 12:34:46', '2019-08-09 14:34:46'),
('343919741b45317cc0aeea5f6907fc4a1bd079cc63f31001b46a04c0e3df9d50ea6df04041a26aec', 108, 2, NULL, '[]', 0, '2019-07-22 01:13:48', '2019-07-22 01:13:48', '2019-08-06 03:13:48'),
('35bd8885815f7d89412f487d007083063d00e5b0bef03ade637f26c2fe45e430fb84c740d8f75dc5', 107, 1, 'My APP', '[]', 0, '2019-07-20 10:51:57', '2019-07-20 10:51:57', '2029-07-20 12:51:57'),
('35eeeedfa905e81436778274f8472486d23d2071b7793cdd219e57704687b7cb09fd780c4c57a3d6', 123, 2, NULL, '[]', 0, '2019-07-30 00:11:50', '2019-07-30 00:11:50', '2019-08-14 02:11:50'),
('3d93f5b61a680d58733b7e339cca4af86af819cf001b8fe3da021c27f44aecb13f1bf7d6e5d954b9', 128, 2, NULL, '[]', 0, '2019-07-30 15:00:19', '2019-07-30 15:00:19', '2019-08-14 17:00:19'),
('41416357b9aea74abc7d5518006e3f1fd59ed1f6a169290c9277e1fd3fa2dae2868f5e1f95f83ad5', 123, 2, NULL, '[]', 0, '2019-07-24 12:47:04', '2019-07-24 12:47:04', '2019-08-08 14:47:04'),
('46c094397f612e39fdf0e3f527ed63c7f1f02cf895339e616f38280ae50d7d5abbfc5815479e2d4c', 104, 1, 'My APP', '[]', 0, '2019-07-20 02:08:22', '2019-07-20 02:08:22', '2029-07-20 04:08:22'),
('49d6491951bc4996599aaac95430292ea5b363402130e65fd95555d79e48bfa14a0e94051fd51013', 128, 2, NULL, '[]', 0, '2019-07-30 15:43:46', '2019-07-30 15:43:46', '2019-08-14 17:43:46'),
('4e8a1a9b78909f53eee3692b316c8375cc1a4ce75a7e34a700099132299952beb9896847b343f64c', 128, 2, NULL, '[]', 0, '2019-07-30 15:30:08', '2019-07-30 15:30:08', '2019-08-14 17:30:08'),
('4e8d783fca2c6a316bdcdaa06179b8c71976d82a72d1683cc44d5056fe68b9d880dbe4988c121fd8', 107, 2, NULL, '[]', 0, '2019-07-21 21:03:51', '2019-07-21 21:03:51', '2019-08-05 23:03:51'),
('57be6e8841d9ffd53ea758024ac3ea4e8c459ffb273e3dc98c592f6788d5f5e9053cb7d88a71d0c9', 124, 1, 'My APP', '[]', 0, '2019-07-24 08:14:12', '2019-07-24 08:14:12', '2029-07-24 10:14:12'),
('5e464d2484c1a424301405612030da63eae9dba37008a66edd052d204caa86dfafab79f1d5ec91ec', 123, 2, NULL, '[]', 0, '2019-07-26 19:16:43', '2019-07-26 19:16:43', '2019-08-10 21:16:43'),
('6b4c950838bb39d7f15a089706bdae4fb0afdf38ad1e0aa55d6d17e9aef35df65abc61c5027f5fda', 123, 2, NULL, '[]', 0, '2019-07-25 22:09:52', '2019-07-25 22:09:52', '2019-08-10 00:09:52'),
('6c4913c2edf4e69cff5f78eeb87f06a06e413360a33081c60d3bfe6ee89395a99064b43c5c4196ef', 139, 2, NULL, '[]', 0, '2019-08-03 00:46:00', '2019-08-03 00:46:00', '2019-08-18 02:46:00'),
('707eff30e7f3a26843ed38a5e122e573e3c749133f5ab91cfa04df51808a17f47ff20622b5f34112', 123, 2, NULL, '[]', 0, '2019-07-25 15:17:51', '2019-07-25 15:17:51', '2019-08-09 17:17:51'),
('70df306e26cd7fccc282777f46b044c593da94c0ac64cf1141a8004462220c8130e312fb9e0aa822', 134, 1, 'My APP', '[]', 0, '2019-08-01 20:57:54', '2019-08-01 20:57:54', '2029-08-01 22:57:54'),
('70e0e72fcb05b42f29381fc4c519d8611b4ac3ecb7eaa7d4868a435bf9abd341c1cebc329a7e8f56', 122, 1, 'My APP', '[]', 0, '2019-07-24 00:19:13', '2019-07-24 00:19:13', '2029-07-24 02:19:13'),
('735bee9dc901fbb96370cb5ef7d8c48375b44c98d468a9f7c9ab599d6dd58b8bb42bea7907a0878f', 108, 2, NULL, '[]', 0, '2019-07-22 10:31:01', '2019-07-22 10:31:01', '2019-08-06 12:31:01'),
('7493c0392b58a067e30c423da723e5edc9af798045642880755ee4b45b096a0c4788bdc63e9614b3', 108, 2, NULL, '[]', 0, '2019-07-23 16:34:04', '2019-07-23 16:34:04', '2019-08-07 18:34:04'),
('797ac31f1cd0d9a069fed7c6ac89dfd55d5851a8f902d25fb2c629178e7cb1cfce0db9ac582bf2b3', 127, 2, NULL, '[]', 0, '2019-07-29 09:56:52', '2019-07-29 09:56:52', '2019-08-13 11:56:52'),
('7cb634771aefeac2ef57e1b5d34c56d4efa9500eb62c73e60f8ccbf06bee2d0527a9397977d8ccfd', 139, 2, NULL, '[]', 0, '2019-08-03 18:09:46', '2019-08-03 18:09:46', '2019-08-18 20:09:46'),
('7d1fc019798e41f81811bb83b60c446561ec443c53bc08b4588fc20f71fdf5eb5b096ab4266e7812', 108, 2, NULL, '[]', 0, '2019-07-23 11:40:05', '2019-07-23 11:40:05', '2019-08-07 13:40:05'),
('826f4048cf737c1787720f4d020e5b2d73cde2b5106279ac9fae048bb8d46b22f9740d4ddc527c7e', 123, 2, NULL, '[]', 0, '2019-07-26 22:46:31', '2019-07-26 22:46:31', '2019-08-11 00:46:31'),
('858b66327836336187202133b44e0e8039a97b9228ad7de3226e0ef2cb1598c48bc122312c1a5885', 139, 2, NULL, '[]', 0, '2019-08-03 00:24:02', '2019-08-03 00:24:02', '2019-08-18 02:24:02'),
('88f621c0f2e34e8e39bb381f9fa2e7686fa7869ab6e7352ea909045aee2b2f7aab3f74f3f00c3e8f', 123, 1, 'My APP', '[]', 0, '2019-07-24 00:21:55', '2019-07-24 00:21:55', '2029-07-24 02:21:55'),
('8befa8bd800195f22fbc927b9a187c1945bcea6c3c0b02b3f7e9f2734db5b383363c8e4df5465f70', 108, 1, 'My APP', '[]', 0, '2019-07-21 22:22:15', '2019-07-21 22:22:15', '2029-07-22 00:22:15'),
('8d2fc33941031039945aa99dee68de92474d27a2e85ad74c3d3895ee5a1872ea41ea725c974a82cc', 123, 2, NULL, '[]', 0, '2019-07-25 10:35:14', '2019-07-25 10:35:14', '2019-08-09 12:35:14'),
('904490e25235c536548b1eb36ecb212cdb86d2f5aaf5ba2f558c72500345cf6ec55a1f1a748b5c68', 139, 1, 'My APP', '[]', 0, '2019-08-02 18:57:39', '2019-08-02 18:57:39', '2029-08-02 20:57:39'),
('95534b82ff31a2dc84d0097e40b56dde68785da8ec43a182fe3f9f4454b0f8a6117c0a9001de9905', 107, 2, NULL, '[]', 0, '2019-07-21 00:45:32', '2019-07-21 00:45:32', '2019-08-05 02:45:32'),
('96022d51123d9df26085f6a8a0169facaba20e11487a67fd58cd7a986b43232eb2a56a4531e70df4', 141, 1, 'My APP', '[]', 0, '2019-08-05 12:21:08', '2019-08-05 12:21:08', '2029-08-05 14:21:08'),
('9870c62f5be166b761821fdeb17ce165b7358e78accaedb5a267d3f3985c475c6f406a9adde5ea27', 123, 2, NULL, '[]', 0, '2019-07-24 14:16:18', '2019-07-24 14:16:18', '2019-08-08 16:16:18'),
('9ad106f45a9bf848838860f437f0a6e8d787e4d36822e8bf8fb7f72c74296e73d4c71f3eac219ead', 123, 2, NULL, '[]', 0, '2019-07-29 09:10:36', '2019-07-29 09:10:36', '2019-08-13 11:10:36'),
('9c54bb8b4bc380aaae47c362324b293ef182fb6086c596b6b663957e7ff07c2187f75a6174d6ac52', 123, 2, NULL, '[]', 0, '2019-07-27 10:17:27', '2019-07-27 10:17:27', '2019-08-11 12:17:27'),
('a2e0359a0fbde18d4da8d5271c8d4a8952156ba20f5738642ff3ff058a44133206a34b4fee7ed8bb', 133, 1, 'My APP', '[]', 0, '2019-08-01 20:55:27', '2019-08-01 20:55:27', '2029-08-01 22:55:27'),
('a6ea95769c467dda71b478eb2113e25cd210c44469d6b05486f077e4dc6434ebb14d27a9f7c5fa3e', 128, 2, NULL, '[]', 0, '2019-07-31 17:15:09', '2019-07-31 17:15:09', '2019-08-15 19:15:09'),
('a7491cbe4217dab483f385f077e3dd4bcfad2e06bafed8666fac8a10289dee977afb7f9c3d8257a0', 130, 1, 'My APP', '[]', 0, '2019-08-01 16:52:20', '2019-08-01 16:52:20', '2029-08-01 18:52:20'),
('a7c7f5a0a311ed4ab880b2b36aad9993d0512d384fc1cdb83df2b64d1aae8296bc4e95af228754dc', 123, 2, NULL, '[]', 0, '2019-07-25 17:47:54', '2019-07-25 17:47:54', '2019-08-09 19:47:54'),
('a8e8eb7b196dcd3451f54438087043ba53a6d54e087db02de733bc8c6e602d2bbb4b94114ca23740', 108, 2, NULL, '[]', 0, '2019-07-23 15:14:33', '2019-07-23 15:14:33', '2019-08-07 17:14:33'),
('a9ddbdb6651c8b70bcb26a54a8fb134495d38e229556b34b7b9f6e459fc6a8d8fa15521070213877', 131, 2, NULL, '[]', 0, '2019-08-02 16:22:16', '2019-08-02 16:22:16', '2019-08-17 18:22:16'),
('aaf941bbed4ff73005ec41aa336f6a491a4ec992bb0ece08d35dbf5d4813c241c2c5968a0b9b3f62', 123, 2, NULL, '[]', 0, '2019-07-29 18:45:54', '2019-07-29 18:45:54', '2019-08-13 20:45:54'),
('ab10323cfdc15d1b04c059eb891ec426f4730725cba10f5ca0caf65e87e463270f481b1ad72dc6c8', 108, 2, NULL, '[]', 0, '2019-07-22 10:51:15', '2019-07-22 10:51:15', '2019-08-06 12:51:15'),
('abf6b9a596c66f23c2e2c39d21e7616e3df16da1768663d1d3fd6f2c78b862e81a1158dda7640559', 119, 1, 'My APP', '[]', 0, '2019-07-23 23:58:32', '2019-07-23 23:58:32', '2029-07-24 01:58:32'),
('adc63a08fee0cd2ebf5c68c21dd65bd6fd117d70c13b6a0ed9e3d970f99bf98b41df485afd2111e7', 132, 1, 'My APP', '[]', 0, '2019-08-01 18:56:23', '2019-08-01 18:56:23', '2029-08-01 20:56:23'),
('afec22beffac17c43b306397022b0e9e1ef5e4398a49d5338539881049266ec801eb633e40dfbbe6', 120, 1, 'My APP', '[]', 0, '2019-07-24 00:02:16', '2019-07-24 00:02:16', '2029-07-24 02:02:16'),
('b0446127d256512ae065173f1ea2105e379911dfd0e03095bbc4f741012d6f385c4703038b8297ed', 142, 1, 'My APP', '[]', 0, '2019-08-05 13:02:56', '2019-08-05 13:02:56', '2029-08-05 15:02:56'),
('b4807b33886b7203fae94519706b71833d936f9431585108b4dcbf20fc211c74b0d7d2faac998804', 131, 2, NULL, '[]', 0, '2019-08-02 15:34:51', '2019-08-02 15:34:51', '2019-08-17 17:34:51'),
('b9bc8a3d5e205d58c283117c858b429eccfb5606ff039241f5853b09e76a26b814ed8b3213d81735', 128, 2, NULL, '[]', 0, '2019-07-31 17:25:18', '2019-07-31 17:25:18', '2019-08-15 19:25:18'),
('bf700f84527a036c2d8a08145bdef48470bf7254706a5a8cb7fe97b9d9ff3e49c9f35af76b50bb70', 108, 2, NULL, '[]', 0, '2019-07-22 00:54:05', '2019-07-22 00:54:05', '2019-08-06 02:54:05'),
('c0221ba712044ef50c675795076d62d3a97e11b454bdcfa476660e5c1326aadef933aa4727e8f6fb', 107, 2, NULL, '[]', 0, '2019-07-21 21:17:08', '2019-07-21 21:17:08', '2019-08-05 23:17:08'),
('c36c68c8297384f7d138f5c21a12bedf13c6475dbd8b2995895f52ab4911aeb0353dc2c09e4f3bd3', 105, 1, 'My APP', '[]', 0, '2019-07-20 02:34:56', '2019-07-20 02:34:56', '2029-07-20 04:34:56'),
('c50118b6a7e766692ed4334806fd8e2a236a0b81b1fb7be6d5ca51af0ed9a3a1d7c5b1eda6e833ce', 116, 1, 'My APP', '[]', 0, '2019-07-23 23:34:06', '2019-07-23 23:34:06', '2029-07-24 01:34:06'),
('c763662b23833a1e98fc42c1a00fe34ce40916f09db5aca57d9322329af2c84f5b3c54dcafd40407', 108, 2, NULL, '[]', 0, '2019-07-23 16:26:24', '2019-07-23 16:26:24', '2019-08-07 18:26:24'),
('d33813371b56f04adfa3e7bfae28489da038a3ea431369ce2c31e7a9f0b787e4be28666eb0b58390', 108, 2, NULL, '[]', 0, '2019-07-23 16:32:22', '2019-07-23 16:32:22', '2019-08-07 18:32:22'),
('e11aa21a72dc180f61d17c549da2e17d16841414c6744102db9870223e510d67cbe0e7dc9bd4c248', 108, 2, NULL, '[]', 0, '2019-07-23 09:01:26', '2019-07-23 09:01:26', '2019-08-07 11:01:26'),
('e1967e8756afe6c67b1e12114f56c6401cf2e97056a7707f39e492cddb90ce7ab30797bc751548c1', 128, 2, NULL, '[]', 0, '2019-07-30 12:01:45', '2019-07-30 12:01:45', '2019-08-14 14:01:45'),
('e58d737fdb44e26a03e361077b661588ce30fbec7f7c5fb535e50c6a9b836a8f18abee909c102f8c', 108, 2, NULL, '[]', 0, '2019-07-22 21:58:34', '2019-07-22 21:58:34', '2019-08-06 23:58:34'),
('e7ef9bf1d3b4c5194fdb3d8258403395df376cda50590b2c0c08565ed32793a057879e38657496b4', 138, 1, 'My APP', '[]', 0, '2019-08-02 16:27:31', '2019-08-02 16:27:31', '2029-08-02 18:27:31'),
('ea8a7965722fc92d126f79c8ad823f5fb857a53c0b965a6d82e411a5f99c7c06112b08a8d63bdaca', 132, 2, NULL, '[]', 0, '2019-08-04 18:47:23', '2019-08-04 18:47:23', '2019-08-19 20:47:23'),
('ef20961bdd4a7ddc9686a971069cc78ca1b521d874029e5e1df81433068aff521e6f37a7b3b18bac', 108, 2, NULL, '[]', 0, '2019-07-23 00:24:17', '2019-07-23 00:24:17', '2019-08-07 02:24:17'),
('f16ddfb25ef03dc8f77218c46a1c7acc875891deb5bb1d728ac47de311361ea00c4b10ad9af7e235', 131, 1, 'My APP', '[]', 0, '2019-08-01 18:54:28', '2019-08-01 18:54:28', '2029-08-01 20:54:28'),
('f1e18ceff339577b5cc4f16d33ba0144015b2a135361b8762495836e7dfe0ed5d629f5002f63290b', 113, 1, 'My APP', '[]', 0, '2019-07-23 12:23:41', '2019-07-23 12:23:41', '2029-07-23 14:23:41'),
('f22aebb94556437c088fd50572a4f4ff7ca08d0ec2dfca451d9c8819773863fca9ee5c07d773d8bb', 128, 2, NULL, '[]', 0, '2019-07-30 08:55:48', '2019-07-30 08:55:48', '2019-08-14 10:55:48'),
('f247f94448656db6eeccc34e6c339346a7ee47560072b2f01741f2758216f9e5204514dca0d3dd34', 127, 2, NULL, '[]', 0, '2019-07-29 08:25:03', '2019-07-29 08:25:03', '2019-08-13 10:25:03'),
('f28fe2d19354b11131b8f703eb5914b9ec64d8b95ba03fdd402bb308f4c585c5845b598b0058312f', 108, 2, NULL, '[]', 0, '2019-07-23 21:29:39', '2019-07-23 21:29:39', '2019-08-07 23:29:39'),
('f7e7de111f85dd11f16c8818336e1dc79979fb6401775461deca4979abf78ce1bf4ce031e51746cc', 123, 2, NULL, '[]', 0, '2019-07-25 09:43:45', '2019-07-25 09:43:45', '2019-08-09 11:43:45'),
('f87c342f09b71e9d993a784fe5a8e2467599dddeda9b79e64fc19c2d2e9dc9c1900d38f0d737df0a', 129, 1, 'My APP', '[]', 0, '2019-08-01 15:47:28', '2019-08-01 15:47:28', '2029-08-01 17:47:28'),
('f956524246fc80ad79d9fbac58c8c42d2fff1e53db2d514536b0eca213ef3140c42e490e720c7a02', 128, 2, NULL, '[]', 0, '2019-07-30 18:51:43', '2019-07-30 18:51:43', '2019-08-14 20:51:43'),
('fced0f513de67c655952634358db55922f4ba90e0f3f6e39016eab3334f31101b5fa747d57932557', 140, 1, 'My APP', '[]', 0, '2019-08-05 09:36:59', '2019-08-05 09:36:59', '2029-08-05 11:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'RelaxTaxi Personal Access Client', 'H6kVsodWGtKVgsJBuweyOXbWGWf4Z2CRaKUJgJqm', 'http://localhost', 1, 0, 0, '2019-07-20 00:13:12', '2019-07-20 00:13:12'),
(2, NULL, 'RelaxTaxi Password Grant Client', 'zDzul2ni6mAzn6q7jEA7Zc7YLJbdoApKLrf4U0Kv', 'http://localhost', 0, 1, 0, '2019-07-20 00:13:12', '2019-07-20 00:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-20 00:13:12', '2019-07-20 00:13:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0627ffcb100943429b6af7e3a1e51d5983f28740e22cce2380a985b7873073d2988891fa1ee888a4', 'a6ea95769c467dda71b478eb2113e25cd210c44469d6b05486f077e4dc6434ebb14d27a9f7c5fa3e', 0, '2019-10-29 19:15:09'),
('112c131d66f344cc4dd959abf9d314382df638781f1fbe1e2cfc08865ccf209425935e5807a2c6c2', '09618b873d6fdf6c6fda1d43f939f09ef1d37d5764870d41d8eaf9ea35c1f11f4eb070a65cabb495', 0, '2019-10-28 16:58:16'),
('125deea4ca2d5061205a54a7ae90a308865fb151bcebdf57bc419963d57fa2ed132de87e3d36d42f', 'a8e8eb7b196dcd3451f54438087043ba53a6d54e087db02de733bc8c6e602d2bbb4b94114ca23740', 0, '2019-10-21 17:14:33'),
('13f0a86b9b757eb75e1df00f9a8931afdfa8916e1a592e5b94eae380f27138e39b01b3b63541f2eb', '7cb634771aefeac2ef57e1b5d34c56d4efa9500eb62c73e60f8ccbf06bee2d0527a9397977d8ccfd', 0, '2019-11-01 20:09:46'),
('166a2657d6f5b5ad64d0f0e3d0e0e980efdcceaa6b3da2aa7aa647c3a1141063914df76bdd09f3da', '102fc616ed0f15faeed5eebbbc51d471e04bbb454e25955b6680e2e1c822b313f0f32b164a5c5937', 0, '2019-10-23 17:47:08'),
('1c40904b7a900638a4a392dc4c97627038218a6ad6c45f1257ea1bf2a2b49877e79f394f73ce8fe1', '09c3f26e8422edfe264267f3d61e8e19b3119bb6aa2faa931317723dab77e442fd10b9340f10c7bd', 0, '2019-10-23 20:39:26'),
('1dff3387c89311f16550f67e5b5317838a556514d2dc4952e2b46be37a1a79f99269d51e39760b85', '4e8a1a9b78909f53eee3692b316c8375cc1a4ce75a7e34a700099132299952beb9896847b343f64c', 0, '2019-10-28 17:30:08'),
('1f9fadbca9e44f50b4737192eef81b3a5e00855d9740c3baabb2c08e00e029ddf31ec9330ef237bc', 'b4807b33886b7203fae94519706b71833d936f9431585108b4dcbf20fc211c74b0d7d2faac998804', 0, '2019-10-31 17:34:51'),
('267265a1e1f693e445a4dbf4b8948b4f742f43fd8c4cc780478cb0e9821cf62439170a1250daf084', 'c0221ba712044ef50c675795076d62d3a97e11b454bdcfa476660e5c1326aadef933aa4727e8f6fb', 0, '2019-10-19 23:17:08'),
('2bcb7092558660974af3b3d373bf530b6f4caf5bd29e14b33554dcbaa330e3857e09cda18d6f7fb6', '7d1fc019798e41f81811bb83b60c446561ec443c53bc08b4588fc20f71fdf5eb5b096ab4266e7812', 0, '2019-10-21 13:40:05'),
('3a156f7cf3b31cb064362e20cc5d7bdf313be4b274434c2a6ed0838345fd4f77533b502354c8ccf6', 'f956524246fc80ad79d9fbac58c8c42d2fff1e53db2d514536b0eca213ef3140c42e490e720c7a02', 0, '2019-10-28 20:51:43'),
('4356bcaeb3ee9a4b05ee89ebbe7820e10c3442503a33825ce3ac34fb31b40954bd0688048130976c', 'aaf941bbed4ff73005ec41aa336f6a491a4ec992bb0ece08d35dbf5d4813c241c2c5968a0b9b3f62', 0, '2019-10-27 20:45:54'),
('4529a1456aad8ae9fb711e5e9a0667b29dc633cd6d5ca7ea2092680c277c665357a3281ef9404c2d', '3d93f5b61a680d58733b7e339cca4af86af819cf001b8fe3da021c27f44aecb13f1bf7d6e5d954b9', 0, '2019-10-28 17:00:19'),
('453886c4c2f757d8acd42e889398775d701fbb7cc5f2a88ab03d2bec0e18fc888beb7cffe1f7a42d', '0c889d991d784db68e991d736e10dbece094bf307c4508e47f9fea8e00a18135f8a26e9948c8fc8f', 0, '2019-10-20 12:18:58'),
('4ac177fc748442296d961c4661ecdac704f98b87dca23b5298c821db64246423e04c6a02fa97a67b', '6c4913c2edf4e69cff5f78eeb87f06a06e413360a33081c60d3bfe6ee89395a99064b43c5c4196ef', 0, '2019-11-01 02:46:00'),
('4e17393f193bc3fd93b2c3a2108d9d924ed974db29fd9215c7a17e0406d1d844ed8cd58dc99d346d', 'f7e7de111f85dd11f16c8818336e1dc79979fb6401775461deca4979abf78ce1bf4ce031e51746cc', 0, '2019-10-23 11:43:45'),
('524ebcb1300fa7b35bc01901b48d27897b70ec035c713ca63cff1bcbf38e4f05a88adfd56698fcf2', '1ebcba8a6c8f15b1219aa01cde407fa5bb06f2706a1ba959925af093f9acf64c164d190a6364feb8', 0, '2019-10-27 11:13:39'),
('54ff0677b5fd3c2d619199a19108d4bcd1cf33fd9904b2db5e27f32f2f8a42c4430d2766644cf3e5', 'ab10323cfdc15d1b04c059eb891ec426f4730725cba10f5ca0caf65e87e463270f481b1ad72dc6c8', 0, '2019-10-20 12:51:15'),
('59d349dec83ad00f0a3475c488f05778b263c1b9c2ce1482b7d25f497862fec214e1cb080b8410d3', 'e1967e8756afe6c67b1e12114f56c6401cf2e97056a7707f39e492cddb90ce7ab30797bc751548c1', 0, '2019-10-28 14:01:45'),
('5e51780a3aa0167d247eec0ccdeda0b54ad63a9c8f83485fbea82a831b494ec5764d02ad48546f18', '4e8d783fca2c6a316bdcdaa06179b8c71976d82a72d1683cc44d5056fe68b9d880dbe4988c121fd8', 0, '2019-10-19 23:03:51'),
('6132c2b79106f3fcdf265b49d0bae1699d0f49ed1c304b697143b762555e7c9bc6c6ea01fdd0a196', 'ea8a7965722fc92d126f79c8ad823f5fb857a53c0b965a6d82e411a5f99c7c06112b08a8d63bdaca', 0, '2019-11-02 20:47:23'),
('662d1f01e74d9a8722e713750eac7815e2cd88cdc49cc677ec40473233503b7085423df24c873eab', '9c54bb8b4bc380aaae47c362324b293ef182fb6086c596b6b663957e7ff07c2187f75a6174d6ac52', 0, '2019-10-25 12:17:27'),
('69f8e499ba20a88ba4ddc4b15b9c3850296b5b0ef81a51c3d805fa28676560725ce6d7822c9257c6', 'b9bc8a3d5e205d58c283117c858b429eccfb5606ff039241f5853b09e76a26b814ed8b3213d81735', 0, '2019-10-29 19:25:18'),
('6b846b8617d8e1d7b529971ab37665d5c96496e835273f6d238c939cf323819e6d2035061366372a', '064452c0c06825f6b4e97fe35af1fc035908dc03ca24f16e44ca398a75e19248a032798a15a1f467', 0, '2019-10-27 11:52:44'),
('6b9bc257cc4e175b03b054a1aa2a54d7603d6b9ccde1696bf5b8f17535ad2b237144d998a55585b3', 'ef20961bdd4a7ddc9686a971069cc78ca1b521d874029e5e1df81433068aff521e6f37a7b3b18bac', 0, '2019-10-21 02:24:17'),
('70f9cfa82f870014a49cdbec471fb05b57b2f123ea9a214f1426868d4c57493ed7f8adb4201da48d', '797ac31f1cd0d9a069fed7c6ac89dfd55d5851a8f902d25fb2c629178e7cb1cfce0db9ac582bf2b3', 0, '2019-10-27 11:56:52'),
('71f2d12560084a9b2d608f6f42da34d21211b94f99122bd36ea0d8528a71aea5b8f4368fa5af6631', '826f4048cf737c1787720f4d020e5b2d73cde2b5106279ac9fae048bb8d46b22f9740d4ddc527c7e', 0, '2019-10-25 00:46:31'),
('794c610cf70fc8dede8eba9856b3027700000e10d3ffd228a2e06a6495b441c80ec8de9913b3e2fb', '126b0d2c5e3c9c14ee5d53d278810fee3e25d6434a1116f376f5567900a16b07279cf56798723f8e', 0, '2019-10-31 17:33:16'),
('7a376b76e86bbd09c50d91a5b93bec727a1783f3bbcc5bcd4d8e23ca514a50afa9d6662825462f32', '95534b82ff31a2dc84d0097e40b56dde68785da8ec43a182fe3f9f4454b0f8a6117c0a9001de9905', 0, '2019-10-19 02:45:32'),
('7fcb239a8fabbbbf65035a5b38c1ecec58fed7b2263dbefeca025115613c2606e8215004da721dd7', '858b66327836336187202133b44e0e8039a97b9228ad7de3226e0ef2cb1598c48bc122312c1a5885', 0, '2019-11-01 02:24:02'),
('813179e0427599637edc92a99845dd57745810d692360380746be37add03a1aa205634ed71a2e580', 'a9ddbdb6651c8b70bcb26a54a8fb134495d38e229556b34b7b9f6e459fc6a8d8fa15521070213877', 0, '2019-10-31 18:22:16'),
('8b58b45bdf1dedb78f1f53ce991f25ec080113498c1438359ea304ec1754d8a828f2e561f0339617', 'c763662b23833a1e98fc42c1a00fe34ce40916f09db5aca57d9322329af2c84f5b3c54dcafd40407', 0, '2019-10-21 18:26:24'),
('8d28099638367912037ebd357cc20fd81a36deecfeeae3c8a7f405c21f126f776e8feab12aef91c9', '2e946aa72f0192d44329aadfc4083529478064258a21acd58607024db0ac2ed141615073b3f0f507', 0, '2019-10-31 17:42:05'),
('90e4596395f44243e89535ab75aded0af4c4274abed781ce0b361a0b0d19731e2a7ded186fffe385', '35eeeedfa905e81436778274f8472486d23d2071b7793cdd219e57704687b7cb09fd780c4c57a3d6', 0, '2019-10-28 02:11:50'),
('9173e55b57b69cda68f865d521810b1169ac9bc415f199f88971758b1d08097a8f60768286be3750', '49d6491951bc4996599aaac95430292ea5b363402130e65fd95555d79e48bfa14a0e94051fd51013', 0, '2019-10-28 17:43:46'),
('991a990a220ed178e19294a6269bfa9eef7d7dc08c29cdb6811043700ea33c4733dde0930ce10701', '343919741b45317cc0aeea5f6907fc4a1bd079cc63f31001b46a04c0e3df9d50ea6df04041a26aec', 0, '2019-10-20 03:13:48'),
('9b7d042a4a2da99c9a75ce346093ffd303dc882d586bb927b0688ef1b38b8246c97b8f88f09be1dd', 'f28fe2d19354b11131b8f703eb5914b9ec64d8b95ba03fdd402bb308f4c585c5845b598b0058312f', 0, '2019-10-21 23:29:39'),
('9b9db839e8a63d2a01655098a68168194ecf9adb8b379b2088ed6a14249a6a8ba36b097d7b9d4abf', '2bf31a308b5455b668e10b19d7e920c18e3585816bf7dbb46891165807d98980b225cd5989916e7a', 0, '2019-10-20 03:05:46'),
('9ca3af748bbb12b875a35e698b955ba6759f1b7e785d959b387884fcf7e8cea742393a7b9551e5ae', '25c8584dc916a703c2efeb6bf801b45299a55464438505d60db9af0136e1eb51fdaba8e00e910d0e', 0, '2019-10-24 11:48:36'),
('a6412c4efc2096eebb30e4ea70a4939863aa851152d6d9a4b486b6ab3c8c5b1fc18645dc13a0b8e7', '9870c62f5be166b761821fdeb17ce165b7358e78accaedb5a267d3f3985c475c6f406a9adde5ea27', 0, '2019-10-22 16:16:18'),
('a76aca665410a3195eff72d82e5ce641489ce1d75703666ed4db1df9d6c393041a97c096653448b4', '6b4c950838bb39d7f15a089706bdae4fb0afdf38ad1e0aa55d6d17e9aef35df65abc61c5027f5fda', 0, '2019-10-24 00:09:52'),
('ac5d1837e99b0876d0ec2b11432dfe46b9d36aa472a4a6729e33453ecd57e65a546e0887f18264e0', '8d2fc33941031039945aa99dee68de92474d27a2e85ad74c3d3895ee5a1872ea41ea725c974a82cc', 0, '2019-10-23 12:35:14'),
('b1fab90e4104ca58ac028cd422795d7c8fffd1ce1c60d2d149d6bbed789fbe2af73f80074ed9984f', '7493c0392b58a067e30c423da723e5edc9af798045642880755ee4b45b096a0c4788bdc63e9614b3', 0, '2019-10-21 18:34:04'),
('b50bc2902a6dcfc9e8263bb05a397f30e1f9bcc1daf78ce3b118418d92b3e0668e4b4ef6c078defb', 'f22aebb94556437c088fd50572a4f4ff7ca08d0ec2dfca451d9c8819773863fca9ee5c07d773d8bb', 0, '2019-10-28 10:55:48'),
('bf5b4818ea30259993db19ca9d7e705bf09b62a2f3df42518197cb0773eb1099a69242f977f5c13e', '15a0ec4d1692e270623495caec3b6094be8341a70128328025e92235d4dec16894060c4231d43835', 0, '2019-11-01 11:43:29'),
('c0c24b941c00fbd778ec298cfa4a823b251aa268da586cd3aa145bb365e0b56c56ad61f5eb5414b9', '2760cf02d3b5ba493a0b55630a544a3a4a173ca2b1e2aa67e3a7900355d21ed16e78058e07c46c51', 0, '2019-10-23 14:46:12'),
('c693b94cb0aac7a7feb77bcf8ddf1186783533a7251cda51ffed32aa5f777d2f9d175f1beaf3a729', 'a7c7f5a0a311ed4ab880b2b36aad9993d0512d384fc1cdb83df2b64d1aae8296bc4e95af228754dc', 0, '2019-10-23 19:47:54'),
('c800f36894d45204487b5d9f773d31cc3e77b45e1534ce8aa433cbd93320ec66d3fae957fd8f5169', '9ad106f45a9bf848838860f437f0a6e8d787e4d36822e8bf8fb7f72c74296e73d4c71f3eac219ead', 0, '2019-10-27 11:10:36'),
('cb457ce97aa49ab638b664b808bcfcaaac04d3f943048f63db95ac62489d163c03d19e1013967804', '41416357b9aea74abc7d5518006e3f1fd59ed1f6a169290c9277e1fd3fa2dae2868f5e1f95f83ad5', 0, '2019-10-22 14:47:04'),
('d08375b6825b3c5928a3e81236fde0994220089c200a1de053162f41b318b798b4779e8eaf2ec021', 'bf700f84527a036c2d8a08145bdef48470bf7254706a5a8cb7fe97b9d9ff3e49c9f35af76b50bb70', 0, '2019-10-20 02:54:05'),
('dc9f74c7d913e32782fb825dfdcfe6894563250d763cd6509e34abb6cfc21f1eb71aaf74fd113acd', '707eff30e7f3a26843ed38a5e122e573e3c749133f5ab91cfa04df51808a17f47ff20622b5f34112', 0, '2019-10-23 17:17:51'),
('e69cca9b0fe7d9aa511f2e105e77fd01c86711ffab9c96c826cb912ad3f2fa6aa04107ddf646076c', '06e0ffc41decd482ef2939c0f87deecfa3996a8af4f6dabdd38451c1ea87cec1a88fe7c7aada81d8', 0, '2019-10-25 13:56:03'),
('e6e49e3f961698fdbf2ad474f8fd6cbb635c18a30289185e74d5710a01ec71403dc3dc3a46d371f1', '735bee9dc901fbb96370cb5ef7d8c48375b44c98d468a9f7c9ab599d6dd58b8bb42bea7907a0878f', 0, '2019-10-20 12:31:01'),
('e712f462ebcecb5516be99af658b062a7a2b5249b6e7b670287b01bbd8123999617f0a2dc3fa29bb', '5e464d2484c1a424301405612030da63eae9dba37008a66edd052d204caa86dfafab79f1d5ec91ec', 0, '2019-10-24 21:16:43'),
('e8a087462834f703c64f9ad93dec114ccecc1e1af8f4f647084022576d1d9a9c33ecdbc90a89c786', '2eaab4bfc0094efc7e6c31927fb30f3e42c2f0a2804e213a6e3f605e7b43a84993403699da9dd879', 0, '2019-10-21 11:47:14'),
('ea4c32d479fe1a138f747629f98fab1480e81a6077b5a7ce614ec614128b7bda4fb1206d5516ca47', 'f247f94448656db6eeccc34e6c339346a7ee47560072b2f01741f2758216f9e5204514dca0d3dd34', 0, '2019-10-27 10:25:03'),
('ea574b6f3cd09a098e8a72286eb08a3859027b4d0dca9529d6b695029970a9cf06fb7900a708014d', 'e11aa21a72dc180f61d17c549da2e17d16841414c6744102db9870223e510d67cbe0e7dc9bd4c248', 0, '2019-10-21 11:01:26'),
('f0b0b8c0f1215f5bc27ce42d8b9783b6a294a3f5d364e4aebf72ea9fe57f15e437ca6bf816b1b4d0', '019d8efbfb31b88e6c9da8031455bad88a704f3cc80a7b23fef996263ca10330a43893c0a7a4d8b1', 0, '2019-10-28 11:24:14'),
('f2128d3f132deb50994e241b79ade2f8fb6ead984c97f590c330fd8d7a5e330c7a31d45d33fcf92f', 'd33813371b56f04adfa3e7bfae28489da038a3ea431369ce2c31e7a9f0b787e4be28666eb0b58390', 0, '2019-10-21 18:32:22'),
('f345db4d94fdc2a904ec71b3102cf006cbf80e67a0cfcbc3b15a4f0a761a36c3569782bb56403f80', '0cee5ecacab61be341fb23693d22d59f7115ad2f44fdfb1d47d0841ff7058a077a4a4f55f36eeefb', 0, '2019-10-27 22:46:50'),
('f35f9fd551b40840e36b4b51a66ad64334570a0bba78f9f1be074a82b390298f65f2fc94f44f6dfb', '34140b67b8a0f3ab5d6fcf543b3c3fde5b51e1d8caead33b65cc78ddd2bf0a0ecee5d5e1586a48d9', 0, '2019-10-23 14:34:46'),
('fb9b7878679d9c51ab0ee9cc65a1bd4e51830d0a92dadba88884b8d93fbdbfab634158db0fc9b031', 'e58d737fdb44e26a03e361077b661588ce30fbec7f7c5fb535e50c6a9b836a8f18abee909c102f8c', 0, '2019-10-20 23:58:34');

-- --------------------------------------------------------

--
-- Table structure for table `package_types`
--

CREATE TABLE `package_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_km` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocodes`
--

CREATE TABLE `promocodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `promo_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `discount_type` enum('percent','amount') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `from_date` datetime NOT NULL,
  `use_count` int(11) DEFAULT '1',
  `expiration` datetime NOT NULL,
  `status` enum('ADDED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocodes`
--

INSERT INTO `promocodes` (`id`, `promo_code`, `discount`, `discount_type`, `from_date`, `use_count`, `expiration`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '123321987', 100.00, 'amount', '2019-07-23 00:00:00', 1, '2019-07-24 00:00:00', 'ADDED', NULL, '2019-07-23 09:50:05', '2019-07-23 09:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_passbooks`
--

CREATE TABLE `promocode_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocode_passbooks`
--

INSERT INTO `promocode_passbooks` (`id`, `user_id`, `promocode_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 108, 1, 'ADDED', '2019-07-23 09:50:44', '2019-07-23 09:50:44'),
(2, 1, 1, 'USED', '2019-07-23 22:24:49', '2019-07-23 22:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `promocode_usages`
--

CREATE TABLE `promocode_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `promocode_id` int(11) NOT NULL,
  `status` enum('ADDED','USED','EXPIRED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promocode_usages`
--

INSERT INTO `promocode_usages` (`id`, `user_id`, `promocode_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 108, 1, 'USED', '2019-07-23 09:50:44', '2019-07-23 22:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `status` enum('onboarding','approved','banned') COLLATE utf8_unicode_ci NOT NULL,
  `fleet` int(11) NOT NULL DEFAULT '0',
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `first_name`, `last_name`, `email`, `gender`, `mobile`, `country_code`, `password`, `avatar`, `rating`, `status`, `fleet`, `latitude`, `longitude`, `otp`, `remember_token`, `created_at`, `updated_at`, `login_by`, `social_unique_id`, `emergency_contact1`, `emergency_contact2`, `deleted_at`) VALUES
(14, 'vegrsf', 'fdegt', 'fwcg@fer.com', 'MALE', '70809010', '+961', '$2y$10$S6rfVqaJ1VOhvYd/GwtFXeEhGXOzN3TKk9Buf5.ekN77ELWO1OCI2', NULL, '3.67', 'approved', 0, 33.97810030, 35.63159200, 0, NULL, '2019-08-01 19:00:54', '2019-08-05 08:13:44', 'manual', NULL, NULL, NULL, NULL),
(15, 'cfsc', 'gfxc', 'dfssf@fdc.com', 'MALE', '78451236', '+961', '$2y$10$lUjtQLjDC5wprt8M4QwwAOwnG8byOl5qi4RLIaYgfDeVcpMx8Kec.', NULL, '5.00', 'approved', 0, 33.86722771, 35.97341926, 0, NULL, '2019-08-01 19:11:28', '2019-08-03 17:39:08', 'manual', NULL, NULL, NULL, NULL),
(17, 'nab', 'test', 'hshshe@jsud.com', 'MALE', '79191563', '+961', '$2y$10$z6MpdUnioi6ReEQ4Shk4VeZMriAJwc7ePLA3w48E55wYzUwtwwzRa', NULL, '5.00', 'approved', 0, 33.97819438, 35.63169108, 0, NULL, '2019-08-05 08:15:02', '2019-08-07 09:22:43', 'manual', NULL, NULL, NULL, NULL),
(18, 'esper', 'daou', 'esper.n.daou@gmail.com', 'MALE', '3046480', '+961', '$2y$10$4wHFQuFbce0WDLTstRmFhOjYG0KWp025qXSnPGEvFAWED5gN5nGz6', NULL, '5.00', 'approved', 0, 33.96699407, 35.60713137, 0, NULL, '2019-08-05 13:27:08', '2019-08-06 23:32:19', 'manual', NULL, NULL, NULL, NULL),
(19, 'Charbel', 'Khoueiry', 'charbel.khoueiry2011@gmail.com', 'MALE', '70911598', '+961', '$2y$10$sKZkwXYEljflZzWmwPPF4endzlcuwQs2Ur/X4xsIkCl3zhi7efPDK', NULL, '5.00', 'approved', 0, 33.95475964, 35.68760340, 0, NULL, '2019-08-05 18:15:58', '2019-08-06 13:47:39', 'manual', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_devices`
--

CREATE TABLE `provider_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `udid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `voip_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sns_arn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `current` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_devices`
--

INSERT INTO `provider_devices` (`id`, `provider_id`, `udid`, `token`, `voip_token`, `sns_arn`, `type`, `status`, `current`, `created_at`, `updated_at`, `mobile`, `otp`) VALUES
(1, 1, '33f40a24550ffc29', 'cVM1MM_ULsg:APA91bH4rItudkRbw6LqCT-F_oHqMqfniPNPB12awb2VvCqV7CO-JaZbq5yhSgICDj-QGj_d7X4euNkn05So4ZNzdsYJm8UAoGUu7pB1LNDXKdw5KAxd3PkvK6cHT_7x-QF8SGBTB6v-', NULL, NULL, 'android', 1, 0, '2019-07-22 00:11:33', '2019-08-01 16:52:38', '79191563', NULL),
(2, 2, '7ec57ff3cf1d6dab', 'dCOsb43DUFY:APA91bGWiqJGrYvK9JrC0EwrGjIlOtvYU0MzUXG2TWA3zJ97om_Gvy8MWSVdyG5w_X4-4FVjfrvBJq6kOK4WC7-ifph3MYgBCqLwgVbgQuSHrCYT4U9mjRjvy8Kxu-6dqLfTzAdgm1xS', NULL, NULL, 'android', 1, 0, '2019-07-23 12:25:45', '2019-07-23 12:56:36', '7402407579', NULL),
(3, 3, '7ec57ff3cf1d6dab', 'dCOsb43DUFY:APA91bGWiqJGrYvK9JrC0EwrGjIlOtvYU0MzUXG2TWA3zJ97om_Gvy8MWSVdyG5w_X4-4FVjfrvBJq6kOK4WC7-ifph3MYgBCqLwgVbgQuSHrCYT4U9mjRjvy8Kxu-6dqLfTzAdgm1xS', NULL, NULL, 'android', 1, 0, '2019-07-23 12:57:38', '2019-08-06 14:20:44', '9944338582', NULL),
(4, 4, 'fd4010588707819f', 'dl6kyuwM4KU:APA91bHJLr06JxZhB5JcfWaMOI_nZgAiKR3hRVVXdpFzm7M3W97hhNFAIVfQOtvhV8T7RsRcKAbYaKeHL5_p3HJfNonuQFieOKyXwv4X693zcBwD1N2FEbNfQoKGIWbnNMdyPyFtkDzU', NULL, NULL, 'android', 1, 0, '2019-07-29 23:53:32', '2019-07-30 00:07:56', '361361', NULL),
(5, 5, 'fd4010588707819f', 'dl6kyuwM4KU:APA91bHJLr06JxZhB5JcfWaMOI_nZgAiKR3hRVVXdpFzm7M3W97hhNFAIVfQOtvhV8T7RsRcKAbYaKeHL5_p3HJfNonuQFieOKyXwv4X693zcBwD1N2FEbNfQoKGIWbnNMdyPyFtkDzU', NULL, NULL, 'android', 1, 1, '2019-07-30 00:08:40', '2019-07-30 00:08:40', '123333', NULL),
(6, 6, 'no device', 'no device', NULL, NULL, 'ios', 1, 0, '2019-07-31 14:19:02', '2019-07-31 14:56:56', '342312', NULL),
(7, 7, 'no device', 'no device', NULL, NULL, 'ios', 1, 0, '2019-07-31 15:01:14', '2019-07-31 15:02:01', '444444', NULL),
(8, 8, 'no device', 'no device', NULL, NULL, 'ios', 1, 0, '2019-07-31 15:07:57', '2019-07-31 15:08:25', '44343434', NULL),
(9, 9, 'no device', 'no device', NULL, NULL, 'ios', 1, 1, '2019-07-31 16:30:32', '2019-07-31 16:30:32', '34234324', NULL),
(10, 10, 'no device', 'no device', NULL, NULL, 'ios', 1, 0, '2019-07-31 18:58:30', '2019-07-31 18:58:42', '453543', NULL),
(11, 11, 'no device', '0ac4b69de744aee629ef5e25b65cb6c8f2802961c2fe2e112032da7b5f682168', NULL, NULL, 'ios', 1, 1, '2019-08-01 15:52:57', '2019-08-01 15:52:57', '79191563', NULL),
(12, 12, '33f40a24550ffc29', 'cVM1MM_ULsg:APA91bH4rItudkRbw6LqCT-F_oHqMqfniPNPB12awb2VvCqV7CO-JaZbq5yhSgICDj-QGj_d7X4euNkn05So4ZNzdsYJm8UAoGUu7pB1LNDXKdw5KAxd3PkvK6cHT_7x-QF8SGBTB6v-', NULL, NULL, 'android', 1, 0, '2019-08-01 16:53:26', '2019-08-01 18:36:15', '70787974', NULL),
(13, 13, '33f40a24550ffc29', 'cVM1MM_ULsg:APA91bH4rItudkRbw6LqCT-F_oHqMqfniPNPB12awb2VvCqV7CO-JaZbq5yhSgICDj-QGj_d7X4euNkn05So4ZNzdsYJm8UAoGUu7pB1LNDXKdw5KAxd3PkvK6cHT_7x-QF8SGBTB6v-', NULL, NULL, 'android', 1, 0, '2019-08-01 18:50:31', '2019-08-01 18:51:21', '5156258', NULL),
(14, 14, '33f40a24550ffc29', 'cVM1MM_ULsg:APA91bH4rItudkRbw6LqCT-F_oHqMqfniPNPB12awb2VvCqV7CO-JaZbq5yhSgICDj-QGj_d7X4euNkn05So4ZNzdsYJm8UAoGUu7pB1LNDXKdw5KAxd3PkvK6cHT_7x-QF8SGBTB6v-', NULL, NULL, 'android', 1, 0, '2019-08-01 19:00:54', '2019-08-05 08:13:48', '70809010', NULL),
(15, 15, 'no device', '48c2da73343f7ccdcfdc5e95fad3d3b237bc79aac164727616933964d89dfce0', NULL, NULL, 'ios', 1, 1, '2019-08-01 19:11:28', '2019-08-01 19:11:28', '78451236', NULL),
(16, 16, '60adac0dd1b9c713', 'e0RpjxJJNjI:APA91bFPaWQguVQBtkZTysESrG-_XHAZ13qWbT603oiPYSkMhZzzuBiPjIOJc70ZosE3wttebfFUvrjaXarBd6uoU7afOobmxuSnZAkZrkHA75JILil9Za5z1NiUuGQiGq2hv7c5yLjY', NULL, NULL, 'android', 1, 1, '2019-08-01 21:00:30', '2019-08-01 21:00:30', '71947647', NULL),
(17, 17, 'no device', '48c2da73343f7ccdcfdc5e95fad3d3b237bc79aac164727616933964d89dfce0', NULL, NULL, 'ios', 1, 1, '2019-08-05 08:15:02', '2019-08-07 09:21:42', '79191563', NULL),
(18, 18, 'no device', 'c184e7b2a5c3bb0f6d28603e90b1661141db236913427fc91b8022541f9263fd', NULL, NULL, 'ios', 1, 1, '2019-08-05 13:27:08', '2019-08-05 13:27:08', '3046480', NULL),
(19, 19, '78e370d37676d591', 'feXnB-OZZUQ:APA91bFk6-hBEb3bP-kHABQPhkTJKQB1V5ldP5p7L3VKWyMLUP5Eu8BriVpr4Xw5JCLeb5wc8oS6b5ljGgQyFUuVOMwEeKN-0qvMivvIPvSdVGLNO1OdBO1-PnFCix3LCKcBvqlEktQn', NULL, NULL, 'android', 1, 1, '2019-08-05 18:15:58', '2019-08-05 18:15:58', '70911598', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider_documents`
--

CREATE TABLE `provider_documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `document_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ASSESSING','ACTIVE') COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provider_profiles`
--

CREATE TABLE `provider_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_profiles`
--

INSERT INTO `provider_profiles` (`id`, `provider_id`, `language`, `address`, `address_secondary`, `city`, `country`, `postal_code`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-23 12:29:21', '2019-07-23 12:29:21'),
(2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-23 12:58:22', '2019-07-23 12:58:22'),
(3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-07-24 23:46:42', '2019-07-24 23:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `service_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','offline','riding','hold') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `provider_services`
--

INSERT INTO `provider_services` (`id`, `provider_id`, `service_type_id`, `service_number`, `service_model`, `created_at`, `updated_at`, `status`) VALUES
(108, 12, 5, 'A213123', 'kia', '2019-08-01 18:00:37', '2019-08-01 18:36:15', 'offline'),
(109, 12, 6, 'b3333', 'KIA', '2019-08-01 18:00:45', '2019-08-01 18:36:15', 'offline'),
(110, 11, 5, 'A213123', 'kia', '2019-08-01 18:00:58', '2019-08-01 18:00:58', 'active'),
(111, 11, 6, 'jd2222', 'KIA', '2019-08-01 18:01:04', '2019-08-01 18:01:04', 'active'),
(112, 13, 5, 'A213123', 'KIA', '2019-08-01 18:50:53', '2019-08-01 18:51:21', 'offline'),
(113, 15, 5, 'A213123', 'KIA', '2019-08-01 19:13:19', '2019-08-03 17:39:10', 'offline'),
(114, 14, 5, 'B3434234', 'KIA', '2019-08-01 19:13:32', '2019-08-05 08:13:48', 'offline'),
(115, 14, 5, 'B3434234', 'KIA', '2019-08-01 19:13:32', '2019-08-05 08:13:48', 'offline'),
(116, 16, 5, 'A213123', 'kia', '2019-08-01 21:00:53', '2019-08-02 03:21:03', 'offline'),
(117, 16, 6, 'A213123', 'kiaa', '2019-08-01 21:01:11', '2019-08-02 03:21:03', 'offline'),
(118, 17, 5, 'G34324', 'kia', '2019-08-05 08:16:27', '2019-08-07 05:58:00', 'active'),
(119, 18, 5, 'G34324', 'kia', '2019-08-05 23:48:33', '2019-08-05 23:48:58', 'active'),
(120, 19, 5, 'G34324', 'kia', '2019-08-05 23:48:43', '2019-08-05 23:48:55', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `request_filters`
--

CREATE TABLE `request_filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_rental_hour_packages`
--

CREATE TABLE `service_rental_hour_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `km` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_rental_hour_packages`
--

INSERT INTO `service_rental_hour_packages` (`id`, `service_type_id`, `hour`, `km`, `price`, `created_at`, `updated_at`) VALUES
(1, 5, '1', '5', 20000, '2019-07-20 10:47:08', '2019-07-20 10:47:08');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '0',
  `fixed` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `night_fare` decimal(8,2) DEFAULT '0.00',
  `minute` int(11) NOT NULL,
  `peak_time_11pm_6am` double(10,2) NOT NULL DEFAULT '0.00',
  `peak_time_5pm_9pm` double(10,2) NOT NULL DEFAULT '0.00',
  `peak_time_8am_11am` double(10,2) NOT NULL DEFAULT '0.00',
  `outstation_km` int(11) DEFAULT NULL,
  `roundtrip_km` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rental_fare` int(11) DEFAULT NULL,
  `rental_km_price` decimal(8,2) DEFAULT '0.00',
  `rental_hour_price` decimal(8,2) DEFAULT '0.00',
  `outstation_driver` int(11) DEFAULT NULL,
  `hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distance` int(11) NOT NULL,
  `between_km` double(10,2) NOT NULL DEFAULT '0.00',
  `calculator` enum('MIN','HOUR','DISTANCE','DISTANCEMIN','DISTANCEHOUR') COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `name`, `provider_name`, `image`, `capacity`, `fixed`, `price`, `night_fare`, `minute`, `peak_time_11pm_6am`, `peak_time_5pm_9pm`, `peak_time_8am_11am`, `outstation_km`, `roundtrip_km`, `rental_fare`, `rental_km_price`, `rental_hour_price`, `outstation_driver`, `hour`, `distance`, `between_km`, `calculator`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Regular', 'Regular4', 'https://www.relaxtaxi.me/uploads/10046a8d7295b5f3fb779f4d1d661bdcd34dc15e.png', 4, 1000, 0, '0.00', 0, 0.00, 0.00, 0.00, 800, '800.00', 20000, '800.00', '7000.00', 20000, '0', 0, 0.00, 'DISTANCEMIN', 'Regular 4 Seater', 1, '2019-07-20 01:38:05', '2019-07-23 15:50:28'),
(6, '7 Seater', '7seater', 'https://www.relaxtaxi.me/uploads/0a90ef7bd1767af6d2f1b0e056a96b2ec788e99d.png', 7, 7000, 0, '0.00', 0, 0.00, 0.00, 0.00, 1100, '0.00', 20000, '0.00', '0.00', 20000, NULL, 0, 0.00, 'DISTANCEMIN', '7 seater', 1, '2019-07-21 20:22:27', '2019-07-21 20:22:27');

-- --------------------------------------------------------

--
-- Table structure for table `service_types_geo_fencings`
--

CREATE TABLE `service_types_geo_fencings` (
  `id` int(10) UNSIGNED NOT NULL,
  `geo_fencing_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `distance` double(10,2) NOT NULL,
  `hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `minute` double(10,2) NOT NULL,
  `price` double(10,2) NOT NULL,
  `non_geo_price` double(10,2) NOT NULL DEFAULT '0.00',
  `city_limits` double(10,2) NOT NULL DEFAULT '0.00',
  `fixed` double(10,2) NOT NULL,
  `old_ranges_price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types_geo_fencings`
--

INSERT INTO `service_types_geo_fencings` (`id`, `geo_fencing_id`, `service_type_id`, `distance`, `hour`, `minute`, `price`, `non_geo_price`, `city_limits`, `fixed`, `old_ranges_price`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 1.00, '0', 120.00, 800.00, 0.00, 0.00, 4000.00, 0.00, '2019-07-20 01:38:05', '2019-07-22 00:57:02'),
(2, 2, 6, 0.00, '0', 120.00, 1100.00, 0.00, 0.00, 7000.00, 0.00, '2019-07-21 20:22:27', '2019-07-21 20:22:27'),
(3, 3, 5, 0.00, '0', 0.00, 0.00, 0.00, 0.00, 4000.00, 0.00, '2019-07-23 13:19:55', '2019-07-23 13:19:55'),
(4, 3, 6, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 7000.00, 0.00, '2019-07-23 13:19:55', '2019-07-23 13:19:55'),
(5, 4, 5, 0.00, '0', 0.00, 0.00, 0.00, 0.00, 1000.00, 0.00, '2019-07-24 15:36:52', '2019-07-24 15:36:52'),
(6, 4, 6, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 7000.00, 0.00, '2019-07-24 15:36:52', '2019-07-24 15:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_title', 'Relax Taxi'),
(2, 'site_logo', 'https://www.relaxtaxi.me/uploads/9becc14ddb08dc3db1ea7b927e0236ddff63a463.png'),
(3, 'site_email_logo', 'http://localhost/logo-white.png'),
(4, 'site_icon', 'https://www.relaxtaxi.me/uploads/9ab016ad991ed4505ceb31dbfdcb8c0eaeddacb3.png'),
(5, 'site_copyright', '© 2019 Relax Taxi Developed By iSky Creative'),
(6, 'provider_select_timeout', '60'),
(7, 'provider_search_radius', '100'),
(8, 'base_price', '4000'),
(9, 'price_per_minute', '120'),
(10, 'tax_percentage', '0'),
(11, 'stripe_secret_key', ''),
(12, 'stripe_publishable_key', ''),
(13, 'CASH', '1'),
(14, 'CARD', '1'),
(15, 'manual_request', '0'),
(16, 'default_lang', 'en'),
(18, 'distance', 'Km'),
(19, 'scheduled_cancel_time_exceed', '60'),
(20, 'price_per_kilometer', '800'),
(21, 'commission_percentage', '0'),
(22, 'store_link_android', ''),
(23, 'store_link_ios', 'https://apps.apple.com/us/app/relax-taxi-lb/id1472637773?ls=1'),
(24, 'daily_target', '0'),
(25, 'surge_percentage', '0'),
(26, 'surge_trigger', '0'),
(27, 'demo_mode', '0'),
(28, 'booking_prefix', 'Relax'),
(29, 'sos_number', '911'),
(30, 'contact_number', '09236636'),
(31, 'contact_email', 'info@relaxtaxi.me'),
(32, 'social_login', '0'),
(33, 'map_key', 'AIzaSyCATPBQuGNU6v0xZ6m5fAZHv3AQuw7YIYs'),
(34, 'fb_app_version', 'v1.1'),
(35, 'fb_app_id', '2524733927666981'),
(36, 'fb_app_secret', '34c3f2e5dfa336b31812a4ef05075b7d'),
(37, 'broadcast_request', '0'),
(38, 'track_distance', '1'),
(39, 'rental_content', ''),
(40, 'outstation_content', ''),
(41, 'limit_message', ''),
(42, 'landing_content', ''),
(43, 'ios_review', '3'),
(44, 'msg91_authkey', '2628AQX9I4Pewh5d268523'),
(45, 'provider_commission_percentage', '0'),
(46, 'eta_discount', '0'),
(65, 'currency', 'LBP ');

-- --------------------------------------------------------

--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `id` int(10) UNSIGNED NOT NULL,
  `from_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to_time` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_prices`
--

CREATE TABLE `time_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `time_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `peak_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL','CC_AVENUE') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('MALE','FEMALE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'MALE',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8_unicode_ci NOT NULL,
  `login_by` enum('manual','facebook','google') COLLATE utf8_unicode_ci NOT NULL,
  `social_unique_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double(15,8) DEFAULT NULL,
  `longitude` double(15,8) DEFAULT NULL,
  `stripe_cust_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wallet_balance` double(8,2) NOT NULL DEFAULT '0.00',
  `rating` decimal(4,2) NOT NULL DEFAULT '5.00',
  `otp` mediumint(9) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `emergency_contact1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emergency_contact2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `payment_mode`, `email`, `gender`, `mobile`, `country_code`, `password`, `picture`, `device_token`, `device_id`, `device_type`, `login_by`, `social_unique_id`, `latitude`, `longitude`, `stripe_cust_id`, `wallet_balance`, `rating`, `otp`, `remember_token`, `created_at`, `updated_at`, `emergency_contact1`, `emergency_contact2`, `deleted_at`) VALUES
(132, 'test', 'gddh', 'CASH', 'test@test.net', 'MALE', '79191563', '+961', '$2y$10$MtaBnfAuLGOjkO8rGYDqr.v9rnj0HZIrEkXldxEH0ik6/zlOpkio.', NULL, 'no device', 'F4257FF2-8BB1-493B-B74A-9C51F8D18400', 'ios', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 9103, NULL, '2019-08-01 18:56:23', '2019-08-04 18:47:23', NULL, NULL, NULL),
(135, 'jhgjhg', 'mhvmnv', 'CASH', 'hgjhg@hhgjhg.com', 'MALE', '76576576', NULL, '$2y$10$vWXkyiqBb65mFSwadAiwb.RU8XQuQLJXzE5Q9ART4Bx8nSaPVkxJi', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-08-01 21:23:49', '2019-08-01 21:23:49', NULL, NULL, NULL),
(137, 'test', '32342', 'CASH', 'dfs@fsdfs.com', 'MALE', '231231231', NULL, '$2y$10$0myN2QA0AhTOC/hVX0OLQOfSYRSUNJhMrM5sqDhhKilYqqugoQdJq', NULL, NULL, NULL, 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-08-02 15:26:05', '2019-08-02 15:26:05', NULL, NULL, NULL),
(139, 'hshdd', 'nshshs', 'CASH', 'test@jsjd.com', 'MALE', '71655455', '+961', '$2y$10$k6ptZYWQX4puDKhkjuxiWOvA8LBX3pQDBN5y2zCQ/VnHSN0wZxB3G', NULL, 'f9iw7fEsbbU:APA91bGP_wCXvp_ZJN6SEv5hUTtmg_4Y1yYCknWzDON0Ojfj2lQK3cpTVdcMuhNzoUrBVEJzGukJK8s4PiF7sjKQpsfjsJlki6e4wBFb9PELfsrLzSx4dr8kHjvjGyzNUxFlvgi_YggS', '33f40a24550ffc29', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-08-02 18:57:39', '2019-08-06 22:42:00', NULL, NULL, NULL),
(140, 'eddy', 'salamy', 'CASH', 'eddysalamy@outlook.com', 'MALE', '71398539', '+961', '$2y$10$0ee9fR.dVtozwrqwzHcK2.nft7Ybd/kgjH8MGwJF3ZXYtlIEbRNQS', NULL, '92566fd9d9aae6f411bbac0ee9067b16067b25f5ec201a096a2ac5968dbfaab4', 'DE73C258-B73D-4857-A37D-7AF94EB0269C', 'ios', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 2110, NULL, '2019-08-05 09:36:59', '2019-08-05 09:36:59', NULL, NULL, NULL),
(141, 'esper', 'daou', 'CASH', 'esper.n.daou@gmail.com', 'MALE', '3046480', '+961', '$2y$10$Y1Optth4DKbUAZEFtR632.SuOSGkA8MmZIwbIiALr2dFMf8IXTXVG', NULL, 'cc7870eefac286fc6c9fe7cf6b0251f669465d16e5277314b953959178e5d3e8', '58F5E182-D310-4893-9CDB-064B4405966E', 'ios', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 2402, NULL, '2019-08-05 12:21:08', '2019-08-05 13:39:14', NULL, NULL, NULL),
(142, 'Charbel', 'Khweiry', 'CASH', 'charbel.khoueiry2011@gmail.com', 'MALE', '70911598', '+961', '$2y$10$S6LOy3mvMPAPORfMNs6ovua.4rfAZIJ8xRbOwoL9qTc6Q8fxvYLha', NULL, 'cZfOIocVzbE:APA91bFYN3jqiArEIZwdDH4YVIy_9jC7ARQoX8jaF_WOh8y9jg4DwEuh7V0g4XUwUFLmwRJ6q0WrMJJ16Lwzxf-EcyVn12CYmqrBdTlgMMf3ofsGWWbYxgPhEuzRl5JpbyX8WRJ1u9U8', '78e370d37676d591', 'android', 'manual', NULL, NULL, NULL, NULL, 0.00, '5.00', 0, NULL, '2019-08-05 13:02:56', '2019-08-06 22:44:46', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `current` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_devices`
--

INSERT INTO `user_devices` (`id`, `mobile`, `device_token`, `device_id`, `otp`, `status`, `current`, `created_at`, `updated_at`) VALUES
(2, '71655455', 'fMugk_6l_Pc:APA91bFOrpTOdpxnG1fLyEpQjhWIIgXX5-sc_MH9Ub9DN6dyOWquJFkbHf4auaSwW5fGNWMEnd6dNQG-SAjrb8T18urePUpQTbuJ5YXyp6IzVfz27Xo6BhXo6ivhodzjOompy1j64bZv', 'fd4010588707819f', NULL, 1, 1, '2019-07-20 02:08:23', '2019-07-20 02:08:23'),
(3, '70717171', 'fMugk_6l_Pc:APA91bFOrpTOdpxnG1fLyEpQjhWIIgXX5-sc_MH9Ub9DN6dyOWquJFkbHf4auaSwW5fGNWMEnd6dNQG-SAjrb8T18urePUpQTbuJ5YXyp6IzVfz27Xo6BhXo6ivhodzjOompy1j64bZv', 'fd4010588707819f', NULL, 1, 1, '2019-07-20 02:34:56', '2019-07-20 02:34:56'),
(4, '71111111', 'fMugk_6l_Pc:APA91bFOrpTOdpxnG1fLyEpQjhWIIgXX5-sc_MH9Ub9DN6dyOWquJFkbHf4auaSwW5fGNWMEnd6dNQG-SAjrb8T18urePUpQTbuJ5YXyp6IzVfz27Xo6BhXo6ivhodzjOompy1j64bZv', 'fd4010588707819f', NULL, 1, 1, '2019-07-20 02:51:27', '2019-07-20 02:51:27'),
(5, '71655455', 'fMugk_6l_Pc:APA91bFOrpTOdpxnG1fLyEpQjhWIIgXX5-sc_MH9Ub9DN6dyOWquJFkbHf4auaSwW5fGNWMEnd6dNQG-SAjrb8T18urePUpQTbuJ5YXyp6IzVfz27Xo6BhXo6ivhodzjOompy1j64bZv', 'fd4010588707819f', NULL, 1, 1, '2019-07-20 10:51:57', '2019-07-20 10:51:57'),
(6, '71655455', 'cR8qjxwZ8OU:APA91bF7iqcHC9eKuQialVZE1XxTmPMuuIiGuZWoZWMi3mWa1oVNSEvwxQQDSLP5w27ZBpS7DQvkOJ4NMgFZaXZnESd44WM7liDqHqafC17z-_JjkeG0kXtoJMe75EKXAXL47syjUz3p', NULL, NULL, 1, 1, '2019-07-21 00:45:23', '2019-07-27 10:17:27'),
(7, '71655455', 'ex5Nn1eFVmo:APA91bHY_c1kCTde6wfUz84u5vai9ajul6h30MaGtzM33vVIrsBHuq70DZft6CygOabxyG9ah3OINt8YLyNyRikIYGyMDhTwjkJeTRBnIUlcZM9AWzjwcF8O13hJyGKvF3gjWKE9rvOr', NULL, NULL, 1, 1, '2019-07-21 21:03:45', '2019-07-21 21:03:51'),
(8, '71655455', 'cR8qjxwZ8OU:APA91bF7iqcHC9eKuQialVZE1XxTmPMuuIiGuZWoZWMi3mWa1oVNSEvwxQQDSLP5w27ZBpS7DQvkOJ4NMgFZaXZnESd44WM7liDqHqafC17z-_JjkeG0kXtoJMe75EKXAXL47syjUz3p', 'fd4010588707819f', NULL, 1, 0, '2019-07-21 22:22:15', '2019-07-27 10:17:27'),
(9, '71655455', 'foHB1aMm7Mo:APA91bHx-g-d0Nc-ROqZK0VrhwfeIaQZUnIXL-_SHTIgzWyaWbHmjgCG4EoETtkWNp_RyzoaHB_Z2tpKuRugVttU42V90LkQR8C1a2_KbJJ2_jmdHpRfdQgh4gE0MshRULVJd7KP2_v4', NULL, NULL, 1, 1, '2019-07-22 00:54:05', '2019-07-22 01:13:48'),
(10, '71655455', 'e4jh28DW664:APA91bGlW3nRiKahBUDYOv62g_W3YA0-iFllWQfHQ81MU5eUHJZC5W4NBGHf2BLrEmlEjlJrdcOwgSlUFQvODUj_qs1KXfRxutXrNreC7Q5hQ_zoWdeQt3U0wSuQzOKHWzq5zFD3yB3H', NULL, NULL, 1, 1, '2019-07-22 10:51:15', '2019-07-23 15:14:33'),
(11, '71655455', 'eaY88DkzdNM:APA91bE4wV2w09UEYG1F9IXrgDVqbl9glM-trklhzx-cyB-rVf_qRiWf7Oll-tBMys5b8LRYsMzH0YLIZ9afrG_KRZwUBY6EovGAlI1Kili8Kzyp3R9bcyB5pzV4ovQTez4LITKqfkqh', NULL, NULL, 1, 1, '2019-07-23 11:40:05', '2019-07-23 11:40:05'),
(12, '7402407579', 'eLS_FFWtl04:APA91bGyk_2y6MzpHgGfzdJHCRXNXf_d0L1te_vVeVyGNQRU5rPmOeJkrzWUVLN7oVGpspZJmuVHYXthJCMgbl-1xTJotXC3i_Rr213AE2HOgPxU031Av6iTOLvi3Wcca1X4eIHy9GFi', '7ec57ff3cf1d6dab', NULL, 1, 1, '2019-07-23 12:23:41', '2019-07-23 12:23:41'),
(13, '71655455', 'f9hxXXsqHKw:APA91bG8qWgglAIrCuJTcb_jBfihbmZw3OrGmN8sJ82A33t_0QH3sv8wzmsfUwvA7sTrFfPKstOCUUW_Nvi1Nx3fSV2Tmj3bgC5zvg_430IWfjXAxt5-OYkfjWe6IucBULe9-EhwBuQy', NULL, NULL, 1, 1, '2019-07-23 16:26:24', '2019-07-24 12:47:04'),
(14, '71655455', 'ellceVuxtP8:APA91bF8JZtTP7zSgVSeaf-KB241nJvROGyfAGA7Pa3DZWQ7sbEKPebFGJbsbkQyd1zguEnk3aQF2Y0B7woE3mOtvfK0VmPfDFTbdQmXxqN-Ryh2iXAbhmFq2Y8G4QfBbYhbDY-hHuF3', NULL, NULL, 1, 1, '2019-07-23 16:32:22', '2019-07-23 16:32:22'),
(15, '71655455', 'no device', NULL, NULL, 1, 1, '2019-07-23 21:29:39', '2019-07-30 12:01:45'),
(16, '71655455', 'no device', 'B258102D-8187-4CEF-A90C-B6D99C7CFBB4', NULL, 1, 0, '2019-07-23 23:34:06', '2019-07-30 12:01:45'),
(17, '71655455', 'no device', '66CD5356-5293-499E-9FE7-F9B1DEA076DB', NULL, 1, 0, '2019-07-23 23:38:19', '2019-07-30 12:01:45'),
(18, '71655455', 'no device', '52AAF653-AAB4-4DD8-9636-7E2E0DEE4154', NULL, 1, 0, '2019-07-23 23:41:32', '2019-07-30 12:01:45'),
(19, '71655455', 'no device', 'B697B8F9-06D1-41D1-ABBE-86C8831343D2', NULL, 1, 0, '2019-07-23 23:58:32', '2019-07-30 12:01:45'),
(20, '71655455', 'no device', 'F82861EA-F227-473E-8A71-F66CC4C35F2B', NULL, 1, 0, '2019-07-24 00:02:16', '2019-07-30 12:01:45'),
(21, '71655455', 'no device', '05991386-5F79-414B-92A3-F074627B0EA7', NULL, 1, 0, '2019-07-24 00:14:25', '2019-07-30 12:01:45'),
(22, '71655455', 'no device', 'F7D1FCDF-B20A-48C0-B72A-B8E1DC974DB0', NULL, 1, 0, '2019-07-24 00:19:13', '2019-07-30 12:01:45'),
(23, '71655455', 'no device', '845640AB-FA19-44DC-A525-90EDCC10BB7A', NULL, 1, 0, '2019-07-24 00:21:55', '2019-07-30 12:01:45'),
(24, '71655455', 'eLS_FFWtl04:APA91bGyk_2y6MzpHgGfzdJHCRXNXf_d0L1te_vVeVyGNQRU5rPmOeJkrzWUVLN7oVGpspZJmuVHYXthJCMgbl-1xTJotXC3i_Rr213AE2HOgPxU031Av6iTOLvi3Wcca1X4eIHy9GFi', NULL, NULL, 1, 1, '2019-07-24 08:12:38', '2019-07-24 08:12:38'),
(25, '7412536241', 'eLS_FFWtl04:APA91bGyk_2y6MzpHgGfzdJHCRXNXf_d0L1te_vVeVyGNQRU5rPmOeJkrzWUVLN7oVGpspZJmuVHYXthJCMgbl-1xTJotXC3i_Rr213AE2HOgPxU031Av6iTOLvi3Wcca1X4eIHy9GFi', '7ec57ff3cf1d6dab', NULL, 1, 1, '2019-07-24 08:14:12', '2019-07-24 08:14:12'),
(26, '71655455', 'fv7pmO-E2-Y:APA91bGnQxPhCtvZjPwV726_38GAnuS5v6QAgoMgAmeJXrGaR-YVh6vGjXeZR7-kMh4WWS8bBmUyKCUq7DtlRoNd4Zbl9D1iRFE69UD8Pt3gbQElxo6PoNg9DAjFVBjt-Y6pY1W_OiU3', NULL, NULL, 1, 1, '2019-07-24 14:16:18', '2019-07-24 14:16:18'),
(27, '71655455', '9be5f89b328be85365c071bf7abd8270ac4fe129275e335ec2d68ffdea16c635', NULL, NULL, 1, 1, '2019-07-25 00:23:37', '2019-07-25 00:24:41'),
(28, '71655455', '364c7d626f10202bd62a6f140e93e98c6e8a0496533def0595b0ce02fba69f3d', NULL, NULL, 1, 1, '2019-07-25 10:35:14', '2019-07-31 17:15:09'),
(29, '71655455', 'dXt13bFIRVo:APA91bGP0BrBGFTA_LkT9OTtXIBT8lwguJxpX1wYsO2Zt6-CrsgEmyYa8gXdckd2GRWeINhnuvHDWbi90XiY8oSACVvYlFp-gyU2bQMEsxJBnhKd_imqKDeakMFHjKykK5wiq1733Ueu', NULL, NULL, 1, 1, '2019-07-25 12:34:46', '2019-07-25 18:39:26'),
(30, '71655455', 'fJJ9wHnsAm0:APA91bEqBMtyAdHCYXacYK-7iR5ZqE7eqlNqErPiu5StrIV2YLSaPQHMbty8hkusHzaVzF-639lJnMO-Qvh9kfFhI438Cw3f070huHvEd73-zADLSpFripP4oGLvdQGAUkGlQXgIm8IK', NULL, NULL, 1, 1, '2019-07-25 15:17:50', '2019-07-25 17:47:54'),
(31, '71655455', 'cLd9EMcpGAY:APA91bHqC1kExRzm7t8sJIKS3Q0FRl81lfWPFm5RNFo-tukf6zJxTIsD9hg7SVVTJFTx5QMP8jV6XuCSW2xvFMX9UkSCNK6t1jHnlsNQzb7PRxMplbIrjbAR5uDiL0REXH7cqSpxWU8v', NULL, NULL, 1, 1, '2019-07-25 22:09:52', '2019-07-26 19:16:42'),
(32, '71655455', 'cFilejT8Qzc:APA91bHSERA4QTaun7h4uZ08mjsnOr9QSt4CELjmCQ73D1kFUhjoUbso-G5LAdiRCZ-cwE8hIU-2JfRcEK0UOEY-8hXiTkTfs2FvPNpWdUZevjRVHibFJp_XigujtUQvtCDHBFoYHaUE', NULL, NULL, 1, 1, '2019-07-26 22:46:31', '2019-07-26 22:46:31'),
(33, '71655455', 'cxvIS63z0OU:APA91bF5jZ-xU3j48wIYoM7cO6zkLaUnn_3yxvVEnwfss5ThqVdOb2hK9zgQvhyVqn42VML7S8-4Fp28j3_cF_LuWWfPZWKjwiUz7JvhzIK84uil3NaM4RMjWWlKJ49VdhCD2F50-8iF', NULL, NULL, 1, 1, '2019-07-27 11:56:03', '2019-07-27 11:56:03'),
(34, '70707070', 'cxvIS63z0OU:APA91bF5jZ-xU3j48wIYoM7cO6zkLaUnn_3yxvVEnwfss5ThqVdOb2hK9zgQvhyVqn42VML7S8-4Fp28j3_cF_LuWWfPZWKjwiUz7JvhzIK84uil3NaM4RMjWWlKJ49VdhCD2F50-8iF', 'fd4010588707819f', NULL, 1, 1, '2019-07-27 12:50:28', '2019-07-27 12:50:28'),
(35, '646646', 'd9_Vu4whxzk:APA91bHtUJdTAN7NaupJJQuZJ-ci1YEooKHmGsUUbjE0RZfV6V2HkH7Ylc-TG_0YpwTLORDIn5nh6DstQlUZWCafbHb5ta0Fg7-dmlB0xMGyfToZINnBT5NI2tSZwt6VIWtegvWtI_pT', '33f40a24550ffc29', NULL, 1, 1, '2019-07-29 08:08:57', '2019-07-29 08:08:57'),
(36, '646646', 'cBBAUK_2llI:APA91bGSSWBD1iQdRxdO42E5GFS469TeZP4fr2ER5NvNckYEXMKHeg4GK3oNOX6Iw_PEYXAtz8Utkztj5Zeda4xLQc7l2LlAwGp0I3etIW_bV9Ux8bDRD7d9eUclqNqqE7GcZtcLLHio', NULL, NULL, 1, 1, '2019-07-29 08:25:03', '2019-07-29 08:25:03'),
(37, '71655455', 'cSfCOgdiQVc:APA91bGVOD-uA89DpbkaO5ctFdsadbbRjxPNr7jbECxvKrfgYbGSiOz7PHym2NIOCSHREKnGBTkaQCowbqcl7sTAqji5D6JEb4pR10LQgINgTUSmeuVrJ47UAhbMAkV8D9o9yjPZYxfr', NULL, NULL, 1, 1, '2019-07-29 09:10:36', '2019-07-29 09:13:39'),
(38, '646646', 'fd0KGfeBiH8:APA91bFLd-wyqOHriT0vaMZljBR1LTK2N_UFUMyDdwqKmVaiql_vJAy5VTc6e1vWY9h4gr11PDOP8ox_LIR3Zaei_lpi0dyQ6wpTeHdvf1z7Cd_2TM0KJVTqIueRc3w7NgjZecSOTsXR', NULL, NULL, 1, 1, '2019-07-29 09:52:44', '2019-07-29 09:52:44'),
(39, '646646', 'f6mwyqgW1T0:APA91bFL45Mt4V37yXuCbncRPm6ok6Lj8CJQiit_ZoaMb8RomAdXszpDmB-H8gX9Ukr4SOcildcZOuPe0S3NcH8asheSguiNLvw8fVTdhnErid2OHUsV-1Gzr5RwFOcb4HjiJDwxZGZa', NULL, NULL, 1, 1, '2019-07-29 09:56:52', '2019-07-29 09:56:52'),
(40, '71655455', 'f9WE3CMcx_k:APA91bH1nzp52PPYljEB6ZQu3KVsY8G-gil90f0XNPEcq0f9Vhj8y2yZd0agJw6pTzXYEUXYC01Gd1BbGX1eTRk5HYwfjo7aMfVNR3bq8Rr3etZiBfVVo378PDOi_zNITpCBUXrtOFDN', NULL, NULL, 1, 1, '2019-07-29 18:45:43', '2019-07-29 18:45:54'),
(41, '71655455', 'dZns_2QN0kw:APA91bH0KxeaJv68QwuXcPtlIN6B0YVHuJNSIxprRHYnELL-ZmsHF_ypJKDLa56XA7oH6E_XRFI40r3nja5Af0jkDZkaVja1A0wld2bBT63wUiFJ6Bmf-wfLFfMbbQeKtEIU3SGeUqbT', NULL, NULL, 1, 1, '2019-07-29 20:46:50', '2019-08-03 00:24:02'),
(42, '71655455', 'f8A4RjbpaM4:APA91bF2y24EJ6fxVuoK8mQwzG6TJoRPgiyfrhx0V72Rk5uNZ0QHmBz9i1WO6WA7f1Rjam8tTm4kKeU2BqBWBySFQme_oR4wM8A8KhOMnx3apwvwWBrobOUnhPd8245Ynom4qdDIFSkc', NULL, NULL, 1, 1, '2019-07-30 00:11:49', '2019-07-30 00:11:49'),
(43, '71655455', 'f8A4RjbpaM4:APA91bF2y24EJ6fxVuoK8mQwzG6TJoRPgiyfrhx0V72Rk5uNZ0QHmBz9i1WO6WA7f1Rjam8tTm4kKeU2BqBWBySFQme_oR4wM8A8KhOMnx3apwvwWBrobOUnhPd8245Ynom4qdDIFSkc', '33f40a24550ffc29', NULL, 1, 1, '2019-07-30 08:02:58', '2019-07-30 08:02:58'),
(44, '71655455', 'fJjIUcLwLnU:APA91bGfAE2ZF6yLV-UVn9mbl7cTrGusa21_ioBAnAxFLkzLYoFfvi0OiM4MFGvGFimGPu866pv3qSw9pCtul2XbLpaEIMgkFB3RyV66EuY_YezqlrBb21l1xbI6i98rCcjzm2xGZDEd', NULL, NULL, 1, 1, '2019-07-30 09:24:14', '2019-08-02 15:34:51'),
(45, '71655455', 'e1hP8RInHMQ:APA91bEm6la6fdYl6Mi9mulJ_FAwOZoOkVfaLHBiQ5Mcq1YUS4-y9MUB1Zj-_XxhDw26xZqRQCpKZvS9cF3F1iq8rznQC0QxKKTYooHbUTZfqyzxR7iGDjk0jS6z2BMhDrz7UefMe-Ho', NULL, NULL, 1, 1, '2019-07-30 14:58:16', '2019-07-30 14:58:16'),
(46, '71655455', 'caOJaXuEsns:APA91bHWJZk8fL45plugFHD-7g1GmiKfvQYdxVMUvclEsmRvJ97tA-RJ9lYga2FTmvtN3Bc8CsFAddLP2CxOUqPUsVrMN7bpPngEBH-MFLJ6mFWUfYf_S7I1e_Np7BpCtqMPznXEO-wk', NULL, NULL, 1, 1, '2019-07-30 15:30:08', '2019-08-02 15:33:16'),
(47, '71655455', 'ea204e176fb0264bb3358e9e0b5ba42fb889316c760c207b1ec46b5fb8ad7a45', 'BDB32C08-3611-410F-8421-53077ED51932', NULL, 1, 1, '2019-08-01 15:47:28', '2019-08-01 15:47:28'),
(48, '71654645', 'fJjIUcLwLnU:APA91bGfAE2ZF6yLV-UVn9mbl7cTrGusa21_ioBAnAxFLkzLYoFfvi0OiM4MFGvGFimGPu866pv3qSw9pCtul2XbLpaEIMgkFB3RyV66EuY_YezqlrBb21l1xbI6i98rCcjzm2xGZDEd', '33f40a24550ffc29', NULL, 1, 1, '2019-08-01 16:52:20', '2019-08-01 16:52:20'),
(49, '71655455', 'fJjIUcLwLnU:APA91bGfAE2ZF6yLV-UVn9mbl7cTrGusa21_ioBAnAxFLkzLYoFfvi0OiM4MFGvGFimGPu866pv3qSw9pCtul2XbLpaEIMgkFB3RyV66EuY_YezqlrBb21l1xbI6i98rCcjzm2xGZDEd', '33f40a24550ffc29', NULL, 1, 0, '2019-08-01 18:54:28', '2019-08-02 15:34:51'),
(50, '79191563', 'ea204e176fb0264bb3358e9e0b5ba42fb889316c760c207b1ec46b5fb8ad7a45', 'F4257FF2-8BB1-493B-B74A-9C51F8D18400', NULL, 1, 1, '2019-08-01 18:56:23', '2019-08-01 18:56:23'),
(51, '71947647', 'cAQerfIQe5c:APA91bE1A4YuxylUQbg2bUhyvxWc1b85G8vUOB3fiweOjJYDQXz-4x-AywQq6ydhjaNsYJkCrTkCVTZcWg8h1QL8-ckM53TmAHDZRuY_EkNbOZi_yKQDCmR7PIZH4hNL6GxgFPOhr2gR', '00fb2873832508fb', NULL, 1, 1, '2019-08-01 20:55:27', '2019-08-01 20:55:27'),
(52, '70181479', 'dwMVOjq7Qb8:APA91bGJrr4h9hBoUdwQFqfquX7YTTxUiS4J3g1RwSE2zeNQn455EHfaB2DStsZQJlT-ZMi-YZpJYzNH_7Q48xsKxuspB2qXn72ezMrBglHcBjDl_-iRgc84dZ5FEFoC-G6EJqUxlc9B', '852998f76b58ac11', NULL, 1, 1, '2019-08-01 20:57:54', '2019-08-01 20:57:54'),
(53, '71655455', 'e2AWbIRNcZY:APA91bGhUln-CZ_gI5pAIN8WRgybNHfC5JdXMB3kL8-68-pZbdq7ricJa0_WT3YSWqlkax_CFAbGvyBMPF7_5FZ_W2_6p1_LNQW8fJY2HJMpAHACDqbzZOHFERCqDR-LXsy1CLlp6khD', NULL, NULL, 1, 1, '2019-08-02 15:42:05', '2019-08-02 15:42:05'),
(54, '71655455', 'f9iw7fEsbbU:APA91bGP_wCXvp_ZJN6SEv5hUTtmg_4Y1yYCknWzDON0Ojfj2lQK3cpTVdcMuhNzoUrBVEJzGukJK8s4PiF7sjKQpsfjsJlki6e4wBFb9PELfsrLzSx4dr8kHjvjGyzNUxFlvgi_YggS', NULL, NULL, 1, 1, '2019-08-02 16:22:16', '2019-08-03 18:09:46'),
(55, '76567070', 'dzcyxJ-B8AA:APA91bE1Dv5LCnoBuoU0N3rwdGDNmKC3NgoTkC6GLGEEUdW1Ii0OGDtHLtBE2EPYe0-O5-O1iPIq5NmtHRUJ-KVosMRjD2lG0ibK520UuHztf5bM7EeAo6QUOQKIb7ko5mCiE3cHjJb9', '1052f57d87ea4b71', NULL, 1, 1, '2019-08-02 16:27:31', '2019-08-02 16:27:31'),
(56, '71655455', 'f9iw7fEsbbU:APA91bGP_wCXvp_ZJN6SEv5hUTtmg_4Y1yYCknWzDON0Ojfj2lQK3cpTVdcMuhNzoUrBVEJzGukJK8s4PiF7sjKQpsfjsJlki6e4wBFb9PELfsrLzSx4dr8kHjvjGyzNUxFlvgi_YggS', '33f40a24550ffc29', NULL, 1, 0, '2019-08-02 18:57:39', '2019-08-03 18:09:46'),
(57, '71655455', 'fUYe3_I4fY4:APA91bGKq71BUIcBA3OxvgVP0ZXLkC1aEQ13XToU-AUGEuJiGBWkYyIdyZX-jLNX9B6elBmq3FRhQ7rRpRbh7cTkKkyyZcDYXtSBv--DMzZw1N-gN4DPv1FwKvLPg7302CaNtJfMZBpJ', NULL, NULL, 1, 1, '2019-08-03 09:43:29', '2019-08-03 09:43:29'),
(58, '79191563', 'no device', NULL, NULL, 1, 1, '2019-08-04 18:47:23', '2019-08-04 18:47:23'),
(59, '71398539', '92566fd9d9aae6f411bbac0ee9067b16067b25f5ec201a096a2ac5968dbfaab4', 'DE73C258-B73D-4857-A37D-7AF94EB0269C', NULL, 1, 1, '2019-08-05 09:36:59', '2019-08-05 09:36:59'),
(60, '3046480', 'cc7870eefac286fc6c9fe7cf6b0251f669465d16e5277314b953959178e5d3e8', '58F5E182-D310-4893-9CDB-064B4405966E', NULL, 1, 1, '2019-08-05 12:21:08', '2019-08-05 12:21:08'),
(61, '70911598', 'cZfOIocVzbE:APA91bFYN3jqiArEIZwdDH4YVIy_9jC7ARQoX8jaF_WOh8y9jg4DwEuh7V0g4XUwUFLmwRJ6q0WrMJJ16Lwzxf-EcyVn12CYmqrBdTlgMMf3ofsGWWbYxgPhEuzRl5JpbyX8WRJ1u9U8', '78e370d37676d591', NULL, 1, 1, '2019-08-05 13:02:56', '2019-08-05 13:02:56'),
(62, '7402407579', 'eLS_FFWtl04:APA91bGyk_2y6MzpHgGfzdJHCRXNXf_d0L1te_vVeVyGNQRU5rPmOeJkrzWUVLN7oVGpspZJmuVHYXthJCMgbl-1xTJotXC3i_Rr213AE2HOgPxU031Av6iTOLvi3Wcca1X4eIHy9GFi', '7ec57ff3cf1d6dab', NULL, 1, 1, '2019-08-06 14:15:52', '2019-08-06 14:15:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('schedule','normal') COLLATE utf8_unicode_ci DEFAULT 'normal',
  `ride_option` enum('Instant','Normal') COLLATE utf8_unicode_ci DEFAULT 'Normal',
  `broadcast` enum('YES','NO') COLLATE utf8_unicode_ci DEFAULT 'NO',
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `current_provider_id` int(11) NOT NULL,
  `service_type_id` int(11) NOT NULL,
  `rental_hours` int(11) DEFAULT NULL,
  `status` enum('SEARCHING','CANCELLED','ACCEPTED','STARTED','ARRIVED','PICKEDUP','DROPPED','COMPLETED','SCHEDULED','SCHEDULES') COLLATE utf8_unicode_ci NOT NULL,
  `invoice_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_leave` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `out_return` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancelled_by` enum('NONE','USER','PROVIDER') COLLATE utf8_unicode_ci NOT NULL,
  `cancel_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` enum('CASH','CARD','PAYPAL','CC_AVENUE') COLLATE utf8_unicode_ci NOT NULL,
  `service_required` enum('none','rental','outstation') COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_track` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NO',
  `distance` double(15,8) NOT NULL,
  `travel_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `s_latitude` double(15,8) NOT NULL,
  `s_longitude` double(15,8) NOT NULL,
  `d_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `d_latitude` double(15,8) NOT NULL,
  `track_distance` double(15,8) NOT NULL DEFAULT '0.00000000',
  `track_latitude` double(20,19) NOT NULL DEFAULT '0.0000000000000000000',
  `track_longitude` double(20,19) NOT NULL DEFAULT '0.0000000000000000000',
  `d_longitude` double(15,8) NOT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  `is_scheduled` enum('YES','NO') COLLATE utf8_unicode_ci NOT NULL,
  `user_rated` tinyint(1) NOT NULL DEFAULT '0',
  `provider_rated` tinyint(1) NOT NULL DEFAULT '0',
  `use_wallet` tinyint(1) NOT NULL DEFAULT '0',
  `surge` tinyint(1) NOT NULL DEFAULT '0',
  `route_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `geo_fencing_id` int(11) NOT NULL DEFAULT '0',
  `geo_fencing_distance` double(10,8) NOT NULL DEFAULT '0.00000000',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `geo_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_accept_time` time DEFAULT NULL,
  `driver_reached_time` time DEFAULT NULL,
  `arrival_estimate_time` int(11) DEFAULT NULL,
  `eta_discount` double(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `booking_id`, `user_id`, `type`, `ride_option`, `broadcast`, `provider_id`, `current_provider_id`, `service_type_id`, `rental_hours`, `status`, `invoice_email`, `out_leave`, `out_return`, `day`, `cancelled_by`, `cancel_reason`, `payment_mode`, `service_required`, `paid`, `is_track`, `distance`, `travel_time`, `s_address`, `s_latitude`, `s_longitude`, `d_address`, `otp`, `d_latitude`, `track_distance`, `track_latitude`, `track_longitude`, `d_longitude`, `assigned_at`, `schedule_at`, `started_at`, `finished_at`, `is_scheduled`, `user_rated`, `provider_rated`, `use_wallet`, `surge`, `route_key`, `geo_fencing_id`, `geo_fencing_distance`, `deleted_at`, `created_at`, `updated_at`, `geo_time`, `driver_accept_time`, `driver_reached_time`, `arrival_estimate_time`, `eta_discount`) VALUES
(1, 'Relax556483', 132, 'normal', 'Normal', 'NO', 14, 14, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 1.00000000, '0', 'Jisr Ghadir, chehade bldg, 2nd flr Jounieh، Lebanon', 33.97814840, 35.63149350, '51M, Lebanon', '4443', 33.97818060, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63192952, '2019-08-01 19:25:55', NULL, '2019-08-01 19:26:28', '2019-08-01 19:27:05', 'YES', 1, 1, 0, 0, 'ijknE}gnxE_B{BgH_J{C{Da@s@m@wAe@mASc@AJ?N?nABpBFx@FXZp@A?A@ABAH@HFDF?DCBC?AJ?NFJHLd@Pn@Jx@^pBRbAFl@?b@Cf@U|AKf@Z^R\\z@o@|@k@HE`A]j@c@`AoA~@zAt@fBl@tBb@tBLfAF~A?~ASxD_@nC}AjIwBfMYlBKdACfA@tAHrA\\|BT~@Z|@`BbDpFpJr@tAz@jB|AzDhBbFbAnBdAxAz@z@fEzDjAlAtD|Dp@p@jAz@hAr@XLnFnClJ~DdClAlOxGXb@@JEXBV@HAVFXFJLHJ@J?PEJINY`@aBl@iA^s@DALGHGn@]`CcBf@Yf@U^ORET@n@Jj@Z\\XbCnBrHxFrCxBpAn@f@Hb@Db@@pAKdAC`@FdAh@N@TG\\O^g@H[D_@Ao@MSICYi@e@{AQ_AEs@Bq@?eIBgB^kDVoARgB`@oCRkBRyAJiBF{A@q@J{AJcAAe@BIF]@Q?GJg@PcARg@p@m@lA{@pA}@`AkA`@o@nB{Ct@g@^[PUTu@ViAl@sD|BmNZiBNe@b@iAJc@B]AwBO}@Oe@Sg@SWOG]Wg@Qu@O_BUq@O}@_@sCoAiBs@e@]wEaE_A_A}@iAq@gAIm@?c@D_@Lc@T]p@e@pDaBr@c@TYj@u@n@kAnDaH\\oAHeAB}@CyAGy@KmAYeCSoAO_AKe@y@uBuAcDWu@My@G}@KuD?sAT{A\\_Cd@}DJ}AP_F', 2, 1.00000000, NULL, '2019-08-01 19:24:52', '2019-08-01 19:27:15', '0', '21:26:03', '21:26:08', 3, 0.00),
(2, 'Relax639485', 132, 'normal', 'Normal', 'NO', 14, 14, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 0.00000000, '0', 'Jisr Ghadir, chehade bldg, 2nd flr Jounieh، Lebanon', 33.97814840, 35.63149350, '51M, Lebanon', '4648', 33.97826425, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63203035, '2019-08-01 19:27:33', NULL, '2019-08-01 19:28:20', '2019-08-01 19:28:28', 'YES', 1, 1, 0, 0, 'ijknE}gnxE_B{BgH_J{C{Da@s@m@wAcAeC_BsDs@oBaAgCq@aBw@uAkBmD{@uB{@kBU_@c@g@k@i@_Ag@iAu@]_@q@oA[c@Z_@^Yf@r@~@hA^\\b@^EuAGwAEu@Ee@Qe@Qa@[_@{@m@cBs@gBm@a@Mi@W]Ua@Wg@e@a@_@a@k@oB_EW[m@_@UQi@u@k@cAc@g@k@e@IO?ABC@C?ICGGEG@EBAB_@WsAiBeAiBkBkDqA_Co@mAFGHEDAT@f@J', 2, 0.00000000, NULL, '2019-08-01 19:27:26', '2019-08-01 19:28:39', '0', '21:27:39', '21:27:46', 10, 0.00),
(3, 'Relax525493', 131, 'normal', 'Normal', 'NO', 16, 16, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 1.00000000, '0', '51M, Lebanon', 34.00083970, 35.64696480, '51M, Lebanon', '2951', 33.99683489, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.64625740, '2019-08-01 21:10:10', NULL, '2019-08-01 21:12:00', '2019-08-01 21:12:20', 'YES', 1, 1, 0, 0, '_xonEgiqxEn@X?PKbAlATj@Dx@?TEPOVe@lEpA~IjCbIfC`EvAjAf@nHbDfClAvOtGxAn@j@\\nCfAhElBbDnBxBlBhCrCfHxIzIhLDDe@r@IJ?ACCGCG@EDAH@HDD@@Wf@uApBc@f@{ApAcBzAw@~@]IAC?CACEGEGUa@Em@@uB?e@QcAWk@]i@s@}@', 2, 1.00000000, NULL, '2019-08-01 21:10:10', '2019-08-01 21:14:05', '0', '23:10:18', '23:10:35', 4, 0.00),
(4, 'Relax610025', 135, 'normal', 'Normal', 'NO', 15, 15, 5, NULL, 'CANCELLED', NULL, NULL, NULL, NULL, 'PROVIDER', NULL, 'CASH', 'none', 0, 'NO', 9.15900000, NULL, 'Jounieh, Lebanon', 33.98426910, 35.63444910, 'Dbayeh, Lebanon', NULL, 33.93291510, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.58921810, '2019-08-01 21:23:49', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'uplnEiznxEGG`@e@b@e@h@q@q@_A{@gAn@y@|@kAR_@^k@Z]HKf@h@L?H@XJP@|DfF|C`EzD|EfFxG^j@z@`Bp@nBh@tBXjBHfAB~AIfCK`B_@nCgDzQ_A|FMfAIrA?bADtAPhBZzAX`A^x@nAfCfChE|C|FzAfDnCnH|@tB|@xAd@l@z@z@fEzDjAlAtD|Dp@p@b@^lAv@|@d@nFnClJ~DdClAtGtChH`DxCpAz@f@|DbBf@PbDvAhDbCbEvDlClCtClCtE~EhAxAl@|@l@vARz@v@lC^~BZ`DZdFX`B`@|@Xd@n@r@t@l@v@\\~@VfGxB`Cj@BFBBpAV~AJ`BBzAIrBKRA?GAc@?k@?K@QH?hBGrA@bADrATjBRbBJtBH|AL`APfA`@rAv@n@ZhBl@hCd@vC^j@D`AA~@IbCe@~D[p@GZ?vCLvEX~F\\xDJpBFhC?rBDn@D~@?~@MzAa@^M\\Gx@T`@X|@pA~@|A_@^Y`@U^G^Jr@BZAf@E|ACT_Eo@oC_@', 2, 0.00000000, NULL, '2019-08-01 21:23:49', '2019-08-01 21:43:01', NULL, NULL, NULL, NULL, 0.00),
(5, 'Relax912890', 131, 'normal', 'Normal', 'NO', 15, 15, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 0.00000000, '0', '51M, Lebanon', 34.00335110, 35.64824790, '51M, Lebanon', '2102', 34.00251580, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.64796940, '2019-08-02 15:00:30', NULL, '2019-08-02 15:00:59', '2019-08-02 15:01:05', 'YES', 1, 1, 0, 0, '}gpnEspqxEpD|@hF~A|Bt@|H`CfDbAbI~BzDnAfH~B`A`@zIxDfClAhFvBtJbE|@f@lHzChCvA`BfAlChC|AdB|D|EtIzKpBjChIfKbB~B^l@v@bBp@rBd@tBPlAJ~A?~AM`DM~Aw@pEqClOy@jFKdAGdA?vAFtAVpBXnAX|@lAbCfB`D|CpFXj@zA`DfAlCpBrFbAxB~@tAb@f@tFhFnCpChCrCpAdAnAx@~EfCzLjF~HnDhFzBrAl@TZ@@@D@FCV?X@F?RBXHPFHNDVALGJIZaARy@jAyBXM^StCqB`By@XIPAd@Ff@Nn@d@`BrAbGrEbDbChA|@p@\\t@Xb@DfABfAKr@C^B~@b@XJRAXK\\[Vg@DWBa@CYKUQOGIi@{AWiAGs@Bu@?eE@}EXuCZgBHq@|@iHXsBP}DBy@TeCBe@EYDGBIDc@?Ob@uBLYp@m@fCeBx@u@h@w@bBkCb@q@\\Sl@c@PSVk@h@eCrCaQb@oCJg@d@kALa@Fc@?yA?k@G_@Qw@Uk@OWm@c@UKk@OgBWu@O{@W}CwAgCeA{DcDsBqBcB}BMYEYA_@@a@Ha@N_@Z[xBiAzAq@`@WVSf@o@r@gAhEqIXwAFgBEkBM{AUwBQqAWsAEa@e@qAaB{Da@iAQy@IaA@_@KwBA{Bh@aDb@oDNyALaEJiB', 2, 0.00000000, NULL, '2019-08-02 15:00:32', '2019-08-02 15:01:28', '0', '17:00:42', '17:00:49', 18, 0.00),
(6, 'Relax288389', 131, 'normal', 'Normal', 'NO', 0, 15, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 12.00000000, NULL, '51M, Lebanon', 34.00357350, 35.64786840, 'Jeita, Lebanon', '9082', 33.95364540, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.64371270, '2019-08-02 15:17:52', NULL, NULL, NULL, 'YES', 0, 1, 1, 0, 'ujpnEinqxEDeBbGxAdK`DjLlD~IjCbIfC`EvAjAf@nHbDfClAvOtGxAn@j@\\nCfAhElBbDnBxBlBhCrCfHxIzIhLzD|EfFxG~@zAt@fBl@tBb@tBLfAF~A?~ASxD_@nC}AjIwBfMYlBKdACfA@tAHrA\\|BT~@Z|@`BbDpFpJr@tAz@jB|AzDhBbFbAnBdAxAz@z@fEzDjAlAtD|Dp@p@jAz@hAr@XLnFnClJ~DdClAlOxGXb@@JEXBV@HAVFXFJLHJ@J?PEJINY`@aBl@iA^s@DALGHGn@]`CcBf@Yf@U^ORET@n@Jj@Z\\XbCnBrHxFrCxBpAn@f@Hb@Db@@pAKdAC`@FdAh@N@TG\\O^g@H[D_@Ao@MSICYi@e@{AQ_AEs@Bq@?eIBgB^kDVoARgB`@oCRkBRyAJiBF{A@q@J{AJcAAe@BIF]@Q?GJg@PcARg@p@m@lA{@pA}@`AkA`@o@nB{Ct@g@^[PUTu@ViAl@sD|BmNZiBNe@b@iAJc@B]AwBO}@Oe@Sg@SWOG]Wg@Qu@O_BUq@O}@_@sCoAiBs@e@]wEaE_A_A}@iAq@gAIm@?c@D_@Lc@T]p@e@pDaBr@c@TYj@u@n@kAnDaH\\oAHeAB}@CyAGy@KmAYeCSoAO_AKe@y@uBuAcDWu@My@G}@KuD?sAT{A\\_Cd@}DJ}AP_F', 2, 0.00000000, NULL, '2019-08-02 15:17:54', '2019-08-02 15:18:11', NULL, NULL, NULL, NULL, 0.00),
(7, 'Relax465356', 132, 'normal', 'Normal', 'NO', 14, 14, 5, NULL, 'COMPLETED', NULL, NULL, NULL, NULL, 'NONE', NULL, 'CASH', 'none', 1, 'YES', 0.00000000, '0', 'Jisr Ghadir, chehade bldg, 2nd flr Jounieh، Lebanon', 33.97814840, 35.63149350, 'Jisr Ghadir, chehade bldg, 2nd flr Jounieh، Lebanon', '5532', 33.97817410, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63157810, '2019-08-02 23:57:09', NULL, '2019-08-02 23:57:49', '2019-08-02 23:57:59', 'YES', 1, 1, 0, 0, 'ijknE}gnxE_B{BgH_J{C{Da@s@m@wAe@mASc@AJ?N?nABpBFx@FXZp@A?A@ABAH@HFDF?DCBC?AJ?NFJHLd@Pn@Jx@^pBRbAFl@?b@Cf@U|AKf@Z^R\\z@o@|@k@HE`A]j@c@`AoA~@zAt@fBl@tBb@tBLfAF~A?~ASxD_@nC}AjIwBfMYlBKdACfA@tAHrA\\|BT~@Z|@`BbDpFpJr@tAz@jB|AzDhBbFbAnBdAxAz@z@fEzDjAlAtD|Dp@p@jAz@hAr@XLnFnClJ~DdClAlOxGXb@@JEXBV@HAVFXFJLHJ@J?PEJINY`@aBl@iA^s@DALGHGn@]`CcBf@Yf@U^ORET@n@Jj@Z\\XbCnBrHxFrCxBpAn@f@Hb@Db@@pAKdAC`@FdAh@N@TG\\O^g@H[D_@Ao@MSICYi@e@{AQ_AEs@Bq@?eIBgB^kDVoARgB`@oCRkBRyAJiBF{A@q@J{AJcAAe@BIF]@Q?GJg@PcARg@p@m@lA{@pA}@`AkA`@o@nB{Ct@g@^[PUTu@ViAl@sD|BmNZiBNe@b@iAJc@B]AwBO}@Oe@Sg@SWOG]Wg@Qu@O_BUq@O}@_@sCoAiBs@e@]wEaE_A_A}@iAq@gAIm@?c@D_@Lc@T]p@e@pDaBr@c@TYj@u@n@kAnDaH\\oAHeAB}@CyAGy@KmAYeCSoAO_AKe@y@uBuAcDWu@My@G}@KuD?sAT{A\\_Cd@}DJ}AP_F', 2, 0.00000000, NULL, '2019-08-02 23:57:09', '2019-08-03 18:10:00', '0', '01:57:12', '01:57:34', 3, 0.00),
(8, 'Relax540323', 141, 'normal', 'Normal', 'NO', 0, 17, 5, NULL, 'CANCELLED', NULL, NULL, NULL, NULL, 'USER', NULL, 'CASH', 'none', 0, 'YES', 17.00000000, NULL, 'Zouq Mosbeh - Aajaltoun Rd, Lebanon', 33.95421260, 35.64063520, 'Daoura, Lebanon', '4340', 33.89383980, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.55065710, '2019-08-05 12:22:32', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'ytfnE_apxEVmBd@}DJ}ARsFNqDk@MMIIIGOGg@BQ\\eAx@cBCzCEbC[dHM`EOxAYtBOd@Ox@_@|BBfBHtBB~@CVO`@U^Qb@B`@P~@d@dArAvAbBrAXVLl@RnAXdCRfCBxAC|@IdA]nAoD`Ho@jAk@t@UXs@b@qD`Bq@d@U\\Mb@E^?b@Hl@p@fA|@hA~@~@rAlAbCrBd@\\hBr@rCnA|@^p@N~ATt@Nf@P\\VNd@Nd@Hf@@f@?\\OvAYpBWbDo@pEy@hFo@pDOl@aAdCa@t@gAlBcBjCi@v@y@t@gCdB_BzASVO`@EBGHGPEXAZ@HNrDF^Ap@GzAKhBSxASjBa@nCSfBWnA_@jDC|GAdDAt@Jr@\\rA`@fAFJBB?NCZKRKJi@LiBLu@Hw@FgBHU?UAc@Mg@Ue@]q@i@uC{BiEcDa@m@[w@Sw@AQc@yAUO_@Ic@As@`@}DpB{@n@y@p@qAp@aAf@{An@k@b@[`@Kt@Bb@Tn@VRhAj@v@Z|@XzAX~Dh@nCn@dBn@rAn@TTjCdClClCtClCtE~EhAxAl@|@l@vARz@v@lC^~BZ`DZdFX`B`@|@Xd@n@r@t@l@v@\\~@VfGxB`Cj@p@Df@F|CJxEKnFGnGXbCZfDl@nBf@bFrAtCd@fD`@xDb@nBR~F~@dBT|Cn@`Et@dNtBzKpAfCZpEv@vJpCzBh@~M|BtEz@zHpAxPjDzBj@x@X\\L|DhB`DnA`A\\jCv@nGhCxBfAdDjBhPbJbEnCpC`CvCpCxBrBtAnAtBnBxAxAth@di@jErE`@X|@~@fBhBz@fAf@b@~@|@Z`@f@v@h@vAd@xAR`ANtAr@hI|@rIzAvMv@~G`B~Mz@dH`@nDf@jEH`B?r@?T', 2, 0.00000000, NULL, '2019-08-05 12:22:32', '2019-08-05 12:23:25', NULL, NULL, NULL, NULL, 0.00),
(9, 'Relax133767', 141, 'normal', 'Normal', 'NO', 0, 17, 5, 1, 'CANCELLED', NULL, NULL, NULL, NULL, 'USER', NULL, 'CASH', 'rental', 0, 'YES', 0.00000000, NULL, 'Zouq Mosbeh - Aajaltoun Rd, Lebanon', 33.95418140, 35.63817900, '', '1221', 33.95418140, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63817900, '2019-08-05 13:39:14', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'stfnEsqoxE', 2, 0.00000000, NULL, '2019-08-05 13:39:14', '2019-08-05 13:39:23', NULL, NULL, NULL, NULL, 0.00),
(10, 'Relax276733', 141, 'normal', 'Normal', 'NO', 0, 17, 5, 1, 'CANCELLED', NULL, NULL, NULL, NULL, 'USER', NULL, 'CASH', 'rental', 0, 'YES', 0.00000000, NULL, 'Zouq Mosbeh - Aajaltoun Rd, Lebanon', 33.95418140, 35.63817900, '', '5952', 33.95418140, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63817900, '2019-08-05 13:39:14', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'stfnEsqoxE', 2, 0.00000000, NULL, '2019-08-05 13:39:14', '2019-08-05 13:39:32', NULL, NULL, NULL, NULL, 0.00),
(11, 'Relax167446', 139, 'normal', 'Normal', 'NO', 0, 19, 5, NULL, 'CANCELLED', NULL, NULL, NULL, NULL, 'USER', NULL, 'CASH', 'none', 0, 'YES', 6.00000000, NULL, 'Unnamed Road, Lebanon', 33.95547120, 35.64565780, 'Jounieh, Lebanon', '6782', 33.98426910, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.63444910, '2019-08-06 21:52:24', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'c|fnEy`qxEUq@Gg@Eg@Qe@mA{AII_@Gi@@]Fm@^[^FTXCTJNRP^L^?\\E\\Ch@Dt@C?EBAD?@?B?@AX?TPtBDpACdAGxA@`AFrAXnAf@jBH\\B\\?l@Gj@MZk@r@kAvA}@bBQr@CZBTJLVHf@Bb@Eb@@LFBDAPK`@cA~BYx@Kf@?ND^NdG@VHRVd@HZ?RIP_@Xk@RgDd@YN_@^Yf@c@|@MP]RSDm@Aw@G_@FYPaAp@c@N_@B[Ac@F_@HcA`@YXQTMZGXCl@IzDKjCAdCQ`@Wp@c@fB?|AInAA?C@CHQN_@No@Ny@d@q@j@aAp@SH_ADwATK[[_AWXm@\\}@^}@XYBgAAMDGHEV?b@Ef@GKGC[DMJCREVa@|@uAjAKBE?M_@SUMIQ@QFgEnEi@x@]x@CHUF_@NKFKMc@k@KU[yAe@cCO]SQ]OmASQK_@c@kA_Ba@k@Ug@KSGCO@GJAPF`@BZCNGFK?I@WOqAq@[Qw@u@qA{AYc@Wi@e@iAUa@ICK@QNKNmApAy@w@gAq@a@SiAK]A_BSyASb@pADP_A@s@BwCRkBNw@JKDg@VSPa@Xe@RYJe@Fh@{FR}AZ}BWCi@G[Sc@a@k@s@aBwB[_@WUWOeA{@QKUGaAE[GgAMUKKMW]QKYG[EGDw@~@]IAC?CACEGEGUa@Em@@uB?e@QcAWk@]i@s@}@', 2, 0.00000000, NULL, '2019-08-06 21:52:24', '2019-08-06 21:52:33', NULL, NULL, NULL, NULL, 0.00),
(12, 'Relax316930', 139, 'normal', 'Normal', 'NO', 0, 18, 5, NULL, 'CANCELLED', NULL, NULL, NULL, NULL, 'USER', NULL, 'CASH', 'none', 0, 'YES', 6.00000000, NULL, 'Unnamed Road, Lebanon', 33.95546900, 35.64564440, 'Kaslik, Lebanon', '1053', 33.98310690, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.61805690, '2019-08-07 05:56:51', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, 'a|fnEw`qxEWs@Gg@Eg@Qe@mA{AII_@Gi@@]Fm@^[^FTXCTJNRP^L^?\\E\\Ch@Dt@C?EBAD?@?B?@AX?TPtBDpACdAGxA@`AFrAXnAf@jBH\\B\\?l@Gj@MZk@r@kAvA}@bBQr@CZBTJLVHf@Bb@Eb@@LFBDAPK`@cA~BYx@Kf@?ND^NdG@VHRVd@HZ?RIP_@Xk@RgDd@YN_@^Yf@c@|@MP]RSDm@Aw@G_@FYPaAp@c@N_@B[Ac@F_@HcA`@YXQTMZGXCl@IzDKjCAdCQ`@Wp@c@fB?|AInAA?C@CHQN_@No@Ny@d@q@j@aAp@SH_ADwATK[[_AWXm@\\}@^}@XYBgAAMDGHEV?b@Ef@GKGC[DMJCREVa@|@uAjAKBE?M_@SUMIQ@QFgEnEi@x@]x@IZCf@B\\H\\Rf@hA~BZ~@h@pAFXD\\AZGPSTOBS?cAWi@Mo@BaAFsAFo@R]\\Qj@Ef@?nDeAdAeCnBu@r@]^gBzA_@Tk@^q@X{@Xo@`@[ZOZINUn@OQa@]]Yw@jBe@bAIr@Ob@g@j@URKFECC@A?A@AB?H@@?@S|AY`AYZY\\i@He@e@iBkAuAcAi@Yw@QQOYQ_@O]IsDYcBWaAUuCeAw@U_@UuDuAoB}@[e@m@kAS}@', 2, 0.00000000, NULL, '2019-08-06 22:41:59', '2019-08-07 05:57:08', NULL, NULL, NULL, NULL, 0.00),
(13, 'Relax422525', 142, 'normal', 'Normal', 'NO', 17, 17, 5, NULL, 'CANCELLED', NULL, NULL, NULL, NULL, 'PROVIDER', 'uuuyhh\n\n', 'CASH', 'none', 0, 'YES', 6.00000000, NULL, 'Unnamed Road, Lebanon', 33.95533190, 35.64569030, 'Kaslik, Lebanon', '7765', 33.98310690, 0.00000000, 0.0000000000000000000, 0.0000000000000000000, 35.61805690, '2019-08-06 22:44:46', NULL, NULL, NULL, 'YES', 0, 0, 0, 0, '}{fnEo`qxEWq@Ig@Ee@Mg@cAuAUUSGc@EM@_@FYLc@\\QT@BDPHCJARH\\b@Tj@B\\E\\CXAVDt@G@CF?@?@?BAP?ND~@PtCK~B@dBFnAHd@t@lCH\\D\\@n@Gj@M\\SXoAxAu@jAYl@KXGXE`@BRJNRFd@Dd@Eb@@PDBFALI`@}@tB[x@Qt@?LDXB^H~EB`@FTT`@L^?TGP]TULYHiCZc@Js@l@s@zASVQNSHe@Dy@Ik@@UH[Ts@f@UJ[Fm@As@J[HeAh@]b@Ut@GtCMlDClCAh@IPSb@i@nBGb@@d@ClACj@A?C??@CBADIHWLi@Nm@Rw@j@cAx@c@TYFS@[@wAT[aAKYKL_@XwAn@o@T]D_@?{@@IFGVA|@CRCEGGY@MFGLCXWp@QXy@p@QPMFG?M[QWMGQCODIDq@v@_DfDUZa@~@IXEb@Bh@FX|@lBd@dA\\dAh@pADX@^GXOTMDOBSCq@SSC_@K[?i@FeBDm@Jg@XQPIPKj@C`A@bCSRq@p@sAfAgA|@y@x@kB~AuAz@}Ah@o@^YVS\\c@fAoAiA}AnDQfAYb@a@d@WJG?A?A@AB?H@@MjA[pA]^OPIJUDSBSUw@g@aD_Ca@Qi@I[S]U}@YsDYoAOc@KeAYeDkAc@UmAc@wEkB[Ym@cAYy@Ic@', 2, 0.00000000, NULL, '2019-08-06 22:44:46', '2019-08-07 05:58:00', NULL, '00:45:01', '00:47:27', 10, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user_request_payments`
--

CREATE TABLE `user_request_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `promocode_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peak_price` double(10,2) DEFAULT NULL,
  `driver_beta` double(10,2) DEFAULT NULL,
  `fixed` double(10,2) NOT NULL DEFAULT '0.00',
  `distance` double(10,2) NOT NULL DEFAULT '0.00',
  `minute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `non_geo_fencing_minute` int(11) NOT NULL DEFAULT '0',
  `geo_fencing_minute` int(11) NOT NULL DEFAULT '0',
  `commision` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `wallet` double(10,2) NOT NULL DEFAULT '0.00',
  `surge` double(10,2) NOT NULL DEFAULT '0.00',
  `none_geo_fencing_total` double(10,2) NOT NULL DEFAULT '0.00',
  `geo_fencing_total` double(10,2) NOT NULL DEFAULT '0.00',
  `non_geo_price` double(10,2) NOT NULL DEFAULT '0.00',
  `return_travel_fare` double(10,2) NOT NULL DEFAULT '0.00',
  `total` double(10,2) NOT NULL DEFAULT '0.00',
  `payable` double(8,2) NOT NULL DEFAULT '0.00',
  `night_fare` double(8,2) DEFAULT '0.00',
  `percentage` double(8,2) DEFAULT '0.00',
  `provider_commission` double(8,2) NOT NULL DEFAULT '0.00',
  `provider_pay` double(8,2) NOT NULL DEFAULT '0.00',
  `eta_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_payments`
--

INSERT INTO `user_request_payments` (`id`, `request_id`, `promocode_id`, `payment_id`, `payment_mode`, `peak_price`, `driver_beta`, `fixed`, `distance`, `minute`, `non_geo_fencing_minute`, `geo_fencing_minute`, `commision`, `discount`, `tax`, `wallet`, `surge`, `none_geo_fencing_total`, `geo_fencing_total`, `non_geo_price`, `return_travel_fare`, `total`, `payable`, `night_fare`, `percentage`, `provider_commission`, `provider_pay`, `eta_discount`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 120.00, 0.00, 1000.00, 0.00, '120', 0, 120, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1120.00, 1120.00, 0.00, 0.00, 0.00, 1120.00, 0.00, '2019-08-01 19:27:05', '2019-08-01 19:27:05'),
(2, 2, NULL, NULL, NULL, 0.00, 0.00, 1000.00, 0.00, '0', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 1000.00, 0.00, '2019-08-01 19:28:28', '2019-08-01 19:28:28'),
(3, 3, NULL, NULL, NULL, 0.00, 0.00, 1000.00, 0.00, '0', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 1000.00, 0.00, '2019-08-01 21:12:20', '2019-08-01 21:12:20'),
(4, 5, NULL, NULL, NULL, 120.00, 0.00, 1000.00, 0.00, '120', 0, 120, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1120.00, 1120.00, 0.00, 0.00, 0.00, 1120.00, 0.00, '2019-08-02 15:01:05', '2019-08-02 15:01:05'),
(5, 7, NULL, NULL, NULL, 0.00, 0.00, 1000.00, 0.00, '0', 0, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1000.00, 1000.00, 0.00, 0.00, 0.00, 1000.00, 0.00, '2019-08-02 23:57:59', '2019-08-02 23:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_request_ratings`
--

CREATE TABLE `user_request_ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `user_rating` int(11) NOT NULL DEFAULT '0',
  `provider_rating` int(11) NOT NULL DEFAULT '0',
  `user_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_request_ratings`
--

INSERT INTO `user_request_ratings` (`id`, `request_id`, `user_id`, `provider_id`, `user_rating`, `provider_rating`, `user_comment`, `provider_comment`, `created_at`, `updated_at`) VALUES
(1, 1, 132, 14, 5, 5, 'Write your comments', '', '2019-08-01 19:27:10', '2019-08-01 19:27:15'),
(2, 2, 132, 14, 5, 5, 'Write your comments', '', '2019-08-01 19:28:33', '2019-08-01 19:28:39'),
(3, 3, 131, 16, 5, 5, '', '', '2019-08-01 21:13:55', '2019-08-01 21:14:05'),
(4, 5, 131, 15, 5, 5, '', 'Write your comments', '2019-08-02 15:01:21', '2019-08-02 15:01:28'),
(5, 6, 131, 0, 0, 5, NULL, 'Write your comments', '2019-08-02 15:18:11', '2019-08-02 15:18:11'),
(6, 7, 132, 14, 1, 5, 'Write your comments', '', '2019-08-02 23:58:11', '2019-08-03 18:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_passbooks`
--

CREATE TABLE `wallet_passbooks` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` enum('CREDITED','DEBITED') COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `work` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_email_unique` (`email`);

--
-- Indexes for table `account_password_resets`
--
ALTER TABLE `account_password_resets`
  ADD KEY `account_password_resets_email_index` (`email`),
  ADD KEY `account_password_resets_token_index` (`token`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `apps_countries`
--
ALTER TABLE `apps_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dispatchers_email_unique` (`email`);

--
-- Indexes for table `dispatcher_password_resets`
--
ALTER TABLE `dispatcher_password_resets`
  ADD KEY `dispatcher_password_resets_email_index` (`email`),
  ADD KEY `dispatcher_password_resets_token_index` (`token`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleets`
--
ALTER TABLE `fleets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fleets_email_unique` (`email`);

--
-- Indexes for table `fleet_devices`
--
ALTER TABLE `fleet_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fleet_password_resets`
--
ALTER TABLE `fleet_password_resets`
  ADD KEY `fleet_password_resets_email_index` (`email`),
  ADD KEY `fleet_password_resets_token_index` (`token`);

--
-- Indexes for table `fleet_vehicles`
--
ALTER TABLE `fleet_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geo_fencings`
--
ALTER TABLE `geo_fencings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`),
  ADD KEY `oauth_access_tokens_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `package_types`
--
ALTER TABLE `package_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `promocodes`
--
ALTER TABLE `promocodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_devices`
--
ALTER TABLE `provider_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_documents`
--
ALTER TABLE `provider_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_filters`
--
ALTER TABLE `request_filters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_rental_hour_packages`
--
ALTER TABLE `service_rental_hour_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types_geo_fencings`
--
ALTER TABLE `service_types_geo_fencings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_key_index` (`key`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_prices`
--
ALTER TABLE `time_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `apps_countries`
--
ALTER TABLE `apps_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `custom_pushes`
--
ALTER TABLE `custom_pushes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `dispatchers`
--
ALTER TABLE `dispatchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `favourite_locations`
--
ALTER TABLE `favourite_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `fleets`
--
ALTER TABLE `fleets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fleet_devices`
--
ALTER TABLE `fleet_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fleet_vehicles`
--
ALTER TABLE `fleet_vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `geo_fencings`
--
ALTER TABLE `geo_fencings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `package_types`
--
ALTER TABLE `package_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `promocodes`
--
ALTER TABLE `promocodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `promocode_passbooks`
--
ALTER TABLE `promocode_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `promocode_usages`
--
ALTER TABLE `promocode_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `provider_devices`
--
ALTER TABLE `provider_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `provider_documents`
--
ALTER TABLE `provider_documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provider_profiles`
--
ALTER TABLE `provider_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `request_filters`
--
ALTER TABLE `request_filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `service_rental_hour_packages`
--
ALTER TABLE `service_rental_hour_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `service_types_geo_fencings`
--
ALTER TABLE `service_types_geo_fencings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `times`
--
ALTER TABLE `times`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `time_prices`
--
ALTER TABLE `time_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `user_request_payments`
--
ALTER TABLE `user_request_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_request_ratings`
--
ALTER TABLE `user_request_ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wallet_passbooks`
--
ALTER TABLE `wallet_passbooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
