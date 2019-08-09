/*
 Navicat Premium Data Transfer

 Source Server         : locahost
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : localhost
 Source Database       : spring-oauth

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : utf-8

 Date: 08/09/2019 19:36:11 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `client_details`
-- ----------------------------
DROP TABLE IF EXISTS `client_details`;
CREATE TABLE `client_details` (
  `app_id` varchar(100) NOT NULL DEFAULT '' COMMENT '客户端ID',
  `resource_ids` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端资源ids',
  `app_secret` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端密码',
  `scope` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端授权范围',
  `grant_types` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端支持的grant_type',
  `redirect_url` varchar(256) NOT NULL DEFAULT '' COMMENT '重定向Url',
  `authorities` varchar(256) NOT NULL DEFAULT '' COMMENT '授权权限',
  `access_token_validity` int(11) DEFAULT '0' COMMENT 'token有效时间,单位s',
  `refresh_token_validity` int(11) DEFAULT '0' COMMENT '刷新token有效时间，单位s',
  `additional_information` varchar(4096) NOT NULL DEFAULT '' COMMENT '附加信息',
  `auto_approve_scopes` varchar(256) NOT NULL DEFAULT '' COMMENT '自动approve操作',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户授权表';

-- ----------------------------
--  Table structure for `oauth_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `authentication_id` varchar(100) NOT NULL DEFAULT '' COMMENT '该字段具有唯一性, 是根据当前的username(如果有),client_id与scope通过MD5加密生成的',
  `token_id` varchar(256) NOT NULL DEFAULT '' COMMENT '从服务器端获取到的access_token的值',
  `token` text NOT NULL COMMENT '二进制字段，存储的数据是OAuth2AccessToken对象',
  `user_name` varchar(256) NOT NULL DEFAULT '' COMMENT '登录时的用户',
  `client_id` varchar(100) NOT NULL DEFAULT '' COMMENT '客户端id',
  `authentication` text COMMENT '存储将OAuth2Authentication.java对象序列化后的二进制数据',
  `refresh_token` varchar(256) NOT NULL DEFAULT '' COMMENT '刷新的token',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='授权token表';

-- ----------------------------
--  Table structure for `oauth_approvals`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `user_id` varchar(256) NOT NULL DEFAULT '' COMMENT '用户ID',
  `client_id` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端ID',
  `scope` varchar(256) NOT NULL DEFAULT '' COMMENT '授权scope',
  `status` varchar(10) NOT NULL DEFAULT '' COMMENT '授权状态',
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  `last_modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户授权表';

-- ----------------------------
--  Table structure for `oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(100) NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端能够访问的资源ids，多个用逗号隔开',
  `client_secret` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端访问密钥',
  `scope` varchar(256) NOT NULL DEFAULT '' COMMENT '指定客户端申请权限的范围，包括可选值read,write',
  `authorized_grant_types` varchar(256) NOT NULL DEFAULT '' COMMENT '指定客户端支持的grant_type,可选值包括authorization_code,password,refresh_token,implicit,client_credentials',
  `web_server_redirect_uri` varchar(256) NOT NULL DEFAULT '' COMMENT '客户端重定向URI',
  `authorities` varchar(256) NOT NULL DEFAULT '' COMMENT '指定客户端所拥有的Spring Security的权限值,可选, 若有多个权限值,用逗号(,)分隔, 如: "ROLE_',
  `access_token_validity` int(11) NOT NULL DEFAULT '43200' COMMENT '设定客户端的access_token的有效时间值(单位:秒),可选, 若不设定值则使用默认的有效时间值(60 * 60 * 12, 12小时)',
  `refresh_token_validity` int(11) NOT NULL DEFAULT '43200' COMMENT '设定客户端的refresh_token的有效时间值(单位:秒),可选, 若不设定值则使用默认的有效时间值(60 * 60 * 12, 12小时)',
  `additional_information` varchar(4096) NOT NULL DEFAULT '' COMMENT '这是一个预留的字段,在Oauth的流程中没有实际的使用,可选',
  `autoapprove` varchar(256) NOT NULL DEFAULT '' COMMENT '设置用户是否自动Approval操作, 默认值为 ‘false’, 可选值包括 ‘true’,‘false’, ‘read’,‘write’.',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端授权表';

-- ----------------------------
--  Table structure for `oauth_client_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `authentication_id` varchar(100) NOT NULL DEFAULT '' COMMENT '该字段具有唯一性, 是根据当前的username(如果有),client_id与scope通过MD5加密生成的',
  `token_id` varchar(256) NOT NULL DEFAULT '' COMMENT '从服务器端获取到的access_token的值',
  `token` text NOT NULL COMMENT '二进制字段，存储的数据是OAuth2AccessToken对象',
  `user_name` varchar(256) NOT NULL DEFAULT '' COMMENT '登录是的用户',
  `client_id` varchar(100) NOT NULL DEFAULT '' COMMENT '客户端id',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端token表';

-- ----------------------------
--  Table structure for `oauth_code`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) NOT NULL DEFAULT '' COMMENT '存储服务端系统生成的code的值(未加密)',
  `authentication` text COMMENT '存储将AuthorizationRequestHolder.java对象序列化后的二进制数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='oauth 授权表';

-- ----------------------------
--  Table structure for `oauth_refresh_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) NOT NULL DEFAULT '' COMMENT '从服务器端获取到的access_token的值',
  `token` text NOT NULL COMMENT '二进制字段，存储的数据是OAuth2AccessToken对象',
  `authentication` text COMMENT '存储将OAuth2Authentication.java对象序列化后的二进制数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='token 刷新表';

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role id` bigint(20) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role id` (`role id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
