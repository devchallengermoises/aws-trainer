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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'Create an AWS Lambda function that lists the EC2 instances, counts the EC2 instances, and compares the total number against the applied quota value by using the Service Quotas API. Configure the Lambda function to publish an Amazon Simple Notification Service (Amazon SNS) notification if the quota utilization is equal to or greater than 70%. Create an Amazon EventBridge rule to invoke the Lambda function.',0,NULL,NULL),(2,1,'Create an AWS Lambda function that lists the EC2 instances, counts the total number against the applied quota value by using the Amazon CloudWatch Metrics API. Configure the Lambda function to publish an Amazon Simple Notification if the quota utilization is equal to or greater than 70%. Create an Amazon EventBridge rule to invoke the Lambda function.',0,NULL,NULL),(3,1,'Use the Service Quotas console to create an Amazon CloudWatch alarm for the EC2 instances. Configure the alarm for quota utilization equal to or greater than 70%. Configure the alarm to publish an Amazon Simple Notification Service (Amazon SNS) notification when the alarm enters ALARM state.',1,NULL,NULL),(4,1,'Create an Amazon CloudWatch alarm. Configure the alarm with a threshold of 70% for the CPU Utilization metric for the EC2 instances. Configure the alarm to publish an Amazon Simple Notification Service (Amazon SNS) notification when the alarm enters ALARM state.',0,NULL,NULL),(5,2,'Create a new CloudFront distribution that has the same origin. Set the default TTL to 1 minute (60 seconds). Switch Amazon Route 53 DNS records to use the new distribution.',0,NULL,NULL),(6,2,'Instruct the marketing team to upload the new images to a different location. When the new images are uploaded, update the website to locate the new images.',0,NULL,NULL),(7,2,'Issue a CloudFront invalidation request to immediately expire the new images from the marketing team\'s update.',1,NULL,NULL),(8,2,'Update the existing CloudFront distribution to reconfigure the default TTL to 1 minute (60 seconds). During submission of the new configuration, include the flag to invalidate objects in the specified path.',0,NULL,NULL),(9,3,'Destination: 10.0.0.0/16, Target: Local',1,NULL,NULL),(10,3,'Destination: 172.31.0.0/16, Target: Local',0,NULL,NULL),(11,3,'Destination: 10.0.0.0/16, Target: pcx-12345',0,NULL,NULL),(12,3,'Destination: 172.31.0.0/16, Target: pcx-12345',1,NULL,NULL),(13,3,'Destination: 10.0.0.0/16, Target: 172.31.0.0/16',0,NULL,NULL),(14,4,'VPC Flow Logs',0,NULL,NULL),(15,4,'AWS CloudTrail logs',0,NULL,NULL),(16,4,'ALB access logs',1,NULL,NULL),(17,4,'CloudFront access logs',1,NULL,NULL),(18,4,'RDS logs',0,NULL,NULL),(19,5,'Create an Amazon CloudWatch alarm for the EC2 instance with basic monitoring. Add an action to restart the instance.',0,NULL,NULL),(20,5,'Create an Amazon CloudWatch alarm for the EC2 instance with detailed monitoring. Add an action to restart the instance.',1,NULL,NULL),(21,5,'Create an AWS Lambda function to restart the EC2 instance, invoked on a scheduled basis every 2 minutes.',0,NULL,NULL),(22,5,'Create an AWS Lambda function to restart the EC2 instance, invoked by EC2 health checks.',0,NULL,NULL),(23,6,'The SysOps administrator does not have access to the key pair that is required for connection.',0,NULL,NULL),(24,6,'The SysOps administrator has not attached a security group to the EC2 instance to allow SSH on port 22.',0,NULL,NULL),(25,6,'The EC2 instance does not have an attached IAM role that allows Session Manager to connect to the EC2 instance.',1,NULL,NULL),(26,6,'The EC2 instance ID has not been entered into the Session Manager configuration.',0,NULL,NULL),(27,7,'Add another node to the ElastiCache cluster.',0,NULL,NULL),(28,7,'Increase the ElastiCache TTL value.',0,NULL,NULL),(29,7,'Change the eviction policy to randomly evict keys that have a TTL set.',0,NULL,NULL),(30,7,'Change the eviction policy to evict the least frequently used keys.',1,NULL,NULL),(31,8,'Configure a Route 53 latency routing policy.',0,NULL,NULL),(32,8,'Configure a Route 53 multivalue answer routing policy.',0,NULL,NULL),(33,8,'Configure a Route 53 geolocation routing policy.',1,NULL,NULL),(34,8,'Configure a Route 53 IP-based routing policy.',0,NULL,NULL),(35,9,'Configure S3 bucket metrics to record object access logs.',0,NULL,NULL),(36,9,'Create an AWS CloudTrail trail to log data events for all S3 objects.',1,NULL,NULL),(37,9,'Enable S3 server access logging for each S3 bucket.',0,NULL,NULL),(38,9,'Use AWS IAM Access Analyzer for Amazon S3 to store object access logs.',0,NULL,NULL),(39,10,'Configure the Auto Scaling group to scale based on events.',0,NULL,NULL),(40,10,'Configure the Auto Scaling group to scale based on a schedule.',0,NULL,NULL),(41,10,'Configure the Auto Scaling group to scale dynamically based on demand.',1,NULL,NULL),(42,10,'Configure the Auto Scaling group to use predictive scaling.',0,NULL,NULL),(43,11,'Change to the least outstanding requests algorithm on the ALB target group.',0,NULL,NULL),(44,11,'Configure cookie forwarding in the CloudFront distribution cache behavior.',1,NULL,NULL),(45,11,'Configure header forwarding in the CloudFront distribution cache behavior.',0,NULL,NULL),(46,11,'Enable group-level stickiness on the ALB listener rule.',0,NULL,NULL),(47,11,'Enable sticky sessions on the ALB target group.',1,NULL,NULL),(48,12,'Amazon RDS DescribeDBInstances action in the us-east-1 Region',1,NULL,NULL),(49,12,'Amazon S3 PutObject operation in a bucket named testbucket',0,NULL,NULL),(50,12,'Amazon EC2 DescribeInstances action in the us-east-1 Region',1,NULL,NULL),(51,12,'Amazon EC2 AttachNetworkInterface action in the eu-west-1 Region',0,NULL,NULL),(52,13,'Create an Aurora Replica node. Create an Auto Scaling policy to scale replicas based on CPU utilization. Ensure that all reporting requests use the read-only connection string.',1,NULL,NULL),(53,13,'Create a second Aurora MySQL single-node DB cluster in a second Availability Zone. Ensure that all reporting requests use the connection string for this additional node.',0,NULL,NULL),(54,13,'Create an AWS Lambda function that caches reporting requests. Ensure that all reporting requests call the Lambda function.',0,NULL,NULL),(55,13,'Create a multi-node Amazon ElastiCache cluster. Ensure that all reporting requests use the ElastiCache cluster. Use the database if the data is not in the cache.',0,NULL,NULL),(56,14,'Ensure that all the EC2 instances have the correct tags for Systems Manager access.',0,NULL,NULL),(57,14,'Configure AWS Identity and Access Management Access Analyzer to determine and automatically remediate the issue.',0,NULL,NULL),(58,14,'Ensure that all the EC2 instances have an instance profile with Systems Manager access.',1,NULL,NULL),(59,14,'Configure Systems Manager to use an interface VPC endpoint.',0,NULL,NULL),(60,15,'In Account A, create an AWS Systems Manager document that updates the /etc/resolv.conf file across all EC2 instances to point to the AWS provided default DNS resolver for the VPC in Account B.',0,NULL,NULL),(61,15,'In Account A, create an AWS CloudFormation template that associates the private hosted zone from Account B with the private hosted zone in Account A.',0,NULL,NULL),(62,15,'In Account A, use the AWS CLI to create a VPC association authorization. When the association is created, use the AWS CLI in Account B to associate the VPC from Account A with the private hosted zone in Account B.',1,NULL,NULL),(63,15,'In Account B, use the AWS CLI to create a VPC association authorization. When the association is created, use the AWS CLI in Account A to associate the VPC from Account B with the private hosted zone in Account A.',0,NULL,NULL),(64,16,'The Auto Scaling group will launch an additional EC2 instance every time the RequestCountPerTarget metric exceeds the predefined limit.',0,NULL,NULL),(65,16,'The Auto Scaling group will launch one EC2 instance and will wait for the default cooldown period before launching another instance.',1,NULL,NULL),(66,16,'The Auto Scaling group will send an alert to the ALB to rebalance the traffic and not add new EC2 instances until the load is normalized.',0,NULL,NULL),(67,16,'The Auto Scaling group will try to distribute the traffic among all EC2 instances before launching another instance.',0,NULL,NULL),(68,17,'Use S3 Batch Operations. Specify the operation to replace all object tags.',1,NULL,NULL),(69,17,'Use the AWS CLI to get the tags for each object. Save the tags in a list. Use S3 Batch Operations. Specify the operation to delete all object tags. Use the AWS CLI and the list to retag the objects.',0,NULL,NULL),(70,17,'Use the AWS CLI to get the tags for each object. Save the tags in a list. Use the AWS CLI and the list to remove the object tags.',0,NULL,NULL),(71,17,'Use the AWS CLI to copy the objects to another S3 bucket. Add the new tag to the copied objects. Delete the original objects.',0,NULL,NULL),(72,18,'Create and attach a NAT gateway. Create a custom route table that includes an entry to point all IPv6 traffic to the NAT gateway. Attach the custom route table to the IPv6-only subnets.',0,NULL,NULL),(73,18,'Create and attach an internet gateway. Create a custom route table that includes an entry to point all IPv6 traffic to the internet gateway. Attach the custom route table to the IPv6-only subnets.',0,NULL,NULL),(74,18,'Create and attach an egress-only internet gateway. Create a custom route table that includes an entry to point all IPv6 traffic to the egress-only internet gateway. Attach the custom route table to the IPv6-only subnets.',1,NULL,NULL),(75,18,'Create and attach an internet gateway and a NAT gateway. Create a custom route table that includes an entry to point all IPv6 traffic to the internet gateway and all IPv4 traffic to the NAT gateway. Attach the custom route table to the IPv6-only subnets.',0,NULL,NULL),(76,19,'Create a Route 53 Resolver inbound endpoint. Attach a security group to the endpoint to allow inbound traffic on TCP/UDP port 53 from the on-premises DNS servers.',1,NULL,NULL),(77,19,'Create a Route 53 Resolver inbound endpoint. Attach a security group to the endpoint to allow outbound traffic on TCP/UDP port 53 to the on-premises DNS servers.',0,NULL,NULL),(78,19,'Create a Route 53 Resolver outbound endpoint. Attach a security group to the endpoint to allow inbound traffic on TCP/UDP port 53 from the on-premises DNS servers.',0,NULL,NULL),(79,19,'Create a Route 53 Resolver outbound endpoint. Attach a security group to the endpoint to allow outbound traffic on TCP/UDP port 53 to the on-premises DNS servers.',0,NULL,NULL),(80,20,'Develop a CloudFormation change set.',0,NULL,NULL),(81,20,'Develop CloudFormation macros.',0,NULL,NULL),(82,20,'Develop CloudFormation nested stacks.',1,NULL,NULL),(83,20,'Develop CloudFormation stack sets.',0,NULL,NULL),(84,21,'Configure a lifecycle policy in Amazon Data Lifecycle Manager (Amazon DLM) to create the EBS volume snapshots with cross-Region backups enabled. Encrypt the snapshot copies by using AWS Key Management Service (AWS KMS).',1,NULL,NULL),(85,21,'Create a point-in-time snapshot of the EBS volumes. Copy the snapshots to an Amazon S3 bucket that uses server-side encryption. Turn on S3 Cross-Region Replication on the S3 bucket.',0,NULL,NULL),(86,21,'Create a point-in-time snapshot of the EBS volumes. When the snapshot status is COMPLETED, copy the snapshots to another Region and set the Encrypted parameter to False.',0,NULL,NULL),(87,21,'Schedule an AWS Lambda function with the Python runtime. Configure the Lambda function to create the EBS volume snapshots, encrypt the unencrypted snapshots, and copy the snapshots to another Region.',0,NULL,NULL),(88,22,'Configure the S3 bucket policy to deny unencrypted object uploads. Specify the \"aws:kms\" encryption context in the policy.',1,NULL,NULL),(89,22,'Enable default encryption on the S3 bucket and select SSE-KMS as the encryption type.',1,NULL,NULL),(90,22,'Configure the S3 bucket to require HTTPS for all requests.',0,NULL,NULL),(91,22,'Enable S3 Versioning on the bucket.',0,NULL,NULL),(92,23,'Amazon CloudWatch',1,NULL,NULL),(93,23,'AWS CloudTrail',0,NULL,NULL),(94,23,'AWS Config',0,NULL,NULL),(95,23,'Amazon Inspector',0,NULL,NULL),(96,24,'Ensure that there is an outbound security group for port 443 to 0.0.0.0/0.',1,NULL,NULL),(97,24,'Ensure that there is an inbound security group for port 443 from 0.0.0.0/0.',0,NULL,NULL),(98,24,'Ensure that there is an outbound network ACL for ephemeral ports 1024-65535 to 0.0.0.0/0.',0,NULL,NULL),(99,24,'Ensure that there is an outbound network ACL for port 80 to 0.0.0.0/0.',0,NULL,NULL),(100,25,'Change the AMI permissions to mark the AMI as public.',0,NULL,NULL),(101,25,'Deregister the AMI in the source account.',0,NULL,NULL),(102,25,'Re-encrypt the destination AMI with an AWS Key Management Service (AWS KMS) key from the destination account.',0,NULL,NULL),(103,25,'Update the CloudFormation template with the ID of the AMI in the destination account.',1,NULL,NULL),(104,26,'Associate the Route 53 private hosted zone with the VPC.',1,NULL,NULL),(105,26,'Create a rule in the default security group for the VPC that allows traffic to the Route 53 Resolver.',0,NULL,NULL),(106,26,'Ensure the VPC network ACLs allow traffic to the Route 53 Resolver.',0,NULL,NULL),(107,26,'Ensure there is a route to the Route 53 Resolver in each of the VPC route tables.',0,NULL,NULL),(108,27,'Add a product from the imported portfolio to a local portfolio.',1,NULL,NULL),(109,27,'Add new products to the imported portfolio.',0,NULL,NULL),(110,27,'Change the launch role for the products contained in the imported portfolio.',0,NULL,NULL),(111,27,'Customize the products in the imported portfolio.',0,NULL,NULL),(112,28,'Create an Amazon CloudWatch alarm to monitor application latency. Configure an alarm action to increase the size of each EC2 instance if the latency threshold is reached.',0,NULL,NULL),(113,28,'Create an Amazon EventBridge rule to monitor application latency. Configure the rule to add an EC2 instance to the ALB if the latency threshold is reached.',0,NULL,NULL),(114,28,'Deploy the application to an EC2 Auto Scaling group that uses a target tracking scaling policy. Attach the ALB to the Auto Scaling group.',0,NULL,NULL),(115,28,'Deploy the application to an EC2 Auto Scaling group that uses a scheduled scaling policy. Attach the ALB to the Auto Scaling group.',1,NULL,NULL),(116,29,'Create an Amazon CloudWatch alarm to monitor application latency. Configure an alarm action to increase the size of each EC2 instance if the latency threshold is reached.',0,NULL,NULL),(117,29,'Create an Amazon EventBridge rule to monitor application latency. Configure the rule to add an EC2 instance to the ALB if the latency threshold is reached.',0,NULL,NULL),(118,29,'Deploy the application to an EC2 Auto Scaling group that uses a target tracking scaling policy. Attach the ALB to the Auto Scaling group.',0,NULL,NULL),(119,29,'Deploy the application to an EC2 Auto Scaling group that uses a scheduled scaling policy. Attach the ALB to the Auto Scaling group.',1,NULL,NULL),(120,30,'Create an Amazon CloudWatch alarm to monitor Service Quotas. Configure the alarm to invoke an AWS Lambda function to request a quota increase when the alarm reaches the threshold.',1,NULL,NULL),(121,30,'Create an AWS Config rule to monitor Service Quotas. Call an AWS Lambda function to remediate the action and increase the quota.',0,NULL,NULL),(122,30,'Create an Amazon CloudWatch alarm to monitor the AWS Health Dashboard. Configure the alarm to invoke an AWS Lambda function to request a quota increase when the alarm reaches the threshold.',0,NULL,NULL),(123,30,'Create an Amazon CloudWatch alarm to monitor AWS Trusted Advisor service quotas. Configure the alarm to publish a message to an Amazon Simple Notification Service (Amazon SNS) topic to increase the quota.',0,NULL,NULL),(124,31,'Change the Amazon EBS volume to Provisioned IOPS.',0,NULL,NULL),(125,31,'Upgrade to a compute-optimized instance.',1,NULL,NULL),(126,31,'Add additional t3.large instances to the application.',0,NULL,NULL),(127,31,'Purchase Reserved Instances.',0,NULL,NULL),(128,32,'The template referenced an IAM user that is not available in eu-west-1.',0,NULL,NULL),(129,32,'The template referenced an Amazon Machine Image (AMI) that is not available in eu-west-1.',1,NULL,NULL),(130,32,'The template did not have the proper level of permissions to deploy the resources.',0,NULL,NULL),(131,32,'The template requested services that do not exist in eu-west-1.',1,NULL,NULL),(132,32,'CloudFormation templates can be used only to update existing services.',0,NULL,NULL),(133,33,'Create a mount target for the EFS file system in the VPC. Use the mount target to mount the file system on each of the instances.',0,NULL,NULL),(134,33,'Create a mount target for the EFS file system in one Availability Zone of the VPC. Use the mount target to mount the file system on the instances in that Availability Zone. Share the directory with the other instances.',0,NULL,NULL),(135,33,'Create a mount target for each instance. Use each mount target to mount the EFS file system on each respective instance.',0,NULL,NULL),(136,33,'Create a mount target in each Availability Zone of the VPC. Use the mount target to mount the EFS file system on the instances in the respective Availability Zone.',1,NULL,NULL),(137,34,'Upload the file using the S3 console.',0,NULL,NULL),(138,34,'Use the s3api copy-object command.',0,NULL,NULL),(139,34,'Use the s3api put-object command.',0,NULL,NULL),(140,34,'Use the s3 cp command.',1,NULL,NULL),(141,35,'Create a script that captures instance state changes and publishes a notification to an Amazon Simple Notification Service (Amazon SNS) topic. Use AWS Systems Manager Run Command to run the script on all EC2 instances.',0,NULL,NULL),(142,35,'Create an Amazon EventBridge event rule that captures EC2 instance state changes. Set an Amazon Simple Notification Service (Amazon SNS) topic as the target.',1,NULL,NULL),(143,35,'Create an Amazon EventBridge event rule that captures EC2 instance state changes. Set as the target an AWS Lambda function that publishes a notification to an Amazon Simple Notification Service (Amazon SNS) topic.',0,NULL,NULL),(144,35,'Create an AWS Config custom rule that evaluates instance state changes with automatic remediation. Use the rule to invoke an AWS Lambda function that publishes a notification to an Amazon Simple Notification Service (Amazon SNS) topic.',0,NULL,NULL);
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
INSERT INTO `exam_types` VALUES (1,'AWS Certified SysOps Administrator','SOA-C02','AWS Certified SysOps Administrator - Associate certification exam','2025-05-26 14:04:43','2025-05-26 14:04:43'),(2,'AWS Certified Solutions Architect','ASS-C03','AWS Certified Solutions Architect - Associate certification exam','2025-05-26 14:04:43','2025-05-26 14:04:43'),(3,'AWS Certified Developer','DVA-C02','AWS Certified Developer - Associate certification exam','2025-05-26 14:04:43','2025-05-26 14:04:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'A company hosts an internal application on Amazon EC2 On-Demand Instances behind an\n            Application Load Balancer (ALB). The instances are in an Amazon EC2 Auto Scaling group.\n            Employees use the application to provide product prices to potential customers. The Auto\n            Scaling group is configured with a dynamic scaling policy and tracks average CPU utilization of\n            the instances.\n            Employees have noticed that sometimes the application becomes slow or unresponsive. A\n            SysOps administrator finds that some instances are experiencing a high CPU load. The Auto\n            Scaling group cannot scale out because the company is reaching the EC2 instance service\n            quota.\n            The SysOps administrator needs to implement a solution that provides a notification when the\n            company reaches 70% or more of the EC2 instance service quota.\n            Which solution will meet these requirements in the MOST operationally efficient manner?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(2,'A company uses Amazon CloudFront to serve static content to end users. The company recently deployed updates to 150 images on the company\'s website. However, the website is not displaying some of the new images. A SysOps administrator reviews the CloudFront distribution\'s cache settings. The default TTL for the distribution is set to 1 week (604,800 seconds). What should the SysOps administrator do to refresh the cache with the new images in the MOST operationally efficient way?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(3,'A company has two VPC networks named VPC A and VPC B. The VPC A CIDR block is 10.0.0.0/16 and the VPC B CIDR block is 172.31.0.0/16. The company wants to establish a VPC peering connection named pcx-12345 between both VPCs. Which rules should appear in the route table of VPC A after configuration? (Select TWO)',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(4,'A SysOps administrator is maintaining a web application using an Amazon CloudFront web distribution, an Application Load Balancer (ALB), Amazon RDS, and Amazon EC2 in a VPC. All services have logging enabled. The administrator needs to investigate HTTP Layer 7 status codes from the web application. Which log sources contain the status codes? (Select TWO.)',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(5,'An errant process is known to use an entire processor and run at 100%. A SysOps administrator wants to automate restarting an Amazon EC2 instance when the problem occurs for more than 2 minutes. How can this be accomplished?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(6,'A SysOps administrator uses AWS Systems Manager Session Manager to connect to instances. After the SysOps administrator launches a new Amazon EC2 instance, the EC2 instance does not appear in the Session Manager list of systems that are available for connection. The SysOps administrator verifies that Systems Manager Agent is installed, updated, and running on the EC2 instance. What is the reason for this issue?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(7,'An e-commerce company uses an Amazon ElastiCache for Redis cluster for in-memory caching of popular product queries on a shopping website. The cache eviction policy is randomly evicting keys whether or not a TTL is set. A SysOps administrator must improve the cache hit ratio without increasing costs. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(8,'A company\'s social media application has strict data residency requirements. The company wants to use Amazon Route 53 to provide the application with DNS services. A SysOps administrator must implement a solution that routes requests to a defined list of AWS Regions. The routing must be based on the user\'s location. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(9,'A company stores critical data in Amazon S3 buckets. A SysOps administrator must build a solution to record all S3 API activity. Which action will meet this requirement?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(10,'A company runs its web application on multiple Amazon EC2 instances that are part of an Auto Scaling group. The company wants the Auto Scaling group to scale out as soon as CPU utilization rises above 50% for the instances. How should a SysOps administrator configure the Auto Scaling group to meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(11,'A company has a stateful web application that is hosted on Amazon EC2 instances in an Auto Scaling group. The instances run behind an Application Load Balancer (ALB) that has a single target group. The ALB is configured as the origin in an Amazon CloudFront distribution. Users are reporting random logouts from the web application. Which combination of actions should a SysOps administrator take to resolve this problem? (Select TWO.)',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(12,'A company has attached the following policy to an IAM user:\\n\\n{\\n\"Version\": \"2012-10-17\",\\n\"Statement\": [\\n{\\n\"Effect\": \"Allow\",\\n\"Action\": \"rds:Describe*\",\\n\"Resource\": \"*\"\\n},\\n{\\n\"Effect\": \"Allow\",\\n\"Action\": \"ec2:*\",\\n\"Resource\": \"*\",\\n\"Condition\": {\\n\"StringEquals\": {\\n\"ec2:Region\": \"us-east-1\"\\n}\\n}\\n},\\n{\\n\"Effect\": \"Deny\",\\n\"NotAction\": [\\n\"ec2:*\",\\n\"s3:GetObject\"\\n],\\n\"Resource\": \"*\"\\n}\\n]\\n}\\n\\nWhich of the following actions are allowed for the IAM user?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(13,'A company hosts a production MySQL database on an Amazon Aurora single-node DB cluster. The database is queried heavily for reporting purposes. The DB cluster is experiencing periods of performance degradation because of high CPU utilization and maximum connections errors. A SysOps administrator needs to improve the stability of the database. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(14,'A company needs to take an inventory of applications that are running on multiple Amazon EC2 instances using Systems Manager. An updated version of Systems Manager Agent has been installed and is running on every instance. While configuring an inventory collection, a SysOps administrator discovers that not all the instances in a single subnet are managed by Systems Manager. What must the SysOps administrator do to fix this issue?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(15,'A company manages its production applications across several AWS accounts. The company hosts the production applications on Amazon EC2 instances that run Amazon Linux 2. The EC2 instances are spread across multiple VPCs. Each VPC uses its own Amazon Route 53 private hosted zone for private DNS. A VPC from Account A needs to resolve private DNS records from a private hosted zone that is associated with a different VPC in Account B. What should a SysOps administrator do to meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(16,'A SysOps administrator configures an application to run on Amazon EC2 instances behind an Application Load Balancer (ALB) in a simple scaling Auto Scaling group with the default settings. The Auto Scaling group is configured to use the RequestCountPerTarget metric for scaling. The SysOps administrator notices that the RequestCountPerTarget metric exceeded the specified limit twice in 180 seconds. How will the number of EC2 instances in this Auto Scaling group be affected in this scenario?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(17,'A company uses an Amazon S3 bucket to store data files. The S3 bucket contains hundreds of objects. The company needs to replace a tag on all the objects in the S3 bucket with another tag. What is the MOST operationally efficient way to meet this requirement?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(18,'A company wants to use only IPv6 for all its Amazon EC2 instances. The EC2 instances must not be accessible from the internet, but the EC2 instances must be able to access the internet. The company creates a dual-stack VPC and IPv6-only subnets. How should a SysOps administrator configure the VPC to meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(19,'A company has an on-premises DNS solution and wants to resolve DNS records in an Amazon Route 53 private hosted zone for example.com. The company has set up an AWS Direct Connect connection for network connectivity between the on-premises network and the VPC. A SysOps administrator must ensure that an on-premises server can query records in the example.com domain. What should the SysOps administrator do to meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(20,'A company uses AWS CloudFormation templates to deploy cloud infrastructure. An analysis of all the company templates shows that the company has declared the same components in multiple templates. A SysOps administrator needs to create dedicated templates that have their own parameters and conditions for these common components. Which solution will meet this requirement?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(21,'A company is expanding globally and needs to back up data on Amazon Elastic Block Storage (Amazon EBS) volumes to a different AWS Region. Most of the EBS volumes that store the data are encrypted, but some of the EBS volumes are unencrypted. The company needs the backup data from all the EBS volumes to be encrypted. Which solution will meet these requirements with the LEAST management overhead?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(22,'A company needs to ensure that all objects uploaded to an Amazon S3 bucket are encrypted. The company wants to use server-side encryption with AWS Key Management Service (AWS KMS) keys (SSE-KMS). Which solution will meet this requirement?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(23,'A company is running a web application on Amazon EC2 instances behind an Application Load Balancer (ALB). The company wants to monitor the application for HTTP 5xx errors. Which AWS service should the company use to collect and analyze the error metrics?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(24,'A SysOps administrator launches an Amazon EC2 instance in a private subnet of a VPC. When the SysOps administrator attempts a curl command from the command line of the EC2 instance, the SysOps administrator cannot connect to https://www.example.com. What should the SysOps administrator do to resolve this issue?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(25,'A SysOps administrator has an AWS CloudFormation template that is used to deploy an encrypted Amazon Machine Image (AMI). The CloudFormation template will be used in a second account, so the SysOps administrator copies the encrypted AMI to the second account. When launching the new CloudFormation stack in the second account, it fails. Which action should the SysOps administrator take to correct the issue?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(26,'A company wants to apply an existing Amazon Route 53 private hosted zone to a new VPC to allow for customized resource name resolution within the VPC. The SysOps administrator created the VPC and added the appropriate resource record sets to the private hosted zone. Which step should the SysOps administrator take to complete the setup?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(27,'A SysOps administrator has created an AWS Service Catalog portfolio and has shared the portfolio with a second AWS account in the company. The second account is controlled by a different administrator. Which action will the administrator of the second account be able to perform?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(28,'A company runs a web application on three Amazon EC2 instances behind an Application Load Balancer (ALB). Web traffic increases significantly during the same 9-hour period every day and causes a decrease in the application’s performance. A SysOps administrator must scale the application ahead of the changes in demand to meet a service level agreement (SLA) for application latency. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(29,'A company runs a web application on three Amazon EC2 instances behind an Application Load Balancer (ALB). Web traffic increases significantly during the same 9-hour period every day and causes a decrease in the application’s performance. A SysOps administrator must scale the application ahead of the changes in demand to meet a service level agreement (SLA) for application latency. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(30,'A company wants to monitor the number of Amazon EC2 instances that it is running. The company also wants to automate a service quota increase when the number of instances reaches a specific threshold. Which solution meets these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(31,'A SysOps administrator is responsible for a legacy, CPU-heavy application. The application can only be scaled vertically. Currently, the application is deployed on a single t3.large Amazon EC2 instance. The system is showing 90% CPU usage and significant performance latency after a few minutes. What change should be made to alleviate the performance problem?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(32,'A SysOps administrator has an AWS CloudFormation template of the company\'s existing infrastructure in us-west-2. The administrator attempts to use the template to launch a new stack in eu-west-1, but the stack only partially deploys, receives an error message, and then rolls back. Why would this template fail to deploy? (Select TWO)',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(33,'A SysOps administrator is provisioning an Amazon Elastic File System (Amazon EFS) file system to provide shared storage across multiple Amazon EC2 instances. The instances all exist in the same VPC across multiple Availability Zones. There are two instances in each Availability Zone. The SysOps administrator must make the file system accessible to each instance with the lowest possible latency. Which solution will meet these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(34,'A SysOps administrator wants to upload a file that is 1 TB in size from on-premises to an Amazon S3 bucket using multipart uploads. What should the SysOps administrator do to meet this requirement?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43'),(35,'A company runs its applications on a large number of Amazon EC2 instances. A SysOps administrator must implement a solution to notify the operations team whenever an EC2 instance state changes. What is the MOST operationally efficient solution that meets these requirements?',1,'2025-05-26 14:04:43','2025-05-26 14:04:43');
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
INSERT INTO `users` VALUES (1,'Admin!.!','admin@admin.com',NULL,'$2y$10$SFUbHfqI9heWZcrkJFlAY.Xy6S26QBvF2rmv53ndOyeQOwZXZvpTe',NULL,'2025-05-26 14:04:43','2025-05-26 14:04:43');
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

-- Dump completed on 2025-05-26 14:05:25
