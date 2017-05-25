<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>医生信息修改</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="viewport" content="width=device-width"/>
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/green.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/green.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<div data-role="page" id="pageone">
	<div data-role="header">
	<a href="" data-role="button" onclick="javascript:history.back(-1);">首页</a>
		<h1>医生信息修改</h1>
	</div>
	<div data-role="content">
			 <input type="hidden" id="dId"" value="${doctor.d_id}">
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" required="true" placeholder="您的姓名" value="${doctor.name}">
		</div>
		<div data-role="fieldcontain">
			<label for="office">科室：</label> 
			 <select name="office"
				id="office" required="true" value="${doctor.office}">
				<c:forEach var="dict" items="${dictList}" varStatus="s">
				<option <c:if test="${doctor.office==dict.id}">selected</c:if> value="${dict.id}">${dict.name }</option>
				</c:forEach>
			</select> 
		</div>
		<div data-role="fieldcontain">
			<label for="phone">手机号码：</label> <input type="text" name="phone"
				id="phone" required="true" placeholder="您的手机号码"
				value="${doctor.phone}">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="提交" onclick="onSubmit();">
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
var dId = $('#dId').val();
var name = $('#name').val();
var office = $('#office').val();
var phone = $('#phone').val();
var phonereg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
if(name==""||name==null){
	alert("请输入姓名！");
}
if(!phonereg.test(phone)){
	alert("请输入正确的手机号码！");
}else{
 $.post("updateDoctorInfo",{dId:dId,name:name,office:office,phone:phone},function(text){
		if(text=="1"){
			alert("保存成功！");
			window.location.href="doctor_index";
		}else{
			alert("保存失败！")
		}
	}); 
}
}
</script>
</html>
