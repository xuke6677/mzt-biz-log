create table t_logrecord
(
    `id`            bigint(11) unsigned not null auto_increment comment 'id',
    `tenant`        varchar(63)   not null default '' comment '租户标识',
    `type`          varchar(63)   not null default '' comment '保存的操作日志的类型，比如：订单类型、商品类型',
    `sub_type`      varchar(63)   not null default '' comment '日志的子类型，比如订单的C端日志，和订单的B端日志，type都是订单类型，但是子类型不一样',
    `biz_no`        varchar(63)   not null default '' comment '日志绑定的业务标识',
    `operator`      varchar(63)   not null default '' comment '操作人',
    `action`        varchar(1023) not null default '' comment '日志内容',
    `fail`          tinyint(1) unsigned not null default 0 comment '记录是否是操作失败的日志',
    `create_time`   datetime(3) not null default current_timestamp (3) comment '创建时间',
    `extra`         varchar(2000) not null default '' comment '扩展信息',
    `code_variable` varchar(2000) not null default '' comment '代码变量信息',
    primary key (id)
);

-- 改造后的脚本
CREATE TABLE `pms_cf_biz_log`
(
    `ID`            bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `TENANT`        varchar(32)   NOT NULL DEFAULT '' COMMENT '租户标识',
	`TYPE` varchar(64) NOT NULL COMMENT '业务类型 (尺重限制库：SIZE_WEIGHT_LIMIT、邮编限制：POSTCODE_LIMIT，物流分区：LOGISTICS，价格表：PRICE_TABLE)',
    `SUB_TYPE`      varchar(256)   NOT NULL DEFAULT '' COMMENT '日志的子类型',
    `SOURCE_ID` bigint(20) NOT NULL COMMENT '来源ID',
    `BIZ_NO`        varchar(256)   NOT NULL DEFAULT '' COMMENT '日志绑定的业务标识',
     `OPERATOR`      varchar(64)         not null default '' comment '操作人',
    `ACTION`        varchar(4000)  NOT NULL DEFAULT '' COMMENT '日志内容',
    `FAIL`          int  NOT NULL DEFAULT 0 COMMENT '记录是否是操作失败的日志',
    `EXTRA`         text   COMMENT '扩展信息',
    `CODE_VARIABLE` varchar(2000) NOT NULL DEFAULT '' COMMENT '代码变量信息',
  	`CREATEDBY` varchar(32) DEFAULT NULL COMMENT '创建人(操作人)',
	`CREATED` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`UPDATEDBY` varchar(32) DEFAULT NULL COMMENT '修改人',
	`UPDATED` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	`IS_ACTIVE` char(1) DEFAULT 'Y' COMMENT '是否有效，Y：是，N：否',
	`IS_DELETE` char(1) DEFAULT 'N' COMMENT '是否删除，Y：是，N：否',
    PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin comment='业务操作日志';