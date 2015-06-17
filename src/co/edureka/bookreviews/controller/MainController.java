package co.edureka.bookreviews.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

  @Controller
  public class MainController {		
	@RequestMapping( value={"/", "/home"} )
	public String getWelcomePage(){
				return "home";
	}	
	@RequestMapping(method=RequestMethod.GET,value="/login")
	public String getLoginPage(){		
		return "login";
	}	
	@RequestMapping("/register")
	public String getRegisterPage(){		
		return "register";
	}		
	@RequestMapping("/logout")
	public ModelAndView performLogout(HttpServletRequest request){
			request.getSession().invalidate();	
		return new ModelAndView("login","logoutMessage","You have been successfully logged out ");
	}
  }

  
  
  
  