package com.example.sdp3final.repository;

import com.example.sdp3final.model.BMI;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BMIRepository extends CrudRepository<BMI,Integer> {
}
