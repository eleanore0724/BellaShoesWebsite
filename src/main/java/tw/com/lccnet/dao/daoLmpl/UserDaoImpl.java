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
	
	
	@Override
	public boolean isUserExist(String email) {
		String sql = "SELECT * FROM users WHERE email = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			System.out.println("email驗證已經存在");
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("email驗證不存在");
		return true;
	}
	
	
	@Override
	public boolean insertUser(User user) {
		String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
