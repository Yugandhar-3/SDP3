package com.example.sdp3final.controller;

import com.example.sdp3final.model.*;
import com.example.sdp3final.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/back")
    public String BackToAdminPage(HttpServletRequest request){
        return "adminhome";
    }

    @RequestMapping("/logout")
    public String BackToWelcomePage(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "welcomepage";
    }

    @RequestMapping("/adminlogin")
    public String ADMINLogin(HttpServletRequest request){
        request.setAttribute("mode","MODE_ADMINLOGIN");
        return "welcomepage";
    }

    @PostMapping("/admin-login")
    public String LoginAdmin(@ModelAttribute Admin admin, HttpServletRequest request){
        if(adminService.findByEmailAndPassword(admin.getEmail(),admin.getPassword())!=null){
            String email=admin.getEmail().toString();
            request.getSession().setAttribute("username2", email);
            return "adminhome";
        }
        else{
            request.setAttribute("error","Invalid Username or Password");
            request.setAttribute("mode","MODE_ADMINLOGIN");
            return "welcomepage";
        }
    }

//ADDING NEW DIET PLANNER
    @RequestMapping("/addnewdietplanner")
    public String Adddietplanner(HttpServletRequest request){
        request.setAttribute("mode","ADD_DIETPLANNER");
        return "dietplanner";
    }

    @PostMapping("/save-dietplanner")
    public String AddnewDietPlanner(@ModelAttribute DietPlanner dietPlanner,HttpServletRequest request)
    {
        if(dietPlanner!=null)
        {
            adminService.savedietplanner(dietPlanner);
        }
        return "adminhome";
    }

    //ADDING NEW FITNESS PLANNER
    @RequestMapping("/addnewfitnessplanner")
    public String Addfitnessplanner(HttpServletRequest request){
        request.setAttribute("mode","ADD_FITNESSPLANNER");
        return "fitnessplanner";
    }

    @PostMapping("/save-fitnessplanner")
    public String AddnewFitnessPlanner(@ModelAttribute FitnessPlanner fitnessPlanner, HttpServletRequest request)
    {
        if(fitnessPlanner!=null)
        {
            adminService.savefitnessplanner(fitnessPlanner);
        }
        return "adminhome";
    }

     //ADDING NEW PLANS
    @RequestMapping("/addnewplan")
    public String AddPlans(HttpServletRequest request){
        request.setAttribute("mode","ADD_PLANS");
        return "adminhome";
    }

    @PostMapping("/save-plans")
    public String AddNewPlan(@ModelAttribute Plans plans, HttpServletRequest request)
    {
        if(plans!=null)
        {
            adminService.savenewplan(plans);
        }
        return "adminhome";
    }

    @GetMapping("viewplans")
    public String viewPlans(HttpServletRequest request){
        request.setAttribute("plans",adminService.showAllPlans());
        request.setAttribute("mode","ALL_PLANS");
        return "viewallplans";
    }

    //ADDING NEW FOOD TYPE
    @RequestMapping("/addfood")
    public String AddFood(HttpServletRequest request){
        request.setAttribute("mode","ADD_FOODTYPE");
        return "food";
    }

    @PostMapping("/save-foodtype")
    public String AddNewFood(@ModelAttribute FoodType foodType, HttpServletRequest request)
    {
        if(foodType!=null)
        {
            adminService.savenewfood(foodType);
        }
        return "adminhome";
    }

    //VIEWING ALL DIET PALNNERS
    @GetMapping("/viewalldietplanners")
    public String showAllDietPlanners(HttpServletRequest request){
        request.setAttribute("dietplanners",adminService.showAllDietPlanners());
        request.setAttribute("mode","ALL_DIETPLANNERS");
        return "viewalldietplanners";
    }

    //Edit Diet Planner
    @GetMapping("/edit-user/{id}")
    public String showEditDietPlannerForm(@PathVariable("id") int id, HttpServletRequest request){
        request.setAttribute("Dietplanner",adminService.findDietplannerById(id));
        request.setAttribute("mode","EDIT_MODE");
        return "viewalldietplanners";
    }

    //Update Diet Planner
    @PostMapping("updatedietplanner")
    public String updateDietPlanner(@ModelAttribute DietPlanner dp, HttpServletRequest request){
        adminService.savedietplanner(dp);
        return "adminhome";
    }

    //Delete Diet Planner
    @GetMapping("delete-user/{id}")
    public String deleteDietPlanner(@PathVariable("id") int id, HttpServletRequest request){
        adminService.deleteDietPlannerById(id);
        return "adminhome";
    }

    //VIEWING ALL FITNESS PLANNERS
    @GetMapping("/viewallfitnessplanners")
    public String showAllFitnessPlanners(HttpServletRequest request){
        request.setAttribute("fitnessplanners",adminService.showAllFitnessPlanners());
        request.setAttribute("mode","ALL_FITNESSPLANNERS");
        return "viewallfitnessplanners";
    }

    //Edit Fitness Trainer
    @GetMapping("/edit-fuser/{id}")
    public String showEditFitnessTrainerForm(@PathVariable("id") int id, HttpServletRequest request){
        request.setAttribute("FitnessTrainer",adminService.findFitnessPlanner(id));
        request.setAttribute("mode","EDIT_MODE");
        return "viewallfitnessplanners";
    }

    //Update Fitness Planner
    @PostMapping("updatefitnessplanner")
    public String updateFitnessPlanner(@ModelAttribute FitnessPlanner fp, HttpServletRequest request){
        adminService.savefitnessplanner(fp);
        return "adminhome";
    }

    //Delete FitnessPlanner
    @GetMapping("delete-fuser/{id}")
    public String deleteFitnessPlanner(@PathVariable("id") int id, HttpServletRequest request){
        adminService.deleteFit(id);
        return "adminhome";
    }

    //VIEWING ALL FOODTYPES
    @GetMapping("/viewallfood")
    public String showAllFoodTypes(HttpServletRequest request){
        request.setAttribute("foodtypes",adminService.showAllFoodTypes());
        request.setAttribute("mode","ALL_FOODTYPES");
        return "viewallfood";
    }

}
