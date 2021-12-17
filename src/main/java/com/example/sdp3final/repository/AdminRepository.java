package com.example.sdp3final.repository;

import com.example.sdp3final.model.Admin;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends CrudRepository<Admin,String> {
     Admin findByEmailAndPassword(String email, String password);
}
