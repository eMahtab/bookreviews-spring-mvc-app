package co.edureka.bookreviews.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.edureka.bookreviews.dao.BookDAO;
import co.edureka.bookreviews.dao.BookJsonObject;
import co.edureka.bookreviews.model.Book;



@Controller
public class BookSearchController {

    private BookDAO bookDAO;
  
	@Autowired
	public void setBookDAO(BookDAO bookDAO){
		this.bookDAO=bookDAO;
	}
	
	@RequestMapping(value="/allCategory",method =RequestMethod.GET)
	public String allCategory(@ModelAttribute("book") Book book, BindingResult result,ModelMap model, HttpServletRequest
		    request, HttpServletResponse response){
		System.out.println("All Category Clicked");
		return "booksBySearch";
	}
	
	@RequestMapping(value="/renderBooks",method =RequestMethod.GET,produces = "application/json")
	public @ResponseBody String renderBooks(@RequestParam Map<String,String> param,HttpServletRequest request){
		
		System.out.println(param.get("category"));		
		return null;
	}
	
	
	
	@RequestMapping(value="/searchBooks",method =RequestMethod.GET,produces = "application/json")
	public @ResponseBody String searchBooks(@RequestParam Map<String,String> param,HttpServletRequest request){
		
		Integer pageNumber = 0;
    	if (null != request.getParameter("iDisplayStart"))
    	pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart"))/10)+1;
        System.out.println("Page Number : "+pageNumber);
    	//Fetch search parameter
    	//String searchParameter = request.getParameter("sSearch");
    
    	//Fetch Page display length
    	Integer pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
		System.out.println("Page Display Length : "+pageDisplayLength);	
	
		
		//int startIndex=;
		//int lastIndex=0;
	List<Book> displayList=null;
	int lowerLimit=(pageNumber-1)*10;
	int upperLimit=pageNumber*10-1;
	List<Book> booksList=bookDAO.listAllBooks();
	try{
	displayList=booksList.subList(lowerLimit,upperLimit);
	}catch(Exception ex){
		displayList=booksList.subList(0,9);
		Collections.shuffle(displayList);
	}
	
	
	
	System.out.println("Fetching : "+lowerLimit+" - "+upperLimit);
	
	//Search functionality: Returns filtered list based on search parameter
	//personsList = getListBasedOnSearchParameter(searchParameter,personsList);
	BookJsonObject bookJsonObject = new BookJsonObject();
	//Set Total display record
	bookJsonObject.setiTotalDisplayRecords(500);
	//Set Total record
	bookJsonObject.setiTotalRecords(500);
	
	bookJsonObject.setAaData(displayList);
	
	Gson gson = new GsonBuilder().setPrettyPrinting().create();
	String json2 = gson.toJson(bookJsonObject);
	System.out.println("Json "+json2);
	return json2;
	
	
	}
	
}
