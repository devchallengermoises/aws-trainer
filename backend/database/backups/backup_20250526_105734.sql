-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: quiz_db
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint unsigned NOT NULL,
  `answer_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'Create an AWS Lambda function that lists the EC2 instances, counts the EC2 instances, and compares the total number against the applied quota value by using the Service Quotas API. Configure the Lambda function to publish an Amazon Simple Notification Service (Amazon SNS) notification if the quota utilization is equal to or greater than 70%. Create an Amazon EventBridge rule to invoke the Lambda function.',0,NULL,NULL),(2,1,'Create an AWS Lambda function that lists the EC2 instances, counts the total number against the applied quota value by using the Amazon CloudWatch Metrics API. Configure the Lambda function to publish an Amazon Simple Notification if the quota utilization is equal to or greater than 70%. Create an Amazon EventBridge rule to invoke the Lambda function.',0,NULL,NULL),(3,1,'Use the Service Quotas console to create an Amazon CloudWatch alarm for the EC2 instances. Configure the alarm for quota utilization equal to or greater than 70%. Configure the alarm to publish an Amazon Simple Notification Service (Amazon SNS) notification when the alarm enters ALARM state.',1,NULL,NULL),(4,1,'Create an Amazon CloudWatch alarm. Configure the alarm with a threshold of 70% for the CPU Utilization metric for the EC2 instances. Configure the alarm to publish an Amazon Simple Notification Service (Amazon SNS) notification when the alarm enters ALARM state.',0,NULL,NULL),(5,2,'Create a new CloudFront distribution that has the same origin. Set the default TTL to 1 minute (60 seconds). Switch Amazon Route 53 DNS records to use the new distribution.',0,NULL,NULL),(6,2,'Instruct the marketing team to upload the new images to a different location. When the new images are uploaded, update the website to locate the new images.',0,NULL,NULL),(7,2,'Issue a CloudFront invalidation request to immediately expire the new images from the marketing team\'s update.',1,NULL,NULL),(8,2,'Update the existing CloudFront distribution to reconfigure the default TTL to 1 minute (60 seconds). During submission of the new configuration, include the flag to invalidate objects in the specified path.',0,NULL,NULL),(9,3,'Destination: 10.0.0.0/16, Target: Local',1,NULL,NULL),(10,3,'Destination: 172.31.0.0/16, Target: Local',0,NULL,NULL),(11,3,'Destination: 10.0.0.0/16, Target: pcx-12345',0,NULL,NULL),(12,3,'Destination: 172.31.0.0/16, Target: pcx-12345',1,NULL,NULL),(13,3,'Destination: 10.0.0.0/16, Target: 172.31.0.0/16',0,NULL,NULL),(14,4,'VPC Flow Logs',0,NULL,NULL),(15,4,'AWS CloudTrail logs',0,NULL,NULL),(16,4,'ALB access logs',1,NULL,NULL),(17,4,'CloudFront access logs',1,NULL,NULL),(18,4,'RDS logs',0,NULL,NULL),(19,5,'Create an Amazon CloudWatch alarm for the EC2 instance with basic monitoring. Add an action to restart the instance.',0,NULL,NULL),(20,5,'Create an Amazon CloudWatch alarm for the EC2 instance with detailed monitoring. Add an action to restart the instance.',1,NULL,NULL),(21,5,'Create an AWS Lambda function to restart the EC2 instance, invoked on a scheduled basis every 2 minutes.',0,NULL,NULL),(22,5,'Create an AWS Lambda function to restart the EC2 instance, invoked by EC2 health checks.',0,NULL,NULL),(23,6,'The SysOps administrator does not have access to the key pair that is required for connection.',0,NULL,NULL),(24,6,'The SysOps administrator has not attached a security group to the EC2 instance to allow SSH on port 22.',0,NULL,NULL),(25,6,'The EC2 instance does not have an attached IAM role that allows Session Manager to connect to the EC2 instance.',1,NULL,NULL),(26,6,'The EC2 instance ID has not been entered into the Session Manager configuration.',0,NULL,NULL),(27,7,'Add another node to the ElastiCache cluster.',0,NULL,NULL),(28,7,'Increase the ElastiCache TTL value.',0,NULL,NULL),(29,7,'Change the eviction policy to randomly evict keys that have a TTL set.',0,NULL,NULL),(30,7,'Change the eviction policy to evict the least frequently used keys.',1,NULL,NULL);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_types`
--

DROP TABLE IF EXISTS `exam_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_types_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_types`
--

LOCK TABLES `exam_types` WRITE;
/*!40000 ALTER TABLE `exam_types` DISABLE KEYS */;
INSERT INTO `exam_types` VALUES (1,'AWS Certified SysOps Administrator','SOA-C02','AWS Certified SysOps Administrator - Associate certification exam','2025-05-26 13:57:14','2025-05-26 13:57:14'),(2,'AWS Certified Solutions Architect','ASS-C03','AWS Certified Solutions Architect - Associate certification exam','2025-05-26 13:57:14','2025-05-26 13:57:14'),(3,'AWS Certified Developer','DVA-C02','AWS Certified Developer - Associate certification exam','2025-05-26 13:57:14','2025-05-26 13:57:14');
/*!40000 ALTER TABLE `exam_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2025_03_20_224657_create_exam_types_table',1),(6,'2025_03_20_224658_create_questions_table',1),(7,'2025_03_20_224712_create_answers_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_type_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_exam_type_id_foreign` (`exam_type_id`),
  CONSTRAINT `questions_exam_type_id_foreign` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'A company hosts an internal application on Amazon EC2 On-Demand Instances behind an\n            Application Load Balancer (ALB). The instances are in an Amazon EC2 Auto Scaling group.\n            Employees use the application to provide product prices to potential customers. The Auto\n            Scaling group is configured with a dynamic scaling policy and tracks average CPU utilization of\n            the instances.\n            Employees have noticed that sometimes the application becomes slow or unresponsive. A\n            SysOps administrator finds that some instances are experiencing a high CPU load. The Auto\n            Scaling group cannot scale out because the company is reaching the EC2 instance service\n            quota.\n            The SysOps administrator needs to implement a solution that provides a notification when the\n            company reaches 70% or more of the EC2 instance service quota.\n            Which solution will meet these requirements in the MOST operationally efficient manner?',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(2,'A company uses Amazon CloudFront to serve static content to end users. The company recently deployed updates to 150 images on the company\'s website. However, the website is not displaying some of the new images. A SysOps administrator reviews the CloudFront distribution\'s cache settings. The default TTL for the distribution is set to 1 week (604,800 seconds). What should the SysOps administrator do to refresh the cache with the new images in the MOST operationally efficient way?',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(3,'A company has two VPC networks named VPC A and VPC B. The VPC A CIDR block is 10.0.0.0/16 and the VPC B CIDR block is 172.31.0.0/16. The company wants to establish a VPC peering connection named pcx-12345 between both VPCs. Which rules should appear in the route table of VPC A after configuration? (Select TWO)',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(4,'A SysOps administrator is maintaining a web application using an Amazon CloudFront web distribution, an Application Load Balancer (ALB), Amazon RDS, and Amazon EC2 in a VPC. All services have logging enabled. The administrator needs to investigate HTTP Layer 7 status codes from the web application. Which log sources contain the status codes? (Select TWO.)',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(5,'An errant process is known to use an entire processor and run at 100%. A SysOps administrator wants to automate restarting an Amazon EC2 instance when the problem occurs for more than 2 minutes. How can this be accomplished?',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(6,'A SysOps administrator uses AWS Systems Manager Session Manager to connect to instances. After the SysOps administrator launches a new Amazon EC2 instance, the EC2 instance does not appear in the Session Manager list of systems that are available for connection. The SysOps administrator verifies that Systems Manager Agent is installed, updated, and running on the EC2 instance. What is the reason for this issue?',1,'2025-05-26 13:57:14','2025-05-26 13:57:14'),(7,'An e-commerce company uses an Amazon ElastiCache for Redis cluster for in-memory caching of popular product queries on a shopping website. The cache eviction policy is randomly evicting keys whether or not a TTL is set. A SysOps administrator must improve the cache hit ratio without increasing costs. Which solution will meet these requirements?',1,'2025-05-26 13:57:14','2025-05-26 13:57:14');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin!.!','admin@admin.com',NULL,'$2y$10$eY30CZKHRa6ynxIaptNxRuHgIYCUFJWu.2A6SKenwsc2uGiT.76Rq',NULL,'2025-05-26 13:57:14','2025-05-26 13:57:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 13:57:34
