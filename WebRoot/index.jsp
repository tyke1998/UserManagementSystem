<%@page import="demo.util.DAOFactory"%>
<%@page import="demo.model.User"%>
<%@page import="demo.dao.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/button.css"></link>
<link rel="stylesheet" type="text/css" href="css/text.css"></link>
<link rel="stylesheet" type="text/css" href="css/font.css"></link>
<link rel="stylesheet" type="text/css" href="css/body.css"></link>
<style type="text/css">
#customers
  {
  font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
  width:100%;
  border-collapse:collapse;
  }

#customers td, #customers th 
  {
  font-size:1em;
  border:1px solid #98bf21;
  padding:3px 7px 2px 7px;
  }

#customers th 
  {
  font-size:1.1em;
  text-align:left;
  padding-top:5px;
  padding-bottom:4px;
  background-color:gray;
  color:#ffffff;
  }
 

#customers tr.alt td 
  {
  color:#000000;
  background-color:#EAF2D3;
  }
  
#btn{
	clear:both; 
	width:80px; 
	height:80px; 
	z-index:1000;
	overflow:hidden; 
	border:0px #ccc solid; bottom:5px; right:5px; 
	position:fixed !important;
	background-image:url(img/huojian.png);
	background-repeat:no-repeat;
	background-size:cover;
	background-position: 0 center;
	background-size:cover;
			} 
</style>
</head>

<body style="height:3000px;">
<div id="btn" onclick="gotoTop();" 
			onmouseover="this.style.backgroundPosition='center center'"
			onmouseout="this.style.backgroundPosition='left center'">
</div>
<table id="customers">
<tr>
<th>ID</th>
<th>账号</th>
<th>密码</th>
<th>操作   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;  
<a href="<%=path%>/readyInsert.jsp"><button class="btn btn-info">添加新用户</button></a></th>
</tr>

<%
UserDAO dao = DAOFactory.getUserDAO();
List<User> yhs = dao.findAll();


for(int i=0;i<yhs.size();i++){
User usr = yhs.get(i);
 %>

<tr>
<td><%=usr.getId() %></td>
<td><%=usr.getUsername() %></td>
<td><%=usr.getPassword() %></td>
<td>
<a href="<%=path%>/readyUpdate.jsp?uid=<%=usr.getId()%>"><button class="btn btn-default">修改</button></a>
<button class="btn btn-danger" onclick="deleteUser(<%=usr.getId()%>);">删除</button>
<%--<a href="javascript:deleteUser(<%=usr.getId()%>);"><button>删除</button></a> --%>
</td>
</tr>

<%} %>

</table>

<script type="text/javascript">
var body = document.body;
var btn = document.getElementById('btn');
btn.style.display = "none";
function gotoTop(){
	if(body.scrollTop>0){
	body.scrollTop *= 0.9;
	setTimeout(gotoTop,15);
	btn.style.backgroundPosition='right center';
	}else{
		btn.style.backgroundPosition='left center';
	}
}
window.onscroll = function(){
	var top = body.scrollTop;	
	if(top>100){
		btn.style.display = "";	
	}else{
		btn.style.display = "none";	
	}
}
function deleteUser(uid){
	
	if(window.confirm("确定要删除吗？")){
		window.location.href="<%=path%>/delete.jsp?xx="+uid;
	}
}
</script>
</body>
</html>
