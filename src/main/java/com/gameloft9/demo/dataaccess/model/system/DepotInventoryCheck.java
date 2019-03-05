package com.gameloft9.demo.dataaccess.model.system;

import lombok.Data;

@Data
public class DepotInventoryCheck {
    private String Id;
    private String SourceUser;
    private String SourceTime;
    private String RecordNumber;
    private String State;
}
