package com.example.sdp3final.repository;


import com.example.sdp3final.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<User,Integer> {

    User findByEmailAndPassword(String email,String password);
    User findById(int id);
    User findByEmail(String email);


}