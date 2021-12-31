package com.example.sdp3final.repository;

import com.example.sdp3final.model.Login;
import com.example.sdp3final.model.WishList;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WishListRepository  extends CrudRepository<WishList,Integer> {
}
