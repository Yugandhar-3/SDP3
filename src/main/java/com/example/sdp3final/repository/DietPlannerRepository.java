package com.example.sdp3final.repository;

import com.example.sdp3final.model.DietPlanner;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DietPlannerRepository extends CrudRepository<DietPlanner,Integer> {
    DietPlanner findDietPlannerById(int id);

}
