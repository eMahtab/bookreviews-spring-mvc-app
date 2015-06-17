package co.edureka.bookreviews.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.edureka.bookreviews.dao.BookDAO;
import co.edureka.bookreviews.model.Book;
import co.edureka.bookreviews.model.FormData;



@Controller
public class BookFindController {

    private BookDAO bookDAO;
    	
	@Autowired
	public void setBookDAO(BookDAO bookDAO){
		this.bookDAO=bookDAO;
	}
	
	@RequestMapping(value="/findBooks",method =RequestMethod.GET)
	public String findBooks(){
		
		System.out.println("All Category Clicked");
		return "search";
	}
	
/*	@RequestMapping(value="/loadData",method =RequestMethod.GET)
	public @ResponseBody ModelAndView loadData(@RequestParam Map<String,String> param,HttpServletRequest request){
		Map<String,Object>data=new HashMap<String,Object>();
		
		List<String> authors=new ArrayList<String>();		
		authors.add("ASDFG"); authors.add("ASDF22G"); authors.add("ASD22FG"); authors.add("ASD232FG");
		java.util.Collections.shuffle(authors);		
		request.getSession().setAttribute("search", authors);		
		data.put("writers",authors);		
		
		System.out.println("Parameter criteria "+param.get("criteria"));
		return new ModelAndView("search","data",data);
	}*/
	
	
	@RequestMapping(value="/loadData",method =RequestMethod.GET)
	public @ResponseBody List<FormData> loadData(@RequestParam(value = "stateName", required = true) String state){
		
		System.out.println("Parameter criteria "+state);
		if(state.equals("author"))
		return bookDAO.getAllDistinctAuthors();
		else if(state.equals("category")){
			return bookDAO.getAllDistinctCategory();
		}
		else if(state.equals("publisher")){
			return bookDAO.getAllDistinctPublishers();
		}
		return null;
	}
	
	
	
	
	@RequestMapping("/getBooks")
	public ModelAndView getBooks(@RequestParam Map<String,String> param){	
		
		String criteria=param.get("criteria");
		String term=param.get("term");
		List<Book> list=null;
		System.out.println("Crieteria "+param.get("criteria"));		
		System.out.println("Term "+param.get("term"));	
		
		
		if(criteria.equals("author")){
			list=bookDAO.getAuthorsBooks(term);
		}
		else if(criteria.equals("publisher")){
			list=bookDAO.getPublisherBooks(term);
		}
		else if(criteria.equals("category")){
			list=bookDAO.getCategoryBooks(term);
		}
	
		
		Map<String,Object>data=new HashMap<String,Object>();
		data.put("list",list);
		return new ModelAndView("search","data",data);
	}
	
	
	
	
	/*
	 * @RequestMapping(value = "/cities", method = RequestMethod.GET)
	public @ResponseBody
	Set<City> citiesForState(
			@RequestParam(value = "stateName", required = true) String state) {
		logger.debug("finding cities for state " + state);
		return this.geoService.findCitiesForState(state);
	}
	 * 
	 */
	
}
