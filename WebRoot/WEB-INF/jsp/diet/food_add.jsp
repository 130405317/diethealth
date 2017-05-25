<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>添加食物信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
	<div data-role="header">
	<a href="" data-role="button" onclick="window.location.href='../user/admin_index'">首页</a>
		<h1>添加食物信息</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain">
			<label for="type">类型：</label> <select name="type" id="type"
				required="true">
				<option value="1">主食</option>
				<option value="2">肉类</option>
				<option value="3">蔬菜</option>
				<option value="4">饮品</option>
				<option value="5">干果/油/零食</option>
				<option value="6">水果</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for="name">名称：</label> <input type="text" name="name"
				id="name" required="true" placeholder="名称">
		</div>
		<div data-role="fieldcontain">
			<label for="pinyin">拼音：</label> <input type="text" name="pinyin"
				id="pinyin" required="true" placeholder="拼音">
		</div>
		<div data-role="fieldcontain">
			<label for="energy">能量（千卡）：</label> <input type="text" name="energy"
				id="energy" required="true" placeholder="能量">
		</div>
		<div data-role="fieldcontain">
			<label for="protein">蛋白质（克）：</label> <input type="text" name="protein"
				id="protein" required="true" placeholder="蛋白质">
		</div>
		<div data-role="fieldcontain">
			<label for="fat">脂肪（克）：</label> <input type="text" name="fat" id="fat"
				required="true" placeholder="脂肪">
		</div>
		<div data-role="fieldcontain">
			<label for="carbohydrate">碳水化合物（克）：</label> <input type="text"
				name="carbohydrate" id="carbohydrate" required="true"
				placeholder="碳水化合物">
		</div>
		<div data-role="fieldcontain">
			<label for="cellulose">膳食纤维（克）：</label> <input type="text"
				name="cellulose" id="cellulose" required="true" placeholder="纤维素">
		</div>
		<div data-role="fieldcontain">
			<label for="calcium">钙（毫克）：</label> <input type="text"
				name="calcium" id="calcium" required="true" placeholder="钙">
		</div>
		<div data-role="fieldcontain">
			<label for="ferrum">铁（毫克）：</label> <input type="text"
				name="ferrum" id="ferrum" required="true" placeholder="铁">
		</div>
		<div data-role="fieldcontain">
			<label for="zinc">锌（毫克）：</label> <input type="text"
				name="zinc" id="zinc" required="true" placeholder="锌">
		</div>
		<div data-role="fieldcontain">
			<label for="carotene">胡萝卜素（微克）：</label> <input type="text"
				name="carotene" id="carotene" required="true" placeholder="胡萝卜素">
		</div>
		<div data-role="fieldcontain">
			<label for="ordername">升糖指数：</label> <input type="text"
				name="ordername" id="ordername" required="true" placeholder="排序">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="提交" onclick="onSubmit();"> <input
				type="button" value="返回" onclick="window.location.href='food_list'">
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
var type = $('#type').val();
var name = $('#name').val();
var pinyin = $('#pinyin').val();
var energy = $('#energy').val();
var protein = $('#protein').val();
var fat = $('#fat').val();
var carbohydrate = $('#carbohydrate').val();
var cellulose = $('#cellulose').val();
var ordername = $('#ordername').val();
var calcium = $('#calcium').val();
var ferrum = $('#ferrum').val();
var zinc = $('#zinc').val();
var carotene = $('#carotene').val();


 $.post("saveFoodInfo",{type:type,name:name,pinyin:pinyin,energy:energy,protein:protein,calcium:calcium,ferrum:ferrum,
	 fat:fat,carbohydrate:carbohydrate,cellulose:cellulose,ordername:ordername,zinc:zinc,carotene:carotene},function(text){
		if(text=="1"){
			alert("保存成功！");
			window.location.href="food_list";
		}else{
			alert("保存失败！")
		}
	}); 
}
</script>
</html>
