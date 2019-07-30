<%@page import="demo.util.DAOFactory"%>
<%@page import="demo.model.User"%>
<%@page import="demo.dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="css/button.css"></link>
	<link rel="stylesheet" type="text/css" href="css/text.css"></link>
	<link rel="stylesheet" type="text/css" href="css/font.css"></link>
	<link rel="stylesheet" type="text/css" href="css/body.css"></link>
    <title>My JSP 'readyUpdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <script>
  	function yan(){
		var a=document.getElementById("t1").value;
		var b=document.getElementById("t2").value;
		var c=document.getElementById("t3").value;
		if(a.length<6){
			alert("账号不得小于6位,请重新输入");
			return false;
		}
		if(b.length<6){
			alert("密码不得小于6位,请重新输入");
			return false;
		}
		if(b!=c){
			alert("两次密码需一致,请重新输入");
			return false;
		}
		alert("恭喜你，注册成功辣");
		return true;
		
	}


	
  </script>
     <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <font face="Microsoft YaHei" size=5>注册用户信息</font><br><br><br>
    <form action="<%=path %>/insert.jsp" method="post" onsubmit="return yan()">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Microsoft YaHei" size=3>账号：</font><input class="form-txt" id="t1" type="text" name="un"  size=16 placeholder="请输入账号..."><br><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Microsoft YaHei" size=3>密码：</font><input class="form-txt" id="t2"type="password" name="pw" size=17 placeholder="请输入密码..."><br><br>
    	<font face="Microsoft YaHei" size=3>确认密码：</font><input class="form-txt" id="t3" type="password" name="pw2" size=17 placeholder="请再次输入密码..."><br><br><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="submit"  value="确认注册用户" >
    </form>
    <form action="<%=path %>/index.jsp" method="post">
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-success" type="submit" value="返回管理平台" >
    </form>
  </body>
</html>
