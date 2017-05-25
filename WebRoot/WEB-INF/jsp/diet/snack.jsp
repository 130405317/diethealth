<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>
<title>设置加餐偏好</title>
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>设置加餐偏好</h1>
		</div>
		<div data-role="content">
		<span>餐饮类型默认为早中晚三餐，如有加餐需求请选择</span>
		<br/>
			<fieldset data-role="controlgroup">
				<input id="snackInfo" type="hidden" value="${snackInfo }">
				<label for="breakfast">上午加餐</label> 
				<input type="checkbox" name="favcolor" id="breakfast" value="4"> 
				<label for="lunch">下午加餐</label> 
				<input type="checkbox" name="favcolor" id="lunch" value="5">
				<label for="dinner">晚上加餐</label> 
				<input type="checkbox" name="favcolor" id="dinner" value="6">
			</fieldset>
			
			 <div data-role="fieldcontain">
   			   <button onclick="onSubmit();">确认</button>
   			   <button onclick="window.location.href='../user/user_index'">返回</button>
   			 </div>
		</div>
	</div>
</body>
</html>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
var snackInfo = $('#snackInfo').val();
if(snackInfo!=""){
	var strs= new Array()
	strs = snackInfo.split("|");
	for(var i=0; i<strs.length; i++){
		if(strs[i]=="4"){
			$("#breakfast").attr("checked",true);
		}
		if(strs[i]=="5"){
			$("#lunch").attr("checked",true);
		}
		if(strs[i]=="6"){
			$("#dinner").attr("checked",true);
		}
	}
} 
function onSubmit(){
	var snacks = "";
	if($('#breakfast').is(':checked')==true){
		snacks +=$('#breakfast').val()+"|";
	}
	if($('#lunch').is(':checked')==true){
		snacks +=$('#lunch').val()+"|";
	}
	if($('#dinner').is(':checked')==true){
		snacks +=$('#dinner').val();
	}
	 $.post("saveSnacks",{snacks:snacks},function(text){
			if(text=="1"){
				alert("设置成功！");
				window.location.href="../user/user_index";
			}else{
				alert("设置失败！")
			}
		}); 
	
}
</script>
