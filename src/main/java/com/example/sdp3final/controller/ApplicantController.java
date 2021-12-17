package com.example.sdp3final.controller;

import com.example.sdp3final.model.Admin;
import com.example.sdp3final.model.BMI;
import com.example.sdp3final.model.Login;
import com.example.sdp3final.model.User;
import com.example.sdp3final.repository.LoginRepository;
import com.example.sdp3final.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

@Controller
@Transactional
public class ApplicantController {
    @Autowired
    private UserService userService;

    @Autowired
    private LoginRepository loginRepository;

    @RequestMapping("/")
    public String welcome(HttpServletRequest request){
        request.setAttribute("mode","MODE_HOME");
        return "welcomepage";
    }

    @RequestMapping("/home")
    public String Home(HttpServletRequest request){
        return "customerhome";
    }


    @RequestMapping("/register")
    public String registration(HttpServletRequest request){
        request.setAttribute("mode","MODE_REGISTER");
        return "welcomepage";
    }

    @PostMapping("/save-user")
    public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        String s1=user.getPassword();
        String s2=user.getRetypepassword();
        if(s1.equals(s2)) {
            userService.savemyuser(user);
            request.setAttribute("mode","MODE_LOGIN");
            return "welcomepage";
        }
        request.setAttribute("mode","MODE_HOME");
        return "welcomepage";
    }

    @RequestMapping("/login")
    public String Login(HttpServletRequest request){
        request.setAttribute("mode","MODE_LOGIN");
        return "welcomepage";
    }

    @RequestMapping("/login-user")
    public String LoginUser(@ModelAttribute User user, HttpServletRequest request){
        if(userService.findByEmailAndPassword(user.getEmail(),user.getPassword())!=null){
            String email=user.getEmail().toString();
            String password=user.getPassword().toString();
            loginRepository.save(new Login(email,password));
            request.getSession().setAttribute("username1", email);
            return "customerhome";
        }
        else{
            request.setAttribute("error","Invalid Username or Password");
            request.setAttribute("mode","MODE_LOGIN");
            return "welcomepage";
        }
    }

    //Log OUT for Customers
    @RequestMapping("/logout-customer")
    public String BackToWelcomePage(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String a=request.getSession().getAttribute("username1").toString();
        loginRepository.deleteAllByEmail(a);
        session.invalidate();
        return "customerhome";
    }

    //showing plans
    @GetMapping("/premiumplans")
    public String showAllDietPlanners(HttpServletRequest request){
        HttpSession session=request.getSession(false);
        Object s=request.getSession().getAttribute("username1");
        if(s!=null) {
            request.setAttribute("planss", userService.showAllDietPlanss());
            request.setAttribute("mode", "ALL_PLANS");
            return "plans";
        }
        else
            return "customerhome";
    }

    //CALCULATE BMI
    @RequestMapping("/calculate")
    public String Bmi(HttpServletRequest request){
        HttpSession session=request.getSession(false);
        Object s=request.getSession().getAttribute("username1");
        if(s!=null) {
            request.setAttribute("mode", "MODE_BMI");
            return "bmi";
        }
        else
          return "customerhome";
    }

    @PostMapping("/calculate-bmi")
    public String CalculateBmi(@ModelAttribute @Validated BMI bmi,BindingResult bindingResult, HttpServletRequest request)
    {
        String username=request.getSession().getAttribute("username1").toString();
        if(bmi.getHeigtype()!=null && username!=null) {

            BMI B = userService.calculatebmi(username,bmi.getWeight(), bmi.getHeight(), bmi.getWeightype(), bmi.getHeigtype(), bmi.getId());

            request.setAttribute("bmi",B);
            request.setAttribute("mode", "VIEW-BMI");
            return "bmi";
        }
        return "customerhome";
    }


}