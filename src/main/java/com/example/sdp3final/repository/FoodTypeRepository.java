package com.example.sdp3final.repository;

import com.example.sdp3final.model.FoodType;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodTypeRepository extends CrudRepository<FoodType,String> {
}
