package demo.dao;

import java.util.List;

import demo.model.User;

public interface UserDAO {
	int save(User u);
	int update(User u);
	int delete(int id);
	/*通过id查用户*/
	User findByID(int id);
	/*通过用户名密码查用户*/
	User find(String username,String password);
	List<User> findAll();
}
