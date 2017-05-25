<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>编辑食物信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta name="viewport" content="width=device-width"/>
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>

<div data-role="page" id="pageone">
<input type="hidden" id="curPage" value="${curPage}">
	<div data-role="header">
	<a href="" data-role="button" onclick="window.location.href='../user/admin_index'">首页</a>
		<h1>编辑食物信息</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain" style="display:none;">
			<input type="text" id="id" value="${food.id }">
		</div>
		<div data-role="fieldcontain" id="aaa">
			<label for="type">类型：</label> <select name="type" id="type"
				required="true" value="${food.type }">
				<option <c:if test="${food.type==1 }">selected</c:if>  value="1">主食</option>
				<option <c:if test="${food.type==2 }">selected</c:if>  value="2">肉类</option>
				<option <c:if test="${food.type==3 }">selected</c:if>  value="3">蔬菜</option>
				<option <c:if test="${food.type==4 }">selected</c:if>  value="4">饮品</option>
				<option <c:if test="${food.type==5 }">selected</c:if>  value="5">干果/油/零食</option>
				<option <c:if test="${food.type==6 }">selected</c:if>  value="6">水果</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for="name">名称：</label> <input type="text" name="name"
				id="name" required="true" placeholder="名称" value="${food.name }">
		</div>
		<div data-role="fieldcontain">
			<label for="pinyin">拼音：</label> <input type="text" name="pinyin"
				id="pinyin" required="true" placeholder="拼音" value="${food.pinyin }">
		</div>
		<div data-role="fieldcontain">
			<label for="energy">能量（千卡）：</label> <input type="text" name="energy"
				id="energy" required="true" placeholder="能量" value="${food.energy }">
		</div>
		<div data-role="fieldcontain">
			<label for="protein">蛋白质（克）：</label> <input type="text" name="protein"
				id="protein" required="true" placeholder="蛋白质"
				value="${food.protein }">
		</div>
		<div data-role="fieldcontain">
			<label for="fat">脂肪（克）：</label> <input type="text" name="fat" id="fat"
				required="true" placeholder="脂肪" value="${food.fat }">
		</div>
		<div data-role="fieldcontain">
			<label for="carbohydrate">碳水化合物（克）：</label> <input type="text"
				name="carbohydrate" id="carbohydrate" required="true"
				placeholder="碳水化合物" value="${food.carbohydrate }">
		</div>
		<div data-role="fieldcontain">
			<label for="cellulose">膳食纤维（克）：</label> <input type="text"
				name="cellulose" id="cellulose" required="true" placeholder="纤维素"
				value="${food.cellulose }">
		</div>
		<div data-role="fieldcontain">
			<label for="calcium">钙（毫克）：</label> <input type="text"
				name="calcium" id="calcium" required="true" placeholder="钙" value="${food.calcium }">
		</div>
		<div data-role="fieldcontain">
			<label for="ferrum">铁（毫克）：</label> <input type="text"
				name="ferrum" id="ferrum" required="true" placeholder="铁" value="${food.ferrum }">
		</div>
		<div data-role="fieldcontain">
			<label for="zinc">锌（毫克）：</label> <input type="text"
				name="zinc" id="zinc" required="true" placeholder="锌" value="${food.zinc }"> 
		</div>
		<div data-role="fieldcontain">
			<label for="carotene">胡萝卜素（微克）：</label> <input type="text"
				name="carotene" id="carotene" required="true" placeholder="胡萝卜素" value="${food.carotene }">
		</div>
		<div data-role="fieldcontain">
			<label for="ordername">升糖指数：</label> <input type="text"
				name="ordername" id="ordername" required="true" placeholder="排序"
				value="${food.ordername }">
		</div>
		<div data-role="fieldcontain">
			<input type="button" value="提交" onclick="onSubmit();"> <input
				type="button" value="删除" onclick="onDelete();"> <input
				type="button" value="返回" onclick="window.location.href='food_list?curPage=${curPage}'">
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
function onDelete(){
	var r=confirm("确认删除？");
	if (r==true)
	  {
		var id = $('#id').val();
		var type = $('#type').val()
	    $.post("deleteFoodInfo",{id:id,type:type},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="food_list?curPage="+$('#curPage').val();
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
function onSubmit(){
var id = $('#id').val();
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

 $.post("saveFoodInfo",{id:id,type:type,name:name,pinyin:pinyin,energy:energy,protein:protein,calcium:calcium,ferrum:ferrum,
	 fat:fat,carbohydrate:carbohydrate,cellulose:cellulose,ordername:ordername,zinc:zinc,carotene:carotene},function(text){
		if(text=="1"){
			alert("保存成功！");
			window.location.href="food_list?curPage="+$('#curPage').val();
		}else{
			alert("保存失败！")
		}
	}); 
}
</script>
</html>
