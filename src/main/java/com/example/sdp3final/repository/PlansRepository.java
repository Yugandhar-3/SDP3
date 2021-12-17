package com.example.sdp3final.repository;

import com.example.sdp3final.model.Plans;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PlansRepository extends CrudRepository<Plans,String> {
}
