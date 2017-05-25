<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String name = session.getAttribute("name").toString();
String isBinded = session.getAttribute("isBinded").toString();
String userImage = session.getAttribute("userImage").toString();
%>
<html>
<head>

<title>我的主页</title>
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" href="<%=path %>/weUI/style/weui.min.css" />
<link rel="stylesheet" href="<%=path %>/weUI/example/example.css" />
<style type="text/css">
    #bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);} 
   .imgtest{margin:10px 5px;overflow:hidden;}
   .center{display:block;margin:5px auto;width:100px;height:100px;border-radius:100px;border:2px solid #fff;overflow:hidden;-webkit-box-shadow:0 0 3px #ccc;box-shadow:0 0 3px #ccc;}
   .imgtest img{width:100%;min-height:100%; text-align:center;vertical-align:middle;}
    </style>
</head>
<body>
<div class="hd" style="background:url(<%=path %>/image/bg.jpg)">
<div class="imgtest">
<div class="center">
<a onclick="window.location.href='user_edit'"><img alt="用户头像" src="<%=userImage%>" /></a>
 </div>  
</div>
		<h1 class="page_title"><%=name %>,您好</h1>
	</div>
	<div class="bd">
		<div class="weui_grids">
		<a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='../diet/snack'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="加餐偏好">
				</div>
				<p class="weui_grid_label">加餐偏好</p>
			</a>
		<a class="weui_grid js_grid" data-id="button"
				onclick="window.location.href='../diet/diet_edit'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_article.png"
						alt="饮食录入">
				</div>
				<p class="weui_grid_label">饮食录入</p>
			</a>
			<a class="weui_grid js_grid" data-id="button"
				onclick="window.location.href='../diet/diet_list'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_panel.png"
						alt="饮食记录">
				</div>
				<p class="weui_grid_label">饮食记录</p>
				</a>
				<a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='user_edit'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_toast.png"
						alt="信息修改">
				</div>
				<p class="weui_grid_label">信息修改</p>
			</a>
			 <a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='../diet/bg_edit1'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="血糖录入">
				</div>
				<p class="weui_grid_label">血糖录入</p>
			</a>
			 <a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='../diet/bg_list'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="血糖记录">
				</div>
				<p class="weui_grid_label">血糖记录</p>
			</a>
			 <a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='advice_list'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="健康资讯">
				</div>
				<p class="weui_grid_label">医生建议</p>
			</a>
			<a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='../diet/sport_edit'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="运动量录入">
				</div>
				<p class="weui_grid_label">运动量录入</p>
			</a>
			<a class="weui_grid js_grid" data-id="cell"
				onclick="window.location.href='../diet/sport_list'">
				<div class="weui_grid_icon">
					<img src="<%=path %>/weUI/example/images/icon_nav_tab.png"
						alt="运动量记录">
				</div>
				<p class="weui_grid_label">运动量记录</p>
			</a>
		</div>
	</div>
	<div id="bg"></div> 
</body>
</html>
<script type="text/javascript">
var isBinded = "<%=isBinded%>";
if(isBinded=="false"){
	document.getElementById("bg").style.display ="block"; 
	alert("您未绑定用户类型！");
}
</script>
