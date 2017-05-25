<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html>
<head>

<title>管理员登录</title>
<!-- <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache"> -->
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div  data-role="header">
<!--  <a href="#" data-role="button">登录</a> -->
<h1>管理员登录</h1>
</div>
<div data-role="content">
<form method="post" action="" id="form1">
  <div data-role="fieldcontain">
    <label for="username">用户名：</label>
    <input type="text" name="username" id="username" placeholder="您的用户名" required="true">
    </div>
   <div data-role="fieldcontain">
    <label for="password">密码：</label>
    <input type="password" name="password" id="password" placeholder="请输入您的密码" required="true">
   </div>
     <div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
   </div>
</form>
</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
function onSubmit(){
	var password = $("#password").val();
	var username = $("#username").val();
	if(username==""){
		alert("用户名不能为空");
	}else if(password==""){
		alert("密码不能为空");
	}else{
		 $.post("user/user_check",{username:username,password:password},function(text){
			if(text!="1"){
				alert("用户名或密码不正确");
			}else{
				window.location.href="user/admin_index";
			}
		}); 
	}
}
</script>
</html>
