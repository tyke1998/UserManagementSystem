package demo.util;

import demo.dao.UserDAO;
import demo.dao.implement.UserDAO_Impl;
//��������DAO����Ĺ���
public class DAOFactory {
	public static UserDAO getUserDAO() {
		return new UserDAO_Impl();
	}
}
