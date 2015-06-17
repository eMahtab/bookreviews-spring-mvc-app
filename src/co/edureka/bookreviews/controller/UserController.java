package co.edureka.bookreviews.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

  @Controller
  @RequestMapping("/user")
  public class UserController {	
	@RequestMapping(method = RequestMethod.GET)
	public String welcomeUser(@RequestParam("name") String name, Model model) {
		String message = "Welcome " + name + "!";
		System.out.println("dfghjk"+message);
		model.addAttribute("message", message);
		return "welcome";
	}
  }

  
  
