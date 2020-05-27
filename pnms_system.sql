/*
Navicat MySQL Data Transfer

Source Server         : localhost_3307
Source Server Version : 100136
Source Host           : localhost:3307
Source Database       : pnms_system

Target Server Type    : MYSQL
Target Server Version : 100136
File Encoding         : 65001

Date: 2019-12-02 14:26:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for promissory_note
-- ----------------------------
DROP TABLE IF EXISTS `promissory_note`;
CREATE TABLE `promissory_note` (
  `pn_id` int(10) NOT NULL AUTO_INCREMENT,
  `pn_tracking_num` varchar(25) DEFAULT NULL,
  `pn_rep_id` int(10) unsigned DEFAULT NULL,
  `pn_ssi_id` int(10) unsigned NOT NULL,
  `pn_semester` varchar(20) NOT NULL,
  `pn_term` int(1) NOT NULL,
  `pn_school_yr` varchar(11) NOT NULL,
  `pn_amount_promised` varchar(10) NOT NULL,
  `pn_date_promised` date NOT NULL,
  `pn_remarks` text,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pn_id`),
  KEY `representative_id` (`pn_rep_id`),
  KEY `user_id` (`user_id`),
  KEY `promissory_note_id_foreign` (`pn_ssi_id`),
  CONSTRAINT `promissory_note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `promissory_note_ibfk_2` FOREIGN KEY (`pn_rep_id`) REFERENCES `representative` (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of promissory_note
-- ----------------------------

-- ----------------------------
-- Table structure for representative
-- ----------------------------
DROP TABLE IF EXISTS `representative`;
CREATE TABLE `representative` (
  `rep_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rep_fullname` varchar(25) NOT NULL,
  `rep_address` varchar(191) NOT NULL,
  `rep_relation` varchar(25) NOT NULL,
  `rep_id_presented` text,
  `rep_email_address` varchar(50) DEFAULT NULL,
  `rep_contact_num` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=912199 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of representative
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=921321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('921319', 'Tester', 'tester', '$2y$10$ZH6JTmTt83dnKa.hviRVU.15u12iXr95jzVFNwwvsIyHwHCVkcs5.', null, 'dpwmNHIqjUul9FUmTAZ7fPDjZs5zbeqweTp7NhcNdgjGS4azjzt7t94zPt7Z', '2019-11-04 02:57:17', '2019-11-04 02:57:17');
INSERT INTO `users` VALUES ('921320', 'Admin', 'admin', '$2y$10$a2U.2SXeQWpvRZNCqwBIPuh1xUdm3OFYixS3xS70eqZ0Bm1vo2Ely', null, 'nqICMp9IClFVuxPm9Z5kE3uusICYsPlqRX5dRrETtRncj2ZkosEcmZWnJbuN', '2019-11-04 03:40:20', '2019-11-04 03:40:20');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `user_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_fname` varchar(25) DEFAULT NULL,
  `user_lname` varchar(25) DEFAULT NULL,
  `user_mname` varchar(25) DEFAULT NULL,
  `user_gender` varchar(6) NOT NULL,
  `user_position` varchar(50) NOT NULL,
  `user_contact_num` varchar(11) DEFAULT NULL,
  `user_image` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_logs
-- ----------------------------
