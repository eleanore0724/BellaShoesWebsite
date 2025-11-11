package tw.com.lccnet.dao;

import tw.com.lccnet.model.User;

public interface UserDao {
	public User userLogin(String email,String password);
}
