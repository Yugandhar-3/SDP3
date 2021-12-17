package com.example.sdp3final.services;

import com.example.sdp3final.model.BMI;
import com.example.sdp3final.model.Plans;
import com.example.sdp3final.model.User;
import com.example.sdp3final.repository.BMIRepository;
import com.example.sdp3final.repository.PlansRepository;
import com.example.sdp3final.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PlansRepository plansRepository;

    @Autowired
    private BMIRepository bmiRepository;

    public void savemyuser(User user){
        userRepository.save(user);
    }
    public User findByEmailAndPassword(String email,String password){
        return userRepository.findByEmailAndPassword(email,password);
    }

    //calculate bmi
    public BMI calculatebmi(String username,String weigth,String height,String weigtype,String heigtype,int id)
    {
        BMI b=new BMI();
        b.setUsername(username);
        b.setId(id);
        b.setWeight(weigth);
        b.setHeight(height);
        b.setWeightype(weigtype);
        b.setHeigtype(heigtype);
        float w1= Float.parseFloat(weigth);
        float h1= Float.parseFloat(height);
        if(heigtype.equalsIgnoreCase("inches"))
        {
            h1=(float)(h1*2.54);
        }
        float res=0;
        if(weigtype.equalsIgnoreCase("pounds"))
        {
            res=w1/(float) Math.pow((double) h1,2.0);
            res=res*703;
        }
        else if(weigtype.equalsIgnoreCase("kg"))
        {
            res=w1/(float) Math.pow((double) h1,2.0);
        }
        b.setBmivalue(String.valueOf(res));
        String response=null;
        if(res<18.5)
        {
            response="Underweight";
        }
        else if(res>=18.5 && res<=24.9)
        {
            response="Normal weight";
        }
        else if(res>=25 && res<=29.9)
        {
            response="Overweight";
        }
        else if(res>=30)
        {
            response="Obesity";
        }
        b.setResponse(response);
        bmiRepository.save(b);
        return b;

    }


    //view all plans for customer
    public List<Plans> showAllDietPlanss()
    {
        List<Plans> plansList=new ArrayList<>();
        for (Plans plans:plansRepository.findAll()) {
            plansList.add(plans);
        }
        return plansList;
    }
}