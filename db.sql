-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2017 at 03:50 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `craftcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfiles`
--

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfolders`
--

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetsources`
--

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_i18n`
--

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_textChunkTitle` text COLLATE utf8_unicode_ci,
  `field_fundName` text COLLATE utf8_unicode_ci,
  `field_fundRiskRating` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_fundManager` text COLLATE utf8_unicode_ci,
  `field_fundObjective` text COLLATE utf8_unicode_ci,
  `field_schemeName` text COLLATE utf8_unicode_ci,
  `field_productName` text COLLATE utf8_unicode_ci,
  `field_lifestyleName` text COLLATE utf8_unicode_ci,
  `field_lifestyleGlide` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_textChunkTitle`, `field_fundName`, `field_fundRiskRating`, `field_fundManager`, `field_fundObjective`, `field_schemeName`, `field_productName`, `field_lifestyleName`, `field_lifestyleGlide`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_gb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:06:39', '2017-09-20 08:35:47', 'b6f60bfc-47a4-48a0-b619-0bcdb1349496'),
(4, 4, 'en_gb', NULL, '<p>Elephant plc. Registered in England on a hill. Company number 123465</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:11:06', '2017-09-15 15:29:35', '0bf8061a-fac5-4424-810a-963d108eb285'),
(5, 5, 'en_gb', 'Fund Guide content', '<p>This is some content</p>', 'Fund guide content goes here', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:13:35', '2017-09-15 15:26:11', '9ff1c151-89bf-46f4-bbd9-179fae152550'),
(8, 8, 'en_gb', 'New Fund Guide', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:19:39', '2017-09-15 16:18:02', 'e0d41ab1-4b1c-4060-ad60-bb87522a4177'),
(10, 10, 'en_gb', 'Fund Guide intro', '<p>Welcome to <strong>your</strong> fund guide.</p>', 'Intro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:24:39', '2017-09-15 15:34:58', 'ff531225-9b86-45f3-9681-9583c5c12ad0'),
(11, 11, 'en_gb', 'FG Special intro', '<p>This is your Fund Guide for your special product. Welcome.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:27:41', '2017-09-15 15:27:41', '9fc4a670-e00b-4d78-a505-304804977c23'),
(12, 12, 'en_gb', 'FG Footer', '<p>For more information, please get in touch on 0800111111.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:30:28', '2017-09-15 15:30:28', '74354021-b2bb-432b-9ba3-51a24eef810b'),
(13, 13, 'en_gb', 'Special conditions', '<p>There are some special conditions for this Fund Guide.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-15 15:33:17', '2017-09-15 15:33:17', '91bc63b7-da8b-4ec1-9d9e-450e0d243790'),
(14, 14, 'en_gb', 'asdf', NULL, NULL, 'Adams Fund', 'medium', 'Rich', '', NULL, NULL, NULL, NULL, '2017-09-15 15:39:26', '2017-09-15 15:42:08', '103e7713-3289-4fcd-bed4-b0d02897941e'),
(15, 15, 'en_gb', 'Adam KFA', NULL, NULL, NULL, NULL, NULL, NULL, 'Adam', 'kjhkjhkjh', NULL, NULL, '2017-09-15 15:49:36', '2017-09-15 16:16:47', '4f595f52-b4c7-4ee0-8e22-0a2ca4896170'),
(16, 16, 'en_gb', 'Rich KFA', NULL, NULL, NULL, NULL, NULL, NULL, 'Adam', '', NULL, NULL, '2017-09-15 15:50:48', '2017-09-15 16:03:33', '94f52043-7827-49c4-819a-5f3a75ccb241'),
(17, 20, 'en_gb', 'James\' KFA', NULL, NULL, NULL, NULL, NULL, NULL, 'jghjhg', '', NULL, NULL, '2017-09-15 16:17:18', '2017-09-15 16:17:18', 'b6e00668-84ed-421e-a635-fcb7061bdd00'),
(21, 27, 'en_gb', 'xxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-20 12:16:10', '2017-09-20 13:08:56', '32299159-7268-4a41-adfc-ac84ec99ece8'),
(22, 30, 'en_gb', 'xxx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-09-20 12:30:56', '2017-09-20 13:08:56', '19b761e1-9cff-4d7c-b015-5a48b3c53744');

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elementindexsettings`
--

INSERT INTO `craft_elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Entry', '{\"sourceOrder\":[[\"key\",\"*\"],[\"heading\",\"Fund Guides\"],[\"key\",\"section:3\"],[\"key\",\"section:4\"]],\"sources\":{\"section:3\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}},\"section:4\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}}}}', '2017-09-15 15:26:34', '2017-09-15 15:34:14', 'f2ba13f7-49e6-4aaf-a18d-7a3df97e5131');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `archived` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'User', 1, 0, '2017-09-15 15:06:39', '2017-09-20 08:35:47', '10e3c9c4-b28e-4dca-bb25-3d41e0e44988'),
(4, 'GlobalSet', 1, 0, '2017-09-15 15:11:06', '2017-09-15 15:29:35', '8d8499f8-aaac-49d5-8761-2d83c92cb2db'),
(5, 'Entry', 1, 0, '2017-09-15 15:13:35', '2017-09-15 15:26:11', '39bbb52c-3b35-465b-bf18-a01d9b105716'),
(8, 'Entry', 1, 0, '2017-09-15 15:19:39', '2017-09-15 16:18:02', '908eca6a-dc56-4d77-a64e-5372a833706a'),
(10, 'Entry', 1, 0, '2017-09-15 15:24:39', '2017-09-15 15:34:58', '1feb1967-1059-4425-aa20-fa3609fc9b36'),
(11, 'Entry', 1, 0, '2017-09-15 15:27:41', '2017-09-15 15:27:41', 'cb60afeb-7337-4c71-b63c-b5d266589099'),
(12, 'Entry', 1, 0, '2017-09-15 15:30:28', '2017-09-15 15:30:28', '331b4f3b-425c-46fe-977d-0c20a77674d4'),
(13, 'Entry', 1, 0, '2017-09-15 15:33:17', '2017-09-15 15:33:17', '84e20b18-dff7-4cda-a953-54a84b287a9d'),
(14, 'Entry', 1, 0, '2017-09-15 15:39:26', '2017-09-15 15:42:08', 'f0a7c700-b6c1-4d10-a374-6443406213f7'),
(15, 'Entry', 1, 0, '2017-09-15 15:49:36', '2017-09-15 16:16:47', '3505ad88-6836-4fa2-bf4e-716e656c20c8'),
(16, 'Entry', 1, 0, '2017-09-15 15:50:48', '2017-09-15 16:03:33', 'dadf8bab-ca56-4ac7-b655-e82f5bd0739a'),
(17, 'MatrixBlock', 1, 0, '2017-09-15 15:55:09', '2017-09-15 16:16:47', 'b2586998-1d05-434b-881b-f971fbc4bce5'),
(18, 'MatrixBlock', 1, 0, '2017-09-15 15:56:31', '2017-09-15 16:16:47', 'e9ef7ff4-6554-4437-8e49-6a90d9d4a388'),
(19, 'MatrixBlock', 1, 0, '2017-09-15 16:03:33', '2017-09-15 16:03:33', '1a584632-8922-4be8-ad1b-5bac7ccbd796'),
(20, 'Entry', 1, 0, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '107c58b9-e184-4521-8f37-bf5ad040325e'),
(21, 'MatrixBlock', 1, 0, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '04b349ee-f471-4639-b0ef-a7940a5fa682'),
(22, 'MatrixBlock', 1, 0, '2017-09-15 16:17:18', '2017-09-15 16:17:18', 'dcf2347b-63d8-4da4-8eef-3e60c06fd7cd'),
(27, 'Entry', 1, 0, '2017-09-20 12:16:10', '2017-09-20 13:08:56', 'b54cdfd4-c02b-46d6-939c-42c05b34034b'),
(28, 'MatrixBlock', 1, 0, '2017-09-20 12:16:10', '2017-09-20 12:37:42', 'b275226d-8974-4233-bd4e-37a08ff5adfa'),
(29, 'MatrixBlock', 1, 0, '2017-09-20 12:23:27', '2017-09-20 12:37:42', '9a8578f9-e3be-49cf-8678-fe47771ad1e4'),
(30, 'Entry', 1, 0, '2017-09-20 12:30:56', '2017-09-20 13:08:56', '039f07ae-5d21-48dc-8ab1-6f60c4bd72fc'),
(31, 'MatrixBlock', 1, 0, '2017-09-20 12:30:57', '2017-09-20 12:43:36', '7454c8eb-5862-4e70-a6f9-a3a633754474'),
(32, 'MatrixBlock', 1, 0, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'c06db9cf-d2b2-48ad-a144-832b74337aa4');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_i18n`
--

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements_i18n`
--

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_gb', '', NULL, 1, '2017-09-15 15:06:39', '2017-09-20 08:35:48', '02dc573f-adc2-43b6-8cd1-4b46c96358a3'),
(4, 4, 'en_gb', '', NULL, 1, '2017-09-15 15:11:06', '2017-09-15 15:29:35', '769bf2f5-5caf-42b1-8f17-b158cce36fa1'),
(5, 5, 'en_gb', 'fund-guide', 'fund-guide-content/fund-guide', 1, '2017-09-15 15:13:35', '2017-09-15 15:26:11', '8c73e0f1-fe94-452f-97c7-ed17d5c67c3c'),
(6, 8, 'en_gb', 'new-fund-guide', 'fund-guide/new-fund-guide', 1, '2017-09-15 15:19:39', '2017-09-15 16:18:02', '64853cef-5112-496b-87d0-db697b17b7c0'),
(7, 10, 'en_gb', 'fund-guide-content-blocks', 'fund-guide-content/fund-guide-content-blocks', 1, '2017-09-15 15:24:39', '2017-09-15 15:34:58', '82099389-102e-447c-9338-f20022847218'),
(8, 11, 'en_gb', 'fg-special-intro', 'fund-guide-content/fg-special-intro', 1, '2017-09-15 15:27:41', '2017-09-15 15:27:41', '5e883a6c-b5c5-42de-b9d5-42e61f4f0c50'),
(9, 12, 'en_gb', 'fg-footer', 'fund-guide-content/fg-footer', 1, '2017-09-15 15:30:28', '2017-09-15 15:30:28', 'cda2d8e8-d2fe-4665-9ea5-35837f048a40'),
(10, 13, 'en_gb', 'special-conditions', 'fund-guide-content/special-conditions', 1, '2017-09-15 15:33:17', '2017-09-15 15:33:17', '53e35aeb-77f7-41c0-9ecf-49d0fd8b8475'),
(11, 14, 'en_gb', 'asdf', 'funds/asdf', 1, '2017-09-15 15:39:26', '2017-09-15 15:42:08', '6ac86813-70c9-4b07-a478-08de28338a6e'),
(12, 15, 'en_gb', 'adam-kfa', 'kfa/adam-kfa', 1, '2017-09-15 15:49:36', '2017-09-15 16:16:47', '098a2c44-7e98-401c-8339-8fb61dc417c6'),
(13, 16, 'en_gb', 'adam-kfa-1', 'kfa/adam-kfa-1', 1, '2017-09-15 15:50:48', '2017-09-15 16:03:33', '23134283-287c-451b-956c-4a74ada3e612'),
(14, 17, 'en_gb', '', NULL, 1, '2017-09-15 15:55:09', '2017-09-15 16:16:47', '4243302a-e798-495b-8766-352858026fe4'),
(15, 18, 'en_gb', '', NULL, 1, '2017-09-15 15:56:31', '2017-09-15 16:16:47', 'b8c376a7-a67b-47d7-9fe5-420ebab3178f'),
(16, 19, 'en_gb', '', NULL, 1, '2017-09-15 16:03:33', '2017-09-15 16:03:33', '0eaa9722-4dff-4235-9e77-63369070f5d9'),
(17, 20, 'en_gb', 'james-kfa', 'kfa/james-kfa', 1, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '181db2c5-a2ca-4085-951b-08d64c9308d9'),
(18, 21, 'en_gb', '', NULL, 1, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '0b868f98-499b-47ac-930d-9eb8a1b6bc16'),
(19, 22, 'en_gb', '', NULL, 1, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '34544366-1667-4638-99ed-e0a2dd6b7f96'),
(24, 27, 'en_gb', 'xxx', 'fast-facts/xxx', 1, '2017-09-20 12:16:10', '2017-09-20 13:08:56', '3a32023c-63af-49d3-9a74-c1cff4980ea8'),
(25, 28, 'en_gb', '', NULL, 1, '2017-09-20 12:16:10', '2017-09-20 12:37:42', 'fef54539-4785-4f72-8f6c-5aaf62d840e3'),
(26, 29, 'en_gb', '', NULL, 1, '2017-09-20 12:23:27', '2017-09-20 12:37:42', 'ce9a856e-74ef-41ee-92bb-0d8d822ae88f'),
(27, 30, 'en_gb', 'xxx-1', 'fast-facts/xxx-1', 1, '2017-09-20 12:30:57', '2017-09-20 13:08:56', '6440bb21-847c-4d48-81ce-0abb0c330ca0'),
(28, 31, 'en_gb', '', NULL, 1, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'bff29c8f-b46a-427b-a9d4-c4320d9e53a9'),
(29, 32, 'en_gb', '', NULL, 1, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'f8dbb94b-baca-4710-8822-699d75ceba78');

-- --------------------------------------------------------

--
-- Table structure for table `craft_emailmessages`
--

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(5, 3, 3, 1, '2017-09-15 15:13:00', NULL, '2017-09-15 15:13:35', '2017-09-15 15:26:11', '359ab616-1926-4769-97d2-03985d6e9a89'),
(8, 4, 4, 1, '2017-09-15 15:19:00', NULL, '2017-09-15 15:19:39', '2017-09-15 16:18:02', 'dd4dc1c9-9960-4ac1-bc23-3aab2ebfd0e6'),
(10, 3, 3, 1, '2017-09-15 15:24:00', NULL, '2017-09-15 15:24:39', '2017-09-15 15:34:59', '6d205636-f21c-4ebe-98e8-76c11bc67563'),
(11, 3, 3, 1, '2017-09-15 15:27:41', NULL, '2017-09-15 15:27:41', '2017-09-15 15:27:41', '4ef5e066-2b98-4bd2-bdc2-52e397ff139c'),
(12, 3, 3, 1, '2017-09-15 15:30:00', NULL, '2017-09-15 15:30:28', '2017-09-15 15:30:28', 'a4986d7b-9c06-4530-b09a-240a0067e955'),
(13, 3, 3, 1, '2017-09-15 15:33:17', NULL, '2017-09-15 15:33:17', '2017-09-15 15:33:17', '63bf8600-b39a-4891-ab4e-05c2377995ae'),
(14, 5, 5, 1, '2017-09-15 15:39:00', NULL, '2017-09-15 15:39:26', '2017-09-15 15:42:08', 'a0d47a8b-74f4-4937-abfd-9fe0e04a88bb'),
(15, 6, 6, 1, '2017-09-15 15:49:00', NULL, '2017-09-15 15:49:36', '2017-09-15 16:16:47', '1343aeaf-6cbe-48e0-89cd-25a96d9c2bda'),
(16, 6, 6, 1, '2017-09-15 15:49:00', NULL, '2017-09-15 15:50:48', '2017-09-15 16:03:33', '1ba2b234-b9e6-486d-bdc8-8a1baeb009c9'),
(20, 6, 6, 1, '2017-09-15 16:17:18', NULL, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '6b4298f8-59a2-4714-aa1e-a6be434f43e6'),
(27, 7, 7, 1, '2017-09-20 12:16:00', NULL, '2017-09-20 12:16:10', '2017-09-20 12:37:42', '553b94cb-6815-4660-9205-f596c4238bc5'),
(30, 7, 7, 1, '2017-09-20 12:30:00', NULL, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'a3f2fcae-d12c-4bf1-bf35-c987719f9fcd');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 3, 15, 'Fund guide', 'fundGuide', 1, 'Title', NULL, 1, '2017-09-15 15:13:34', '2017-09-15 15:25:56', 'b947ef47-4306-4ede-bc79-c87e1d70957d'),
(4, 4, 13, 'Fund Guide', 'fundGuide', 1, 'Title', NULL, 1, '2017-09-15 15:16:23', '2017-09-15 15:21:28', '3de6e67c-400c-45dc-9917-eba12a2afa2d'),
(5, 5, 17, 'Funds', 'funds', 1, 'SEDOL Code', NULL, 1, '2017-09-15 15:38:01', '2017-09-15 15:38:39', '35dca0e6-75c0-416b-9cb9-5eb6478041f8'),
(6, 6, 20, 'KFA', 'kfa', 1, 'Item Code', NULL, 1, '2017-09-15 15:47:36', '2017-09-15 15:51:28', '467abde7-f1cf-4b9c-9166-12a063efc3fd'),
(7, 7, 29, 'Fast Facts', 'fastFacts', 0, NULL, 'xxx', 1, '2017-09-19 10:23:02', '2017-09-20 11:34:06', 'ddc63ad8-9429-4506-8599-a2da9b3c8fec');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entryversions`
--

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 5, 3, 1, 'en_gb', 1, NULL, '{\"typeId\":\"3\",\"authorId\":null,\"title\":\"Fund guide\",\"slug\":\"fund-guide\",\"postDate\":1505488414,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}', '2017-09-15 15:13:35', '2017-09-15 15:13:35', 'bf607779-4a47-4b66-a319-9504664c3fa0'),
(5, 5, 3, 1, 'en_gb', 2, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Fund guide\",\"slug\":\"fund-guide\",\"postDate\":1505488380,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is some content<\\/p>\"}}', '2017-09-15 15:15:37', '2017-09-15 15:15:37', '474681a6-a69a-498c-a8dc-0c6a2ca3434b'),
(6, 5, 3, 1, 'en_gb', 3, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund guide\",\"slug\":\"fund-guide\",\"postDate\":1505488380,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is some content<\\/p>\"}}', '2017-09-15 15:15:42', '2017-09-15 15:15:42', '29b02a70-71d6-4dc8-9bcd-22c470848c10'),
(7, 5, 3, 1, 'en_gb', 4, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund guide content\",\"slug\":\"fund-guide\",\"postDate\":1505488380,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is some content<\\/p>\"}}', '2017-09-15 15:17:43', '2017-09-15 15:17:43', '64af7152-c8e5-4283-928f-29c1923dde24'),
(8, 8, 4, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"New Fund Guide\",\"slug\":\"new-fund-guide\",\"postDate\":1505488740,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"5\"]}}', '2017-09-15 15:19:39', '2017-09-15 15:19:39', 'f121275c-2771-43e6-a8c4-4e03a1d284fa'),
(9, 10, 3, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Fund Guide Content Blocks\",\"slug\":\"fund-guide-content-blocks\",\"postDate\":1505489079,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>Welcome to your fund guide.<\\/p>\",\"4\":\"Intro\"}}', '2017-09-15 15:24:39', '2017-09-15 15:24:39', '70ec8903-f9f3-44f7-8cfc-2d26f1a287cb'),
(10, 5, 3, 1, 'en_gb', 5, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund Guide Content Blocks\",\"slug\":\"fund-guide\",\"postDate\":1505488380,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is some content<\\/p>\",\"4\":\"Fund guide content goes here\"}}', '2017-09-15 15:25:00', '2017-09-15 15:25:00', '68982ac6-e610-4ccb-a621-5fe14868d202'),
(11, 5, 3, 1, 'en_gb', 6, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund Guide content\",\"slug\":\"fund-guide\",\"postDate\":1505488380,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is some content<\\/p>\"}}', '2017-09-15 15:26:11', '2017-09-15 15:26:11', 'afb5b030-edf4-4911-967b-08ff13086572'),
(12, 10, 3, 1, 'en_gb', 2, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund Guide intro\",\"slug\":\"fund-guide-content-blocks\",\"postDate\":1505489040,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>Welcome to your fund guide.<\\/p>\"}}', '2017-09-15 15:26:18', '2017-09-15 15:26:18', '1d6a6ce3-3558-4dc3-89c5-05e8a97b1559'),
(13, 8, 4, 1, 'en_gb', 2, '', '{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"New Fund Guide\",\"slug\":\"new-fund-guide\",\"postDate\":1505488740,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"10\"]}}', '2017-09-15 15:27:07', '2017-09-15 15:27:07', 'daeb3966-6e5f-40ba-9ee2-0a921fdd7131'),
(14, 11, 3, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"FG Special intro\",\"slug\":\"fg-special-intro\",\"postDate\":1505489261,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>This is your Fund Guide for your special product. Welcome.<\\/p>\"}}', '2017-09-15 15:27:41', '2017-09-15 15:27:41', '04758d98-f63c-4833-8561-4f332becbf06'),
(15, 12, 3, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"FG Footer\",\"slug\":\"fg-footer\",\"postDate\":1505489400,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>For more information, please get in touch on 0800111111.<\\/p>\"}}', '2017-09-15 15:30:28', '2017-09-15 15:30:28', '04f2c4b4-b662-4822-840b-6d3330b0ee07'),
(16, 13, 3, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Special conditions\",\"slug\":\"special-conditions\",\"postDate\":1505489597,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>There are some special conditions for this Fund Guide.<\\/p>\"}}', '2017-09-15 15:33:18', '2017-09-15 15:33:18', '57001793-93d9-42de-98ee-b740920400f9'),
(17, 8, 4, 1, 'en_gb', 3, '', '{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"New Fund Guide\",\"slug\":\"new-fund-guide\",\"postDate\":1505488740,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"10\",\"13\",\"12\"]}}', '2017-09-15 15:33:43', '2017-09-15 15:33:43', 'fa6972dc-3822-4696-a57e-fd07e31511f9'),
(18, 10, 3, 1, 'en_gb', 3, '', '{\"typeId\":\"3\",\"authorId\":\"1\",\"title\":\"Fund Guide intro\",\"slug\":\"fund-guide-content-blocks\",\"postDate\":1505489040,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>Welcome to <strong>your<\\/strong> fund guide.<\\/p>\"}}', '2017-09-15 15:34:59', '2017-09-15 15:34:59', '25471291-ffeb-42ad-a2aa-43643618c59e'),
(19, 14, 5, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"asdf\",\"slug\":\"asdf\",\"postDate\":1505489940,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"7\":\"\",\"5\":\"\",\"8\":\"\",\"6\":\"medium\"}}', '2017-09-15 15:39:26', '2017-09-15 15:39:26', 'c798360d-c2c3-4f2d-abf5-2cf92ec667e3'),
(20, 14, 5, 1, 'en_gb', 2, '', '{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"asdf\",\"slug\":\"asdf\",\"postDate\":1505489940,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"7\":\"Adam\",\"5\":\"Adams Fund\",\"8\":\"\",\"6\":\"medium\"}}', '2017-09-15 15:41:57', '2017-09-15 15:41:57', '40fe9de9-d0a8-454f-9205-992055ed6f84'),
(21, 14, 5, 1, 'en_gb', 3, '', '{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"asdf\",\"slug\":\"asdf\",\"postDate\":1505489940,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"7\":\"Rich\",\"5\":\"Adams Fund\",\"8\":\"\",\"6\":\"medium\"}}', '2017-09-15 15:42:08', '2017-09-15 15:42:08', '2bca0946-b59d-4cbc-9a76-6a6587a8fc03'),
(22, 15, 6, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":[\"14\"],\"14\":\"\",\"12\":[\"14\"],\"11\":\"\",\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:49:36', '2017-09-15 15:49:36', '239951cf-0118-46d8-b918-c3b7c4edf2f5'),
(23, 16, 6, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Rich KFA\",\"slug\":\"adam-kfa-1\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":[\"14\"],\"14\":\"\",\"12\":[\"14\"],\"11\":\"\",\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:50:48', '2017-09-15 15:50:48', '216ef217-cbf8-4ed3-8d5b-5c3013dd79ab'),
(24, 15, 6, 1, 'en_gb', 2, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":[\"14\"],\"14\":\"\",\"12\":[\"14\"],\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:52:44', '2017-09-15 15:52:44', 'd94ed01f-20ba-47e1-93aa-07a9e9ee0e7d'),
(25, 15, 6, 1, 'en_gb', 3, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"new1\":{\"type\":\"fundName\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".5\"}}},\"14\":\"\",\"12\":[\"14\"],\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:55:09', '2017-09-15 15:55:09', 'b2d1ab77-df5c-4c4e-b7d0-6779e03b4c4e'),
(26, 15, 6, 1, 'en_gb', 4, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"17\":{\"type\":\"fundName\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".5\"}},\"new1\":{\"type\":\"fundName\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".75\"}}},\"14\":\"\",\"12\":[\"14\"],\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:56:31', '2017-09-15 15:56:31', 'eb51b904-ef32-404d-b7c1-73a23138097a'),
(27, 15, 6, 1, 'en_gb', 5, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":0,\"parentId\":null,\"fields\":{\"13\":{\"17\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".5\"}},\"18\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".75\"}}},\"14\":\"\",\"12\":[\"14\"],\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 15:59:13', '2017-09-15 15:59:13', '0d750570-742b-4709-aa45-a802fb710f31'),
(28, 16, 6, 1, 'en_gb', 2, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Rich KFA\",\"slug\":\"adam-kfa-1\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"new1\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\"\"},\"collapsed\":\"\"}},\"14\":\"\",\"12\":\"\",\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 16:03:33', '2017-09-15 16:03:33', '0cd4b1b4-2ce8-4aa2-811e-1453b338b91e'),
(29, 15, 6, 1, 'en_gb', 6, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"17\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".5\"}},\"18\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".75\"}}},\"14\":\"\",\"12\":[\"14\"],\"10\":\"\",\"9\":\"Adam\"}}', '2017-09-15 16:16:34', '2017-09-15 16:16:34', '0d67bbf9-347a-40ed-8073-065c9c867aca'),
(30, 15, 6, 1, 'en_gb', 7, '', '{\"typeId\":\"6\",\"authorId\":\"1\",\"title\":\"Adam KFA\",\"slug\":\"adam-kfa\",\"postDate\":1505490540,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"17\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".5\"}},\"18\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\".75\"}}},\"14\":\"\",\"12\":[\"14\"],\"10\":\"kjhkjhkjh\",\"9\":\"Adam\"}}', '2017-09-15 16:16:47', '2017-09-15 16:16:47', '7525e3f2-d4ee-41f2-b020-3c653f3e5ec8'),
(31, 20, 6, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"James\' KFA\",\"slug\":\"james-kfa\",\"postDate\":1505492238,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"13\":{\"new1\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\"5%\"}},\"new2\":{\"type\":\"fund\",\"enabled\":\"1\",\"fields\":{\"fundName\":[\"14\"],\"fundCharge\":\"1%\"}}},\"14\":\"\",\"12\":\"\",\"10\":\"\",\"9\":\"jghjhg\"}}', '2017-09-15 16:17:18', '2017-09-15 16:17:18', '52365f8f-d172-4bc8-b557-8ea6a26873d7'),
(32, 8, 4, 1, 'en_gb', 4, '', '{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"New Fund Guide\",\"slug\":\"new-fund-guide\",\"postDate\":1505488740,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"11\",\"13\",\"12\"]}}', '2017-09-15 16:18:02', '2017-09-15 16:18:02', 'aba8bdd3-0db9-4bb2-b7e8-88f6439c9d85'),
(33, 27, 7, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx\",\"postDate\":1505909770,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":[\"25\"],\"19\":{\"new1\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"nun,,n,n\",\"desc\":\"kn,n,nn,\"}}}}}', '2017-09-20 12:16:10', '2017-09-20 12:16:10', '0ae7722d-7cc4-44d0-9d88-ca315d5bb517'),
(34, 27, 7, 1, 'en_gb', 2, '', '{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx\",\"postDate\":1505909760,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":[\"23\",\"25\"],\"19\":{\"28\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"nun,,n,n\",\"desc\":\"kn,n,nn,\"}}}}}', '2017-09-20 12:16:54', '2017-09-20 12:16:54', '66686899-77f1-44ca-a109-2a032f0e92be'),
(35, 27, 7, 1, 'en_gb', 3, '', '{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx\",\"postDate\":1505909760,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":[\"23\",\"25\",\"26\"],\"19\":{\"28\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"nun,,n,n\",\"desc\":\"kn,n,nn,\"}}}}}', '2017-09-20 12:17:20', '2017-09-20 12:17:20', '280d07ea-0409-4ff2-ac13-e2e3dd2c6da3'),
(36, 27, 7, 1, 'en_gb', 4, '', '{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx\",\"postDate\":1505909760,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":{\"new1\":{\"type\":\"features\",\"enabled\":\"1\",\"fields\":{\"desc\":\"sfsfdsfsdf\",\"detail\":\"\"}}},\"19\":{\"28\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"nun,,n,n\",\"desc\":\"kn,n,nn,\"}}}}}', '2017-09-20 12:23:27', '2017-09-20 12:23:27', 'a55c9c1f-2c5d-4a45-937f-3cabd62e11cc'),
(37, 30, 7, 1, 'en_gb', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx-1\",\"postDate\":1505910656,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":{\"new1\":{\"type\":\"features\",\"enabled\":\"1\",\"fields\":{\"desc\":\"abc\",\"detail\":\"\"}}},\"19\":{\"new1\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"yyyy\",\"desc\":\"\"}}}}}', '2017-09-20 12:30:57', '2017-09-20 12:30:57', 'd68beb78-f47b-436f-8a96-c8fd018c25d9'),
(38, 27, 7, 1, 'en_gb', 5, '', '{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx\",\"postDate\":1505909760,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":{\"29\":{\"type\":\"features\",\"enabled\":\"1\",\"fields\":{\"desc\":\"sfsfdsfsdf\",\"detail\":\"\"}}},\"19\":{\"28\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"nun,,n,n\",\"desc\":\"kn,n,nn,\"}}}}}', '2017-09-20 12:37:42', '2017-09-20 12:37:42', '56c692d3-44f5-48c0-8d08-a83519d4ca32'),
(39, 30, 7, 1, 'en_gb', 2, '', '{\"typeId\":\"7\",\"authorId\":\"1\",\"title\":\"xxx\",\"slug\":\"xxx-1\",\"postDate\":1505910600,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"20\":{\"32\":{\"type\":\"features\",\"enabled\":\"1\",\"fields\":{\"desc\":\"abc\",\"detail\":\"\"}}},\"19\":{\"31\":{\"type\":\"productName\",\"enabled\":\"1\",\"fields\":{\"productName\":\"yyyy\",\"desc\":\"\"}}}}}', '2017-09-20 12:43:36', '2017-09-20 12:43:36', '7a06334b-bfa1-44a9-90b0-7e3851ddfcb1');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', '2017-09-15 15:06:43', '2017-09-15 15:06:43', '26a9b3c4-abdb-44ac-8a36-4c049f3dfb00'),
(2, 'Funds', '2017-09-15 15:36:08', '2017-09-15 15:36:08', '26d84335-110a-41be-a7a6-98596a581c85'),
(3, 'KFA', '2017-09-15 15:44:28', '2017-09-15 15:44:28', 'd84b8562-0301-41fd-8097-97c7334e2127'),
(4, 'KFA Lifestyle', '2017-09-15 15:57:52', '2017-09-15 15:57:52', '83e8519c-3d35-4c75-913b-7b017601cbec'),
(5, 'FastFacts', '2017-09-20 10:34:39', '2017-09-20 10:34:39', '71498983-a9ee-42c6-8eaf-4f1087d4904e'),
(6, 'testgroup', '2017-09-20 11:15:55', '2017-09-20 11:15:55', '46b715bb-efbf-4815-9aeb-2ecece95c170');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 6, 3, 1, 0, 1, '2017-09-15 15:11:07', '2017-09-15 15:11:07', 'dd6cc1d6-b422-42f8-bb1e-045b87ea508a'),
(9, 13, 8, 3, 0, 1, '2017-09-15 15:21:28', '2017-09-15 15:21:28', 'a42d2346-0c79-477d-beee-8af2981d5935'),
(12, 15, 10, 1, 1, 1, '2017-09-15 15:25:56', '2017-09-15 15:25:56', 'ef90b3dc-2c05-4f29-b885-53057730e586'),
(13, 17, 11, 5, 0, 1, '2017-09-15 15:38:39', '2017-09-15 15:38:39', 'd5c875c6-4ca0-43e0-9111-e88f61acc807'),
(14, 17, 11, 7, 0, 2, '2017-09-15 15:38:39', '2017-09-15 15:38:39', 'a70d27c3-faab-40b0-9682-48b01d77ef3f'),
(15, 17, 11, 8, 0, 3, '2017-09-15 15:38:39', '2017-09-15 15:38:39', '67e31fb5-6fcf-4cc2-b7ee-9a4edb5945c9'),
(16, 17, 11, 6, 0, 4, '2017-09-15 15:38:39', '2017-09-15 15:38:39', '4cc8c845-1270-40fb-99fc-4230afa5e53c'),
(23, 20, 14, 9, 0, 1, '2017-09-15 15:51:28', '2017-09-15 15:51:28', '1de404f8-e3a2-4f99-ad14-38a71b032aac'),
(24, 20, 14, 10, 0, 2, '2017-09-15 15:51:28', '2017-09-15 15:51:28', 'c1ab7b5f-c5d5-48eb-8672-c6e5636334c4'),
(25, 20, 15, 12, 0, 1, '2017-09-15 15:51:28', '2017-09-15 15:51:28', 'c8e382ba-b5b4-4706-82af-d34e3df6c68a'),
(26, 20, 15, 13, 0, 2, '2017-09-15 15:51:28', '2017-09-15 15:51:28', '268b00d7-9203-4dd0-8189-05124f8c36cc'),
(27, 20, 15, 14, 0, 3, '2017-09-15 15:51:28', '2017-09-15 15:51:28', '17a6d212-f8f8-4fd8-b972-057c862836be'),
(32, 23, 18, 15, 0, 1, '2017-09-15 15:57:09', '2017-09-15 15:57:09', '5c8442a7-c572-4bcf-84b6-18aaf45c6229'),
(33, 23, 18, 16, 0, 2, '2017-09-15 15:57:09', '2017-09-15 15:57:09', '9bb5ea5f-eef3-40eb-974c-ef895f3bc843'),
(42, 29, 23, 19, 0, 1, '2017-09-20 11:34:06', '2017-09-20 11:34:06', '9d647670-9d8a-45e2-889f-c9ca5ada78eb'),
(43, 29, 23, 20, 0, 2, '2017-09-20 11:34:06', '2017-09-20 11:34:06', 'b42ea8a2-04f8-41d9-b69c-46300625e22f'),
(53, 37, 29, 27, 1, 1, '2017-09-20 12:22:54', '2017-09-20 12:22:54', '251a0a3c-8b5f-451e-a26b-e07d707fe92b'),
(54, 37, 29, 28, 0, 2, '2017-09-20 12:22:54', '2017-09-20 12:22:54', '6b0c340d-1246-4114-a614-c2f5d1643cf1'),
(55, 38, 30, 19, 0, 1, '2017-09-20 12:37:20', '2017-09-20 12:37:20', '09eb0b38-bfda-4de6-b7fc-929c61c9df2b'),
(56, 38, 30, 20, 0, 2, '2017-09-20 12:37:20', '2017-09-20 12:37:20', '07705c4c-03b3-429a-84ba-795ae998b15a'),
(77, 46, 38, 23, 0, 1, '2017-09-25 13:28:36', '2017-09-25 13:28:36', 'd10d1004-20fa-40f1-9eb6-b81c44d2d9b4'),
(78, 46, 38, 24, 0, 2, '2017-09-25 13:28:36', '2017-09-25 13:28:36', 'c1f0053f-1a1f-40cd-b3e4-42d1d265afe4'),
(79, 46, 38, 29, 0, 3, '2017-09-25 13:28:36', '2017-09-25 13:28:36', 'a421b781-3dd4-4859-a111-4acebebff8b7');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 'GlobalSet', '2017-09-15 15:11:07', '2017-09-15 15:11:07', '7f5f8269-e44c-4354-bc43-7b40359b2e5b'),
(13, 'Entry', '2017-09-15 15:21:28', '2017-09-15 15:21:28', 'e264caad-a55b-4f80-8c95-c3f291ec87e0'),
(15, 'Entry', '2017-09-15 15:25:56', '2017-09-15 15:25:56', 'a6ca5b50-3b75-4da7-9482-8ab112e2cae6'),
(17, 'Entry', '2017-09-15 15:38:39', '2017-09-15 15:38:39', 'd6eb2ec0-8239-4d87-9027-352c1c93f2e1'),
(20, 'Entry', '2017-09-15 15:51:28', '2017-09-15 15:51:28', 'fcee9650-2261-4a7e-a523-a955c0320659'),
(23, 'MatrixBlock', '2017-09-15 15:57:09', '2017-09-15 15:57:09', '87fc928e-9e73-4711-bf93-fc78489c67ee'),
(29, 'Entry', '2017-09-20 11:34:06', '2017-09-20 11:34:06', '4cb194d9-90cc-4d4b-85df-e34f7d126af1'),
(37, 'MatrixBlock', '2017-09-20 12:22:54', '2017-09-20 12:22:54', '7bcaf6bf-237c-4c19-b11a-50a5194d621a'),
(38, 'Tag', '2017-09-20 12:37:20', '2017-09-20 12:37:20', 'cef5c04d-070e-4d8e-a0ce-61e0093819e5'),
(46, 'MatrixBlock', '2017-09-25 13:28:36', '2017-09-25 13:28:36', '8e44064d-588b-4420-a2fe-7a609c8173ad');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 6, 'Content', 1, '2017-09-15 15:11:07', '2017-09-15 15:11:07', 'bc197b40-234b-4df3-921f-5c7d32cb6cfb'),
(8, 13, 'Tab 1', 1, '2017-09-15 15:21:28', '2017-09-15 15:21:28', '057fe4f2-3063-471d-952f-1b352f9915d4'),
(10, 15, 'Edit text content here', 1, '2017-09-15 15:25:56', '2017-09-15 15:25:56', '479224a0-2a4d-4d8e-af92-0f2b3f9eb3b1'),
(11, 17, 'Fund Details', 1, '2017-09-15 15:38:39', '2017-09-15 15:38:39', '9b49b3a5-af30-40af-ac25-616ce0c13237'),
(14, 20, 'Basic Info', 1, '2017-09-15 15:51:28', '2017-09-15 15:51:28', 'c11f31d3-8fa6-4715-bd2a-8d163546bf22'),
(15, 20, 'Fund Info', 2, '2017-09-15 15:51:28', '2017-09-15 15:51:28', '5eeca4fe-65d0-4192-9c3d-8fb7ec068f92'),
(18, 23, 'Content', 1, '2017-09-15 15:57:09', '2017-09-15 15:57:09', '170e3faf-57d4-433f-b3e3-5c58aad4d1ee'),
(23, 29, 'FastFacts', 1, '2017-09-20 11:34:06', '2017-09-20 11:34:06', 'e702bf0a-ae7c-4518-9de1-1cd8de9b4725'),
(29, 37, 'Content', 1, '2017-09-20 12:22:54', '2017-09-20 12:22:54', '29f3f42c-1fe7-4ef2-9d30-acb23f720a22'),
(30, 38, 'Content', 1, '2017-09-20 12:37:20', '2017-09-20 12:37:20', '42cfb3ee-f383-4ca7-818e-30829072391d'),
(38, 46, 'Content', 1, '2017-09-25 13:28:36', '2017-09-25 13:28:36', 'a1c74940-4b0d-4b4e-8c1b-7801b082a936');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Text Chunk', 'body', 'global', '', 0, 'RichText', '{\"configFile\":\"Standard.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-09-15 15:06:44', '2017-09-15 15:17:06', 'c5337d49-49d2-4787-938a-4af8cb72cd87'),
(3, 1, 'Fund Guide Document', 'testDocument', 'global', '', 0, 'Entries', '{\"sources\":[\"section:3\"],\"limit\":\"\",\"selectionLabel\":\"\"}', '2017-09-15 15:13:01', '2017-09-15 15:18:39', 'd66b69b7-bbd6-4853-95d1-3d7da241b6d8'),
(4, 1, 'Text Chunk Title', 'textChunkTitle', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:22:11', '2017-09-15 15:22:11', '28a939f1-6c79-4c64-91ae-23bf0b9f0f66'),
(5, 2, 'Fund Name', 'fundName', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:36:03', '2017-09-15 15:36:21', 'a3ef74f7-7575-42ae-88ff-a926794630ef'),
(6, 2, 'Fund Risk Rating', 'fundRiskRating', 'global', '', 0, 'Dropdown', '{\"options\":[{\"label\":\"Higher\",\"value\":\"higher\",\"default\":\"\"},{\"label\":\"Medium to Higher\",\"value\":\"mediumToHigher\",\"default\":\"\"},{\"label\":\"Medium\",\"value\":\"medium\",\"default\":\"\"},{\"label\":\"Medium to Lower\",\"value\":\"mediumToLower\",\"default\":\"\"},{\"label\":\"Lower\",\"value\":\"lower\",\"default\":\"\"},{\"label\":\"Minimal\",\"value\":\"minimal\",\"default\":\"\"}]}', '2017-09-15 15:37:00', '2017-09-15 15:37:00', '9662d5f9-32c0-41c0-beec-359b2f985ae3'),
(7, 2, 'Fund Manager', 'fundManager', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:37:10', '2017-09-15 15:37:10', '68ed922a-53ed-4725-8a67-d9460f1462cc'),
(8, 2, 'Fund Objective', 'fundObjective', 'global', '', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"\",\"availableTransforms\":\"\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-09-15 15:37:17', '2017-09-15 15:40:34', 'bc8bc47f-5b1c-4773-9f51-de7eed40a3f1'),
(9, 3, 'Scheme Name', 'schemeName', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:44:38', '2017-09-15 15:44:38', '5a984ffd-143c-4583-98ca-e8ab264b2a58'),
(10, 3, 'Product Name', 'productName', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:45:08', '2017-09-15 15:45:08', '297b125a-475b-4784-a119-a530e246bc12'),
(12, 3, 'Default Fund', 'defaultFund', 'global', '', 0, 'Entries', '{\"sources\":[\"section:5\"],\"limit\":\"1\",\"selectionLabel\":\"\"}', '2017-09-15 15:46:00', '2017-09-15 15:46:12', '65455596-1fd5-4668-a254-75238e16de61'),
(13, 3, 'Active Funds', 'activeFunds', 'global', '', 0, 'Matrix', '{\"maxBlocks\":null}', '2017-09-15 15:46:27', '2017-09-15 15:57:09', '6f2d11e0-01f1-408a-ba4e-b915d38ee85c'),
(14, 3, 'Closed Funds', 'closedFunds', 'global', '', 0, 'Entries', '{\"sources\":[\"section:5\"],\"limit\":\"\",\"selectionLabel\":\"\"}', '2017-09-15 15:47:24', '2017-09-15 15:47:24', 'adc1d77d-1760-4189-986f-9fca25875f8c'),
(15, NULL, 'Fund Name', 'fundName', 'matrixBlockType:1', '', 0, 'Entries', '{\"sources\":[\"section:5\"],\"limit\":\"1\",\"selectionLabel\":\"\"}', '2017-09-15 15:54:28', '2017-09-15 15:57:09', '61e82c7f-7aa8-4996-81c0-e12944c383fa'),
(16, NULL, 'Fund Charge', 'fundCharge', 'matrixBlockType:1', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:54:28', '2017-09-15 15:57:09', 'd555a3c8-fd39-4a48-942d-2b46f8467287'),
(17, 4, 'Lifestyle Name', 'lifestyleName', 'global', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-15 15:58:07', '2017-09-15 15:58:07', 'f4d87044-6742-4233-8c98-44e5965d0862'),
(18, 4, 'Lifestyle Glide', 'lifestyleGlide', 'global', '', 0, 'Table', '{\"columns\":{\"col1\":{\"heading\":\"\",\"handle\":\"\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"\",\"handle\":\"\",\"width\":\"\",\"type\":\"singleline\"},\"col3\":{\"heading\":\"\",\"handle\":\"\",\"width\":\"\",\"type\":\"singleline\"},\"col4\":{\"heading\":\"\",\"handle\":\"\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\",\"col3\":\"\",\"col4\":\"\"}}}', '2017-09-15 15:58:57', '2017-09-15 15:58:57', '36d24373-db0f-46bf-9358-a362e13af170'),
(19, 5, 'FFProduct', 'product', 'global', '', 0, 'Matrix', '{\"maxBlocks\":\"1\"}', '2017-09-20 10:36:58', '2017-09-25 13:28:35', '0cc1c05b-6e77-4b7c-a213-f03c331f1025'),
(20, 5, 'FFFeatures', 'fffeatures', 'global', '', 0, 'Matrix', '{\"maxBlocks\":null}', '2017-09-20 11:02:37', '2017-09-20 12:22:53', '4d3d6346-88ab-4e67-b8eb-63524f491952'),
(23, NULL, 'Product name', 'productName', 'matrixBlockType:3', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-20 11:06:25', '2017-09-25 13:28:35', '0777f295-1944-4367-92af-bd36167efce0'),
(24, NULL, 'Desc', 'desc', 'matrixBlockType:3', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-20 11:06:25', '2017-09-25 13:28:36', '02eb0eef-104f-4d02-b005-9e772f3792c6'),
(27, NULL, 'desc', 'desc', 'matrixBlockType:5', '', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}', '2017-09-20 12:22:54', '2017-09-20 12:22:54', '020f87a7-beba-43bd-ab56-1fbbacba1428'),
(28, NULL, 'Detail', 'detail', 'matrixBlockType:5', '', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-09-20 12:22:54', '2017-09-20 12:22:54', 'a2d2b223-5e93-4eec-a5f6-ae71cfaeaeb6'),
(29, NULL, 'IDS', 'ids', 'matrixBlockType:3', '', 0, 'ButtonBox_Triggers', '{\"displayAsGraphic\":\"\",\"displayFullwidth\":\"\",\"options\":[{\"label\":\"\",\"showLabel\":\"1\",\"imageUrl\":\"\",\"type\":\"js\",\"value\":\"alert ( \\\"hello\\\" );craft.rich_myservice.sayhellophp()\",\"newWindow\":\"\"}]}', '2017-09-21 14:33:21', '2017-09-25 13:28:36', '78ac57b1-64cf-4178-bc47-754655b8f2dd');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_globalsets`
--

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(4, 'Footer', 'footer', 6, '2017-09-15 15:11:07', '2017-09-15 15:11:07', '41276d70-86c4-4632-8bb7-9b0da340a6cc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2.6.2989', '2.6.10', 0, 'Test CraftCMS Site', 'http://localhost', 'UTC', 1, 0, '2017-09-15 15:06:35', '2017-09-15 15:06:35', '1940aedf-e5d9-4edc-9c7b-a58f0f388acc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_locales`
--

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_locales`
--

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
('en_gb', 1, '2017-09-15 15:06:37', '2017-09-15 15:06:37', '2bc4042e-69a3-4fb1-aa3b-fb5a5a3a67e2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocks`
--

INSERT INTO `craft_matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(17, 15, 13, 1, 1, NULL, '2017-09-15 15:55:09', '2017-09-15 16:16:47', 'feebab93-43ba-42f3-ab12-ac13abb33455'),
(18, 15, 13, 1, 2, NULL, '2017-09-15 15:56:31', '2017-09-15 16:16:47', '4c20b1a9-aa70-433f-98c5-92bbbb1e484f'),
(19, 16, 13, 1, 1, NULL, '2017-09-15 16:03:33', '2017-09-15 16:03:33', '65bd7758-de3e-4ff3-864f-95dfbcb52bb3'),
(21, 20, 13, 1, 1, NULL, '2017-09-15 16:17:18', '2017-09-15 16:17:18', 'a31fc8ca-d271-4eb0-a38c-3a04ded30106'),
(22, 20, 13, 1, 2, NULL, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '2ef4f7dd-cf4b-4d46-b0b8-e5cd91fdbf23'),
(28, 27, 19, 3, 1, NULL, '2017-09-20 12:16:10', '2017-09-20 12:37:42', '1b4457eb-900a-45bb-afca-6c64572432dd'),
(29, 27, 20, 5, 1, NULL, '2017-09-20 12:23:27', '2017-09-20 12:37:42', '4cc6013e-e925-42a1-8bd4-e73315c01953'),
(31, 30, 19, 3, 1, NULL, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'e12287d6-b8d4-4ddc-90bc-8ecf39cab11a'),
(32, 30, 20, 5, 1, NULL, '2017-09-20 12:30:57', '2017-09-20 12:43:36', 'ab18edb6-87de-4af0-92d9-de85dd694ab0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixblocktypes`
--

INSERT INTO `craft_matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 13, 23, 'Fund', 'fund', 1, '2017-09-15 15:54:28', '2017-09-15 15:57:09', '2d68b70d-a02b-43a2-9bed-090b96e0a106'),
(3, 19, 46, 'Product Name', 'productName', 1, '2017-09-20 11:06:24', '2017-09-25 13:28:36', '4b4e26e0-958b-4c35-a1fa-7bf8cf232a76'),
(5, 20, 37, 'Features', 'features', 1, '2017-09-20 12:22:54', '2017-09-20 12:22:54', '259c8b4c-e9c5-42d8-a76b-60c61b32613f');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_activefunds`
--

CREATE TABLE `craft_matrixcontent_activefunds` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_fund_fundCharge` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixcontent_activefunds`
--

INSERT INTO `craft_matrixcontent_activefunds` (`id`, `elementId`, `locale`, `field_fund_fundCharge`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 17, 'en_gb', '.5', '2017-09-15 15:55:09', '2017-09-15 16:16:47', 'b5789d2f-7673-4d5b-9eac-6d96482ac740'),
(2, 18, 'en_gb', '.75', '2017-09-15 15:56:31', '2017-09-15 16:16:47', '75b506df-9fbc-441d-8af9-f77c9b9cf5e0'),
(3, 19, 'en_gb', '', '2017-09-15 16:03:33', '2017-09-15 16:03:33', 'ca0ccf13-c753-49b2-8dd9-c1bbe3f23972'),
(4, 21, 'en_gb', '5%', '2017-09-15 16:17:18', '2017-09-15 16:17:18', '9039bf2a-1b5e-46a2-bc40-ac0cbeaf941c'),
(5, 22, 'en_gb', '1%', '2017-09-15 16:17:18', '2017-09-15 16:17:18', '2d7727d8-94da-4085-bcad-3137407ef027');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_fffeatures`
--

CREATE TABLE `craft_matrixcontent_fffeatures` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_features_desc` text COLLATE utf8_unicode_ci,
  `field_features_detail` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixcontent_fffeatures`
--

INSERT INTO `craft_matrixcontent_fffeatures` (`id`, `elementId`, `locale`, `field_features_desc`, `field_features_detail`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 29, 'en_gb', 'sfsfdsfsdf', '', '2017-09-20 12:23:27', '2017-09-20 12:37:42', 'a2480266-caa7-4dd1-a69a-bc3009f5ff56'),
(3, 32, 'en_gb', 'abc', '', '2017-09-20 12:30:57', '2017-09-20 12:43:36', '8c1f0927-9925-4db5-a964-55befe83b053');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixcontent_product`
--

CREATE TABLE `craft_matrixcontent_product` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_productName_productName` text COLLATE utf8_unicode_ci,
  `field_productName_desc` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_matrixcontent_product`
--

INSERT INTO `craft_matrixcontent_product` (`id`, `elementId`, `locale`, `field_productName_productName`, `field_productName_desc`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 28, 'en_gb', 'nun,,n,n', 'kn,n,nn,', '2017-09-20 12:16:10', '2017-09-20 12:37:42', '437adf1d-9d36-4e8b-8084-b45cb81017bb'),
(2, 31, 'en_gb', 'yyyy', '', '2017-09-20 12:30:57', '2017-09-20 12:43:36', '0e413ef1-86fc-47eb-8fdd-9871d2502aa2');

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'm000000_000000_base', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '63bf0e0a-7952-4380-816d-7212d7933a88'),
(2, NULL, 'm140730_000001_add_filename_and_format_to_transformindex', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a42ca0d1-6c4f-4a7e-b5c0-2350b3da3353'),
(3, NULL, 'm140815_000001_add_format_to_transforms', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a05c3f2e-4c85-4a67-891d-c098f10d5adf'),
(4, NULL, 'm140822_000001_allow_more_than_128_items_per_field', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a3f103c4-c276-4ce3-9eb6-885c19971d38'),
(5, NULL, 'm140829_000001_single_title_formats', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '52269d68-ff63-4e1c-9b82-eb8bc017f413'),
(6, NULL, 'm140831_000001_extended_cache_keys', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'b7b01646-056f-4266-8504-69364874eab3'),
(7, NULL, 'm140922_000001_delete_orphaned_matrix_blocks', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '3f023e6c-57b1-4010-8071-21a045e5f43a'),
(8, NULL, 'm141008_000001_elements_index_tune', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '653026ca-005d-4b19-ae90-a9c2b3cf60d8'),
(9, NULL, 'm141009_000001_assets_source_handle', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '96194bba-6314-430c-8df1-b650ed05c8f9'),
(10, NULL, 'm141024_000001_field_layout_tabs', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'c19f84f5-1836-479b-84b9-9f4c9fef8050'),
(11, NULL, 'm141030_000000_plugin_schema_versions', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a7fbe5ad-ff5d-441c-823b-b0cb43323751'),
(12, NULL, 'm141030_000001_drop_structure_move_permission', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '3d0eb146-78fa-4f27-a727-8e4a549b6f6d'),
(13, NULL, 'm141103_000001_tag_titles', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '7913328e-38c9-4f7a-bfa4-d9130f74d281'),
(14, NULL, 'm141109_000001_user_status_shuffle', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '8f26161e-8703-491c-b338-2e6490c64495'),
(15, NULL, 'm141126_000001_user_week_start_day', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'e2e86233-92d4-4876-b0d3-1d8fd0b503a2'),
(16, NULL, 'm150210_000001_adjust_user_photo_size', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '04daeee9-bfb2-48af-b0f8-62aac95bd49a'),
(17, NULL, 'm150724_000001_adjust_quality_settings', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '10349136-08a5-408d-8491-9cf17f04eef5'),
(18, NULL, 'm150827_000000_element_index_settings', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '8fbf2f93-9114-4f6c-84bb-8b770674f404'),
(19, NULL, 'm150918_000001_add_colspan_to_widgets', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'ef28576b-83b5-458a-b1cb-174b4766989f'),
(20, NULL, 'm151007_000000_clear_asset_caches', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '67257de1-1ce4-43f8-a033-0fc0d31f9f1e'),
(21, NULL, 'm151109_000000_text_url_formats', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '953d6f3c-56c9-47bc-943b-d88ebccb3320'),
(22, NULL, 'm151110_000000_move_logo', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a6a9d95e-6797-4e36-b3b3-2b1ca9adfac7'),
(23, NULL, 'm151117_000000_adjust_image_widthheight', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '29480640-f127-46a0-873a-ab6152cdf204'),
(24, NULL, 'm151127_000000_clear_license_key_status', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'd6c9c6f5-3db6-4e77-9659-1d0d6bfb5ed8'),
(25, NULL, 'm151127_000000_plugin_license_keys', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'a70a27df-641a-4678-8b8d-f6adbe417efe'),
(26, NULL, 'm151130_000000_update_pt_widget_feeds', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '3763f8c0-4e29-4dbe-a39f-f061788996b0'),
(27, NULL, 'm160114_000000_asset_sources_public_url_default_true', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '7e65704f-eaad-4e2c-9965-5f1e7dcd784e'),
(28, NULL, 'm160223_000000_sortorder_to_smallint', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '96ee3d6e-98ab-44f1-af2d-c0571dad86c6'),
(29, NULL, 'm160229_000000_set_default_entry_statuses', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '62bc7627-bf75-43c1-95cd-f85e8f5030ae'),
(30, NULL, 'm160304_000000_client_permissions', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '326ec8b5-8458-4d50-8432-318be422fec9'),
(31, NULL, 'm160322_000000_asset_filesize', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'e1cb6dc2-53e4-450f-8725-08e04441a040'),
(32, NULL, 'm160503_000000_orphaned_fieldlayouts', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'c824810a-34fd-4b30-ad90-c4f8923b892d'),
(33, NULL, 'm160510_000000_tasksettings', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '129b9d2b-4b4d-459b-a7c6-d6222c676f3a'),
(34, NULL, 'm160829_000000_pending_user_content_cleanup', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '4ef6cad3-34cd-42be-9023-bbfcc899cba1'),
(35, NULL, 'm160830_000000_asset_index_uri_increase', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'd4f0345e-12c4-4724-b69a-0aec1ddc0fc1'),
(36, NULL, 'm160919_000000_usergroup_handle_title_unique', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'd17fbfab-d2f3-4b39-9761-daaa536ece97'),
(37, NULL, 'm161108_000000_new_version_format', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'c98cf6dc-8305-4aa4-b72a-23f7046ad48f'),
(38, NULL, 'm161109_000000_index_shuffle', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', 'd61798f8-1a1b-4b5b-a951-fd71bf5dce7c'),
(39, NULL, 'm170612_000000_route_index_shuffle', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '2017-09-15 15:06:36', '92f4560c-8ef6-4ae8-8484-07123b08002c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_plugins`
--

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ButtonBox', '1.5.0', NULL, NULL, 'unknown', 1, NULL, '2017-09-21 14:28:59', '2017-09-21 14:28:59', '2017-10-19 13:21:28', '8a4ae6c5-bd16-4a54-a1c0-755927d7c791'),
(3, 'Rich', '1.0.0', '1.0.0', NULL, 'unknown', 1, NULL, '2017-09-25 13:13:55', '2017-09-25 13:13:55', '2017-10-19 13:21:28', 'b1de976c-6928-48f0-9b68-f2b328119c10');

-- --------------------------------------------------------

--
-- Table structure for table `craft_rackspaceaccess`
--

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_relations`
--

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 13, 16, NULL, 14, 1, '2017-09-15 15:50:48', '2017-09-15 15:50:48', '4bd16e4a-1f90-48dd-8eea-8ad2f0c1606e'),
(11, 13, 15, NULL, 14, 1, '2017-09-15 15:52:44', '2017-09-15 15:52:44', '1ee02d4c-64fc-481a-87fa-4201594c7d9d'),
(20, 15, 19, NULL, 14, 1, '2017-09-15 16:03:33', '2017-09-15 16:03:33', 'bde4435b-659e-48c0-8c46-8329fd28c985'),
(24, 12, 15, NULL, 14, 1, '2017-09-15 16:16:47', '2017-09-15 16:16:47', '7f6e9631-fda6-4827-a1ac-121bd2285427'),
(25, 15, 17, NULL, 14, 1, '2017-09-15 16:16:47', '2017-09-15 16:16:47', 'dd351c24-9fe5-4d70-a87a-e44ce304fc9c'),
(26, 15, 18, NULL, 14, 1, '2017-09-15 16:16:47', '2017-09-15 16:16:47', '5d6e4d1c-66e4-4c84-84e0-1d662e207f3e'),
(27, 15, 21, NULL, 14, 1, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '475d1f88-6f2a-4296-9e17-61d1adea3d17'),
(28, 15, 22, NULL, 14, 1, '2017-09-15 16:17:18', '2017-09-15 16:17:18', '138cf4fc-78df-4fc7-8617-ffe734fa6a11'),
(29, 3, 8, NULL, 11, 1, '2017-09-15 16:18:02', '2017-09-15 16:18:02', 'be59c027-2768-4265-9e9c-700d359b9f40'),
(30, 3, 8, NULL, 13, 2, '2017-09-15 16:18:02', '2017-09-15 16:18:02', '5890730e-357e-4b2a-84e9-5bb4714937cb'),
(31, 3, 8, NULL, 12, 3, '2017-09-15 16:18:02', '2017-09-15 16:18:02', 'ca7c08ab-0ed1-48bb-b183-eaba6d017481');

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(1, 'username', 0, 'en_gb', ' adam '),
(1, 'firstname', 0, 'en_gb', ''),
(1, 'lastname', 0, 'en_gb', ''),
(1, 'fullname', 0, 'en_gb', ''),
(1, 'email', 0, 'en_gb', ' adam devbook local '),
(1, 'slug', 0, 'en_gb', ''),
(10, 'slug', 0, 'en_gb', ' fund guide content blocks '),
(8, 'title', 0, 'en_gb', ' new fund guide '),
(9, 'field', 1, 'en_gb', ' more content goes here '),
(9, 'slug', 0, 'en_gb', ' fund guide content '),
(9, 'title', 0, 'en_gb', ' fund guide content '),
(11, 'field', 1, 'en_gb', ' this is your fund guide for your special product welcome '),
(10, 'field', 4, 'en_gb', ' intro '),
(10, 'field', 1, 'en_gb', ' welcome to your fund guide '),
(8, 'slug', 0, 'en_gb', ' new fund guide '),
(6, 'slug', 0, 'en_gb', ' fund guide content '),
(6, 'title', 0, 'en_gb', ' fund guide content '),
(7, 'field', 1, 'en_gb', ' fund guide introduction welcome etc '),
(7, 'slug', 0, 'en_gb', ' fund guide content '),
(7, 'title', 0, 'en_gb', ' fund guide content '),
(8, 'field', 3, 'en_gb', ' fg special intro special conditions fg footer '),
(6, 'field', 1, 'en_gb', ' fund guide introduction welcome etc '),
(5, 'field', 1, 'en_gb', ' this is some content '),
(4, 'field', 1, 'en_gb', ' elephant plc registered in england on a hill company number 123465 '),
(4, 'slug', 0, 'en_gb', ''),
(5, 'slug', 0, 'en_gb', ' fund guide '),
(5, 'title', 0, 'en_gb', ' fund guide content '),
(10, 'title', 0, 'en_gb', ' fund guide intro '),
(5, 'field', 4, 'en_gb', ' fund guide content goes here '),
(11, 'slug', 0, 'en_gb', ' fg special intro '),
(11, 'title', 0, 'en_gb', ' fg special intro '),
(12, 'field', 1, 'en_gb', ' for more information please get in touch on 0800111111 '),
(12, 'slug', 0, 'en_gb', ' fg footer '),
(12, 'title', 0, 'en_gb', ' fg footer '),
(13, 'field', 1, 'en_gb', ' there are some special conditions for this fund guide '),
(13, 'slug', 0, 'en_gb', ' special conditions '),
(13, 'title', 0, 'en_gb', ' special conditions '),
(14, 'field', 5, 'en_gb', ' adams fund '),
(14, 'field', 7, 'en_gb', ' rich '),
(14, 'field', 8, 'en_gb', ''),
(14, 'field', 6, 'en_gb', ' medium '),
(14, 'slug', 0, 'en_gb', ' asdf '),
(14, 'title', 0, 'en_gb', ' asdf '),
(15, 'field', 9, 'en_gb', ' adam '),
(15, 'field', 10, 'en_gb', ' kjhkjhkjh '),
(15, 'field', 11, 'en_gb', ''),
(15, 'field', 12, 'en_gb', ' asdf '),
(15, 'field', 13, 'en_gb', ' 5 asdf 75 asdf '),
(15, 'field', 14, 'en_gb', ''),
(15, 'slug', 0, 'en_gb', ' adam kfa '),
(15, 'title', 0, 'en_gb', ' adam kfa '),
(16, 'field', 9, 'en_gb', ' adam '),
(16, 'field', 10, 'en_gb', ''),
(16, 'field', 11, 'en_gb', ''),
(16, 'field', 12, 'en_gb', ''),
(16, 'field', 13, 'en_gb', ' asdf '),
(16, 'field', 14, 'en_gb', ''),
(16, 'slug', 0, 'en_gb', ' adam kfa 1 '),
(16, 'title', 0, 'en_gb', ' rich kfa '),
(17, 'field', 15, 'en_gb', ' asdf '),
(17, 'field', 16, 'en_gb', ' 5 '),
(17, 'slug', 0, 'en_gb', ''),
(18, 'field', 15, 'en_gb', ' asdf '),
(18, 'field', 16, 'en_gb', ' 75 '),
(18, 'slug', 0, 'en_gb', ''),
(19, 'field', 15, 'en_gb', ' asdf '),
(19, 'field', 16, 'en_gb', ''),
(19, 'slug', 0, 'en_gb', ''),
(20, 'field', 9, 'en_gb', ' jghjhg '),
(20, 'field', 10, 'en_gb', ''),
(20, 'field', 12, 'en_gb', ''),
(20, 'field', 13, 'en_gb', ' 5% asdf 1% asdf '),
(20, 'field', 14, 'en_gb', ''),
(20, 'slug', 0, 'en_gb', ' james kfa '),
(20, 'title', 0, 'en_gb', ' james kfa '),
(21, 'field', 15, 'en_gb', ' asdf '),
(21, 'field', 16, 'en_gb', ' 5% '),
(21, 'slug', 0, 'en_gb', ''),
(22, 'field', 15, 'en_gb', ' asdf '),
(22, 'field', 16, 'en_gb', ' 1% '),
(22, 'slug', 0, 'en_gb', ''),
(31, 'slug', 0, 'en_gb', ''),
(31, 'field', 24, 'en_gb', ''),
(30, 'slug', 0, 'en_gb', ' xxx 1 '),
(30, 'title', 0, 'en_gb', ' xxx '),
(31, 'field', 23, 'en_gb', ' yyyy '),
(30, 'field', 20, 'en_gb', ' abc '),
(30, 'field', 19, 'en_gb', ' yyyy '),
(29, 'slug', 0, 'en_gb', ''),
(29, 'field', 28, 'en_gb', ''),
(29, 'field', 27, 'en_gb', ' sfsfdsfsdf '),
(27, 'field', 19, 'en_gb', ' kn n nn nun n n '),
(27, 'field', 20, 'en_gb', ' sfsfdsfsdf '),
(27, 'slug', 0, 'en_gb', ' xxx '),
(27, 'title', 0, 'en_gb', ' xxx '),
(28, 'field', 23, 'en_gb', ' nun n n '),
(28, 'field', 24, 'en_gb', ' kn n nn '),
(28, 'slug', 0, 'en_gb', ''),
(32, 'field', 27, 'en_gb', ' abc '),
(32, 'field', 28, 'en_gb', ''),
(32, 'slug', 0, 'en_gb', '');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, NULL, 'Fund Guide Content Blocks', 'fundGuideContentBlock', 'channel', 1, 'fund-guide', 1, '2017-09-15 15:13:34', '2017-09-15 15:25:35', 'f04806f6-1b63-476f-9a3a-465d2c0459ce'),
(4, NULL, 'Fund Guide', 'fundGuide', 'channel', 1, 'fund-guide/_entry', 1, '2017-09-15 15:16:23', '2017-09-15 15:21:18', '43cc021f-555e-4739-af22-4efb2fd553ff'),
(5, NULL, 'Funds', 'funds', 'channel', 1, 'funds/_entry', 1, '2017-09-15 15:38:01', '2017-09-15 15:38:01', '06220427-1a3e-4684-b01e-ddb7af41911e'),
(6, NULL, 'KFA', 'kfa', 'channel', 1, 'kfa/_entry', 1, '2017-09-15 15:47:36', '2017-09-15 15:52:51', '5e017e0b-f580-459d-8dcf-d7be2dc47b74'),
(7, NULL, 'Fast Facts', 'fastFacts', 'channel', 1, 'fast-facts/_entry', 1, '2017-09-19 10:23:02', '2017-09-20 13:08:56', '133cfb65-d362-4061-bd28-8c4e01cfc9da');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_i18n`
--

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections_i18n`
--

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 3, 'en_gb', 1, 'fund-guide-content/{slug}', NULL, '2017-09-15 15:13:34', '2017-09-15 15:20:12', 'f14a2608-2b1e-40a6-9eef-e711c536599d'),
(4, 4, 'en_gb', 1, 'fund-guide/{slug}', NULL, '2017-09-15 15:16:23', '2017-09-15 15:18:53', '0c6f5cea-d78d-47be-8457-1917036fce6b'),
(5, 5, 'en_gb', 1, 'funds/{slug}', NULL, '2017-09-15 15:38:01', '2017-09-15 15:38:01', '6d610f3d-7e6b-4f70-b04b-d841952a733e'),
(6, 6, 'en_gb', 1, 'kfa/{slug}', NULL, '2017-09-15 15:47:36', '2017-09-15 15:47:36', '1900cc6f-7b36-47d3-97ac-ff2a58d62833'),
(7, 7, 'en_gb', 1, 'fast-facts/{slug}', NULL, '2017-09-19 10:23:02', '2017-09-20 13:08:56', '4647df89-0bd4-4bd8-b05d-34b73e48be22');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '472205a1e99aae988d3e1b2136f8e557668230c1czozMjoiaHUyYzVrc2VfRjM1bHc5X0hmdUFJcFRoOFVKaGxZSG4iOw==', '2017-09-15 15:06:43', '2017-09-15 15:06:43', 'cff4f14e-57d9-41bd-b79a-45991a8142db'),
(2, 1, '0eef7384b9425ae6954af30d2aa7e275f3e7edd0czozMjoiZkFfdlI4WnRJVm5GVTNiMGlLeDdjWDliREhpTFdiWlYiOw==', '2017-09-18 14:56:45', '2017-09-18 14:56:45', 'be10510d-80e9-4728-adfa-03210fab4087'),
(3, 1, 'd022ad54116afe804be844c826f69c3397c9c5f7czozMjoiTTQ3SmJ1VkFsZTE3Q35iZ3NyWElEVTJIQWpwRGc1MEwiOw==', '2017-09-18 15:02:13', '2017-09-18 15:02:13', 'a566307a-3d61-43a7-aa28-b8f22ff4fc33'),
(4, 1, '9d3887d2a8e7b587446e875a97aa7ceb5e41c64dczozMjoiX0ZhajF3aGp+R184eGo5R25ZdkxnVEE2VktRRXpJMmUiOw==', '2017-09-19 10:12:41', '2017-09-19 10:12:41', '32060c5a-3d28-4c7e-aeee-51cb6709edce'),
(5, 1, '101631c0a0713c0ebb8152145c8e3711d5279751czozMjoiQ3E2anRyTXExdXhDeW80OWtTS094RHp6SXFnelFWdmIiOw==', '2017-09-20 08:35:14', '2017-09-20 08:35:14', 'bc68a5fb-6569-415d-ac03-e4834e3b7c1e'),
(6, 1, 'dd1c8bb7bb0527b6077c94fe443dfbbc75c48f57czozMjoiR0tUMVRnTE0wNDZyZ1B0U2F4TmhscGhrT2luQnMzcFgiOw==', '2017-09-20 10:32:00', '2017-09-20 10:32:00', '761a9ec3-cfb0-4287-b307-d43441d6bbac'),
(7, 1, 'f5d4ab86454980c99543ebed4e8ca57746c39172czozMjoiY3gwRlk3SWJ5MG5iblY4cVZkck5XSlJMV1VUOXJrcWkiOw==', '2017-09-20 10:32:04', '2017-09-20 10:32:04', '0d257b13-4f90-4d85-9fb5-5c9adc3f4908'),
(8, 1, 'e2460298898ac8fed364db3febd9cf87df19b76cczozMjoiTm5vRFZhZk1HbGVjWmZrVGJjWjBQNUxpaGZtUWF+MFUiOw==', '2017-09-21 14:15:30', '2017-09-21 14:15:30', 'c0eac8c7-6b5d-4cf5-98c8-86c65c06f030'),
(9, 1, 'e282eb58609df8f7d3262d60c5cbba008a109e58czozMjoidTc0YVF6V0ZGcnVFRUt2NVhzRkNjUHFzblZDRkZDOVMiOw==', '2017-09-22 13:11:52', '2017-09-22 13:11:52', 'c0708ec5-cd81-49dc-b807-95ea69b2cb84'),
(10, 1, 'd78bc28eb0394078407ccd08052e633a18ace484czozMjoiVzlyZzRhNER6V2V3cHRBWX5lQjJtenBZVTFuWk1iWVMiOw==', '2017-09-22 15:19:16', '2017-09-22 15:19:16', '7d4287e7-8163-4bca-918a-028aee0215f6'),
(11, 1, 'd0263199431c61fa13357e2d73a27e94c19a1f3bczozMjoiQ290SUQzS1JEM3FWTzluUn45X2xTSmhVSzdCY0dhVmUiOw==', '2017-09-25 09:45:21', '2017-09-25 09:45:21', '82694d16-6fc2-4cf4-9d8f-327ef3267a9b'),
(12, 1, '7e48c114a63df5b90e6da377a3a51688836ec376czozMjoiZWlxM3E0bUw5RlYyajFYd0hYcWozb0hObjgzfkVwb1kiOw==', '2017-09-25 12:34:35', '2017-09-25 12:34:35', '87807353-47ea-4b16-ba1f-7030cc2f908c'),
(13, 1, '3de141ecb7769e42ddc109fd7e64f5a46e69638bczozMjoiTTFBcnpUYzBOTDVLRHlwWXdNUH5FbWhDUUNzSkxYWDYiOw==', '2017-09-25 15:42:46', '2017-09-25 15:42:46', '50f91a25-edb7-4708-9abf-ffee7f450a15'),
(14, 1, 'f0ac0a62abf997c952c03762c68cccc221235b8cczozMjoiOWl6OG9IMmczZzdSYWU4SFFobllkckFTcDV0dmRZdXIiOw==', '2017-09-26 09:49:51', '2017-09-26 09:49:51', '72d36ae2-d1a3-404b-8e54-4bcbce98a2e2'),
(15, 1, '238e9fd275eff8218a36bed0b1cbd9f81974357eczozMjoiaXJWVXpDdXZBVVhrUGdrM35tcGxmV1lLc3FZUGplOEEiOw==', '2017-09-26 15:07:21', '2017-09-26 15:07:21', 'a53484fe-7618-401b-bbbc-c2b117799b2e'),
(16, 1, '1f6e5894ab015e401e5ea2b1cefff37bd1aa4756czozMjoibmtkVWVnYjBkYkl3YkdLZ0RtVnJfflhSbnhrU2V5d2ciOw==', '2017-10-19 13:13:24', '2017-10-19 13:21:23', 'fa8513f0-c76a-468e-aacc-287e6e4f60ec');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_structureelements`
--

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 3, NULL, 1, 1, 2, 0, '2017-09-20 12:09:55', '2017-09-20 12:09:55', '0c00a5d7-6067-4898-9adc-e7ff2d21c249');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_structures`
--

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, '2017-09-20 12:07:01', '2017-09-20 12:07:01', 'c668f099-003d-4ac9-a7fe-161bdb17a5fb'),
(3, 1, '2017-09-20 12:09:26', '2017-09-20 12:09:26', 'c311427b-5bad-4582-9d4f-f2fca409cd59');

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"protocol\":\"php\",\"emailAddress\":\"adam@devbook.local\",\"senderName\":\"Test CraftCMS Site\"}', '2017-09-15 15:06:43', '2017-09-15 15:06:43', '59558ac8-4a8e-4706-b3e9-8edbb5e690fd');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_taggroups`
--

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 38, '2017-09-15 15:06:43', '2017-09-20 12:37:20', 'bb2dfc49-2b7a-4f9c-adc6-0bbc420b054c');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tasks`
--

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `currentStep` int(11) UNSIGNED DEFAULT NULL,
  `totalSteps` int(11) UNSIGNED DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachecriteria`
--

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `client` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `suspended` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pending` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `archived` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'adam', NULL, '', '', 'adam@devbook.local', '$2y$13$rP5OMwqBqpoq.EGQADt51.l28eAlgAHh2HzIZGSOs9VPhCNjVTcni', NULL, 0, 1, 0, 0, 0, 0, 0, '2017-10-19 13:13:24', '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-09-20 08:35:47', '2017-09-15 15:06:40', '2017-10-19 13:13:24', 'cb15f180-a430-4dd2-ae6d-b31eaff377e0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(4) UNSIGNED DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'RecentEntries', 1, NULL, NULL, 1, '2017-09-15 15:07:54', '2017-09-15 15:07:54', 'b0d95637-d7c8-49ce-94d1-d58fe17dd772'),
(2, 1, 'GetHelp', 2, NULL, NULL, 1, '2017-09-15 15:07:54', '2017-09-15 15:07:54', 'eb99e4ee-2ce4-46ff-9f4c-4074260c6bdd'),
(3, 1, 'Updates', 3, NULL, NULL, 1, '2017-09-15 15:07:54', '2017-09-15 15:07:54', 'a872b0e3-c8cd-4902-912b-ff2a3d4cfbae'),
(4, 1, 'Feed', 4, NULL, '{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}', 1, '2017-09-15 15:07:54', '2017-09-15 15:07:54', 'a896605e-6976-4936-859a-bc3ca05e0070');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  ADD KEY `craft_assetfiles_folderId_fk` (`folderId`);

--
-- Indexes for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  ADD KEY `craft_assetfolders_parentId_fk` (`parentId`),
  ADD KEY `craft_assetfolders_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  ADD KEY `craft_assetindexdata_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  ADD KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categories_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_categorygroups_structureId_fk` (`structureId`),
  ADD KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  ADD KEY `craft_categorygroups_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD KEY `craft_content_title_idx` (`title`),
  ADD KEY `craft_content_locale_fk` (`locale`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_elements_type_idx` (`type`),
  ADD KEY `craft_elements_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  ADD KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  ADD KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  ADD KEY `craft_emailmessages_locale_fk` (`locale`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entries_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entries_typeId_idx` (`typeId`),
  ADD KEY `craft_entries_postDate_idx` (`postDate`),
  ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `craft_entries_authorId_fk` (`authorId`);

--
-- Indexes for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  ADD KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  ADD KEY `craft_entrydrafts_locale_fk` (`locale`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  ADD KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  ADD KEY `craft_entryversions_locale_fk` (`locale`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  ADD KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `craft_fields_context_idx` (`context`),
  ADD KEY `craft_fields_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  ADD KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_locales`
--
ALTER TABLE `craft_locales`
  ADD PRIMARY KEY (`locale`),
  ADD KEY `craft_locales_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_matrixcontent_activefunds`
--
ALTER TABLE `craft_matrixcontent_activefunds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_activefunds_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD KEY `craft_matrixcontent_activefunds_locale_fk` (`locale`);

--
-- Indexes for table `craft_matrixcontent_fffeatures`
--
ALTER TABLE `craft_matrixcontent_fffeatures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_fffeatures_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD KEY `craft_matrixcontent_fffeatures_locale_fk` (`locale`);

--
-- Indexes for table `craft_matrixcontent_product`
--
ALTER TABLE `craft_matrixcontent_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixcontent_product_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD KEY `craft_matrixcontent_product_locale_fk` (`locale`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  ADD KEY `craft_migrations_pluginId_fk` (`pluginId`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  ADD KEY `craft_relations_sourceId_fk` (`sourceId`),
  ADD KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  ADD KEY `craft_relations_targetId_fk` (`targetId`);

--
-- Indexes for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_routes_locale_idx` (`locale`),
  ADD KEY `craft_routes_urlPattern_idx` (`urlPattern`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  ADD KEY `craft_sections_structureId_fk` (`structureId`);

--
-- Indexes for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  ADD KEY `craft_sections_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sessions_uid_idx` (`uid`),
  ADD KEY `craft_sessions_token_idx` (`token`),
  ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `craft_sessions_userId_fk` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `craft_structureelements_root_idx` (`root`),
  ADD KEY `craft_structureelements_lft_idx` (`lft`),
  ADD KEY `craft_structureelements_rgt_idx` (`rgt`),
  ADD KEY `craft_structureelements_level_idx` (`level`),
  ADD KEY `craft_structureelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tags_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tasks_root_idx` (`root`),
  ADD KEY `craft_tasks_lft_idx` (`lft`),
  ADD KEY `craft_tasks_rgt_idx` (`rgt`),
  ADD KEY `craft_tasks_level_idx` (`level`);

--
-- Indexes for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  ADD KEY `craft_templatecachecriteria_type_idx` (`type`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  ADD KEY `craft_templatecacheelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  ADD KEY `craft_templatecaches_locale_fk` (`locale`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `craft_usergroups_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `craft_userpermissions_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  ADD KEY `craft_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `craft_users_uid_idx` (`uid`),
  ADD KEY `craft_users_preferredLocale_fk` (`preferredLocale`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_widgets_userId_fk` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `craft_matrixcontent_activefunds`
--
ALTER TABLE `craft_matrixcontent_activefunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `craft_matrixcontent_fffeatures`
--
ALTER TABLE `craft_matrixcontent_fffeatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_matrixcontent_product`
--
ALTER TABLE `craft_matrixcontent_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `craft_routes`
--
ALTER TABLE `craft_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_matrixcontent_activefunds`
--
ALTER TABLE `craft_matrixcontent_activefunds`
  ADD CONSTRAINT `craft_matrixcontent_activefunds_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_activefunds_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_fffeatures`
--
ALTER TABLE `craft_matrixcontent_fffeatures`
  ADD CONSTRAINT `craft_matrixcontent_fffeatures_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_fffeatures_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_matrixcontent_product`
--
ALTER TABLE `craft_matrixcontent_product`
  ADD CONSTRAINT `craft_matrixcontent_product_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixcontent_product_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

