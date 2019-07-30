package demo.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.mysql.jdbc.Driver;

public class JDBCutil_Mysql {
	
	
	
//	private static String url = "jdbc:mysql://localhost:3306/wukong_db?characterEncoding=utf-8&serverTimezone=UTC";
//	private static String user = "common";
//	private static String password = "123456";
	
	static {
		try {
			new Driver();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Mysql«˝∂Øº”‘ÿ“Ï≥£...");
			e.printStackTrace();
		}
	}
	
	public static Connection getconnection() {
		Properties prop = new Properties();
		InputStream in = JDBCutil_Mysql.class.getClassLoader().getResourceAsStream("database.properties");
		try {
			prop.load(in);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String url = prop.getProperty("URL");
		String user = prop.getProperty("USERNAME");
		String password = prop.getProperty("PASSWORD");
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(Connection conn,Statement st,ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(st!=null) {
				st.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
