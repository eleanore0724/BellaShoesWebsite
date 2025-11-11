package tw.com.lccnet.dao.daoLmpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tw.com.lccnet.dao.UserDao;
import tw.com.lccnet.databaseutils.DBUtils;
import tw.com.lccnet.model.User;

public class UserDaoImpl implements UserDao{
	private Connection conn =DBUtils.getDataBase().getConnection();
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserDaoImpl(Connection conn) {
	}
	
	public UserDaoImpl() {
	}


	@Override
	public User userLogin(String email, String password) {
		User user=null;
		String query="select * from users where email=? and password=?";
		
		try {
			ps=this.conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				user =new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
