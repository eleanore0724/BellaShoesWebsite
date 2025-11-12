package tw.com.lccnet.dao;

import tw.com.lccnet.model.User;

public interface UserDao {
	public User userLogin(String email,String password);
	
	boolean isUserExist(String email);
	
	boolean insertUser(User user);
}
