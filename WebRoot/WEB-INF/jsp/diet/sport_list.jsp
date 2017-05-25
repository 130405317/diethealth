<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%
String path = request.getContextPath();
%>
<html>
<head>

<title>运动记录列表</title>
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
    <h1>运动记录列表</h1>
  </div>

  <div data-role="content">
    <ul data-role="listview" data-autodividers="false" data-inset="true" data-filter="true" data-filter-placeholder="搜索日期">
     <c:forEach var="sport" items="${sportList}" varStatus="s">
    <li><a href="" onclick="window.location.href='sport_info?pId=${sport.p_id }&date=${sport.date }'">${sport.date }</a></li>
    </c:forEach>
  </ul>
  </div>

  <div data-role="footer">
    <h1><a href="" data-role="button" onclick="pageChange(-1)">上一页</a>${curPage }/${totalPage }<a href="" data-role="button" onclick="pageChange(1)">下一页</a></h1>
  </div>
</div> 
</body>
<script src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
function pageChange(num){
	var curPage = ${curPage };
	var totalPage = ${totalPage};
	if(curPage+num<1){
		alert("当前页已经是第一页");
	}else if(curPage+num>totalPage){
		alert("当前页已经是最后一页");
	}else{
		curPage = curPage+num;
		window.location.href='sport_list?curPage='+curPage;
	}
}
</script>
</html>
