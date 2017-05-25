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

<body onload="init()">
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食记录</h1>
		</div>
		<p id="targetEnergy" style="display: none">${targetEnergy }</p>
		<h3 style="text-align: center;">孕糖宝温馨提示</h3>
		<div>
			<div data-role="fieldcontain">
				<div class="ui-grid-b">
					<div class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">总蛋白质</div>
					<div class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">总脂肪</div>
					<div class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">总碳水化合物</div>
				</div>
				<div class="ui-grid-b">
					<div id="protein" class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${dietEnergy.protein}</div>
					<div id="fat" class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${dietEnergy.fat}</div>
					<div id="carbohydrate" class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${dietEnergy.carbohydrate}</div>
				</div>
				<div class="ui-grid-b">
					<div id="protein_range" class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">-</div>
					<div id="fat_range" class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">-</div>
					<div id="carbohydrate_range" class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">-</div>
				</div>
			</div>

			<c:forEach var="diet" items="${dietList}" varStatus="s">
				<h3 style="text-align: center;">${diet.type }&nbsp;&nbsp;&nbsp;总能量：${diet.energy}(kal)</h3>
				<c:forEach var="mainfood" items="${diet.mainfood}" varStatus="s">
					<span>${mainfood.name }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${mainfood.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${mainfood.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${mainfood.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${mainfood.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${mainfood.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${mainfood.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${mainfood.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${mainfood.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${mainfood.carbohydrate }</div>
					</div>
				</c:forEach>
				<c:forEach var="meat" items="${diet.meat}" varStatus="s">
					<span>${meat.name  }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${meat.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${meat.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${meat.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${meat.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${meat.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-c">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${meat.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${meat.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${meat.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${meat.carbohydrate }</div>
					</div>
				</c:forEach>

				<c:forEach var="vegetables" items="${diet.vegetables}" varStatus="s">
					<span>${vegetables.name  }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${vegetables.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${vegetables.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${vegetables.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${vegetables.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${vegetables.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${vegetables.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${vegetables.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${vegetables.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${vegetables.carbohydrate }</div>
					</div>
				</c:forEach>
				<c:forEach var="drink" items="${diet.drink}" varStatus="s">
					<span>${drink.name  }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${drink.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${drink.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${drink.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${drink.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${drink.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${drink.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${drink.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${drink.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${drink.carbohydrate }</div>
					</div>
				</c:forEach>

				<c:forEach var="nut" items="${diet.nut}" varStatus="s">
					<span>${nut.name  }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${nut.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${nut.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${nut.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${nut.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${nut.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${nut.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${nut.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${nut.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${nut.carbohydrate }</div>
					</div>
				</c:forEach>
				<c:forEach var="fruits" items="${diet.fruits}" varStatus="s">
					<span>${fruits.name  }(kal)</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">能量</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">铁</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 23%; border-style: ridge ridge ridge none;">膳食纤维</div>
						<div class="ui-block-e"
							style="border: 1px solid black; text-align: center; width: 18.5%; border-style: ridge ridge ridge none;">钙</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${fruits.energy }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${fruits.protein }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${fruits.ferrum }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; width: 23%; text-align: center; border-style: none ridge ridge none;">${fruits.cellulose }</div>
						<div class="ui-block-e"
							style="border: 1px solid black; width: 18.5%; text-align: center; border-style: none ridge ridge none;">${fruits.calcium }</div>
					</div>
					<span>&nbsp;</span>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge ridge;">脂肪</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: ridge ridge ridge none;">锌</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: ridge ridge ridge none;">胡萝卜素</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: ridge ridge ridge none;">碳水化合物</div>
					</div>
					<div class="ui-grid-d">
						<div class="ui-block-a"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge ridge;">${fruits.fat }</div>
						<div class="ui-block-b"
							style="border: 1px solid black; text-align: center; width: 20%; border-style: none ridge ridge none;">${fruits.zinc }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; text-align: center; width: 25%; border-style: none ridge ridge none;">${fruits.carotene }</div>
						<div class="ui-block-d"
							style="border: 1px solid black; text-align: center; width: 30%; border-style: none ridge ridge none;">${fruits.carbohydrate }</div>
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
	function init() {
		var targetEnergy = $("#targetEnergy").text();
		var protein1 = targetEnergy * 0.15;
		var protein2 = targetEnergy * 0.2;
		var protein = $("#protein").text();
		var fat1 = targetEnergy * 0.25;
		var fat2 = targetEnergy * 0.3;
		var fat = $("#fat").text();
		var carbohydrate1 = targetEnergy * 0.5;
		var carbohydrate2 = targetEnergy * 0.6;
		var carbohydrate = $("#carbohydrate").text();
		if (protein < protein1) {
			$("#protein_range").text("不足");
		} else if (protein > protein2) {
			$("#protein_range").text("偏高");
		} else {
			$("#protein_range").text("正常");
		}
		if (fat < fat1) {
			$("#fat_range").text("不足");
		} else if (fat > fat2) {
			$("#fat_range").text("偏高");
		} else {
			$("#fat_range").text("正常");
		}
		if (carbohydrate < carbohydrate1) {
			$("#carbohydrate_range").text("不足");
		} else if (carbohydrate > carbohydrate2) {
			$("#carbohydrate_range").text("偏高");
		} else {
			$("#carbohydrate_range").text("正常");
		}
	}
</script>
</html>
