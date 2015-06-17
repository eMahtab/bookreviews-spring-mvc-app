package co.edureka.bookreviews.model;

import java.util.ArrayList;
import java.util.List;

public class Book {
	
	private String name;
	private String publisher;
	
	public String getPublisher(){
		return this.publisher;
	}
	
	public void setPublisher(String str){
		publisher=str;
	}
	
	private String published_date;
	
	public String getPublished_date() {
		return published_date;
	}

	public void setPublished_date(String published_date) {
		this.published_date = published_date;
	}

	private List<String> authorsName;
	
	public List<String> getAuthorsName() {
		return authorsName;
	}

	public void setAuthorsName(List<String> authorsName) {
		this.authorsName = authorsName;
	}

	private String bookImageName;
	
	public String getBookImageName(){
		return bookImageName; 
	}
	
	public void setBookImageName(String s){
		this.bookImageName=s;
	}
	
	private String who_this_book_is_for;
	
	private ArrayList<String> table_of_contents;
	
	private String what_you_will_learn;
	
	private ArrayList<String> about_the_book;
	
	private int price;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWho_this_book_is_for() {
		return who_this_book_is_for;
	}

	public void setWho_this_book_is_for(String who_this_book_is_for) {
		this.who_this_book_is_for = who_this_book_is_for;
	}

	public ArrayList<String> getTable_of_contents() {
		return table_of_contents;
	}

	public void setTable_of_contents(ArrayList<String> table_of_contents) {
		this.table_of_contents = table_of_contents;
	}

	public String getWhat_you_will_learn() {
		return what_you_will_learn;
	}

	public void setWhat_you_will_learn(String what_you_will_learn) {
		this.what_you_will_learn = what_you_will_learn;
	}

	public ArrayList<String> getAbout_the_book() {
		return about_the_book;
	}

	public void setAbout_the_book(ArrayList<String> about_the_book) {
		this.about_the_book = about_the_book;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	private String isbn;
	
	

}
