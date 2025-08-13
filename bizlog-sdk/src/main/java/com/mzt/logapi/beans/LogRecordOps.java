package com.mzt.logapi.beans;

import lombok.Builder;
import lombok.Data;

/**
 * @author muzhantong
 * create on 2020/4/29 3:27 下午
 */
@Data
@Builder
public class LogRecordOps {
    private String successLogTemplate;
    private String failLogTemplate;
    private String operatorId;
    private String type;
    private String bizNo;
    private String subType;
    private String extra;
    private String condition;
    private String isSuccess;
    private String sourceId;
}
