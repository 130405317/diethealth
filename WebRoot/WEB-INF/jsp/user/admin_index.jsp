<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String name = session.getAttribute("name").toString();
%>
<html>
<head>

<title>管理员主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
<div data-role="page" id="pageone">
  <div data-role="header">
    <h1>我的主页</h1>
  </div>
<div data-role="content">
<h1 style="text-align:center;"><%=name %>,您好！</h1>
</div>
  <div data-role="content">
    <div data-role="navbar">
      <ul>
        <li><a href="" data-icon="grid" onclick="window.location.href='doctor_list'">医师管理</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='../diet/food_list'">食物管理</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='patient_list'">患者管理</a></li>
        <li><a href="#" data-icon="grid" onclick="window.location.href='../dictionary/dictionary_list'">标准管理</a></li>
      </ul>
    </div>
  </div>

</div> 
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
</html>
