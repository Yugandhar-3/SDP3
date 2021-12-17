package com.example.sdp3final.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="food")
@Entity
public class FoodType {
    @Id
    private String fname;
    private String fquantity;
    private String fsize;
    private String fcarbo;
    private String fprotein;
    private String fvitamins;

    public FoodType(String fname, String fquantity, String fsize, String fcarbo, String fprotein, String fvitamins) {
        super();
        this.fname = fname;
        this.fquantity = fquantity;
        this.fsize = fsize;
        this.fcarbo = fcarbo;
        this.fprotein = fprotein;
        this.fvitamins = fvitamins;
    }

    public FoodType() {
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFquantity() {
        return fquantity;
    }

    public void setFquantity(String fquantity) {
        this.fquantity = fquantity;
    }

    public String getFsize() {
        return fsize;
    }

    public void setFsize(String fsize) {
        this.fsize = fsize;
    }

    public String getFcarbo() {
        return fcarbo;
    }

    public void setFcarbo(String fcarbo) {
        this.fcarbo = fcarbo;
    }

    public String getFprotein() {
        return fprotein;
    }

    public void setFprotein(String fprotein) {
        this.fprotein = fprotein;
    }

    public String getFvitamins() {
        return fvitamins;
    }

    public void setFvitamins(String fvitamins) {
        this.fvitamins = fvitamins;
    }

    @Override
    public String toString() {
        return "FoodType{" +
                "fname='" + fname + '\'' +
                ", fquantity='" + fquantity + '\'' +
                ", fsize='" + fsize + '\'' +
                ", fcarbo='" + fcarbo + '\'' +
                ", fprotein='" + fprotein + '\'' +
                ", fvitamins='" + fvitamins + '\'' +
                '}';
    }
}
