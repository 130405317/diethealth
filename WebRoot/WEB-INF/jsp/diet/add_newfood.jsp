<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加新食物</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="<%=path%>/jquerymobile/jquery.mobile.structure-1.4.5.min.css" />

<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

<div data-role="page">
	<div data-role="header">
		<a href="" data-role="button"
				onclick="window.location.href='../diet/diet_edit'">返回</a>
			<h1>新增食物</h1>
	</div>
	<div data-role="content">
		<label>食物名称：</label><input type="text" id="foodName" placeholder="请输入食物名称"/>
		<input type="button" onclick="addFood()" value="提交" />
	</div>
</div>
</body>
<script type="text/javascript">
	function addFood(){
		var foodName = $('#foodName').val();
		if(foodName == ""){
			alert("请输入食物名称！");
		}else{
			 $.post("../diet/insert_newfood",{foodname:foodName},function(text){
				 if(text=="1"){
						alert("保存成功！");
						window.location.href="../diet/diet_edit";
					}else{
						alert("保存失败！");
					} 
			 });
		}
	}
</script>
</html>