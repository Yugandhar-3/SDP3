package com.example.sdp3final.model;

import javax.persistence.*;

@Entity
@Table(name = "bmi")
public class BMI {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String username;
    private String weight;
    private String weightype;
    private String height;
    private String heigtype;
    private String bmivalue;
    private String response;

    public BMI() {
    }

    public BMI(String username,String weight, String weightype, String height, String heigtype, String bmivalue, String response) {
        super();
        this.username=username;
        this.weight = weight;
        this.weightype = weightype;
        this.height = height;
        this.heigtype = heigtype;
        this.bmivalue = bmivalue;
        this.response = response;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getWeightype() {
        return weightype;
    }

    public void setWeightype(String weightype) {
        this.weightype = weightype;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getHeigtype() {
        return heigtype;
    }

    public void setHeigtype(String heigtype) {
        this.heigtype = heigtype;
    }

    public String getBmivalue() {
        return bmivalue;
    }

    public void setBmivalue(String bmivalue) {
        this.bmivalue = bmivalue;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    @Override
    public String toString() {
        return "BMI{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", weight='" + weight + '\'' +
                ", weightype='" + weightype + '\'' +
                ", height='" + height + '\'' +
                ", heigtype='" + heigtype + '\'' +
                ", bmivalue='" + bmivalue + '\'' +
                ", response='" + response + '\'' +
                '}';
    }
}
