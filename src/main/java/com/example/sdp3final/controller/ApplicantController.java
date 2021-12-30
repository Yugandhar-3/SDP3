package com.example.sdp3final.controller;

import com.example.sdp3final.model.*;
import com.example.sdp3final.repository.LoginRepository;
import com.example.sdp3final.repository.UserRepository;
import com.example.sdp3final.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.paytm.pg.merchant.PaytmChecksum;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Map;
import java.util.TreeMap;

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

    //Profile for Customers
    @RequestMapping("/myprofile")
    public String displayProfile(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String a=request.getSession().getAttribute("username1").toString();
        if(a!=null){
            request.setAttribute("userprofile",userService.findByEmail(a));
            request.setAttribute("mode","PROFILE");
            return "profile";
        }
        else
            return "customerhome";
    }

    @RequestMapping("edit-profile")
    public String editProfile(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String a=request.getSession().getAttribute("username1").toString();
        if(a!=null){
            request.setAttribute("userdetails",userService.findByEmail(a));
            request.setAttribute("mode","EDIT_PROFILE");
            return "edit_profile";
        }
        else{
            return "customerhome";
        }
    }

    @PostMapping("updateuser")
    public String updateProfile(@ModelAttribute User user){
        userService.savemyuser(user);
        return "redirect:/myprofile";
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

   @GetMapping("/paymentform/{pname}/{pamount}")
   // @GetMapping("/paymentform")
    public String displayForm(@PathVariable("pname") String panme,@PathVariable("pamount") String pamount,HttpServletRequest request)
    {
        Plans p=new Plans();
        p.setPname(panme);
        p.setPamount(pamount);
        p.setDescription(" ");
        request.setAttribute("plan",p);
        request.setAttribute("mode","Display_Form");
        return "plans";
    }
    @Autowired
    private PaytmDetailPojo paytmDetailPojo;
    @Autowired
    private Environment env;
    @PostMapping(value = "/submitPaymentDetail")
    public ModelAndView getRedirect(@RequestParam(name = "pname") String pname,
                                    @RequestParam(name = "pamount") String transactionAmount) throws Exception {

        ModelAndView modelAndView = new ModelAndView("redirect:" + paytmDetailPojo.getPaytmUrl());
        TreeMap<String, String> parameters = new TreeMap<>();
        paytmDetailPojo.getDetails().forEach((k, v) -> parameters.put(k, v));
        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
        parameters.put("EMAIL", env.getProperty("paytm.email"));
        parameters.put("ORDER_ID", "715196");
        parameters.put("TXN_AMOUNT", transactionAmount);
        parameters.put("CUST_ID", "55115156");
        String checkSum = getCheckSum(parameters);
        parameters.put("CHECKSUMHASH", checkSum);
        modelAndView.addAllObjects(parameters);
        return modelAndView;
    }
    @PostMapping(value = "/pgresponse")
    public String getResponseRedirect(HttpServletRequest request, Model model) {

        Map<String, String[]> mapData = request.getParameterMap();
        TreeMap<String, String> parameters = new TreeMap<String, String>();
        String paytmChecksum = "";
        for (Map.Entry<String, String[]> requestParamsEntry : mapData.entrySet()) {
            if ("CHECKSUMHASH".equalsIgnoreCase(requestParamsEntry.getKey())){
                paytmChecksum = requestParamsEntry.getValue()[0];
            } else {
                parameters.put(requestParamsEntry.getKey(), requestParamsEntry.getValue()[0]);
            }
        }
        String result;

        boolean isValideChecksum = false;
        System.out.println("RESULT : "+parameters.toString());
        try {
            isValideChecksum = validateCheckSum(parameters, paytmChecksum);
            if (isValideChecksum && parameters.containsKey("RESPCODE")) {
                if (parameters.get("RESPCODE").equals("01")) {
                    result = "Payment Successful";
                } else {
                    result = "Payment Failed";
                }
            } else {
                result = "Checksum mismatched";
            }
        } catch (Exception e) {
            result = e.toString();
        }
        System.out.println(result);
//        model.addAttribute("result",result);
        request.setAttribute("result",result);
        parameters.remove("CHECKSUMHASH");
        model.addAttribute("parameters",parameters);
        return "report";
    }

    private boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
        return PaytmChecksum.verifySignature(parameters,
                paytmDetailPojo.getMerchantKey(), paytmChecksum);
    }
    private String getCheckSum(TreeMap<String, String> parameters) throws Exception {
        return PaytmChecksum.generateSignature(parameters, paytmDetailPojo.getMerchantKey());
    }


}