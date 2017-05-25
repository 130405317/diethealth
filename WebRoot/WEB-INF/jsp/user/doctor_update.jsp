<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>医生信息审核</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<div data-role="page" id="pageone">
	<div data-role="header">
	<a href="" data-role="button" onclick="window.location.href='admin_index'">首页</a>
		<h1>医生信息审核</h1>
	</div>
	<div data-role="content">
	 <input type="hidden" name="dId" id="dId" value="${doctor.d_id }">
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" required="true" placeholder="您的姓名" value="${doctor.name}"
				readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="office">科室：</label> 
			 <select name="office" value="${doctor.office}" readonly="true"
				id="office" required="true">
				<c:forEach var="dict" items="${dictList}" varStatus="s">
				<option value="${dict.id}">${dict.name }</option>
				</c:forEach>
			</select> 
		</div>
		<div data-role="fieldcontain">
			<label for="phone">手机号码：</label> <input type="text" name="phone"
				id="phone" required="true" placeholder="您的手机号码"
				value="${doctor.phone}" readonly="true">
		</div>
		<div data-role="fieldcontain">
			<label for="state">状态：</label> 
			 <select name="state" value="${doctor.state}" readonly="true"
				id="state" required="true">
				<option value="1">待审核</option>
				<option value="2">审核通过</option>
				<option value="3">审核不通过</option>
			</select> 
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="确认审核" onclick="onSubmit();">
			<input type="button" value="删除" onclick="onDelete();">
			<input type="button" value="返回" onclick="window.location.href='doctor_list'">
		</div>
	</div>
	<div data-role="footer">
		<h1>&nbsp;</h1>
	</div>
</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script> 
<script>
function onSubmit(){
	var r=confirm("确认状态更改？");
	if (r==true)
	  {
		var dId = $('#dId').val();
		var state = $('#state').val();
	    $.post("updateDoctorState",{dId:dId,state:state},function(text){
		if(text=="1"){
			alert("更新成功！");
			window.location.href="doctor_list";
		}else{
			alert("更新失败！")
		}
	   }); 
	 }
}
function onDelete(){
	var r=confirm("确认删除？");
	if (r==true)
	  {
		var dId = $('#dId').val();
	    $.post("delectDoctor",{dId:dId},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="doctor_list";
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
</script>
</html>
