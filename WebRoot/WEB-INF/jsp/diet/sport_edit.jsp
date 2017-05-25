<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>运动量录入</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
	<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css"> 
 <link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css"> 
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
		<a href="" data-role="button" onclick="window.location.href='../user/user_index'">主页</a>
			<h1>运动量录入</h1>
		</div>
		
		<fieldset data-role="controlgroup">
	    <legend>早餐前</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	       <c:choose>
			<c:when test="${sportInfo.beforebreakfasttype==sprotType.id}">
			<label for="beforebreakfast${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforebreakfast" id="beforebreakfast${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			<label for="beforebreakfast${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforebreakfast" id="beforebreakfast${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="beforebreakfasttime">运动时间（分钟）：</label>
			 <c:choose>
			<c:when test="${sportInfo.beforebreakfasttime!=null}">
			 <input type="range"
							id="beforebreakfast" name="beforebreakfasttime" required="true" value="${sportInfo.beforebreakfasttime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			 <input type="range"
							id="beforebreakfast" name="beforebreakfasttime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset>
	 
	  <fieldset data-role="controlgroup">
	    <legend>早餐后</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	        <c:choose>
			<c:when test="${sportInfo.afterbreakfasttype==sprotType.id}">
			 <label for="afterbreakfast${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterbreakfast" id="afterbreakfast${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			 <label for="afterbreakfast${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterbreakfast" id="afterbreakfast${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
	      
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="afterbreakfasttime">运动时间（分钟）：</label> 
			 <c:choose>
			<c:when test="${sportInfo.afterbreakfasttime!=null}">
			 <input type="range"
							id="afterbreakfast" name="afterbreakfasttime" required="true" value="${sportInfo.afterbreakfasttime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			<input type="range"
							id="afterbreakfast" name="afterbreakfasttime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset>
	  <fieldset data-role="controlgroup">
	    <legend>午餐前</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	       <c:choose>
			<c:when test="${sportInfo.beforelaunchtype==sprotType.id}">
			<label for="beforelaunch${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforelaunch" id="beforelaunch${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			 <label for="beforelaunch${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforelaunch" id="beforelaunch${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
	       
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="beforelaunchtime">运动时间（分钟）：</label> 
			 <c:choose>
			<c:when test="${sportInfo.beforelaunchtime!=null}">
			<input type="range"
							id="beforelaunch" name="beforelaunchtime" required="true" value="${sportInfo.beforelaunchtime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			<input type="range"
							id="beforelaunch" name="beforelaunchtime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset>
	  <fieldset data-role="controlgroup">
	    <legend>午餐后</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	        <c:choose>
			<c:when test="${sportInfo.afterlaunchtype==sprotType.id}">
			 <label for="afterlaunch${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterlaunch" id="afterlaunch${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			 <label for="afterlaunch${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterlaunch" id="afterlaunch${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
	      
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="afterlaunchtime">运动时间（分钟）：</label>
				 <c:choose>
			<c:when test="${sportInfo.afterlaunchtime!=null}">
			<input type="range"
							id="afterlaunch" name="afterlaunchtime" required="true" value="${sportInfo.afterlaunchtime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			<input type="range"
							id="afterlaunch" name="afterlaunchtime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			 
							</div>
	  </fieldset>
	  <fieldset data-role="controlgroup">
	    <legend>晚餐前</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	       <c:choose>
			<c:when test="${sportInfo.beforedinnertype==sprotType.id}">
			 <label for="beforedinner${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforedinner" id="beforedinner${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			  <label for="beforedinner${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforedinner" id="beforedinner${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
	      
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="beforedinnertime">运动时间（分钟）：</label>
				 <c:choose>
			<c:when test="${sportInfo.beforedinnertime!=null}">
			 <input type="range"
							id="beforedinner" name="beforedinnertime" required="true" value="${sportInfo.beforedinnertime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			 <input type="range"
							id="beforedinner" name="beforedinnertime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset>
	  <fieldset data-role="controlgroup">
	    <legend>晚餐后</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	        <c:choose>
			<c:when test="${sportInfo.afterdinnertype==sprotType.id}">
			<label for="afterdinner${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterdinner" id="afterdinner${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			 <label for="afterdinner${s.index }">${sprotType.name }</label>
	        <input type="radio" name="afterdinner" id="afterdinner${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
	       
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="afterdinnertime">运动时间（分钟）：</label>
			 <c:choose>
			<c:when test="${sportInfo.afterdinnertime!=null}">
			  <input type="range"
							id="afterdinner" name="afterdinnertime" required="true" value="${sportInfo.afterdinnertime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			 <input type="range"
							id="afterdinner" name="afterdinnertime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset>
	  
	  <fieldset data-role="controlgroup">
	    <legend>睡前</legend>
	       <c:forEach var="sprotType" items="${sprotTypeList}" varStatus="s">
	         <c:choose>
			<c:when test="${sportInfo.beforesleeptype==sprotType.id}">
			<label for="beforesleep${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforesleep" id="beforesleep${s.index }" value="${sprotType.id }" checked=true>
			</c:when>
			<c:otherwise>
			<label for="beforesleep${s.index }">${sprotType.name }</label>
	        <input type="radio" name="beforesleep" id="beforesleep${s.index }" value="${sprotType.id }">
			</c:otherwise>
			</c:choose>
			</c:forEach>
			<div data-role="fieldcontain">
			<label for="beforesleeptime">运动时间（分钟）：</label>
			 <c:choose>
			<c:when test="${sportInfo.beforesleeptime!=null}">
			   <input type="range"
							id="beforesleep" name="beforesleeptime" required="true" value="${sportInfo.beforesleeptime }"
							min="0" max="150">
			</c:when>
			<c:otherwise>
			  <input type="range"
							id="beforesleep" name="beforesleeptime" required="true" value="0"
							min="0" max="150">
			</c:otherwise>
			</c:choose>
			
							</div>
	  </fieldset> 
		<div data-role="fieldcontain">
     <input type="button" value="提交" onclick="onSubmit();">
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
	var beforebreakfasttype = $('[name="beforebreakfast"]:checked').val();
	var beforebreakfasttime = $('#beforebreakfast').val();
	var afterbreakfasttype = $('[name="afterbreakfast"]:checked').val();
	var afterbreakfasttime = $('#afterbreakfast').val(); 
	var beforelaunchtype = $('[name="beforelaunch"]:checked').val();
	var beforelaunchtime = $('#beforelaunch').val(); 
	var afterlaunchtype = $('[name="afterlaunch"]:checked').val();
	var afterlaunchtime = $('#afterlaunch').val(); 
	var beforedinnertype = $('[name="beforedinner"]:checked').val();
	var beforedinnertime = $('#beforedinner').val(); 
	var afterdinnertype = $('[name="afterdinner"]:checked').val();
	var afterdinnertime = $('#afterdinner').val(); 
	var beforesleeptype = $('[name="beforesleep"]:checked').val();
	var beforesleeptime = $('#beforesleep').val(); 
	  $.post("../diet/saveSport",{beforebreakfasttype:beforebreakfasttype,beforebreakfasttime:beforebreakfasttime,
		  afterbreakfasttype:afterbreakfasttype,afterbreakfasttime:afterbreakfasttime,beforelaunchtype:beforelaunchtype,
		  beforelaunchtime:beforelaunchtime,afterlaunchtype:afterlaunchtype,afterlaunchtime:afterlaunchtime,
		  beforedinnertype:beforedinnertype,beforedinnertime:beforedinnertime,afterdinnertype:afterdinnertype,
		  afterdinnertime:afterdinnertime,beforesleeptype:beforesleeptype,beforesleeptime:beforesleeptime},function(text){
			if(text=="1"){
				alert("保存成功！");
				window.location.href="../user/user_index";
			}else{
				alert("保存失败！")
			}
		}); 
}

</script>
</html>
