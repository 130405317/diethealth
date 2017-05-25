<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>使用说明</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">
</head>

<body>
	<div data-role="header">
		<!--  <a href="#" data-role="button">登录</a> -->
		<h1>使用说明</h1>
	</div>
	<div data-role="content">
		<p>
			&nbsp;&nbsp;&nbsp;&nbsp;进入孕糖宝首页如图1，首先进行身份绑定，点击<span style="color: red">“绑定业务”</span>请选择<span style="color: red">“糖尿病用户”</span>，绑定成功后进入<span style="color: red">“我的业务”</span>进行日常饮食、血糖、运动量的记录及时查看饮食指导，让我们成为您的贴心小管家。使用方法的讲解，请进入<span style="color: red">“使用说明”</span>查看。
		</p>
		<img alt="" src="<%=path%>/introduce.files/image001.png"
			style="width: 100%" />
		<p align="center">图1，孕糖宝首页</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;点击<span style="color: red">“我的业务”</span>进入个人主页，如图2。</p>
		<img alt="" src="<%=path%>/introduce.files/image003.png"
			style="width: 100%;" />
		<p align="center">图2，个人主页</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;进入<span style="color: red">“加餐偏好”</span>页面如图3，请先选择习惯进餐方式，默认三餐。如有加餐需要，请选择加餐种类。例如：习惯每日五餐，加餐种类为下午加餐及晚上加餐。点击<span style="color: red">“确认”</span>，系统为您计算参考目标能量值，为您进餐的食量有一个科学合理的建议。</p>
		<img alt="" src="<%=path%>/introduce.files/image004.png"
			style="width: 100%;">
		<p align="center">图3，“加餐偏好”页面</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;在<span style="color: red">“饮食录入”</span>界面会出现日常进餐种类，选择录入食物（首次饮食录入请先进入主页的<span style="color: red">“个人偏好”</span>选项，选择习惯进餐数）。图4为餐饮类型页面，选择即将录入的餐饮类型，然后录入食物。</p>
		<img alt="" src="<%=path%>/introduce.files/image006.png"
			style="width: 100%;">
		<p align="center">图4，选择餐饮类型</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;饮食录入界面如图5所示为<span style="color: red">“饮食录入”</span>页面：</p>
		<img alt="" src="<%=path%>/introduce.files/image008.png"
			style="width: 100%;">
		<p align="center">图5，饮食录入界面</p>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>

</html>
