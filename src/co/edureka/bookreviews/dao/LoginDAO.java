package co.edureka.bookreviews.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import co.edureka.bookreviews.model.User;


@Component("loginDAO")
public class LoginDAO {
	
private NamedParameterJdbcTemplate jdbc;

	
	@Autowired
	public void setDataSource(DataSource jdbc){
		this.jdbc=new NamedParameterJdbcTemplate(jdbc);
		
	}	
	
	public User checkCredentials(String username,String password){
		
		
		
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username",username);
		params.addValue("password",password);

		return (User) jdbc.queryForObject("select * from users where username=:username and password=:password", params,
				new RowMapper<User>() {

					public User mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						User user = new User();
						System.out.println("in the query "+rs.getString("username"));
                        user.setUsername(rs.getString("username"));
						
						
						return user;
					}

				});			
		
	}

}
