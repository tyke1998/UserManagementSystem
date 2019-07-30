<%@page import="demo.util.DAOFactory"%>
<%@page import="demo.dao.UserDAO"%>
<%@page import="demo.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String name = request.getParameter("un");
String pass = request.getParameter("pw");

User usr = new User();
usr.setUsername(name);
usr.setPassword(pass);

UserDAO dao = DAOFactory.getUserDAO();
dao.save(usr);

response.sendRedirect(path+"/index.jsp");

%>
