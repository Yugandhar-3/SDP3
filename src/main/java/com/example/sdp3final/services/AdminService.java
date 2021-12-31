package com.example.sdp3final.services;

import com.example.sdp3final.model.*;
import com.example.sdp3final.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private DietPlannerRepository dietPlannerRepository;
    @Autowired
    private FitnessPlannerRepository fitnessPlannerRepository;
    @Autowired
    private PlansRepository plansRepository;
    @Autowired
    private FoodTypeRepository foodTypeRepository;


    public Admin findByEmailAndPassword(String email, String password){
        return adminRepository.findByEmailAndPassword(email,password);
    }

    //saving dietplanner
    public void savedietplanner(DietPlanner dietPlanner)
    {
        dietPlannerRepository.save(dietPlanner);
    }

    public DietPlanner findDietplannerById(int id){
        DietPlanner d=dietPlannerRepository.findDietPlannerById(id);
        if(d!=null)
          return d;
        else
            return null;
    }

    public void deleteDietPlannerById(int id){
        dietPlannerRepository.deleteById(id);
    }

    public FitnessPlanner findFitnessPlanner(int id){
        FitnessPlanner f = fitnessPlannerRepository.findFitnessPlannerById(id);
        if(f!=null)
            return f;
        else
            return null;

    }

    public void deleteFit(int id){
        fitnessPlannerRepository.deleteById(id);
    }
    //saving fitnessplanner
    public void savefitnessplanner(FitnessPlanner fitnessPlanner)
    {
        fitnessPlannerRepository.save(fitnessPlanner);
    }

    //saving new plan
    public void savenewplan(Plans plans)
    {
        plansRepository.save(plans);
    }

    //saving new food type
    public void savenewfood(FoodType foodType){ foodTypeRepository.save(foodType);}

    //Displaying all DietPlanners
    public List<DietPlanner> showAllDietPlanners()
    {
        List<DietPlanner> dietPlanners=new ArrayList<>();
        for (DietPlanner dietPlanner:dietPlannerRepository.findAll())
        {
            dietPlanners.add(dietPlanner);
        }
        return dietPlanners;
    }

    //Displaying All FitnessPlanners
    public List<FitnessPlanner> showAllFitnessPlanners()
    {
        List<FitnessPlanner> fitnessPlanners=new ArrayList<>();
        for (FitnessPlanner fitnessPlanner:fitnessPlannerRepository.findAll())
        {
            fitnessPlanners.add(fitnessPlanner);
        }
        return fitnessPlanners;
    }

    //Displaying All FoodTypes
    public List<FoodType> showAllFoodTypes()
    {
        List<FoodType> foodTypes=new ArrayList<>();
        for (FoodType foodType:foodTypeRepository.findAll())
        {
            foodTypes.add(foodType);
        }
        return foodTypes;
    }

    //Displaying all Plans
    public List<Plans> showAllPlans(){
        List<Plans> plans = new ArrayList<>();
        for (Plans plan:plansRepository.findAll()){
            plans.add(plan);
        }
        return plans;
    }

}
