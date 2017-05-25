<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>运动量记录</title>
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
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>运动量记录</h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<p>记录日期：${sportInfo.date }</p>
			</div>

			<div class="ui-grid-c">
				<div class="ui-block-a"
					style="border: 1px solid black; width: 40%; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">时间段</div>
				<div class="ui-block-b"
					style="border: 1px solid black; width: 30%; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">运动强度</div>
				<div class="ui-block-c"
					style="border: 1px solid black; width: 30%; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">运动时间</div>
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a"
					style="border: 1px solid black; width: 20%; height: 40px; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">早餐</div>
				<div class="ui-block-b"
					style="border: 1px solid black; width: 80%; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
					<div class="ui-grid-b">
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">${sportInfo.beforebreakfasttype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none ridge none; text-align: center; font-size: 10px;">${sportInfo.beforebreakfasttime }分钟</div>
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">后</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">${sportInfo.afterbreakfasttype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none none none; text-align: center; font-size: 10px;">${sportInfo.afterbreakfasttime }分钟</div>
					</div>
				</div>

				<div class="ui-block-a"
					style="border: 1px solid black; width: 20%; height: 40px; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">午餐</div>
				<div class="ui-block-b"
					style="border: 1px solid black; width: 80%; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
					<div class="ui-grid-b">
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">${sportInfo.beforelaunchtype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none ridge none; text-align: center; font-size: 10px;">${sportInfo.beforelaunchtime }分钟</div>
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">后</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">${sportInfo.afterlaunchtype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none none none; text-align: center; font-size: 10px;">${sportInfo.afterlaunchtime }分钟</div>
					</div>
				</div>

				<div class="ui-block-a"
					style="border: 1px solid black; width: 20%; height: 40px; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">晚餐</div>
				<div class="ui-block-b"
					style="border: 1px solid black; width: 80%; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
					<div class="ui-grid-b">
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">前</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">${sportInfo.beforedinnertype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none ridge none; text-align: center; font-size: 10px;">${sportInfo.beforedinnertime }分钟</div>
						<div class="ui-block-a"
							style="border: 1px solid black; width: 25%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">后</div>
						<div class="ui-block-b"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none ridge none none; text-align: center; font-size: 10px;">${sportInfo.afterdinnertype }</div>
						<div class="ui-block-c"
							style="border: 1px solid black; width: 37.5%; height: 20px; border-style: none none none none; text-align: center; font-size: 10px;">${sportInfo.afterdinnertime }分钟</div>
					</div>
				</div>

			</div>
			<div class="ui-grid-c">
					<div class="ui-block-a"
						style="border: 1px solid black; width: 40%; height:20px; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">睡前</div>
					<div class="ui-block-b"
						style="border: 1px solid black; width: 30%; height:20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">${sportInfo.beforesleeptype }</div>
					<div class="ui-block-c"
						style="border: 1px solid black; width: 30%; height:20px; border-style: none ridge ridge none; text-align: center; font-size: 10px;">${sportInfo.beforesleeptime }分钟</div>
				</div>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
	
</script>
</html>
