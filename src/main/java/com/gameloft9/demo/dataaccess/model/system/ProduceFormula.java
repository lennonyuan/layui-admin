package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

import java.util.Date;
@Data
public class ProduceFormula {
    private String Id;
    private String ProductName;
    private Integer Type;
    private String CreateUser;
    private Date CreateTime;
}
