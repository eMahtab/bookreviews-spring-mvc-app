package co.edureka.bookreviews.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.edureka.bookreviews.dao.LoginDAO;
import co.edureka.bookreviews.model.User;


@Controller
public class LoginController {

private LoginDAO loginDAO;
	
	@Autowired
	public void setLoginDAO(LoginDAO loginDAO){
		this.loginDAO=loginDAO;
	}
	
	@RequestMapping("/checkLogin")
	public ModelAndView checkLogin(@RequestParam Map<String,String> param,HttpServletRequest request){
		System.out.println("Username "+param.get("username"));
		System.out.println("Password "+param.get("password"));
		int exists=1;
		User user=null;
		ModelAndView mv=null;
		
		try{
		user=loginDAO.checkCredentials(param.get("username"),param.get("password"));
		}catch(EmptyResultDataAccessException noUser){
			exists=0;
		}
		
	
		if(exists==1){
			System.out.println(user.getUsername()+" authenticated");
			request.getSession().setAttribute("username", user.getUsername());
			mv=new ModelAndView("home","message","");
			
		}if(exists==0){
			String message="Invalid Username or Password !";
			System.out.println(message);
			mv=new ModelAndView("login","message",message);
		}
	
		return mv;
	}
	
}
