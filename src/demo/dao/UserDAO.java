package demo.dao;

import java.util.List;

import demo.model.User;

public interface UserDAO {
	int save(User u);
	int update(User u);
	int delete(int id);
	/*ͨ��id���û�*/
	User findByID(int id);
	/*ͨ���û���������û�*/
	User find(String username,String password);
	List<User> findAll();
}
