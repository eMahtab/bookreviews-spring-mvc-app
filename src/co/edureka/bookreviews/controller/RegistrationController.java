package co.edureka.bookreviews.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import co.edureka.bookreviews.dao.RegistrationDAO;


@Controller
public class RegistrationController {

private RegistrationDAO registrationDAO;
	
	@Autowired
	public void setRegistrationDAO(RegistrationDAO registrationDAO){
		this.registrationDAO=registrationDAO;
	}
	
	@RequestMapping("/checkRegister")
	public ModelAndView checkRegister(@RequestParam Map<String,String> param,HttpServletRequest request){
	     ModelAndView mv=null;
	     System.out.println("Username "+param.get("username"));
	     System.out.println("Password "+param.get("password"));
	     System.out.println("Email "+param.get("email"));
	     
	     registrationDAO.createAccount(param.get("username"), param.get("email"),param.get("password"));
	     mv=new ModelAndView("register","message","Congratulation "+param.get("username")+" your account have been created ");
	     return mv;
	}
}
