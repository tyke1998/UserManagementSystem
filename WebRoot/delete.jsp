<%@page import="demo.util.DAOFactory"%>
<%@page import="demo.dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String uidStr = request.getParameter("xx");
int usrid = Integer.parseInt(uidStr);

UserDAO dao = DAOFactory.getUserDAO();
dao.delete(usrid);

response.sendRedirect(path+"/index.jsp");

%>