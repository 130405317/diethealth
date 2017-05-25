<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>血糖记录</title>

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
	<div data-role="page">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>血糖记录</h1>
		</div>
		<div data-role="content">
			<div class="ui-grid-b">
				<div class="ui-block-a" style="text-align: center;">偏高</div>
				<div class="ui-block-b" style="text-align: center;">正常</div>
				<div class="ui-block-c" style="text-align: center;">偏低</div>
				<div class="ui-block-a"
					style="border: 1px solid black; border-style: none ridge none none; text-align: center;"
					id="heightTime"></div>
				<div class="ui-block-b"
					style="border: 1px solid black; border-style: none ridge none none; text-align: center;"
					id="normolTime"></div>
				<div class="ui-block-c" style="text-align: center;" id="lowTime"></div>
				<div class="ui-block-a" style="text-align: center;">次</div>
				<div class="ui-block-b" style="text-align: center;">次</div>
				<div class="ui-block-c" style="text-align: center;">次</div>
			</div>
			<div data-role="fieldcontain">
				餐前标准：<span id="before">${standard1.name }</span>mmol/L
			</div>
			餐后标准：<span id="after">${standard2.name }</span>mmol/L
		</div>
		<div data-role="content">
			<div class="ui-grid-a" id="HbAlc">
				<div class="ui-block-a"
					style="width: 20%; border: 1px solid black; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">
					日&nbsp;期</div>
				<div class="ui-block-b"
					style="width: 30%; border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
					糖化血糖蛋白</div>
				<c:forEach var="bg" items="${bgList}" varStatus="s">
					<div class="ui-block-a"
						style="width: 20%; border: 1px solid black; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">
						${bg.date }</div>
					<div  class="ui-block-b"
						style="width: 30%; border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						${bg.HbAlc }</div>
				</c:forEach>
			</div>
			<br />
			<div class="ui-grid-d" id="bggrid">
				<div class="ui-block-a"
					style="border: 1px solid black; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">
					日&nbsp;期
					<div class="ui-grid-a">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">&nbsp;</div>
					</div>
				</div>
				<div class="ui-block-b"
					style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
					早餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
					</div>
				</div>
				<div class="ui-block-c"
					style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
					午餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
					</div>
				</div>
				<div class="ui-block-d"
					style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
					晚餐
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
					</div>
				</div>
				<div class="ui-block-e"
					style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
					睡前
					<div class="ui-grid-a">
						<div class="ui-block-a"
							style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
						<div class="ui-block-b"
							style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
					</div>
				</div>

				<c:forEach var="bg" items="${bgList}" varStatus="s">
					<div class="ui-block-a"
						style="border: 1px solid black; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">
						${bg.date }</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${bg.bloodGlucoseBeforeBreakfast }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${bg.bloodGlucoseAfterBreakfast }</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${bg.bloodGlucoseBeforeLunch }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${bg.bloodGlucoseAfterLunch }</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${bg.bloodGlucoseBeforeDinner }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${bg.bloodGlucoseAfterDinner }</div>
						</div>
					</div>
					<div class="ui-block-e"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;"
						name="before">${bg.bloodGlucoseBeforeSleep }</div>
				</c:forEach>
			</div>
		</div>
		<div data-role="footer">
			<h1>
				<a href="" data-role="button" onclick="pageChange(-1)">上一页</a>${curPage }/${totalPage }<a
					href="" data-role="button" onclick="pageChange(1)">下一页</a>
			</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
	
	function pageChange(num) {
		var curPage = $
		{
			curPage
		}
		;
		var totalPage = $
		{
			totalPage
		}
		;
		if (curPage + num < 1) {
			alert("当前页已经是第一页");
		} else if (curPage + num > totalPage) {
			alert("当前页已经是最后一页");
		} else {
			curPage = curPage + num;
			window.location.href = 'bg_list?curPage=' + curPage;
		}
	}

	function count() {

		var beforeValue = $('#before').text().split("-");
		var afterValue = $('#after').text().split("-");
		var low = 0;
		var height = 0;
		var normol = 0;
		var divs = $('#bggrid').find('div').filter("[name='before']");
		//console.log(beforeValue);
		for (var i = 0; i < divs.length; i++) {
			if (!isNaN(divs[i].innerText)) {
				var value = parseFloat(divs[i].innerText);
				if (value < parseFloat(beforeValue[0])) {
					low++;
					divs[i].style.color = "red";
				} else if (value > parseFloat(beforeValue[1])) {
					divs[i].style.color = "red";
					height++;
				} else {
					normol++;
				}
			}
		}
		divs = $('#bggrid').find('div').filter("[name='after']");
		for (var i = 0; i < divs.length; i++) {
			if (!isNaN(divs[i].innerText)) {
				var value = parseFloat(divs[i].innerText);
				if (value < parseFloat(afterValue[0])) {
					low++;
					divs[i].style.color = "red";
				} else if (value > parseFloat(afterValue[1])) {
					divs[i].style.color = "red";
					height++;
				} else {
					normol++;
				}
			}
		}
		$('#lowTime').text(low);
		$('#normolTime').text(normol);
		$('#heightTime').text(height);
	}
	count();
</script>
</html>
