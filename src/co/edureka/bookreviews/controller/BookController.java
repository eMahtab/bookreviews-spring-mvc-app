package co.edureka.bookreviews.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.edureka.bookreviews.dao.BookDAO;
import co.edureka.bookreviews.model.Book;
import co.edureka.bookreviews.model.Comment;

@Controller
public class BookController {
	private BookDAO bookDAO;	
	@Autowired
	public void setBookDAO(BookDAO bookDAO){
		this.bookDAO=bookDAO;
	}	
	
	@RequestMapping("/books")
	public ModelAndView getBookDetails(@RequestParam Map<String,String> param,HttpServletRequest request){
		Map<String,Object>data=new HashMap<String,Object>();
		
		request.getSession().setAttribute("book_name",param.get("book"));
		
		String book_title=param.get("book");
		System.out.println("Book Title "+book_title);
		Book book=bookDAO.findABookByName(book_title);
		
		List<Comment> commentList=bookDAO.getComments(param.get("book"));
		for(Comment c:commentList){
			System.out.println(c.getComment());
		}
		data.put("book", book);
		data.put("comments",commentList );
		
		return new ModelAndView("bookDetails","data",data);
	}
	
	
	@RequestMapping("/saveComment")
	public ModelAndView saveComment(@RequestParam Map<String,String> param,HttpServletRequest request){
		System.out.println(param.get("comments"));
		Comment comment=new Comment();
		comment.setBook_name((String)request.getSession().getAttribute("book_name"));
		comment.setComment(param.get("comments"));
		
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss ");
			Date date = new Date();
			String commentedOn=dateFormat.format(date);
		
		
		System.out.println("Commented On "+commentedOn);
		
		comment.setPosted(commentedOn);
		comment.setUsername((String)request.getSession().getAttribute("username"));
		
		bookDAO.addComment(comment);
		
		
        Map<String,Object>data=new HashMap<String,Object>();		
		
		
		String book_title=(String)request.getSession().getAttribute("book_name");
		System.out.println("Book Title "+book_title);
		Book book=bookDAO.findABookByName(book_title);
		
		List<Comment> commentList=bookDAO.getComments(book_title);
		for(Comment c:commentList){
			System.out.println(c.getComment());
		}
		data.put("book", book);
		data.put("comments",commentList );
		
		
		return new ModelAndView("bookDetails","data",data);
	}
	
	
	
}
