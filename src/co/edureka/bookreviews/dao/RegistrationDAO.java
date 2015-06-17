package co.edureka.bookreviews.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import java.util.*;

@Component("registrationDAO")
public class RegistrationDAO {
	
private NamedParameterJdbcTemplate jdbc;

	
	@Autowired
	public void setDataSource(DataSource jdbc){
		this.jdbc=new NamedParameterJdbcTemplate(jdbc);
		
	}	
	
	public void createAccount(String username,String email,String password) {
		String query = "INSERT INTO users (username, password, email) VALUES (:username,:password,:email)";		
		Map<String,String> namedParameters = new HashMap<String,String>();		
		namedParameters.put("username", username);
		namedParameters.put("password", password);
		namedParameters.put("email", email);
		
		jdbc.update(query, namedParameters);
	}
	
	
	
	
}
