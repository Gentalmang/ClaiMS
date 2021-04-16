/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : claims

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 16/04/2021 00:21:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('next.dbid', '150001', 61);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.22.0.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.22.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('147503', NULL, 'starter', 'admin', NULL, '147501');

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('147501', '147501', 'e91e818fa30444be9cd362045ce9e189', 'salary:3:135067', '2021-02-25 14:15:37', NULL, NULL, 'admin', 'start', NULL, NULL, NULL, '', NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime NULL DEFAULT NULL,
  `END_TIME_` datetime NULL DEFAULT NULL,
  `DURATION_` bigint NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `DUE_DATE_` datetime NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('147502', '147501', '147501', NULL, 'apply', 'string', 0, NULL, NULL, NULL, 'admin', NULL, '2021-02-25 14:15:37', '2021-02-25 14:15:37');
INSERT INTO `act_hi_varinst` VALUES ('147505', '147501', '147501', NULL, 'title', 'string', 1, NULL, NULL, NULL, '', NULL, '2021-02-25 14:15:37', '2021-02-25 14:19:13');
INSERT INTO `act_hi_varinst` VALUES ('147508', '147501', '147501', NULL, 'pass', 'string', 0, NULL, NULL, NULL, '1', NULL, '2021-02-25 14:19:13', '2021-02-25 14:19:13');

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('145001', 'new-process', NULL, '', '2018-01-09 19:32:28');

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------
INSERT INTO `act_re_model` VALUES ('142501', 8, 'new-process', 'process', NULL, '2018-01-08 16:10:30', '2018-01-09 19:32:30', 1, '{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}', '145001', '142502', '142503', '');
INSERT INTO `act_re_model` VALUES ('145005', 4, 'new-process', 'process', NULL, '2018-01-09 20:00:51', '2018-01-09 20:01:00', 1, '{\"name\":\"new-process\",\"description\":\"\",\"revision\":1}', NULL, '145006', '145007', '');

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('process:1:145004', 1, 'http://www.activiti.org/processdef', NULL, 'process', 1, '145001', 'new-process.bpmn20.xml', 'new-process.process.png', NULL, 0, 1, 1, '');

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('147501', 2, '147501', 'e91e818fa30444be9cd362045ce9e189', NULL, 'salary:3:135067', NULL, 'audit2', 1, 0, 1, 0, 1, 2, '', NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('147503', 1, NULL, 'starter', 'admin', NULL, '147501', NULL);

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXCEPTION`(`EXCEPTION_STACK_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('147502', 1, 'string', 'apply', '147501', '147501', NULL, NULL, NULL, NULL, 'admin', NULL);
INSERT INTO `act_ru_variable` VALUES ('147505', 2, 'string', 'title', '147501', '147501', NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('147508', 1, 'string', 'pass', '147501', '147501', NULL, NULL, NULL, NULL, '1', NULL);

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content`  (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` bigint NULL DEFAULT NULL COMMENT '创建人id',
  `modified` bigint NULL DEFAULT NULL COMMENT '最近修改人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `categories` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类',
  `hits` int NULL DEFAULT NULL,
  `comments_num` int NULL DEFAULT 0 COMMENT '评论数量',
  `allow_comment` int NULL DEFAULT 0 COMMENT '开启评论',
  `allow_ping` int NULL DEFAULT 0 COMMENT '允许ping',
  `allow_feed` int NULL DEFAULT 0 COMMENT '允许反馈',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `gtm_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gtm_modified` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章内容' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_content
-- ----------------------------

-- ----------------------------
-- Table structure for oa_form
-- ----------------------------
DROP TABLE IF EXISTS `oa_form`;
CREATE TABLE `oa_form`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wFirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SIN` bigint NULL DEFAULT NULL,
  `telephone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wProvince` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `wPostal` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sex` bigint NULL DEFAULT NULL,
  `monetLost` double NULL DEFAULT NULL,
  `eName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `eTelephone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `eAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `eCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `eProvince` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ePostal` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `doctor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `doctor_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `doctor_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `doctor_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `doctor_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `is_use` int NULL DEFAULT NULL,
  `is_version` int NULL DEFAULT NULL,
  `is_color` int NULL DEFAULT NULL,
  `is_hearing` int NULL DEFAULT NULL,
  `is_body` int NULL DEFAULT NULL,
  `is_limb` int NULL DEFAULT NULL,
  `is_strength` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_form
-- ----------------------------

-- ----------------------------
-- Table structure for oa_form_set
-- ----------------------------
DROP TABLE IF EXISTS `oa_form_set`;
CREATE TABLE `oa_form_set`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hearing` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `limb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strength` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4191334 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_form_set
-- ----------------------------
INSERT INTO `oa_form_set` VALUES (0, 'Administrators of vocational training schools', 'Close visual acuity', 'Not revelant', 'Verbal interaction', 'Sitting ability', 'Not revelant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (1, 'Registrars', 'Near vision', 'Not revelant', 'Verbal interaction', 'Sitting ability', 'Not revelant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (3, 'Senior managers - construction, transportation, production and utilities', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (4, 'Senior managers - trade, broadcasting and other services, n.e.c.', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (5, 'Senior managers - health, education, social and community services and membership organizations', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (6, 'Senior managers - financial, communications and other business services', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (7, 'Senior government managers and officials', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (8, 'Legislators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (9, 'Managers in natural resources production and fishing', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (10, 'Managers in aquaculture', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (11, 'Managers in horticulture', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (12, 'Managers in agriculture', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (13, 'Computer and information systems managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (14, 'Architecture and science managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (15, 'Engineering managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (16, 'Petroleum product distribution managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (17, 'Natural gas supply managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (18, 'Water supply managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (19, 'Waste systems managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (20, 'Water pollution control managers\r\r\n\r\r\n', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (21, 'Electrical power distribution managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (22, 'Recreation, sports and fitness program and service directors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (23, 'Managers - publishing, motion pictures, broadcasting and performing arts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (24, 'Library, archive, museum and art gallery managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (25, 'Postal and courier services managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (26, 'Telecommunication carriers managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (27, 'Other business services managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (28, 'Public relations managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (29, 'Marketing managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (30, 'E-business managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (31, 'Advertising managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (32, 'Credit managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (33, 'Banking and other investment managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (34, 'Securities managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (35, 'Real estate service managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (36, 'Insurance managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (37, 'Mortgage broker managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (38, 'Other administrative services managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (39, 'Purchasing managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (40, 'Human resources managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (41, 'Financial managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (42, 'Other managers in public administration', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (43, 'Government managers - education policy development and program administration', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (44, 'Government managers - economic analysis, policy development and program administration', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (45, 'Government managers - health and social policy development and program administration', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (46, 'Commissioned officers of the Canadian Armed Forces', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (47, 'Fire chiefs and senior firefighting officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (48, 'Commissioned police officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (49, 'Managers in social, community and correctional services', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (50, 'School principals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (51, 'Administrators of elementary and secondary education', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (52, 'Manufacturing managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (53, 'Managers in customer and personal services, n.e.c.', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (54, 'Accommodation service managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (55, 'Restaurant and food service managers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (56, 'Retail and wholesale trade managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (57, 'Corporate sales managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (58, 'Maintenance managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (59, 'Facility operation managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (60, 'Home building and renovation managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (61, 'Construction managers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (62, 'Transportation managers, operations', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (63, 'Transportation managers, freight traffic', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (64, 'Managers in health care', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (65, 'Correspondence clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (66, 'Editorial assistants and publication clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (67, 'Readers and press clippers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (68, 'Classified advertising clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (69, 'Regulatory clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (70, 'Proofreaders', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (71, 'Library assistants and clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (72, 'Collectors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (73, 'Bank clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (74, 'Other financial clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (75, 'Insurance clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (76, 'Payroll administrators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (77, 'Accounting and related clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (78, 'Typesetting input operators', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (79, 'Markup persons', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (80, 'Desktop publishing operators', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (81, 'Typesetting output operators', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (82, 'Data entry clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (83, 'Court clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (84, 'Personnel clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (85, 'Medical and dental receptionists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (86, 'Front desk clerks (except hotel)', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (87, 'Answering service operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (88, 'Hospital admitting clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (89, 'Switchboard operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (90, 'Telephone operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (91, 'Receptionists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (92, 'General office support workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (93, 'Administrative clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (94, 'File clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (95, 'Customs brokers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (96, 'Ship brokers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (97, 'Valuators', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (98, 'Assessors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (99, 'Appraisers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (100, 'Insurance underwriters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (101, 'Insurance adjusters', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (102, 'Insurance claims examiners', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (103, 'Accounting technicians and bookkeepers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (104, 'Transportation route and crew schedulers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (105, 'Radio operators', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (106, 'Dispatchers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (107, 'Inventory Control Workers', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (108, 'Purchasing Control Workers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (109, 'Production logistics co-ordinators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (110, 'Storekeepers and partspersons', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (111, 'Shippers and receivers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (112, 'Couriers, messengers and door-to-door distributors', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (113, 'Letter carriers', 'Total visual field', 'Not relevant', 'Limited', 'Standing and/or walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (114, 'Mail sorters', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (115, 'Mail room clerks', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (116, 'Postal clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (117, 'Legal administrative assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (118, 'Administrative assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (119, 'Immigration officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (120, 'Government benefits services officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (121, 'Excise tax revenue officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (122, 'Border services officers and customs inspectors ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (123, 'Justices of the peace', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (124, 'Court officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (125, 'Conference and event planners', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (126, 'Purchasing agents and officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (127, 'Property administrators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (128, 'Human resources and recruitment officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (129, 'Executive assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (130, 'Administrative officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (131, 'Supervisors, supply chain, tracking and scheduling co-ordination occupations', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (132, 'Supervisors, mail and message distribution occupations', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (133, 'Supervisors, library, correspondence and related information workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (134, 'Supervisors, finance and insurance office workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (135, 'Supervisors, general office and administrative support workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (136, 'Records management technicians', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (137, 'Health information management occupations', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (138, 'Court reporters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (139, 'Medical transcriptionists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (140, 'Professional occupations in marketing and public relations', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (141, 'Professional occupations in advertising', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (142, 'Management Consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (143, 'Human resources professionals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (144, 'Trust officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (145, 'Financial examiners and inspectors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (146, 'Financial planners', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (147, 'Mortgage brokers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (148, 'Financial investigators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (149, 'Underwriters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (150, 'Securities agents and investment dealers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (151, 'Brokers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (152, 'Financial analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (153, 'Investment analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (154, 'Financial auditors', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (155, 'Accountants', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (156, 'Survey interviewers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (157, 'Statistical clerks', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (158, 'FHandling loads of 5 kg but less than 10 kg engineers (second officers) ', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (159, 'Construction inspectors', 'Near and far vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (160, 'Inspectors in public and environmental health and occupational health and safety', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (162, 'Airworthiness inspectors', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (163, 'Motor vehicle defects investigators', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (164, 'Inspectors, weights and measures', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (165, 'Railway accident investigation officers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (166, 'Non-destructive testers and inspection technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (167, 'Meteorological technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (168, 'Remote sensing technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (169, 'Photogrammetric technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (170, 'Geographic information systems (GIS) technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (171, 'Cartographic technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (172, 'Aerial survey technologists and technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (173, 'Information systems testing technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (174, 'User support technicians', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (175, 'Web technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (176, 'Computer and network operators', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (177, 'Marine traffic regulators', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (178, 'Railway traffic controllers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (179, 'Engineer officers, water transport', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (180, 'Deck officers, water transport', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (181, 'FHandling loads of 5 kg but less than 10 kg dispatchers', 'Near vision', 'Relevant', 'Other sound discrimination', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (182, 'FHandling loads of 5 kg but less than 10 kg service specialists', 'Near vision', 'Relevant', 'Other sound discrimination', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (183, 'Air traffic controllers', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (184, 'Pilots', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (185, 'Flying instructors ', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (186, 'Land survey technologists', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (187, 'Land survey technicians', 'Near and far vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (188, 'Drafting technicians', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (189, 'Drafting technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (190, 'Industrial designers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (191, 'Architectural technologists and technicians', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (192, 'Avionics mechanics and technicians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (193, 'Avionics inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (194, 'Aircraft electrical mechanics and technicians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (195, 'Aircraft instrument mechanics and technicians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (196, 'Industrial instrument technicians and mechanics', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (197, 'Electronic service technicians (household and business equipment)', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (198, 'Electrical and electronics engineering technicians', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (199, 'Electrical and electronics engineering technologists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (200, 'Construction estimators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (201, 'Industrial engineering and manufacturing technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (202, 'Industrial engineering and manufacturing technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (203, 'Mechanical engineering technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (204, 'Mechanical engineering technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (205, 'Civil engineering technologists', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (206, 'Civil engineering technicians', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (207, 'Lawn care specialists', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (208, 'Golf course superintendents', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (209, 'Arborists and tree service technicians', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (210, 'Landscape gardeners', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (211, 'Landscapers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (212, 'Horticulturists', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (213, 'Conservation and fishery officers', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (214, 'Forestry technologists and technicians', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (215, 'Grain inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (216, 'Meat inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (217, 'Plant protection inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (218, 'Fruit and vegetables inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (219, 'Fish and fish products inspectors', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (220, 'Biological technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (221, 'Biological technologists', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (222, 'Geological and mineral technicians', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (223, 'Geological and mineral technologists', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (224, 'Chemical technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (225, 'Chemical technologists', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (226, 'Web designers and developers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (227, 'Interactive media developers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (228, 'Computer programmers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (229, 'Software engineers and designers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (230, 'Data administrators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (231, 'Database analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (232, 'Information systems quality assurance analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (233, 'Systems security analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (234, 'Information systems business analysts and consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (235, 'Systems auditors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (236, 'Actuaries', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (237, 'Statisticians', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (238, 'Mathematicians', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (239, 'Land surveyors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (240, 'Urban and land use planners', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (241, 'Landscape architects', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (242, 'Architects', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (243, 'Biomedical engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (244, 'Marine and naval engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (245, 'Textile engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (246, 'Agricultural and bio-resource engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (247, 'Engineering physicists and engineering scientists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (248, 'Computer and telecommunications hardware engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (249, 'Network system and data communication engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (250, 'Aerospace engineers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (251, 'Petroleum engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (252, 'Geological engineers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (253, 'Mining engineers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (254, 'Metallurgical and materials engineers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (255, 'Industrial and manufacturing engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (256, 'Chemical engineers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (257, 'Electrical and electronics engineers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (258, 'Mechanical engineers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (259, 'Civil engineers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (260, 'Agricultural representatives, consultants and specialists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (261, 'Forestry professionals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (262, 'Microbiologists and cell and molecular biologists', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (263, 'Biologists', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (265, 'Materials scientists', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (266, 'Soil scientists', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (267, 'Metallurgists', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (268, 'Meteorologists and climatologists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (269, 'Geoscientists ', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (270, 'Oceanographers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (271, 'Chemists', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (272, 'Astronomers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (273, 'Physicists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (274, 'Traditional Chinese medical practitioners', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (275, 'Rolfers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (276, 'Reflexologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (277, 'Homeopaths', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (278, 'Herbalists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (279, 'Opticians', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (280, 'Dental Laboratory Assistants', 'Close visual acuity', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (281, 'Dental technologists and technicians', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (282, 'Dental therapists', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (283, 'Dental hygienists', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (284, 'Denturists', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (285, 'Pharmacy technicians', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (286, 'Prosthetists and orthotists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (287, 'Prosthetic and orthotic technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (288, 'Dietary technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (289, 'Ocularists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (290, 'Cardiology Technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (291, 'Electromyography (EMG) technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (292, 'Electroencephalographic (EEG) technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (293, 'Medical sonographers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (294, 'Nuclear medicine technologists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (295, 'Radiation therapists', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (296, 'Radiological technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (297, 'Cardiopulmonary technologists', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (298, 'Clinical perfusionists', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (299, 'Respiratory therapists', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (300, 'Animal health technologists and veterinary technicians', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (301, 'Pathologists\' assistants', 'Close visual acuity', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (302, 'Medical laboratory technicians ', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (303, 'Medical laboratory technologists', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (304, 'Registered psychiatric nurses', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (305, 'Occupational health nurses ', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (306, 'Nursing researchers ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (307, 'Nursing consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (308, 'General duty registered nurses', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (309, 'Community health nurses ', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (310, 'Clinical nurses', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (311, 'Nursing co-ordinators and supervisors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (312, 'Other professional occupations in therapy and assessment', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (313, 'Exercise therapists', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (314, 'Kinesiologists', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (315, 'Occupational therapists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (316, 'Physiotherapists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (317, 'Speech-language pathologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (318, 'Audiologists', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (319, 'Dietitians and nutritionists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (320, 'Community pharmacists and hospital pharmacists', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (321, 'Industrial pharmacists', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (322, 'Doctors of osteopathic medicine\r\r\n', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (323, 'Chiropodists and podiatrists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (324, 'Doctors of podiatric medicine', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (325, 'Orthoptists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (326, 'Naturopaths', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (329, 'Midwives', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (330, 'Chiropractors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (331, 'Optometrists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (332, 'Veterinarians', 'Near vision', 'Relevant', 'Other sound discrimination', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (333, 'Dentists', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (334, 'General practitioners and family physicians', 'Near vision', 'Relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (335, 'Specialists in surgery', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (336, 'Specialists in clinical medicine', 'Near vision', 'Relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (337, 'Specialists in laboratory medicine', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (338, 'Pharmacy aides', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (339, 'Therapy assistants ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (340, 'Orthopedic technologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (341, 'Optical/ophthalmic laboratory technicians and assistants ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (342, 'Morgue attendants', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (343, 'Central supply aides', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (344, 'Blood donor clinic assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (345, 'Nurse aides, orderlies and patient service associates', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (346, 'Dental assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (347, 'Communicative disorders assistants and speech-language pathology assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (348, 'Hearing instrument practitioners', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (349, 'Audiometric technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (350, 'Physiotherapy assistants and occupational therapy assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (351, 'Ophthalmic medical assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (352, 'Massage therapists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (353, 'Paramedical occupations', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (354, 'Operating room technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (355, 'Licensed practical nurses', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (356, 'Acupuncturists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (357, 'Non-commissioned ranks of the Canadian Armed Forces', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (358, 'Firefighters', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (359, 'Police officers (except commissioned)', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (360, 'Taxi inspectors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (361, 'Garbage collection inspectors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (362, 'Commercial transport inspectors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (363, 'By-law enforcement officers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (364, 'Liquor licence inspectors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (365, 'Zoning inspectors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (366, 'Parking control officers', 'Near and far vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (367, 'Animal control officers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (368, 'Correctional service officers', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (369, 'Sheriffs and bailiffs', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (370, 'Elementary and secondary school teacher assistants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (371, 'Companions', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (372, 'Visiting homemakers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (373, 'Housekeepers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (374, 'Parents\' helpers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (375, 'Foster parents', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (376, 'Babysitters', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (377, 'Nannies and Live-In Caregivers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (378, 'Political scientists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (379, 'Other social science professionals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (380, 'Psychometricians and psychometrists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (381, 'Sociologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (382, 'Linguists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (383, 'Historians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (384, 'Geographers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (385, 'Archaeologists', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (386, 'Anthropologists', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (387, 'Program officers unique to government', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (388, 'Sports consultants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (389, 'Recreation and sports program supervisors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (390, 'Recreation consultants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (391, 'Recreation, sports and fitness policy analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (392, 'Fitness consultant', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (393, 'Education policy researchers, consultants and program officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (394, 'Health policy researchers, consultants and program officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (395, 'Housing policy analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (396, 'Home economists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (397, 'Social services planners', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (398, 'Social survey researchers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (399, 'International aid and development project officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (400, 'Social policy researchers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (401, 'Business development officers and marketing researchers and consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (402, 'Economists and economic policy researchers and analysts', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (404, 'Science policy and program officers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (405, 'Patent agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (406, 'Occupational/industrial hygienists', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (407, 'Ergonomists', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (408, 'Employment counsellors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (409, 'Probation and parole officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (410, 'Classification officers, correctional institutions', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (411, 'Professional occupations in religion', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (412, 'Family, marriage and other related counsellors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (413, 'Social workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (414, 'Psychologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (415, 'Lawyers and Quebec notaries', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (416, 'Judges', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (417, 'Other religious occupations', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (418, 'Driver\'s licence examiners', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (419, 'Modelling and finishing school instructors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (420, 'Sewing instructors', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (421, 'Driving instructors', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (422, 'Instructors of persons with disabilities', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (423, 'Early childhood educator assistants', 'Total visual field', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (424, 'Early childhood educators', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (425, 'Social and community service workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (426, 'Paralegals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (427, 'Trademark agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (428, 'Notaries public', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (429, 'Independent paralegals', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (430, 'Educational counsellors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (431, 'Elementary school and kindergarten teachers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (432, 'Secondary school teachers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (433, 'College and other vocational instructors', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (434, 'Post-secondary teaching assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (435, 'Post-secondary research assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (436, 'University professors and lecturers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (437, 'Record producers', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (438, 'Film editors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (439, 'Directors of photography', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (440, 'Art directors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (441, 'Choreographers', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (442, 'Directors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (443, 'Sign language interpreters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (444, 'Interpreters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (445, 'Terminologists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (446, 'Translators', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (447, 'Journalists', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (448, 'Editors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (449, 'Technical writers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (450, 'Authors and Other Creative Writers', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (451, 'Copywriters', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (452, 'Archivists', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (453, 'Curators', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (454, 'Conservators', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (455, 'Librarians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (456, 'Program leaders and instructors in recreation and sport', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (457, 'Fitness appraisers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (458, 'Sports officials and referees', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (459, 'Sports scouts', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (460, 'Coaches', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (461, 'Athletes', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (462, 'Patternmakers - textile, leather and fur products', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (463, 'Metal arts workers', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (464, 'Artistic floral arrangers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (465, 'Craft instructors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (466, 'Stringed instrument makers', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (467, 'Stained glass artists', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (468, 'Weavers', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (469, 'Potters', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (470, 'Carvers', 'Close visual acuity', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (471, 'Exhibit designers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (472, 'Fashion designers', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (473, 'Theatre designers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (474, 'Interior designers and interior decorators', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (475, 'Graphic designers', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (476, 'Illustrators', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (477, 'Circus performers', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (478, 'Fashion models', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (479, 'Magicians and illusionists', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (480, 'Puppeteers', 'Near and far vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (481, 'Buskers', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (482, 'Announcers and other broadcasters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (484, 'Grips and riggers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (485, 'Props persons and set builders', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (486, 'Script assistants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (487, 'Camera crane operators', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (488, 'Dressers', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (489, 'Projectionists', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (490, 'Stunt co-ordinators and special effects technicians', 'Total visual field', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (491, 'Key grips', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (492, 'Property masters', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (493, 'Make-up artists', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (494, 'Gaffers and Handling loads of 5 kg but less than 10 kging technicians', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (495, 'Floor managers ', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (496, 'Settings shop foremen/women', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (497, 'Costumiers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (498, 'Audio and video recording technicians', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (499, 'Broadcast technicians', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (500, 'Graphic arts technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (501, 'Film and video camera operators', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (502, 'Photographers', 'Near and far vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (503, 'Preparators', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (504, 'Taxidermists', 'Close visual acuity', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (505, 'Picture framers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (506, 'Museology technicians ', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (507, 'Museum registrars and cataloguers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (508, 'Curatorial assistants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (509, 'Conservation and restoration technicians', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (510, 'Museum and other related interpreters', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (511, 'Museum extension officers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (512, 'Public archive technicians ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (513, 'Library  technicians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (514, 'Sculptors', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (515, 'Painters ', 'Near and far vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (516, 'Art instructors and teachers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (517, 'Acting teachers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (518, 'Actors and comedians', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (519, 'Dance teachers', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (520, 'Dancers', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (521, 'Teachers of music or voice', 'Close visual acuity', 'Not relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (522, 'Singers', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Standing and/or walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (523, 'Musicians', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (524, 'Arrangers', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (525, 'Composers', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (526, 'Conductors', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (527, 'Film, radio, television and video game producers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (528, 'Handling loads of 5 kg but less than 10 kg duty cleaners', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (529, 'Funeral home attendants', 'Total visual field', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (530, 'Ticket takers and ushers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (531, 'Other elemental service workers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (532, 'Parking lot attendants and car jockeys', 'Total visual field', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (533, 'Laundromat attendants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (534, 'Door attendants', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (535, 'Beauty salon attendants', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (536, 'Dry cleaning and laundry inspectors and assemblers', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (537, 'Dry cleaning and laundry machine operators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (538, 'Ironing, pressing and finishing workers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (539, 'Food service helpers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (540, 'Food service counter attendants and food preparers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (541, 'Kitchen helpers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (542, 'Dishwashers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (543, 'Door-to-door salespersons', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (544, 'Direct distributors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (545, 'Telephone solicitors and telemarketers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (546, 'Street vendors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (547, 'Demonstrators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (548, 'Store shelf stockers, clerks and order fillers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (549, 'Automotive service station attendants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (550, 'Marina service station attendants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (551, 'Cashiers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (552, 'Hotel front desk clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (553, 'Cargo service representatives (except airline)', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (554, 'Ticket agents and related clerks (except airline)', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (555, 'Airline passenger and ticket agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (556, 'Airline station agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (557, 'Airline load planners', 'Near vision', 'Not relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (558, 'Airline cargo agents', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (559, 'Airline baggage agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (560, 'Airline reservation agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (561, 'Ship pursers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (562, 'FHandling loads of 5 kg but less than 10 kg pursers, customer service directors and passenger service directors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (563, 'FHandling loads of 5 kg but less than 10 kg attendants', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (564, 'Travel counsellors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (565, 'Food and beverage servers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (566, 'Bartenders', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (567, 'Maîtres d\'hôtel and hosts/hostesses', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (568, 'Outdoor sport and recreational guides', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (569, 'Travel guides', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (570, 'Tour guides', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (571, 'Psychic consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (572, 'Other service providers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (573, 'Astrologers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (574, 'Pet groomers and animal care workers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (575, 'Tattoo artists', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (576, 'Scalp treatment specialists', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (577, 'Hair replacement technicians (non-medical)', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (578, 'Manicurists and pedicurists', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (579, 'Estheticians', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (580, 'Electrologists', 'Close visual acuity', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (581, 'Cosmeticians', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (582, 'Weight loss consultants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (583, 'Wedding consultants', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (584, 'Colour consultants', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (585, 'Image consultants', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (586, 'Make-up consultants', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (587, 'Customer service clerks in insurance, telephone, utility and similar companies', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (588, 'Information clerks', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (589, 'Customer service clerks in retail establishments', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (590, 'Call centre agents', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (591, 'Customer services representatives - financial institutions', 'Near vision', 'Not relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (592, 'Armoured car guards', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (593, 'Security guards', 'Total visual field', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (594, 'Retail loss prevention officers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (595, 'Private investigators', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (596, 'Corporate security officers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (597, 'Retail salespersons', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (598, 'Sales and account representatives - wholesale trade (non-technical)', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (599, 'Financial sales representatives', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (600, 'Real estate agents and salespersons', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (601, 'Insurance agents and brokers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (602, 'Retail and wholesale buyers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (603, 'Grain elevator operators', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (604, 'Technical sales specialists - wholesale trade', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (605, 'Retail sales supervisors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (606, 'Bakers', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (607, 'Butchers, meat cutters and fishmongers - retail and wholesale', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (608, 'Cooks', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (609, 'Chefs', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (610, 'Sous-chefs', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (611, 'Chefs and specialist chefs', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (612, 'Other services supervisors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (613, 'Dry cleaning and laundry supervisors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (614, 'Cleaning supervisors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (615, 'Customer service representatives supervisors - financial services', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (616, 'Customer service representatives supervisors (except financial services)', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (617, 'Casino supervisors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (618, 'Accommodation, travel, tourism and related services supervisors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (619, 'Executive housekeepers', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (620, 'Food service supervisors', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (621, 'Funeral directors', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (622, 'Embalmers', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (623, 'Upholsterers', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (624, 'Watch repairers', 'Close visual acuity', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (625, 'Jewellers and related workers', 'Close visual acuity', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (626, 'Shoe repairers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (627, 'Shoemakers', 'Near vision', 'Relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (628, 'Tailors', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (629, 'Milliners', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (630, 'Furriers', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (631, 'Dressmakers', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (632, 'Alterationists', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (633, 'Hairstylists', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (634, 'Barbers', 'Near vision', 'Relevant', 'Verbal interaction', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (635, 'Amusement attraction operators', 'Total visual field', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (636, 'Attendants in amusement, recreation and sport', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (637, 'Facilities workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (638, 'Train service attendants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (639, 'Ship attendants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (640, 'Guest service attendants', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (641, 'Baggage porters', 'Near vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (642, 'Janitors, caretakers and building superintendents', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (643, 'Furnace and ventilation system cleaners', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (644, 'Window cleaners', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (645, 'Chimney cleaners', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (646, 'Carpet and upholstery cleaners', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (647, 'Vehicle cleaners', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (648, 'Sandblasters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (649, 'Other trades helpers and labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (650, 'Construction trades helpers and labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (651, 'Material handlers (equipment operators)', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (652, 'Material handlers (manual)', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (653, 'Longshore workers', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (654, 'Other repairers and servicers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (655, 'Pest controllers and fumigators', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (656, 'Waterworks maintenance workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (657, 'Gas maintenance workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (658, 'Residential and commercial installers and servicers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (659, 'Contractors and supervisors, other construction trades, installers, repairers and servicers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (660, 'Contractors and supervisors, carpentry trades', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (661, 'Contractors and supervisors, pipefitting trades', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (662, 'Contractors and supervisors, electrical trades and telecommunications occupations', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (663, 'Supervisors, machinists and related occupations', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (664, 'Other automotive mechanical installers and servicers', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (665, 'Air transport ramp attendants', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (666, 'Boat operators', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (667, 'Cable ferry operators', 'Total visual field', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (668, 'Lock equipment operators', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Sitting', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (669, 'Ferry terminal workers', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (670, 'Water transport deck crew', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (671, 'Water transport engine room crew', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (672, 'Railway yard workers ', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (673, 'Railway track maintenance workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (674, 'Public works maintenance equipment operators and related workers', 'Total visual field', 'Relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (675, 'Handling loads more than 20 kg equipment operators (except crane)', 'Total visual field', 'Not relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (676, 'Delivery and courier service drivers', 'Total visual field', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (677, 'Taxi and limousine drivers', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (678, 'Chauffeurs', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (679, 'Subway train and Handling loads of 5 kg but less than 10 kg rail transit operators', 'Total visual field', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (680, 'Bus and streetcar drivers', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (681, 'School bus drivers', 'Total visual field', 'Relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (682, 'Line-haul and local truck drivers', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (683, 'Long-haul truck drivers', 'Total visual field', 'Relevant', 'Verbal interaction', 'Sitting', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (684, 'Supervisors, motor transport and other ground transit operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (685, 'Supervisors, railway transport operations', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (686, 'Supervisors, printing and related occupations', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (687, 'Contractors and supervisors, Handling loads more than 20 kg equipment operator crews', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (688, 'Contractors and supervisors, mechanic trades', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (689, 'Blacksmiths', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (690, 'Commercial divers', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (691, 'Saw fitters', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (692, 'Safe and vault servicers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (693, 'Recreation  vehicle technicians', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (694, 'Die setters', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (695, 'Locksmiths', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (696, 'Gunsmiths', 'Close visual acuity', 'Not relevant', 'Verbal interaction', 'Sitting', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (697, 'Printing press operators', 'Near vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (698, 'Water well drillers', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (699, 'Blasters - surface mining, quarrying and construction', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (700, 'Drillers - surface mining, quarrying and construction', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (701, 'Crane operators', 'Total visual field', 'Not relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (702, 'Railway conductors', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (703, 'Brakemen/women', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (704, 'Railway locomotive engineers', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (705, 'Yard locomotive engineers', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (706, 'Other small engine and small equipment repairers', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (707, 'Motorcycle, all-terrain vehicle and other related mechanics', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (708, 'Electrical mechanics', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (709, 'Small appliance servicers and repairers', 'Near vision', 'Relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (710, 'Major appliance repairers/technicians', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (711, 'Oil and solid fuel heating mechanics', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (712, 'Motor vehicle body repairers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (713, 'Transport truck and trailer mechanics', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (714, 'Automotive service technicians', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (715, 'Mechanical repairers, motor vehicle manufacturing', 'Near vision', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (716, 'Elevator constructors and mechanics', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (717, 'Machine fitters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (718, 'Aircraft inspectors', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (719, 'Aircraft mechanics', 'Near and far vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (720, 'Railway carmen/women', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (721, 'Heating, refrigeration and air conditioning mechanics', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (722, 'Handling loads more than 20 kg-duty equipment mechanics', 'Near vision', 'Not relevant', 'Other sound discrimination', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (723, 'Textile machinery mechanics and repairers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (724, 'Construction millwrights and industrial mechanics', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (725, 'Railway labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (726, 'Motor transport labourers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (727, 'Public works and maintenance labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (728, 'Contractors and supervisors, metal forming, shaping and erecting trades', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (729, 'Floor covering installers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (730, 'Painters and decorators (except interior decorators)', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (731, 'Insulators', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (732, 'Glaziers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (733, 'Shinglers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (734, 'Roofers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (735, 'Drywall installers and finishers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (736, 'Lathers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (737, 'Plasterers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (738, 'Tilesetters', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (739, 'Concrete finishers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (740, 'Bricklayers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (741, 'Cabinetmakers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (742, 'Carpenters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (743, 'Gas fitters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (744, 'Steamfitters and pipefitters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (745, 'Sprinkler system installers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (746, 'Plumbers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (747, 'Cable television maintenance technicians', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (748, 'Cable television service technicians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (749, 'Telephone installers and repairers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (750, 'Telecommunications equipment technicians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (751, 'Switch network installers and repairers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (752, 'Telecommunications service testers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (753, 'Telecommunications line and cable workers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (754, 'Electrical power line and cable workers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (755, 'Power system electricians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (756, 'Industrial electricians', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (757, 'Electricians (except industrial and power system)', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (758, 'Welding, brazing and soldering machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (759, 'Welders', 'Close visual acuity', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (760, 'Ironworkers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (761, 'Structural metal and platework fabricators and fitters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (762, 'Boilermakers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (763, 'Sheet metal workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (764, 'Metal mould makers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (765, 'Metal patternmakers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (766, 'Tool and die makers', 'Close visual acuity', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (767, 'Machining and tooling inspectors', 'Close visual acuity', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (768, 'Machinists', 'Close visual acuity', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (769, 'Oil and gas well services operators', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (770, 'Oil and gas well drilling workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (771, 'Underground mine service and support workers', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (772, 'Fishermen/women', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (773, 'Fishing masters and officers', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (774, 'Landscaping and grounds maintenance contractors and managers', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (775, 'Supervisors, landscape and horticulture', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (776, 'Specialized livestock workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (777, 'Farm supervisors ', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (778, 'Agricultural service contractors ', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (779, 'Cable yarding system operators', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (780, 'Mechanical tree processor and loader operators', 'Total visual field', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (781, 'Mechanical harvester and forwarder operators', 'Total visual field', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (782, 'Oil and gas well loggers, testers and related workers', 'Total visual field', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (783, 'Oil and gas well drillers and well servicers', 'Total visual field', 'Not relevant', 'Verbal interaction', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (784, 'Underground production and development miners', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (785, 'Contractors and supervisors, oil and gas drilling and services', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (786, 'Supervisors, mining and quarrying', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (787, 'Supervisors, logging and forestry', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (788, 'Logging and forestry labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (789, 'Oil and gas drilling, servicing and related labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (790, 'Mine labourers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (791, 'Mollusk harvesters', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (792, 'Aquaculture support workers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (793, 'Marine plant gatherers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (794, 'Landscaping and grounds maintenance labourers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (795, 'Harvesting labourers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (796, 'Hunters', 'Total visual field', 'Relevant', 'Other sound discrimination', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (797, 'Trappers', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (798, 'Fishing vessel deckhands', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (799, 'Nursery and greenhouse workers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (800, 'General farm workers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (801, 'Silviculture and forestry workers', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (802, 'Chain saw and skidder operators', 'Total visual field', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (803, 'Manual mouldmakers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (804, 'Machine operators, mineral and metal processing', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (805, 'Inspectors and testers, electrical apparatus manufacturing', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (806, 'Machine operators, electrical apparatus manufacturing', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (807, 'Mechanical assemblers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (808, 'Mechanical inspectors', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (809, 'Assemblers, industrial electrical motors and transformers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (810, 'Electrical fitters and wirers, industrial electrical motors and transformers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (811, 'Inspectors, industrial electrical motors and transformers', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (812, 'Assemblers, electrical appliance, apparatus and equipment manufacturing', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (813, 'Inspectors and testers, electrical appliance, apparatus and equipment manufacturing', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (814, 'Electronics testers', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (815, 'Electronics inspectors', 'Close visual acuity', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (816, 'Electronics fabricators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (817, 'Electronics assemblers', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (818, 'Motor vehicle assemblers', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (819, 'Motor vehicle inspectors and testers', 'Near and far vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (820, 'Aircraft assembly inspectors', 'Near and far vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (821, 'Aircraft assemblers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (822, 'Other inspectors', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (823, 'Other assemblers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (824, 'Other products machine operators', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (825, 'Painters and coaters â€?industrial', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (826, 'Plating, metal spraying and related operators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (827, 'Plastics products inspectors', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (828, 'Plastic products assemblers and finishers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (829, 'Furniture refinishers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (830, 'Furniture finishers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (831, 'Other wood products inspectors', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (832, 'Other wood products assemblers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (833, 'Furniture and fixture assemblers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (834, 'Furniture and fixture inspectors', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (835, 'Boat inspectors', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (836, 'Boat assemblers', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (837, 'Supervisors, plastic and rubber products manufacturing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (838, 'Supervisors, food, beverage and associated products processing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (839, 'Supervisors, petroleum, gas and chemical processing and utilities', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (840, 'Supervisors, mineral and metal processing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (841, 'Liquid waste plant operators', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (842, 'Water treatment plant operators', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (843, ' Power station operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (844, 'Photographic and film processors', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (845, 'Stationary engineers and auxiliary equipment operators ', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (846, 'Power systems operators', 'Near vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (847, 'Specialty finishing equipment operators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (848, 'Binding and finishing machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (849, 'File preparation operators', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (850, 'Graphic arts camera operators', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (851, 'Scanner operators', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (852, 'Pre-fHandling loads of 5 kg but less than 10 kg operators', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (853, 'Pre-press technicians', 'Near vision', 'Relevant', 'Limited', 'Sitting', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (854, 'Other labourers in processing, manufacturing and utilities', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (855, 'Labourers in fish and seafood processing', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (856, 'Labourers in textile processing', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (857, 'Labourers in rubber and plastic products manufacturing', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (858, 'Labourers in wood, pulp and paper processing', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (859, 'Labourers in chemical products processing and utilities', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (860, 'Labourers in metal fabrication', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (861, 'Labourers in mineral and metal processing', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Multiple limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (862, 'Film strippers/assemblers', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (863, 'Cylinder preparers', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (864, 'Proofmakers', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (865, 'Platemakers', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (866, 'Plateless printing equipment operators', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (867, 'Testers and graders, food and beverage processing', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (868, 'Fish plant cutters and cleaners', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (869, 'Pulping control operators', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (870, 'Papermaking and coating control operators', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (871, 'Central control and process operators, petroleum, gas and chemical processing', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (872, 'Central control and process operators, mineral and metal processing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (873, 'Supervisors, other products manufacturing and assembly', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (874, 'Supervisors, other mechanical and metal products manufacturing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (875, 'Fish and seafood plant machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (876, 'Industrial meat cutters', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (877, 'Industrial butchers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (878, 'Poultry preparers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (879, 'Trimmers', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (880, 'Tobacco processing machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (881, 'Supervisors, furniture and fixtures manufacturing', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (882, 'Supervisors, electrical products manufacturing', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (883, 'Supervisors, electronics manufacturing', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (884, 'Supervisors, motor vehicle assembling', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (885, 'Supervisors, fabric, fur and leather products manufacturing', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (886, 'Supervisors, textile processing', 'Near and far vision', 'Relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (887, 'Supervisors, forest products processing', 'Near and far vision', 'Not relevant', 'Verbal interaction', 'Sitting, standing, walking', 'Not relevant', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (888, 'Machine operators, food and beverage processing', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (889, 'Process control operators, food and beverage processing', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (890, 'Inspectors and graders, textile, fabric, fur and leather products manufacturing', 'Near vision', 'Relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (891, 'Textile inspectors, graders and samplers', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (892, 'Industrial sewing machine operators', 'Close visual acuity', 'Relevant', 'Limited', 'Sitting', 'Multiple limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (893, 'Fur cutters', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (894, 'Fabric cutters', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (895, 'Leather cutters', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (896, 'Weavers, knitters and other fabric making occupations', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (897, 'Textile fibre and yarn processing machine operators ', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (898, 'Textile dyeing and finishing machine operators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (899, 'Hide and pelt processing workers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (900, 'Woodworking machine operators', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (901, 'Lumber graders', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (902, 'Other wood processing inspectors and graders', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (903, 'Paper converting machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (904, 'Other wood processing machine operators', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (905, 'Papermaking and finishing machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (906, 'Pulp mill machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (907, 'Sawmill machine operators', 'Near and far vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (908, 'Rubber products inspectors', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (909, 'Assemblers, rubber products', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (910, 'Rubber processing machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (911, 'Mixing machine operators - plastics processing', 'Near and far vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (912, 'Moulding process operators - plastics processing', 'Near and far vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (913, 'Extruding process operators - plastics processing', 'Near and far vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (914, 'Calendering process operators - plastics processing', 'Near and far vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (915, 'Chemical plant machine operators', 'Near vision', 'Relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (916, 'Other metal products machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (917, 'Machining tool operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (918, 'Forging machine operators', 'Near and far vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (919, 'Metalworking machine operators', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (920, 'Inspectors and testers, mineral and metal processing', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (921, 'Stone forming and finishing workers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (922, 'Clay products forming and finishing machine operators', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (923, 'Concrete products machine operators', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (924, 'Concrete products forming and finishing workers', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads more than 20 kg');
INSERT INTO `oa_form_set` VALUES (925, 'Glass cutters', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (926, 'Glass finishing machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (927, 'Glass forming machine operators', 'Near vision', 'Not relevant', 'Limited', 'Standing and/or walking', 'Upper limb co-ordination', 'Handling loads of 5 kg but less than 10 kg');
INSERT INTO `oa_form_set` VALUES (928, 'Glass process control operators', 'Near vision', 'Not relevant', 'Limited', 'Sitting, standing, walking', 'Upper limb co-ordination', 'Handling loads up to 5 kg');
INSERT INTO `oa_form_set` VALUES (929, 'Machine mouldmakers and coremakers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (930, 'Foundry furnace operators', 'Near vision', 'Relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (931, 'Metal casters', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');
INSERT INTO `oa_form_set` VALUES (932, 'Manual coremakers', 'Near vision', 'Not relevant', 'Limited', 'Other body positions', 'Upper limb co-ordination', 'Handling loads between 10 kg and 20 kg');

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '附件',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '状态',
  `create_by` bigint NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_notify
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `notify_id` bigint NULL DEFAULT NULL COMMENT '通知通告ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '接受人',
  `is_read` tinyint(1) NULL DEFAULT 0 COMMENT '阅读标记',
  `read_date` date NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oa_notify_record_notify_id`(`notify_id`) USING BTREE,
  INDEX `oa_notify_record_user_id`(`user_id`) USING BTREE,
  INDEX `oa_notify_record_read_flag`(`is_read`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知通告发送记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_notify_record
-- ----------------------------

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `OA_TEST_AUDIT_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批流程测试表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (6, 0, 'Develop', 1, 1);
INSERT INTO `sys_dept` VALUES (7, 6, 'Develop I', 1, 1);
INSERT INTO `sys_dept` VALUES (8, 6, 'Develop II', 2, 1);
INSERT INTO `sys_dept` VALUES (9, 0, 'Sales', 2, 1);
INSERT INTO `sys_dept` VALUES (10, 9, 'Sales I', 1, 1);
INSERT INTO `sys_dept` VALUES (11, 0, 'Product', 3, 1);
INSERT INTO `sys_dept` VALUES (12, 11, 'Product I', 1, 1);
INSERT INTO `sys_dept` VALUES (13, 0, 'Test', 5, 1);
INSERT INTO `sys_dept` VALUES (14, 13, 'Test I', 1, 1);
INSERT INTO `sys_dept` VALUES (15, 13, 'Test II', 2, 1);
INSERT INTO `sys_dept` VALUES (16, 0, 'Work', 5, 1);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `sort` decimal(10, 0) NULL DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父级编号',
  `create_by` int NULL DEFAULT NULL COMMENT '创建者',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT NULL COMMENT '更新者',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`name`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'Normal', '0', 'del_flag', 'Delete flag', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (3, 'Show', '1', 'show_hide', 'show_hide', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (4, 'Hide', '0', 'show_hide', 'show_hide', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (5, 'Yes', '1', 'yes_no', 'yes_no', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (6, 'No', '0', 'yes_no', 'yes_no', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (7, 'Red', 'red', 'color', 'color', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (8, 'Greed', 'green', 'color', 'color', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (9, 'Blue', 'blue', 'color', 'color', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (10, 'Yellow', 'yellow', 'color', 'color', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (11, 'Orange', 'orange', 'color', 'color', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (12, 'Default Theme', 'default', 'theme', 'theme', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (13, 'Skay Theme', 'cerulean', 'theme', 'theme', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (14, 'Orange Theme', 'readable', 'theme', 'theme', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (15, 'Red Theme', 'united', 'theme', 'theme', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (16, 'Falt Theme', 'flat', 'theme', 'theme', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (17, 'Country', '1', 'sys_area_type', 'sys_area_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (18, 'Province', '2', 'sys_area_type', 'sys_area_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (19, 'City', '3', 'sys_area_type', 'sys_area_type', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (20, 'District', '4', 'sys_area_type', 'sys_area_type', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (21, 'Company', '1', 'sys_office_type', 'sys_office_type', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (22, 'Department', '2', 'sys_office_type', 'sys_office_type', 70, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (23, 'Group', '3', 'sys_office_type', 'sys_office_type', 80, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (24, 'Other', '4', 'sys_office_type', 'sys_office_type', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (25, 'General', '1', 'sys_office_common', 'sys_office_common', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (26, 'Develop', '2', 'sys_office_common', 'sys_office_common', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (27, 'HR', '3', 'sys_office_common', 'sys_office_common', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (28, 'Level 1', '1', 'sys_office_grade', 'sys_office_grade', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (29, 'Level 2', '2', 'sys_office_grade', 'sys_office_grade', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (30, 'Level 3', '3', 'sys_office_grade', 'sys_office_grade', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (31, 'Level 4', '4', 'sys_office_grade', 'sys_office_grade', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (32, 'All data', '1', 'sys_data_scope', 'sys_data_scope', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (33, 'Company ralated data', '2', 'sys_data_scope', 'sys_data_scope', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (34, 'Company data', '3', 'sys_data_scope', 'sys_data_scope', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (35, 'Department related data', '4', 'sys_data_scope', 'sys_data_scope', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (36, 'Department data', '5', 'sys_data_scope', 'sys_data_scope', 50, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (37, 'Personal data only', '8', 'sys_data_scope', 'sys_data_scope', 90, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (38, 'Set by details', '9', 'sys_data_scope', 'sys_data_scope', 100, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (39, 'System management', '1', 'sys_user_type', 'sys_user_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (40, 'Department manager', '2', 'sys_user_type', 'sys_user_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (41, 'User', '3', 'sys_user_type', 'sys_user_type', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (42, 'Basic Theme', 'basic', 'cms_theme', 'cms_theme', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (43, 'Blue Theme', 'blue', 'cms_theme', 'cms_theme', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (44, 'Red Theme', 'red', 'cms_theme', 'cms_theme', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (45, 'Article template', 'article', 'cms_module', 'cms_module', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (46, 'Picture template', 'picture', 'cms_module', 'cms_module', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (47, 'Download module', 'download', 'cms_module', 'cms_module', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (48, 'Link module', 'link', 'cms_module', 'cms_module', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (49, 'Special module', 'special', 'cms_module', 'cms_module', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (50, 'Default show', '0', 'cms_show_modes', 'cms_show_modes', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (51, 'First column content', '1', 'cms_show_modes', 'cms_show_modes', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (52, 'First row content', '2', 'cms_show_modes', 'cms_show_modes', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (53, 'Publish', '0', 'cms_del_flag', 'cms_del_flag', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (54, 'Delete', '1', 'cms_del_flag', 'cms_del_flag', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (55, 'Auditing', '2', 'cms_del_flag', 'cms_del_flag', 15, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (56, 'Focus map', '1', 'cms_posid', 'cms_del_flag', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (57, 'Recommend article', '2', 'cms_posid', 'cms_del_flag', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (58, 'Inquiry', '1', 'cms_guestbook', 'cms_guestbook', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (59, 'Suggestion', '2', 'cms_guestbook', 'cms_guestbook', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (60, 'Complaint', '3', 'cms_guestbook', 'cms_guestbook', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (61, 'Other', '4', 'cms_guestbook', 'cms_guestbook', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (62, 'General holiday', '1', 'oa_leave_type', 'oa_leave_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (63, 'Sick leave', '2', 'oa_leave_type', 'oa_leave_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (64, 'Personal leave', '3', 'oa_leave_type', 'oa_leave_type', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (65, 'Rest', '4', 'oa_leave_type', 'oa_leave_type', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (66, 'Marriage leave', '5', 'oa_leave_type', 'oa_leave_type', 60, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (67, 'Access log', '1', 'sys_log_type', 'sys_log_type', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (68, 'Exception log', '2', 'sys_log_type', 'sys_log_type', 40, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (69, 'Leave process', 'leave', 'act_type', 'act_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (70, 'Test & audit process', 'test_audit', 'act_type', 'act_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (71, 'Category 1', '1', 'act_category', 'act_category', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (72, 'Category 2', '2', 'act_category', 'act_category', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (73, 'Add&Delete&Edit&Search', 'crud', 'gen_category', 'gen_category', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (74, 'Add&Delete&Edit&Search(From table)', 'crud_many', 'gen_category', 'gen_category', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (75, 'Trees', 'tree', 'gen_category', 'gen_category', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (76, '=', '=', 'gen_query_type', 'gen_query_type', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (77, '!=', '!=', 'gen_query_type', 'gen_query_type', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (78, '&gt;', '&gt;', 'gen_query_type', 'gen_query_type', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (79, '&lt;', '&lt;', 'gen_query_type', 'gen_query_type', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (80, 'Between', 'between', 'gen_query_type', 'gen_query_type', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (81, 'Like', 'like', 'gen_query_type', 'gen_query_type', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (82, 'Left Like', 'left_like', 'gen_query_type', 'gen_query_type', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (83, 'Right Like', 'right_like', 'gen_query_type', 'gen_query_type', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (84, 'Input', 'input', 'gen_show_type', 'gen_show_type', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (85, 'Text area', 'textarea', 'gen_show_type', 'gen_show_type', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (86, 'Select', 'select', 'gen_show_type', 'gen_show_type', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (87, 'Check box', 'checkbox', 'gen_show_type', 'gen_show_type', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (88, 'Radio box', 'radiobox', 'gen_show_type', 'gen_show_type', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (89, 'Date select', 'dateselect', 'gen_show_type', 'gen_show_type', 60, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (90, 'User select', 'userselect', 'gen_show_type', 'gen_show_type', 70, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (91, 'Department select', 'officeselect', 'gen_show_type', 'gen_show_type', 80, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (92, 'Area select', 'areaselect', 'gen_show_type', 'gen_show_type', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (93, 'String', 'String', 'gen_java_type', 'gen_java_type', 10, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (94, 'Long', 'Long', 'gen_java_type', 'gen_java_type', 20, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (95, 'Dao', 'dao', 'gen_category', 'gen_category', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (96, 'Male', '1', 'sex', 'sex', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (97, 'Female', '2', 'sex', 'sex', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (98, 'Integer', 'Integer', 'gen_java_type', 'gen_java_type', 30, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (99, 'Double', 'Double', 'gen_java_type', 'gen_java_type', 40, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (100, 'Date', 'java.util.Date', 'gen_java_type', 'gen_java_type', 50, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (104, 'Custom', 'Custom', 'gen_java_type', 'gen_java_type', 90, 0, 1, NULL, 1, NULL, NULL, '1');
INSERT INTO `sys_dict` VALUES (105, 'Meeting', '1', 'oa_notify_type', 'oa_notify_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (106, 'Reward and punishment', '2', 'oa_notify_type', 'oa_notify_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (107, 'Event', '3', 'oa_notify_type', 'oa_notify_type', 30, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (108, 'Draft', '0', 'oa_notify_status', 'oa_notify_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (109, 'Publish', '1', 'oa_notify_status', 'oa_notify_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (110, 'Unread', '0', 'oa_notify_read', 'oa_notify_type', 10, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (111, 'Read', '1', 'oa_notify_read', 'oa_notify_type', 20, 0, 1, NULL, 1, NULL, NULL, '0');
INSERT INTO `sys_dict` VALUES (112, 'Draft', '0', 'oa_notify_status', 'oa_notify_type', 10, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (113, 'Delete', '0', 'del_flag', 'del_flag', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (118, 'About', 'about', 'blog_type', 'blog_type', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (119, 'Communication', 'communication', 'blog_type', 'blog_type', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (120, 'Article', 'article', 'blog_type', 'blog_type', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (121, 'Code', 'code', 'hobby', 'hobby', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (122, 'Painting', 'painting', 'hobby', 'hobby', NULL, 0, 1, NULL, 1, NULL, '', '0');
INSERT INTO `sys_dict` VALUES (123, 'Depth perception and peripheral vision lost', '3', 'oa_form_vision', 'vision', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (124, 'Near vision lost', '2', 'oa_form_vision', 'vision', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (125, 'Close visual acuity lost', '1', 'oa_form_vision', 'vision', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (126, 'Not relevant', '5', 'oa_form_vision', 'vision', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (127, 'Yes', '0', 'oa_form_colorDiscrimination', 'color discrimination', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (128, 'No', '1', 'oa_form_colorDiscrimination', 'color discrimination', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (129, 'Can not do verbal interaction', '2', 'oa_form_hearing', 'hearing', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (130, 'Can not work due to hearing damage', '3', 'oa_form_hearing', 'hearing', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (131, 'Not relevant', '3', 'oa_form_hearing', 'hearing', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (132, 'Can not sit', '1', 'oa_form_bodyPosition', 'body position', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (133, 'Can not standing/walking', '2', 'oa_form_bodyPosition', 'body position', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (134, 'Can not sitting/standing/walking', '3', 'oa_form_bodyPosition', 'body position', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (135, 'Can not work due to body position limitation', '4', 'oa_form_bodyPosition', 'body position', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (136, 'Not relevant', '5', 'oa_form_bodyPosition', 'body position', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (137, 'Upper limb co-ordination limited', '1', 'oa_form_limbCo', 'limb coordination', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (138, 'Multiple limb co-ordination limited', '2', 'oa_form_limbCo', 'limb coordination', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (139, 'Not relevant', '3', 'oa_form_limbCo', 'limb coordination', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (140, 'Can not handling loads up to 5kg', '1', 'oa_form_strength', 'strength', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (141, 'Can not handling loads of 5 kg but less than 10 kg', '2', 'oa_form_strength', 'strength', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (142, 'Can not handling loads between 10 kg and 20 kg', '3', 'oa_form_strength', 'strength', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (143, 'Can not handling loads more than 20 kg', '4', 'oa_form_strength', 'strength', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (144, 'Not relevant', '5', 'oa_form_strength', 'strength', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (146, 'Closed', '3', 'oa_form_status', 'status', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');
INSERT INTO `sys_dict` VALUES (147, 'More information requested', '4', 'oa_form_status', 'status', NULL, NULL, NULL, NULL, NULL, NULL, ' ', '0');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (149, 0, '/files/6f888717-1656-4cab-aff0-2ae6199eed01.png', '2021-03-01 00:18:40');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `time` int NULL DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int NULL DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, 'Resource', '', '', 0, 'fa fa-bars', 0, '2017-08-09 22:49:47', NULL);
INSERT INTO `sys_menu` VALUES (2, 3, 'Menu', 'sys/menu/', 'sys:menu:menu', 1, 'fa fa-th-list', 2, '2017-08-09 22:55:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 0, 'System', '', '', 0, 'fa fa-desktop', 1, '2017-08-09 23:06:55', '2017-08-14 14:13:43');
INSERT INTO `sys_menu` VALUES (6, 3, 'User', 'sys/user/', 'sys:user:user', 1, 'fa fa-user', 0, '2017-08-10 14:12:11', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, 'Role', 'sys/role', 'sys:role:role', 1, 'fa fa-paw', 1, '2017-08-10 14:13:19', NULL);
INSERT INTO `sys_menu` VALUES (12, 6, 'Add', '', 'sys:user:add', 2, '', 0, '2017-08-14 10:51:35', NULL);
INSERT INTO `sys_menu` VALUES (13, 6, 'Edit', '', 'sys:user:edit', 2, '', 0, '2017-08-14 10:52:06', NULL);
INSERT INTO `sys_menu` VALUES (14, 6, 'Delete', NULL, 'sys:user:remove', 2, NULL, 0, '2017-08-14 10:52:24', NULL);
INSERT INTO `sys_menu` VALUES (15, 7, 'Add', '', 'sys:role:add', 2, '', 0, '2017-08-14 10:56:37', NULL);
INSERT INTO `sys_menu` VALUES (20, 2, 'Add', '', 'sys:menu:add', 2, '', 0, '2017-08-14 10:59:32', NULL);
INSERT INTO `sys_menu` VALUES (21, 2, 'Edit', '', 'sys:menu:edit', 2, '', 0, '2017-08-14 10:59:56', NULL);
INSERT INTO `sys_menu` VALUES (22, 2, 'Delete', '', 'sys:menu:remove', 2, '', 0, '2017-08-14 11:00:26', NULL);
INSERT INTO `sys_menu` VALUES (24, 6, 'Batch delete', '', 'sys:user:batchRemove', 2, '', 0, '2017-08-14 17:27:18', NULL);
INSERT INTO `sys_menu` VALUES (25, 6, 'Disable', NULL, 'sys:user:disable', 2, NULL, 0, '2017-08-14 17:27:43', NULL);
INSERT INTO `sys_menu` VALUES (26, 6, 'Reset Password', '', 'sys:user:resetPwd', 2, '', 0, '2017-08-14 17:28:34', NULL);
INSERT INTO `sys_menu` VALUES (27, 91, 'Log', 'common/log', 'common:log', 1, 'fa fa-warning', 0, '2017-08-14 22:11:53', NULL);
INSERT INTO `sys_menu` VALUES (28, 27, 'Refresh', NULL, 'sys:log:list', 2, NULL, 0, '2017-08-14 22:30:22', NULL);
INSERT INTO `sys_menu` VALUES (29, 27, 'Delete', NULL, 'sys:log:remove', 2, NULL, 0, '2017-08-14 22:30:43', NULL);
INSERT INTO `sys_menu` VALUES (30, 27, 'Clear', NULL, 'sys:log:clear', 2, NULL, 0, '2017-08-14 22:31:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 77, 'Code generator', 'common/generator', 'common:generator', 1, 'fa fa-code', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (55, 7, 'Edit', '', 'sys:role:edit', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (56, 7, 'Delete', '', 'sys:role:remove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (61, 2, 'Batch delete', '', 'sys:menu:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (62, 7, 'Batch delete', '', 'sys:role:batchRemove', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (71, 1, 'File Management', '/common/sysFile', 'common:sysFile:sysFile', 1, 'fa fa-folder-open', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (73, 3, 'Department', '/system/sysDept', 'system:sysDept:sysDept', 1, 'fa fa-users', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (74, 73, 'Add', '/system/sysDept/add', 'system:sysDept:add', 2, NULL, 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (75, 73, 'Delete', 'system/sysDept/remove', 'system:sysDept:remove', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (76, 73, 'Edit', '/system/sysDept/edit', 'system:sysDept:edit', 2, NULL, 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (77, 0, 'Tool', '', '', 0, 'fa fa-gear', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (78, 1, 'Data Dictionary', '/common/dict', 'common:dict:dict', 1, 'fa fa-book', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (79, 78, 'Add', '/common/dict/add', 'common:dict:add', 2, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (80, 78, 'Edit', '/common/dict/edit', 'common:dict:edit', 2, NULL, 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (81, 78, 'Delete', '/common/dict/remove', 'common:dict:remove', 2, '', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (83, 78, 'Batch delete', '/common/dict/batchRemove', 'common:dict:batchRemove', 2, '', 4, NULL, NULL);
INSERT INTO `sys_menu` VALUES (84, 0, 'Claim', '', '', 0, 'fa fa-laptop', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (85, 84, 'Claims management', 'oa/form', 'oa:form', 1, 'fa fa-pencil-square', 3, NULL, NULL);
INSERT INTO `sys_menu` VALUES (86, 85, 'Add', 'oa/form/add', 'oa:form:add', 2, 'fa fa-plus', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (87, 85, 'Edit', 'oa/form/edit', 'oa:form:edit', 2, 'fa fa-pencil-square-o', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (88, 85, 'Delete', 'oa/form/remove', 'oa:form:remove', 2, 'fa fa-minus', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (89, 85, 'Batch delete', 'oa/form/batchRemove', 'oa:form:batchRemove', 2, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (91, 0, 'Monitor', '', '', 0, 'fa fa-video-camera', 5, NULL, NULL);
INSERT INTO `sys_menu` VALUES (92, 91, 'Online User', 'sys/online', '', 1, 'fa fa-user', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (104, 77, 'swagger', '/swagger-ui.html', '', 1, '', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (105, 84, 'My Claims', 'oa/form/userForm', 'oa:form:userForm', 1, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (106, 105, 'Add', 'oa/form/userAdd', 'oa:form:userAdd', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (107, 105, 'Edit', 'oa/form/userEdit', 'oa:form:userEdit', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (108, 105, 'Remove', 'oa/form/remove', 'oa:form:remove', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (109, 105, 'batchRemove', 'oa/form/batchRemove', 'oa:form:batchRemove', 2, '', 1, NULL, NULL);
INSERT INTO `sys_menu` VALUES (110, 84, 'Form evaluation ', 'oa/doctor/doctor', 'oa:doctor:doctor', 1, '', 2, NULL, NULL);
INSERT INTO `sys_menu` VALUES (111, 110, 'Edit', 'oa/doctor/doctorEdit', 'oa:doctor:doctorEdit', 2, '', 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'Super admin', 'admin', 'admin', 2, NULL, NULL);
INSERT INTO `sys_role` VALUES (59, 'User', NULL, 'Normal user', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (61, 'Insurer', NULL, '', NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (63, 'doctor', NULL, 'doctor', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3466 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (367, 44, 1);
INSERT INTO `sys_role_menu` VALUES (368, 44, 32);
INSERT INTO `sys_role_menu` VALUES (369, 44, 33);
INSERT INTO `sys_role_menu` VALUES (370, 44, 34);
INSERT INTO `sys_role_menu` VALUES (371, 44, 35);
INSERT INTO `sys_role_menu` VALUES (372, 44, 28);
INSERT INTO `sys_role_menu` VALUES (373, 44, 29);
INSERT INTO `sys_role_menu` VALUES (374, 44, 30);
INSERT INTO `sys_role_menu` VALUES (375, 44, 38);
INSERT INTO `sys_role_menu` VALUES (376, 44, 4);
INSERT INTO `sys_role_menu` VALUES (377, 44, 27);
INSERT INTO `sys_role_menu` VALUES (378, 45, 38);
INSERT INTO `sys_role_menu` VALUES (379, 46, 3);
INSERT INTO `sys_role_menu` VALUES (380, 46, 20);
INSERT INTO `sys_role_menu` VALUES (381, 46, 21);
INSERT INTO `sys_role_menu` VALUES (382, 46, 22);
INSERT INTO `sys_role_menu` VALUES (383, 46, 23);
INSERT INTO `sys_role_menu` VALUES (384, 46, 11);
INSERT INTO `sys_role_menu` VALUES (385, 46, 12);
INSERT INTO `sys_role_menu` VALUES (386, 46, 13);
INSERT INTO `sys_role_menu` VALUES (387, 46, 14);
INSERT INTO `sys_role_menu` VALUES (388, 46, 24);
INSERT INTO `sys_role_menu` VALUES (389, 46, 25);
INSERT INTO `sys_role_menu` VALUES (390, 46, 26);
INSERT INTO `sys_role_menu` VALUES (391, 46, 15);
INSERT INTO `sys_role_menu` VALUES (392, 46, 2);
INSERT INTO `sys_role_menu` VALUES (393, 46, 6);
INSERT INTO `sys_role_menu` VALUES (394, 46, 7);
INSERT INTO `sys_role_menu` VALUES (598, 50, 38);
INSERT INTO `sys_role_menu` VALUES (632, 38, 42);
INSERT INTO `sys_role_menu` VALUES (737, 51, 38);
INSERT INTO `sys_role_menu` VALUES (738, 51, 39);
INSERT INTO `sys_role_menu` VALUES (739, 51, 40);
INSERT INTO `sys_role_menu` VALUES (740, 51, 41);
INSERT INTO `sys_role_menu` VALUES (741, 51, 4);
INSERT INTO `sys_role_menu` VALUES (742, 51, 32);
INSERT INTO `sys_role_menu` VALUES (743, 51, 33);
INSERT INTO `sys_role_menu` VALUES (744, 51, 34);
INSERT INTO `sys_role_menu` VALUES (745, 51, 35);
INSERT INTO `sys_role_menu` VALUES (746, 51, 27);
INSERT INTO `sys_role_menu` VALUES (747, 51, 28);
INSERT INTO `sys_role_menu` VALUES (748, 51, 29);
INSERT INTO `sys_role_menu` VALUES (749, 51, 30);
INSERT INTO `sys_role_menu` VALUES (750, 51, 1);
INSERT INTO `sys_role_menu` VALUES (1064, 54, 53);
INSERT INTO `sys_role_menu` VALUES (1095, 55, 2);
INSERT INTO `sys_role_menu` VALUES (1096, 55, 6);
INSERT INTO `sys_role_menu` VALUES (1097, 55, 7);
INSERT INTO `sys_role_menu` VALUES (1098, 55, 3);
INSERT INTO `sys_role_menu` VALUES (1099, 55, 50);
INSERT INTO `sys_role_menu` VALUES (1100, 55, 49);
INSERT INTO `sys_role_menu` VALUES (1101, 55, 1);
INSERT INTO `sys_role_menu` VALUES (1856, 53, 28);
INSERT INTO `sys_role_menu` VALUES (1857, 53, 29);
INSERT INTO `sys_role_menu` VALUES (1858, 53, 30);
INSERT INTO `sys_role_menu` VALUES (1859, 53, 27);
INSERT INTO `sys_role_menu` VALUES (1860, 53, 57);
INSERT INTO `sys_role_menu` VALUES (1861, 53, 71);
INSERT INTO `sys_role_menu` VALUES (1862, 53, 48);
INSERT INTO `sys_role_menu` VALUES (1863, 53, 72);
INSERT INTO `sys_role_menu` VALUES (1864, 53, 1);
INSERT INTO `sys_role_menu` VALUES (1865, 53, 7);
INSERT INTO `sys_role_menu` VALUES (1866, 53, 55);
INSERT INTO `sys_role_menu` VALUES (1867, 53, 56);
INSERT INTO `sys_role_menu` VALUES (1868, 53, 62);
INSERT INTO `sys_role_menu` VALUES (1869, 53, 15);
INSERT INTO `sys_role_menu` VALUES (1870, 53, 2);
INSERT INTO `sys_role_menu` VALUES (1871, 53, 61);
INSERT INTO `sys_role_menu` VALUES (1872, 53, 20);
INSERT INTO `sys_role_menu` VALUES (1873, 53, 21);
INSERT INTO `sys_role_menu` VALUES (1874, 53, 22);
INSERT INTO `sys_role_menu` VALUES (2084, 56, 68);
INSERT INTO `sys_role_menu` VALUES (2085, 56, 60);
INSERT INTO `sys_role_menu` VALUES (2086, 56, 59);
INSERT INTO `sys_role_menu` VALUES (2087, 56, 58);
INSERT INTO `sys_role_menu` VALUES (2088, 56, 51);
INSERT INTO `sys_role_menu` VALUES (2089, 56, 50);
INSERT INTO `sys_role_menu` VALUES (2090, 56, 49);
INSERT INTO `sys_role_menu` VALUES (2243, 48, 72);
INSERT INTO `sys_role_menu` VALUES (2252, 64, 84);
INSERT INTO `sys_role_menu` VALUES (2253, 64, 89);
INSERT INTO `sys_role_menu` VALUES (2254, 64, 88);
INSERT INTO `sys_role_menu` VALUES (2255, 64, 87);
INSERT INTO `sys_role_menu` VALUES (2256, 64, 86);
INSERT INTO `sys_role_menu` VALUES (2257, 64, 85);
INSERT INTO `sys_role_menu` VALUES (2258, 65, 89);
INSERT INTO `sys_role_menu` VALUES (2259, 65, 88);
INSERT INTO `sys_role_menu` VALUES (2260, 65, 86);
INSERT INTO `sys_role_menu` VALUES (2262, 67, 48);
INSERT INTO `sys_role_menu` VALUES (2263, 68, 88);
INSERT INTO `sys_role_menu` VALUES (2264, 68, 87);
INSERT INTO `sys_role_menu` VALUES (2265, 69, 89);
INSERT INTO `sys_role_menu` VALUES (2266, 69, 88);
INSERT INTO `sys_role_menu` VALUES (2267, 69, 86);
INSERT INTO `sys_role_menu` VALUES (2268, 69, 87);
INSERT INTO `sys_role_menu` VALUES (2269, 69, 85);
INSERT INTO `sys_role_menu` VALUES (2270, 69, 84);
INSERT INTO `sys_role_menu` VALUES (2271, 70, 85);
INSERT INTO `sys_role_menu` VALUES (2272, 70, 89);
INSERT INTO `sys_role_menu` VALUES (2273, 70, 88);
INSERT INTO `sys_role_menu` VALUES (2274, 70, 87);
INSERT INTO `sys_role_menu` VALUES (2275, 70, 86);
INSERT INTO `sys_role_menu` VALUES (2276, 70, 84);
INSERT INTO `sys_role_menu` VALUES (2277, 71, 87);
INSERT INTO `sys_role_menu` VALUES (2278, 72, 59);
INSERT INTO `sys_role_menu` VALUES (2279, 73, 48);
INSERT INTO `sys_role_menu` VALUES (2280, 74, 88);
INSERT INTO `sys_role_menu` VALUES (2281, 74, 87);
INSERT INTO `sys_role_menu` VALUES (2282, 75, 88);
INSERT INTO `sys_role_menu` VALUES (2283, 75, 87);
INSERT INTO `sys_role_menu` VALUES (2284, 76, 85);
INSERT INTO `sys_role_menu` VALUES (2285, 76, 89);
INSERT INTO `sys_role_menu` VALUES (2286, 76, 88);
INSERT INTO `sys_role_menu` VALUES (2287, 76, 87);
INSERT INTO `sys_role_menu` VALUES (2288, 76, 86);
INSERT INTO `sys_role_menu` VALUES (2289, 76, 84);
INSERT INTO `sys_role_menu` VALUES (2292, 78, 88);
INSERT INTO `sys_role_menu` VALUES (2293, 78, 87);
INSERT INTO `sys_role_menu` VALUES (2294, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2295, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2296, 78, NULL);
INSERT INTO `sys_role_menu` VALUES (2308, 80, 87);
INSERT INTO `sys_role_menu` VALUES (2309, 80, 86);
INSERT INTO `sys_role_menu` VALUES (2310, 80, -1);
INSERT INTO `sys_role_menu` VALUES (2311, 80, 84);
INSERT INTO `sys_role_menu` VALUES (2312, 80, 85);
INSERT INTO `sys_role_menu` VALUES (2328, 79, 72);
INSERT INTO `sys_role_menu` VALUES (2329, 79, 48);
INSERT INTO `sys_role_menu` VALUES (2330, 79, 77);
INSERT INTO `sys_role_menu` VALUES (2331, 79, 84);
INSERT INTO `sys_role_menu` VALUES (2332, 79, 89);
INSERT INTO `sys_role_menu` VALUES (2333, 79, 88);
INSERT INTO `sys_role_menu` VALUES (2334, 79, 87);
INSERT INTO `sys_role_menu` VALUES (2335, 79, 86);
INSERT INTO `sys_role_menu` VALUES (2336, 79, 85);
INSERT INTO `sys_role_menu` VALUES (2337, 79, -1);
INSERT INTO `sys_role_menu` VALUES (2338, 77, 89);
INSERT INTO `sys_role_menu` VALUES (2339, 77, 88);
INSERT INTO `sys_role_menu` VALUES (2340, 77, 87);
INSERT INTO `sys_role_menu` VALUES (2341, 77, 86);
INSERT INTO `sys_role_menu` VALUES (2342, 77, 85);
INSERT INTO `sys_role_menu` VALUES (2343, 77, 84);
INSERT INTO `sys_role_menu` VALUES (2344, 77, 72);
INSERT INTO `sys_role_menu` VALUES (2345, 77, -1);
INSERT INTO `sys_role_menu` VALUES (2346, 77, 77);
INSERT INTO `sys_role_menu` VALUES (2974, 57, 93);
INSERT INTO `sys_role_menu` VALUES (2975, 57, 99);
INSERT INTO `sys_role_menu` VALUES (2976, 57, 95);
INSERT INTO `sys_role_menu` VALUES (2977, 57, 101);
INSERT INTO `sys_role_menu` VALUES (2978, 57, 96);
INSERT INTO `sys_role_menu` VALUES (2979, 57, 94);
INSERT INTO `sys_role_menu` VALUES (2980, 57, -1);
INSERT INTO `sys_role_menu` VALUES (2981, 58, 93);
INSERT INTO `sys_role_menu` VALUES (2982, 58, 99);
INSERT INTO `sys_role_menu` VALUES (2983, 58, 95);
INSERT INTO `sys_role_menu` VALUES (2984, 58, 101);
INSERT INTO `sys_role_menu` VALUES (2985, 58, 96);
INSERT INTO `sys_role_menu` VALUES (2986, 58, 94);
INSERT INTO `sys_role_menu` VALUES (2987, 58, -1);
INSERT INTO `sys_role_menu` VALUES (3383, 1, 92);
INSERT INTO `sys_role_menu` VALUES (3384, 1, 30);
INSERT INTO `sys_role_menu` VALUES (3385, 1, 29);
INSERT INTO `sys_role_menu` VALUES (3386, 1, 28);
INSERT INTO `sys_role_menu` VALUES (3387, 1, 109);
INSERT INTO `sys_role_menu` VALUES (3388, 1, 108);
INSERT INTO `sys_role_menu` VALUES (3389, 1, 107);
INSERT INTO `sys_role_menu` VALUES (3390, 1, 106);
INSERT INTO `sys_role_menu` VALUES (3391, 1, 90);
INSERT INTO `sys_role_menu` VALUES (3392, 1, 89);
INSERT INTO `sys_role_menu` VALUES (3393, 1, 88);
INSERT INTO `sys_role_menu` VALUES (3394, 1, 87);
INSERT INTO `sys_role_menu` VALUES (3395, 1, 86);
INSERT INTO `sys_role_menu` VALUES (3396, 1, 104);
INSERT INTO `sys_role_menu` VALUES (3397, 1, 72);
INSERT INTO `sys_role_menu` VALUES (3398, 1, 48);
INSERT INTO `sys_role_menu` VALUES (3399, 1, 76);
INSERT INTO `sys_role_menu` VALUES (3400, 1, 75);
INSERT INTO `sys_role_menu` VALUES (3401, 1, 74);
INSERT INTO `sys_role_menu` VALUES (3402, 1, 62);
INSERT INTO `sys_role_menu` VALUES (3403, 1, 56);
INSERT INTO `sys_role_menu` VALUES (3404, 1, 55);
INSERT INTO `sys_role_menu` VALUES (3405, 1, 15);
INSERT INTO `sys_role_menu` VALUES (3406, 1, 26);
INSERT INTO `sys_role_menu` VALUES (3407, 1, 25);
INSERT INTO `sys_role_menu` VALUES (3408, 1, 24);
INSERT INTO `sys_role_menu` VALUES (3409, 1, 14);
INSERT INTO `sys_role_menu` VALUES (3410, 1, 13);
INSERT INTO `sys_role_menu` VALUES (3411, 1, 12);
INSERT INTO `sys_role_menu` VALUES (3412, 1, 61);
INSERT INTO `sys_role_menu` VALUES (3413, 1, 22);
INSERT INTO `sys_role_menu` VALUES (3414, 1, 21);
INSERT INTO `sys_role_menu` VALUES (3415, 1, 20);
INSERT INTO `sys_role_menu` VALUES (3416, 1, 83);
INSERT INTO `sys_role_menu` VALUES (3417, 1, 81);
INSERT INTO `sys_role_menu` VALUES (3418, 1, 80);
INSERT INTO `sys_role_menu` VALUES (3419, 1, 79);
INSERT INTO `sys_role_menu` VALUES (3420, 1, 71);
INSERT INTO `sys_role_menu` VALUES (3421, 1, 27);
INSERT INTO `sys_role_menu` VALUES (3422, 1, 91);
INSERT INTO `sys_role_menu` VALUES (3423, 1, 105);
INSERT INTO `sys_role_menu` VALUES (3424, 1, 85);
INSERT INTO `sys_role_menu` VALUES (3425, 1, 77);
INSERT INTO `sys_role_menu` VALUES (3426, 1, 73);
INSERT INTO `sys_role_menu` VALUES (3427, 1, 7);
INSERT INTO `sys_role_menu` VALUES (3428, 1, 6);
INSERT INTO `sys_role_menu` VALUES (3429, 1, 2);
INSERT INTO `sys_role_menu` VALUES (3430, 1, 3);
INSERT INTO `sys_role_menu` VALUES (3431, 1, 78);
INSERT INTO `sys_role_menu` VALUES (3432, 1, 1);
INSERT INTO `sys_role_menu` VALUES (3433, 1, 110);
INSERT INTO `sys_role_menu` VALUES (3434, 1, 111);
INSERT INTO `sys_role_menu` VALUES (3435, 1, 84);
INSERT INTO `sys_role_menu` VALUES (3436, 1, -1);
INSERT INTO `sys_role_menu` VALUES (3437, 59, 108);
INSERT INTO `sys_role_menu` VALUES (3438, 59, 107);
INSERT INTO `sys_role_menu` VALUES (3439, 59, 106);
INSERT INTO `sys_role_menu` VALUES (3440, 59, -1);
INSERT INTO `sys_role_menu` VALUES (3441, 59, 84);
INSERT INTO `sys_role_menu` VALUES (3442, 59, 105);
INSERT INTO `sys_role_menu` VALUES (3451, 61, 89);
INSERT INTO `sys_role_menu` VALUES (3452, 61, 88);
INSERT INTO `sys_role_menu` VALUES (3453, 61, 87);
INSERT INTO `sys_role_menu` VALUES (3454, 61, 86);
INSERT INTO `sys_role_menu` VALUES (3455, 61, 85);
INSERT INTO `sys_role_menu` VALUES (3456, 61, -1);
INSERT INTO `sys_role_menu` VALUES (3457, 61, 84);
INSERT INTO `sys_role_menu` VALUES (3462, 63, 111);
INSERT INTO `sys_role_menu` VALUES (3463, 63, 110);
INSERT INTO `sys_role_menu` VALUES (3464, 63, -1);
INSERT INTO `sys_role_menu` VALUES (3465, 63, 84);

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_task
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `dept_id` bigint NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint NULL DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `sex` bigint NULL DEFAULT NULL COMMENT '性别',
  `birth` datetime NULL DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint NULL DEFAULT NULL,
  `live_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'Super Admin', '27bd386e70f280e24c2f4f2a549b82cf', 6, 'asgrrem98@gmail.com', '1122334455', 1, 1, '2017-08-15 21:40:39', '2017-08-15 21:41:00', 96, '2017-12-14 00:00:00', 149, '100 Tucker Park Rd', '122;121;', 'New Brunswick', 'Saint John', 'E2K 4L4');
INSERT INTO `sys_user` VALUES (2, 'test', 'test', '6cf3bb3deba2aadbd41ec9a22511084e', 6, 'test@claims.com', NULL, 1, 1, '2017-08-14 13:43:05', '2017-08-14 21:15:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (139, 'insurer', 'insurer', '6ba7104806fb0188d6e1f7019e56f6f7', 16, 'em@claims.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (158, 'doctor_a', 'doctor_a', 'e617cdfb65722a376bd62f93894d3a16', 16, 'doctor_a@claims.com', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_plus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `payment` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_plus
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (73, 30, 48);
INSERT INTO `sys_user_role` VALUES (74, 30, 49);
INSERT INTO `sys_user_role` VALUES (75, 30, 50);
INSERT INTO `sys_user_role` VALUES (76, 31, 48);
INSERT INTO `sys_user_role` VALUES (77, 31, 49);
INSERT INTO `sys_user_role` VALUES (78, 31, 52);
INSERT INTO `sys_user_role` VALUES (79, 32, 48);
INSERT INTO `sys_user_role` VALUES (80, 32, 49);
INSERT INTO `sys_user_role` VALUES (81, 32, 50);
INSERT INTO `sys_user_role` VALUES (82, 32, 51);
INSERT INTO `sys_user_role` VALUES (83, 32, 52);
INSERT INTO `sys_user_role` VALUES (84, 33, 38);
INSERT INTO `sys_user_role` VALUES (85, 33, 49);
INSERT INTO `sys_user_role` VALUES (86, 33, 52);
INSERT INTO `sys_user_role` VALUES (87, 34, 50);
INSERT INTO `sys_user_role` VALUES (88, 34, 51);
INSERT INTO `sys_user_role` VALUES (89, 34, 52);
INSERT INTO `sys_user_role` VALUES (124, NULL, 48);
INSERT INTO `sys_user_role` VALUES (135, 2, 1);
INSERT INTO `sys_user_role` VALUES (151, 139, 61);
INSERT INTO `sys_user_role` VALUES (160, 1, 1);
INSERT INTO `sys_user_role` VALUES (167, 158, 63);

SET FOREIGN_KEY_CHECKS = 1;
