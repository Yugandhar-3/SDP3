package com.example.sdp3final.model;

import javax.persistence.*;

@Entity
@Table(name = "wishlist")
public class WishList {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  int id;
    private String uname;
    private String fname;
    private String quantity;
    private String totCarb;
    private String totProt;

    public WishList() {
    }

    public WishList(int id, String uname, String fname, String quantity, String totCarb, String totProt) {
        this.id = id;
        this.uname = uname;
        this.fname = fname;
        this.quantity = quantity;
        this.totCarb = totCarb;
        this.totProt = totProt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getTotCarb() {
        return totCarb;
    }

    public void setTotCarb(String totCarb) {
        this.totCarb = totCarb;
    }

    public String getTotProt() {
        return totProt;
    }

    public void setTotProt(String totProt) {
        this.totProt = totProt;
    }
}
