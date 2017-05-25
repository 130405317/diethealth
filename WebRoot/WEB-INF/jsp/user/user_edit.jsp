<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>用户信息修改</title>
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
	<div data-role="header">
		<a href="" data-role="button"
			onclick="window.location.href='user_index'">主页</a>
		<h1>用户信息修改</h1>
	</div>
	<div data-role="content">
		<div data-role="fieldcontain" style="display: none;">
			<input type="text" id="pId" value="${user.p_id }">
		</div>
		<div data-role="fieldcontain">
			<label for="name">姓名：</label> <input type="text" name="name"
				id="name" placeholder="您的真实姓名" required="true" value="${user.name }">
		</div>
		<div data-role="fieldcontain">
			<label for="birthday">出生日期：</label> <input type="date"
				name="birthday" id="birthday" placeholder="您的出生日期" required="true"
				value="${user.birthday }">
		</div>
		<div data-role="fieldcontain">
			<label for="height">身高（cm）：</label> <input type="range" name="height"
				id="height" placeholder="您的身高（cm）" required="true" min="50"
				max="250" value="${user.height }">
		</div>
		<div data-role="fieldcontain">
			<label for="prepregnancyWeight">孕前体重（kg）：</label> <input type="range"
				name="prepregnancyWeight" id="prepregnancyWeight" required="true"
				min="40" max="100" value="${user.prepregnancyWeight}">
		</div>
		<div data-role="fieldcontain">
			<label for="weight">当前体重（kg）：</label> <input type="range"
				name="weight" id="weight" required="true" min="40" max="100"
				value="${user.weight }">
		</div>
		<div data-role="fieldcontain">
			<label for="diabetesType">患病时间：</label> <select name="diabetesType"
				id="diabetesType" required="true" value="${user.diabetesType }">
				<option <c:if test="${user.diabetesType==0 }">selected</c:if>
					value="0">怀孕前</option>
				<option <c:if test="${user.diabetesType==1 }">selected</c:if>
					value="1">怀孕时</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for=fetus_num>胎儿数量：</label> <select name="fetus_num"
				id="fetus_num" required="true">
				<option value="1">单胞胎</option>
				<option value="2">双胞胎</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for="height">是否使用降糖药物：</label> <select name="isUsedDrug"
				id="isUsedDrug" required="true" onchange="selectChange();">
				<option <c:if test="${user.isUsedDrug==0 }">selected</c:if>
					value="0">否</option>
				<option <c:if test="${user.isUsedDrug==1 }">selected</c:if>
					value="1">是</option>
			</select>
		</div>
		<div id="hiddenDIV" style="display: none;">
			<div data-role="fieldcontain">
				<label for="height">药物类型：</label> <select name="effectType"
					id="effectType" required="true">
					<option <c:if test="${user.effectType==0 }">selected</c:if>
						value="0">长效</option>
					<option <c:if test="${user.effectType==1 }">selected</c:if>
						value="1">短效</option>
				</select>
			</div>
			<div data-role="fieldcontain">
				<label for="weight">药物使用量：</label> <input type="range"
					name="drugNum" id="drugNum" required="true" min="0" max="100"
					value="${user.drugNum }">
			</div>
		</div>
		<div data-role="fieldcontain">
			<label for="strength">工作强度：</label> <select name="strength"
				id="strength" required="true" value="${user.strength }">
				<option <c:if test="${user.strength==0 }">selected</c:if> value="0">轻度劳动</option>
				<option <c:if test="${user.strength==1 }">selected</c:if> value="1">中度劳动</option>
				<option <c:if test="${user.strength==2 }">selected</c:if> value="2">重度劳动</option>
			</select>
		</div>
		<div data-role="fieldcontain">
			<label for="pregnancy">孕期周数：</label> <input type="range"
				name="pregnancy" id="pregnancy" placeholder="请输入您的孕期周数"
				required="true" value="${user.pregnancy }" min="0" max="50">
		</div>
		<div data-role="fieldcontain">
			<label for="doctorId">主治医师：</label> <select name="doctorId"
				id="doctorId" required="false" value="${user.doctorId }">
				<c:forEach var="doctor" items="${doctorlist}" varStatus="s">
					<option value="${doctor.d_id }"
						<c:if test="${doctor.d_id==user.doctorId}">selected</c:if>>${doctor.name }
					</option>
				</c:forEach>
			</select>

		</div>
		<div data-role="fieldcontain">
			<button onclick="onSubmit();">提交</button>
		</div>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
	var isUsedDrug = $("#isUsedDrug").val();
	if (isUsedDrug == 1) {
		$("#hiddenDIV").show();
	}
	function selectChange() {
		var isUsedDrug = $("#isUsedDrug").val();
		if (isUsedDrug == 1) {
			$("#hiddenDIV").show();
		} else {
			$("#hiddenDIV").hide();
		}
	}
	function onSubmit() {
		var pId = $('#pId').val();
		var name = $('#name').val();
		var birthday = $('#birthday').val();
		var height = $('#height').val();
		var prepregnancyWeight = $('#prepregnancyWeight').val();
		var weight = $('#weight').val();
		var diabetesType = $('#diabetesType').val();
		var strength = $('#strength').val();
		var pregnancy = $('#pregnancy').val();
		var doctorId = $('#doctorId').val();
		var isUsedDrug = $('#isUsedDrug').val();
		var fetus_num = $('#fetus_num').val();
		var effectType = $('#effectType').val();
		var drugNum = $('#drugNum').val();
		if (name == "") {
			alert("真实姓名不能为空！");
			return false;
		} else if (height == "") {
			alert("身高不能为空！");
			return false;
		} else if (strength == "") {
			alert("工作强度不能为空！");
			return false;
		} else {
			$.post("saveUserInfo", {
				pId : pId,
				name : name,
				birthday : birthday,
				isUsedDrug : isUsedDrug,
				fetus_num: fetus_num,
				effectType : effectType,
				drugNum : drugNum,
				height : height,
				prepregnancyWeight : prepregnancyWeight,
				weight : weight,
				diabetesType : diabetesType,
				strength : strength,
				pregnancy : pregnancy,
				doctorId : doctorId
			}, function(text) {
				if (text == "1") {
					alert("保存成功！");
					window.location.href = "user_index";
				} else {
					alert("保存失败！")
				}
			});
		}

	}
</script>
</html>
