<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String isBinded = session.getAttribute("isBinded").toString();
%>
<html>
  <head>
    <title>绑定业务</title>
	<meta content="width=device-width" name="viewport" />
	<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
	<link rel="stylesheet" href="<%=path %>/css/weui.min.css"/>
    <link rel="stylesheet" href="<%=path %>/css/example.css"/>
    <style type="text/css">
    #bg{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:1001; -moz-opacity: 0.7; opacity:.70; filter: alpha(opacity=70);} 
    </style>
  </head>
  <body>
   <div class="hd">
        <h1 class="page_title">绑定用户类型</h1>
    </div>
    <div class="weui_cells weui_cells_radio">
            <label class="weui_cell weui_check_label" for="patient">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>糖尿病用户</p>
                </div>
                <div class="weui_cell_ft">
                    <input type="radio" class="weui_check" name="radio1" id="patient"  checked="checked">
                    <span class="weui_icon_checked"></span>
                </div>
            </label>
            <label class="weui_cell weui_check_label" for="doctor">

                <div class="weui_cell_bd weui_cell_primary">
                    <p>医生用户</p>
                </div>
                <div class="weui_cell_ft">
                    <input type="radio" name="radio1" class="weui_check" id="doctor">
                    <span class="weui_icon_checked"></span>
                </div>
            </label>
        </div>
        <div class="weui_cells_title">&nbsp;</div>
          <div class="bd spacing">
        <a href="javascript:;" class="weui_btn weui_btn_primary" onclick="linkIndex();">确认</a>
        </div>
        <div id="bg"></div>  
  </body>
</html>
<script >
var isBinded = "<%=isBinded%>";
if(isBinded=="true"){
	document.getElementById("bg").style.display ="block"; 
	alert("您已绑定用户类型！");
}
function linkIndex(){
	var r=confirm("确认绑定此用户类型？此操作不可更改！");
	if(r){
		if(document.getElementById("patient").checked==true){
			window.location.href="register";
		}else{
			window.location.href="doctor_add";
		}
	}
}
</script>
