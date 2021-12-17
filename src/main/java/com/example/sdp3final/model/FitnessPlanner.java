package com.example.sdp3final.model;

import javax.persistence.*;

@Entity
@Table(name = "fitnessplanner")
public class FitnessPlanner {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String gender;
    private String experience;
    private String address;
    private String password;

    public FitnessPlanner(String fullname, String email, String phone, String gender, String experience, String address, String password) {
        super();
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.gender = gender;
        this.experience = experience;
        this.address = address;
        this.password = password;
    }

    public FitnessPlanner() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "DietPlanner{" +
                "id=" + id +
                ", fullname='" + fullname + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", gender='" + gender + '\'' +
                ", experience=" + experience +
                ", address='" + address + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
