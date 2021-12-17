package com.example.sdp3final.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "plans")
@Entity
public class Plans {
    @Id
    private String pname;
    private String pamount;
    private String description;

    public Plans(String pname, String pamount, String description) {
        super();
        this.pname = pname;
        this.pamount = pamount;
        this.description = description;
    }

    public Plans() {
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPamount() {
        return pamount;
    }

    public void setPamount(String pamount) {
        this.pamount = pamount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Plans{" +
                "pname='" + pname + '\'' +
                ", amount=" + pamount +
                ", description='" + description + '\'' +
                '}';
    }
}
