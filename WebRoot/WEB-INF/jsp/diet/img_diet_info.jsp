diet_info_d.jsp<%@ page language="java" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>饮食记录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body onload="">
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食记录</h1>
		</div>
		<p id="targetEnergy" style="display: none">${targetEnergy }</p>
		<div data-role="fieldcontain">
			<c:forEach var="dietList" items="${dietInfo}" varStatus="s">
				<h2 name="diet_type" style="text-align: center;">${dietList.type}</h2>
				<div class="ui-grid-b">
					<div class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">食物名称</div>
					<div class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">食物重量</div>
					<div class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">食物能量</div>

				</div>
				<c:forEach var="food_list" items="${dietList.food_list}"
					varStatus="s">
					<div class="ui-grid-b">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${food_list.food_name }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${food_list.food_weight }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${food_list.food_energy }</div>

					</div>
				</c:forEach>
			</c:forEach>
		</div>

	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
	var path = getRootPath();
	$("h2[name='diet_type']")
			.each(

					function() {
						var brekfast_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 55%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>早餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/breakfast.png' width='50px' height='50px'></div></div>";
						var brekfast_add_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 40%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>上午加餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/breakfast_add.png' width='50px' height='50px'></div></div>";
						var lunch_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 55%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>午餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/lunch.png' width='50px' height='50px'></div></div>";
						var lunch_add_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 40%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>下午加餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/lunch_add.png' width='50px' height='50px'></div></div>";
						var dinner_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 55%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>晚餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/dinner.png' width='50px' height='50px'></div></div>";
						var dinner_add_img = "<div style='display: table;'>"
								+ "<div style='display: table-cell; width: 40%' ></div>"
								+ "<div style='display: table-cell; margin-left: 100px'><h2>晚上加餐</h2></div>"
								+ "<div style='display: table-cell;'>"
								+ "<img src='"+path+"/image/dinner_add.png' width='50px' height='50px'></div></div>";
						//alert($(this).text());
						if ($(this).text() == "早餐") {
							$(this).replaceWith(brekfast_img);
						} else if($(this).text() == "上午加餐") {
							$(this).replaceWith(brekfast_add_img);
						}else if($(this).text() == "午餐"){
							$(this).replaceWith(lunch_img);
						}else if($(this).text() == "下午加餐"){
							$(this).replaceWith(lunch_add_img);
						}else if($(this).text() == "晚餐"){
							$(this).replaceWith(dinner_img);
						}else{
							$(this).replaceWith(dinner_add_img);
						}

					}

			);

	//js获取项目根路径，如： http://localhost:8083/uimcardprj
	function getRootPath() {
		//获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		//获取主机地址，如： http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		//获取带"/"的项目名，如：/uimcardprj
		var projectName = pathName.substring(0,
				pathName.substr(1).indexOf('/') + 1);
		return (localhostPaht + projectName);
	}
</script>
</html>
