<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/doctor_index'">主页</a>
			<h1>饮食记录</h1>
		</div>

		<div>
			<c:forEach var="diet" items="${dietList}" varStatus="s">
				<h3 style="text-align: center;">${diet.type }&nbsp;&nbsp;&nbsp;总能量：${diet.energy}(kal)</h3>
				<div class="ui-grid-d">
					<div class="ui-block-a"
						style="width: 30%; height: 45px; border: 1px solid black; text-align: center; border-style: ridge none ridge ridge;">名称</div>
					<div class="ui-block-b"
						style="width: 20%; height: 45px; border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
					<div class="ui-block-c"
						style="width: 15%; height: 45px; border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
					<div class="ui-block-d"
						style="width: 15%; height: 45px; border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">脂肪</div>
					<div class="ui-block-e"
						style="width: 20%; height: 45px; border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">碳水化合物</div>
				</div>
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${mainfood.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${mainfood.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${mainfood.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${mainfood.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${mainfood.carbohydrate }</div>

					</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">

					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${meat.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${meat.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${meat.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${meat.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${meat.carbohydrate }</div>

					</div>
				</c:forEach>

				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${vegetables.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${vegetables.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${vegetables.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${vegetables.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${vegetables.carbohydrate }</div>

					</div>
				</c:forEach>
				<c:forEach var="drink" items="${diet.drink}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${drink.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${drink.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${drink.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${drink.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${drink.carbohydrate }</div>

					</div>
				</c:forEach>

				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${nut.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${nut.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${nut.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${nut.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${nut.carbohydrate }</div>

					</div>
				</c:forEach>
				<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="width: 30%; border: 1px solid black; text-align: center; border-style: none none ridge ridge;">${fruits.name }</div>
						<div class="ui-block-b"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${fruits.energy }</div>
						<div class="ui-block-c"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none none ridge none;">${fruits.protein }</div>
						<div class="ui-block-d"
							style="width: 15%; border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${fruits.fat }</div>
						<div class="ui-block-e"
							style="width: 20%; border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${fruits.carbohydrate }</div>

					</div>
				</c:forEach>

				<div data-role="fieldcontain">
					<p>烹饪方式及说明：${diet.remarks }</p>
				</div>


			</c:forEach>
			
			<div data-role="fieldcontain">
				<p>医生建议</p>
				<c:forEach var="advice" items="${advice}" varStatus="s">
					<div>${advice.time}&nbsp;&nbsp;${advice.content }</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
	
</script>
</html>
