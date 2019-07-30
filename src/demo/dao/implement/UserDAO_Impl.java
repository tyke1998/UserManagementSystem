package demo.dao.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import demo.dao.UserDAO;
import demo.model.User;
import demo.util.JDBCutil_Mysql;

public final class UserDAO_Impl implements UserDAO{

	public int save(User u) {
		// TODO Auto-generated method stub
		String sql = "insert into ur values(0,?,?)";
		Connection conn = JDBCutil_Mysql.getconnection();
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getPassword());
			return pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, null);
		}
		return 0;
	}

	public int update(User u) {
		// TODO Auto-generated method stub
		String sql = "update ur set username=?,password=? where id=?";
		Connection conn = JDBCutil_Mysql.getconnection();
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, u.getUsername());
			pst.setString(2, u.getPassword());
			pst.setInt(3, u.getId());
			return pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, null);
		}
		return 0;
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from ur where id=?";
		Connection conn = JDBCutil_Mysql.getconnection();
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			return pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, null);
		}
		return 0;
	}

	public User findByID(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from ur where id = ?";
		Connection conn = JDBCutil_Mysql.getconnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User u=new User();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				u.setId(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, rs);
		}
		return null;
	}

	public User find(String username, String password) {
		// TODO Auto-generated method stub
		String sql = "select * from ur where username=? and password=?";
		Connection conn = JDBCutil_Mysql.getconnection();
		PreparedStatement pst = null;
		ResultSet rs = null;
		User u=new User();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,username);
			pst.setString(2,password);
			rs = pst.executeQuery();
			while(rs.next()) {
				u.setId(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, rs);
		}
		return null;
	}

	public List<User> findAll() {
		// TODO Auto-generated method stub
		Connection conn = JDBCutil_Mysql.getconnection();
//		Connection conn = C3P0util_Mysql.getconnection();  //使用了C3P0连接池获取连接
		PreparedStatement pst = null;
		ResultSet rs = null;
		String sql = "select * from ur";
		List<User> l = new ArrayList<User>();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("ID"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				l.add(u);
			}
			return l;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCutil_Mysql.close(conn, pst, rs);
		}
		return null;
	}

}
