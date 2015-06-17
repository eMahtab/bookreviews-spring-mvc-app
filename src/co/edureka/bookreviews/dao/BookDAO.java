package co.edureka.bookreviews.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.sql.DataSource;
import org.apache.commons.lang.WordUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import co.edureka.bookreviews.model.Book;
import co.edureka.bookreviews.model.Comment;
import co.edureka.bookreviews.model.FormData;

@Component("bookDAO")
public class BookDAO {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);

	}

	public Book findABookByName(String s) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("name", s);

		return (Book) jdbc.queryForObject(
				"select * from books where name=:name", params,
				new RowMapper<Book>() {

					public Book mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						Book book = new Book();

						book.setIsbn(rs.getString("isbn"));
						String bookName = WordUtils.capitalize(
								rs.getString("name"), new char[] { '-' });
						bookName = bookName.replace('-', ' ');
						book.setName(bookName);

						book.setBookImageName(rs.getString("name"));

						String authors = rs.getString("authors");
						ArrayList<String> authorsList = new ArrayList<String>();
						for (String author : authors.split(",")) {
							authorsList.add(author);
						}
						book.setAuthorsName(authorsList);

						book.setPublished_date(rs.getString("published-date"));

						String aboutBook = rs.getString("about_the_book");
						ArrayList<String> aboutTheBook = new ArrayList<String>();
						for (String line : aboutBook.split(";")) {
							aboutTheBook.add(line);
						}
						book.setAbout_the_book(aboutTheBook);
						book.setWho_this_book_is_for(rs
								.getString("who_this_book_is_for"));

						String book_content = rs.getString("table_of_contents");
						ArrayList<String> table_of_contents = new ArrayList<String>();
						for (String line : book_content.split(";")) {
							table_of_contents.add(WordUtils.capitalize(line
									.toLowerCase()));
						}
						book.setTable_of_contents(table_of_contents);

						book.setPrice(rs.getInt("price"));

						System.out.println(book.getName() + "#####"
								+ book.getIsbn() + "#####" + book.getPrice()
								+ "#####" + book.getAuthorsName() + "#####"
								+ book.getPublished_date());

						return book;
					}
				});

	}

	public List<Comment> getComments(String bookName) {
           String sql="select * from comments where book_name='"+bookName+"' ";
           System.out.println("Sql Query "+sql);
		return jdbc.query("select * from comments where book_name='"+bookName+"' ", new RowMapper<Comment>() {

			public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
				Comment comment = new Comment();
				comment.setUsername(rs.getString("username"));
				comment.setComment(rs.getString("comment"));
				comment.setPosted(rs.getString("posted"));						
				return comment;
			}
		});
	}
	
	public void addComment(Comment comment) {	
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("username",comment.getUsername());
		parameters.put("comment", comment.getComment());
		parameters.put("posted", comment.getPosted());
		parameters.put("book_name", comment.getBook_name());
		System.out.println(comment.getUsername()+"##"+comment.getComment()+"##"+comment.getPosted()+"##"+comment.getBook_name());
		jdbc.update("insert into comments(username,posted,book_name,comment) values (:username,:posted,:book_name,:comment) ", parameters);		
	}
	
   public List<Book> searchBooks(String searchCriteria) {
		 String query="select * from books where LOWER(tags) like '%"+searchCriteria+"%' ";
		 System.out.println("MyWork MyQuery "+query);
		return jdbc.query(query, new RowMapper<Book>() {

			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();

				book.setName(rs.getString("name"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getInt("price"));
				System.out.println("Book "+rs.getString("name")+"----"+rs.getString("isbn")+"----"+rs.getInt("price"));
				return book;
			}
		});
	 }
   
   
   
     
   
   
   
   
   public List<Book> listAllBooks() {
		 String query="select * from books  order by name";
		 System.out.println("MyWork MyQuery "+query);
		 return jdbc.query(query, new RowMapper<Book>() {

			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();

				book.setName(rs.getString("name"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getInt("price"));
				System.out.println("Book "+rs.getString("name")+"----"+rs.getString("isbn")+"----"+rs.getInt("price"));
				return book;
			}
		});
	 }
	
   
   public List<FormData> getAllDistinctAuthors(){
	   final Set<String> set=new HashSet<String>();	  
	   String query="select distinct authors from books";
		 System.out.println("MyWork MyQuery "+query);
		 
		 return jdbc.query(query, new RowMapper<FormData>() {

			public FormData mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormData data=null;
				String authors=rs.getString("authors");
				String[] array=authors.split(",");
				for(String author:array){
					if(set.contains(author)==false){
						set.add(author);
						data=new FormData();data.setValue(author);
						System.out.println("Added : "+author);
					}					
				}		
				
				return data;
			}
		});
	   
	   
   }
   
   
   public List<FormData> getAllDistinctCategory(){
	   final Set<String> set=new HashSet<String>();	 
	   String query="select distinct category from books";
		 System.out.println("MyWork MyQuery "+query);
		 
		 return jdbc.query(query, new RowMapper<FormData>() {

			public FormData mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormData data=null;
				String category=rs.getString("category");
				String[] array=category.split(",");
				for(String each:array){
					if(set.contains(each)==false){
						set.add(each);
						data=new FormData();data.setValue(each.toUpperCase());
						System.out.println("Added : "+each);
					}					
				}		
				
				return data;
			}
		});
   }
   
   public List<FormData> getAllDistinctPublishers(){
	   final Set<String> set=new HashSet<String>();	   
	   String query="select distinct publisher from books";
		 System.out.println("MyWork MyQuery "+query);
		 
		 return jdbc.query(query, new RowMapper<FormData>() {

			public FormData mapRow(ResultSet rs, int rowNum) throws SQLException {
				FormData data=null;
				String category=rs.getString("publisher");
				String[] array=category.split(",");
				for(String each:array){
					if(set.contains(each)==false){
						set.add(each);
						data=new FormData();data.setValue(each.toUpperCase());
						System.out.println("Added : "+each);
					}					
				}		
				
				return data;
			}
		});
   }
   
   
   public List<Book> getAuthorsBooks(String author) {
		 String query="select * from books where LOWER(authors) like '%"+author.toLowerCase()+"%' ";
		 System.out.println("MyWork MyQuery "+query);
		return jdbc.query(query, new RowMapper<Book>() {

			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();

				book.setName(rs.getString("name"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getInt("price"));
				book.setAuthorsName(Arrays.asList(rs.getString("authors").split(",")));
				book.setPublished_date(rs.getString("published-date"));
				book.setPublisher(rs.getString("publisher").toUpperCase());
				
				System.out.println("Book "+rs.getString("name")+"----"+rs.getString("isbn")+"----"+rs.getInt("price"));
				return book;
			}
		});
	 }
   
   
   public List<Book> getPublisherBooks(String publisher) {
		 String query="select * from books where LOWER(publisher) like '%"+publisher.toLowerCase()+"%' ";
		 System.out.println("MyWork MyQuery "+query);
		return jdbc.query(query, new RowMapper<Book>() {

			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();

				book.setName(rs.getString("name"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getInt("price"));
				book.setAuthorsName(Arrays.asList(rs.getString("authors").split(",")));
				book.setPublished_date(rs.getString("published-date"));
				book.setPublisher(rs.getString("publisher").toUpperCase());
				
				System.out.println("Book "+rs.getString("name")+"----"+rs.getString("isbn")+"----"+rs.getInt("price"));
				return book;
			}
		});
	 }
   
   
   public List<Book> getCategoryBooks(String category) {
		 String query="select * from books where LOWER(category) like '%"+category.toLowerCase()+"%' ";
		 System.out.println("MyWork MyQuery "+query);
		return jdbc.query(query, new RowMapper<Book>() {

			public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
				Book book = new Book();

				book.setName(rs.getString("name"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getInt("price"));
				book.setAuthorsName(Arrays.asList(rs.getString("authors").split(",")));
				book.setPublished_date(rs.getString("published-date"));
				book.setPublisher(rs.getString("publisher").toUpperCase());
				
				System.out.println("Book "+rs.getString("name")+"----"+rs.getString("isbn")+"----"+rs.getInt("price"));
				return book;
			}
		});
	 }
	

}
