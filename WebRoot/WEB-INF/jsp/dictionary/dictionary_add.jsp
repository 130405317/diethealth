<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<html>
<head>

<title>新增字典</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="header">
		<a href="" data-role="button"
			onclick="window.location.href='../user/admin_index'">主页</a>
		<h1>新增字典</h1>
	</div>
	<div data-role="content">
		<form method="post" action="">
			<div data-role="fieldcontain">
				<label for="name">名称：</label> <input type="text" name="name"
					id="name" placeholder="名称" value="${dict.name }">
			</div>
			<div data-role="fieldcontain">
				<label for="type">类型：</label> <select name="type" required="true"
					id="type" value="${dict.type }">
					<option value="1">科室</option>
					<option value="2">怀孕前患病餐前血糖标准</option>
					<option value="3">怀孕前患病餐后血糖标准</option>
					<option value="4">怀孕时患病餐前血糖标准</option>
					<option value="5">怀孕时患病餐后血糖标准</option>
				</select>
			</div>

			<div data-role="fieldcontain">
				<input type="button" value="提交" onclick="onSubmit();">
				<input type="button" value="返回" onclick="window.location.href='dictionary_list'">
			</div>
		</form>
	</div>
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
function onSubmit(){
	var name = $('#name').val();
	var type = $('#type').val();
	$.post("saveDict",{name:name,type:type},function(text){
			if(text=="1"){
				alert("保存成功！");
				window.location.href="dictionary_list";
			}else{
				alert("保存失败！")
			}
		}); 
}
</script>
</html>
