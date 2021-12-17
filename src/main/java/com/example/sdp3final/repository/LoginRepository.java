package com.example.sdp3final.repository;

import com.example.sdp3final.model.Login;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoginRepository extends CrudRepository<Login,Integer> {

    List<Login> findAll();
    void deleteAllByEmail(String username1);
    Object findByEmail(String email);
}
