package demo.util;

import demo.dao.UserDAO;
import demo.dao.implement.UserDAO_Impl;
//用来创建DAO对象的工厂
public class DAOFactory {
	public static UserDAO getUserDAO() {
		return new UserDAO_Impl();
	}
}
