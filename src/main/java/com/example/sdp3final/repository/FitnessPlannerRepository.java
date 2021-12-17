package com.example.sdp3final.repository;

import com.example.sdp3final.model.Admin;
import com.example.sdp3final.model.FitnessPlanner;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FitnessPlannerRepository extends CrudRepository<FitnessPlanner,Integer> {
}
