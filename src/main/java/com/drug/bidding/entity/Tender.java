package com.drug.bidding.entity;

import java.util.Date;

public class Tender {
    private String tenderId;
    private String drugName;
    private String manufacturer;
    private String packagingRequirements;
    private Integer totalQuantity;
    private Date deadline;
    private Double deposit;
    private String status;
    private Date createTime;
    
    public String getTenderId() {
        return tenderId;
    }
    public void setTenderId(String tenderId) {
        this.tenderId = tenderId;
    }
    public String getDrugName() {
        return drugName;
    }
    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }
    public String getManufacturer() {
        return manufacturer;
    }
    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }
    public String getPackagingRequirements() {
        return packagingRequirements;
    }
    public void setPackagingRequirements(String packagingRequirements) {
        this.packagingRequirements = packagingRequirements;
    }
    public Integer getTotalQuantity() {
        return totalQuantity;
    }
    public void setTotalQuantity(Integer totalQuantity) {
        this.totalQuantity = totalQuantity;
    }
    public Date getDeadline() {
        return deadline;
    }
    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
    public Double getDeposit() {
        return deposit;
    }
    public void setDeposit(Double deposit) {
        this.deposit = deposit;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}