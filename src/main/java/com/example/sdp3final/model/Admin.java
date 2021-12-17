package com.example.sdp3final.model;

import org.springframework.context.annotation.Primary;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="admin")
@Entity
public class Admin {
    @Id
    private  String email;
    private String password;
    public Admin(String password) {
        super();
        this.password = password;
    }

    public Admin() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
