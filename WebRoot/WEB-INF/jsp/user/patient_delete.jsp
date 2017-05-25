<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
<head>

<title>患者信息删除</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path %>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.css">

</head>
<body>
<div  data-role="header">
 <a href="" data-role="button"  onclick="window.location.href='admin_index'">主页</a>
<h1>用户信息</h1>
</div>
<div data-role="content">
    <div data-role="fieldcontain">
    <input type="hidden" id="pId" value="${user.p_id }">
    <label for="name">姓名：</label>
    <span>${user.name }</span>
     </div>
     <div data-role="fieldcontain">
    <label for="birthday">出生日期：</label>
    <span>${user.birthday }</span>
    </div>
     <div data-role="fieldcontain">
    <label for="height">身高：</label>
    <span>${user.height }cm</span>
   </div>
    <div data-role="fieldcontain">
    <label for="prepregnancyWeight">孕前体重：</label>
    <span>${user.prepregnancyWeight}kg</span>
   </div>
     <div data-role="fieldcontain">
    <label for="weight">当前体重：</label>
    <span>${user.weight }kg</span>
   </div>
    <div data-role="fieldcontain">
    <label for="diabetesType">患病时间：</label>
    <c:if test="${user.diabetesType==0}">
      <span>怀孕前</span>
     </c:if>
      <c:if test="${user.diabetesType==1}">
      <span>怀孕时</span>
     </c:if>
   </div>
    <div data-role="fieldcontain">
   <label for="diabetesType">是否使用降糖药物：</label>
   <input type="hidden" id="isUsedDrug" value="${user.isUsedDrug }">
    <c:if test="${user.isUsedDrug==0}">
      <span>否</span>
     </c:if>
      <c:if test="${user.isUsedDrug==1}">
      <span>是</span>
     </c:if>
   </div>
   <div id="hiddenDIV" style="display:none;">
		<div data-role="fieldcontain">
		 <label for="diabetesType">药物类型：</label>
		    <c:if test="${user.effectType==0}">
		      <span>否</span>
		     </c:if>
		      <c:if test="${user.effectType==1}">
		      <span>是</span>
		     </c:if>
		</div>
		<div data-role="fieldcontain">
			<label for="weight">药物使用量：</label><span>${user.drugNum }单位</span>
		</div>
		</div>
    <div data-role="fieldcontain">
    <label for="strength">工作强度：</label>
    <c:choose>  
    <c:when test="${user.strength==0 }">  
             轻度劳动
        </c:when>  
    <c:when test="${user.strength==1 }">  
             中度劳动
    </c:when>  
    <c:when test="${user.strength==2 }">  
               重度劳动
    </c:when>  
</c:choose>  
   </div>
    <div data-role="fieldcontain">
    <label for="pregnancy">孕期周数：</label>
    <span>第${user.pregnancy }周</span>
   </div>
<div data-role="fieldcontain">
			<input type="button" value="删除" onclick="onSubmit();">
			<input type="button" value="返回" onclick="window.location.href='patient_list'">
		</div>

	<div data-role="footer">
		<h1>&nbsp;</h1>
	</div>
</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
var value = $("#isUsedDrug").val();
if(value=="1"){
	$("#hiddenDIV").show();
	
}
function onSubmit(){
	var r=confirm("确认删除？");
	if (r==true)
	  {
		var pId = $('#pId').val();
	    $.post("deletePatientInfo",{pId:pId},function(text){
		if(text=="1"){
			alert("删除成功！");
			window.location.href="patient_list";
		}else{
			alert("删除失败！")
		}
	   }); 
	 }
}
</script>
</html>
