<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String pId = session.getAttribute("pId").toString();
	//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
%>
<html>
<head>

<title>血糖录入</title>
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
			onclick="window.location.href='../user/user_index'">主页</a>
		<h1>血糖录入</h1>
	</div>
	<div data-role="content">
		<div>
			<p style="color: red">6.7--7.5血糖较高注意查找原因</p>
			<p style="color: red">7.5---血糖超出正常值很多及时就诊</p>
		</div>
		<form method="post" action="">
			<div data-role="fieldcontain" style="display: none;">
				<input type="text" id="pId" value="<%=pId%>">
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseBeforeBreakfast">早餐前：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseBeforeBreakfast==0}">
						<input type="text" name="bloodGlucoseBeforeBreakfast"
							id="bloodGlucoseBeforeBreakfast" placeholder="空腹血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseBeforeBreakfast"
							id="bloodGlucoseBeforeBreakfast" placeholder="空腹血糖（mmol/L）"
							value="${bg.bloodGlucoseBeforeBreakfast }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseAfterBreakfast">早餐后：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseAfterBreakfast==0}">
						<input type="text" name="bloodGlucoseAfterBreakfast"
							id="bloodGlucoseAfterBreakfast" placeholder="早餐后2小时血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseAfterBreakfast"
							id="bloodGlucoseAfterBreakfast" placeholder="早餐后2小时血糖（mmol/L）"
							value="${bg.bloodGlucoseAfterBreakfast }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseBeforeLunch">午餐前：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseBeforeLunch==0}">
						<input type="text" name="bloodGlucoseBeforeLunch"
							id="bloodGlucoseBeforeLunch" placeholder="午餐前2小时血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseBeforeLunch"
							id="bloodGlucoseBeforeLunch" placeholder="午餐前2小时血糖（mmol/L）"
							value="${bg.bloodGlucoseBeforeLunch }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseAfterLunch">午餐后：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseAfterLunch==0}">
						<input type="text" name="bloodGlucoseAfterLunch"
							id="bloodGlucoseAfterLunch" placeholder="午餐后2小时血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseAfterLunch"
							id="bloodGlucoseAfterLunch" placeholder="午餐后2小时血糖（mmol/L）"
							value="${bg.bloodGlucoseAfterLunch }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseBeforeDinner">晚餐前：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseBeforeDinner==0}">
						<input type="text" name="bloodGlucoseBeforeDinner"
							id="bloodGlucoseBeforeDinner" placeholder="晚餐前2小时血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseBeforeDinner"
							id="bloodGlucoseBeforeDinner" placeholder="晚餐前2小时血糖（mmol/L）"
							value="${bg.bloodGlucoseBeforeDinner }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseAfterDinner">晚餐后：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseAfterDinner==0}">
						<input type="text" name="bloodGlucoseAfterDinner"
							id="bloodGlucoseAfterDinner" placeholder="晚餐后2小时血糖（mmol/L）"
							value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseAfterDinner"
							id="bloodGlucoseAfterDinner" placeholder="晚餐后2小时血糖（mmol/L）"
							value="${bg.bloodGlucoseAfterDinner }">
					</c:otherwise>
				</c:choose>
			</div>
			<div data-role="fieldcontain">
				<label for="bloodGlucoseBeforeSleep">睡前：</label>
				<c:choose>
					<c:when test="${bg.bloodGlucoseBeforeSleep==0}">
						<input type="text" name="bloodGlucoseBeforeSleep"
							id="bloodGlucoseBeforeSleep" placeholder="睡前血糖（mmol/L）" value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="bloodGlucoseBeforeSleep"
							id="bloodGlucoseBeforeSleep" placeholder="睡前血糖（mmol/L）"
							value="${bg.bloodGlucoseBeforeSleep }">
					</c:otherwise>
				</c:choose>
			</div>
			
			<div data-role="fieldcontain">
				<label for="bloodGlucoseBeforeSleep">糖化血糖蛋白：</label>
				<c:choose>
					<c:when test="${bg.HbAlc==0}">
						<input type="text" name="HbAlc"
							id="HbAlc" placeholder="糖化血糖蛋白（mmol/L）" value="">
					</c:when>
					<c:otherwise>
						<input type="text" name="HbAlc"
							id="HbAlc" placeholder="糖化血糖蛋白（mmol/L）"
							value="${bg.HbAlc }">
					</c:otherwise>
				</c:choose>
			</div>

			<div data-role="fieldcontain">
				<input type="button" onclick="onSubmit();" value="提交" />
			</div>
		</form>
	</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
	function onSubmit() {
		var pId = $('#pId').val();
		var timestamp = Date.parse(new Date());
		var isSuccess = true;
		var bloodGlucoseBeforeBreakfast = $('#bloodGlucoseBeforeBreakfast')
				.val();
		var bloodGlucoseAfterBreakfast = $('#bloodGlucoseAfterBreakfast').val();
		var bloodGlucoseBeforeLunch = $('#bloodGlucoseBeforeLunch').val();
		var bloodGlucoseAfterLunch = $('#bloodGlucoseAfterLunch').val();
		var bloodGlucoseBeforeDinner = $('#bloodGlucoseBeforeDinner').val();
		var bloodGlucoseAfterDinner = $('#bloodGlucoseAfterDinner').val();
		var bloodGlucoseBeforeSleep = $('#bloodGlucoseBeforeSleep').val();
		var HbAlc = $('#HbAlc').val();
		if (bloodGlucoseBeforeBreakfast != "") {
			if (isNaN(bloodGlucoseBeforeBreakfast)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseBeforeBreakfast) < 0
					|| parseFloat(bloodGlucoseBeforeBreakfast) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseAfterBreakfast != "") {
			if (isNaN(bloodGlucoseAfterBreakfast)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseAfterBreakfast) < 0
					|| parseFloat(bloodGlucoseAfterBreakfast) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseBeforeLunch != "") {
			if (isNaN(bloodGlucoseBeforeLunch)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseBeforeLunch) < 0
					|| parseFloat(bloodGlucoseBeforeLunch) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseAfterLunch != "") {
			if (isNaN(bloodGlucoseAfterLunch)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseAfterLunch) < 0
					|| parseFloat(bloodGlucoseAfterLunch) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseBeforeDinner != "") {
			if (isNaN(bloodGlucoseBeforeDinner)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseBeforeDinner) < 0
					|| parseFloat(bloodGlucoseBeforeDinner) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseAfterDinner != "") {
			if (isNaN(bloodGlucoseAfterDinner)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseAfterDinner) < 0
					|| parseFloat(bloodGlucoseAfterDinner) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (bloodGlucoseBeforeSleep != "") {
			if (isNaN(bloodGlucoseBeforeSleep)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(bloodGlucoseBeforeSleep) < 0
					|| parseFloat(bloodGlucoseBeforeSleep) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}
		if (HbAlc != "") {
			if (isNaN(HbAlc)) {
				alert("血糖格式不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			} else if (parseFloat(HbAlc) < 0
					|| parseFloat(HbAlc) > 20) {
				alert("血糖范围不正确！");
				setTimeout(1000);
				//window.location.href="../user/user_index";
				isSuccess = false;
			}
		}

		if(bloodGlucoseBeforeBreakfast == ""
			&& bloodGlucoseAfterBreakfast == ""
			&& bloodGlucoseBeforeLunch == ""
			&& bloodGlucoseAfterLunch == ""
			&& bloodGlucoseBeforeDinner == ""
			&& bloodGlucoseAfterDinner == ""
			&& bloodGlucoseBeforeSleep == ""
			&& HbAlc == ""){
			alert("至少录入一项！");
			return;
		}
		if (isSuccess) {
			$.post("saveBloodGlucose", {
				pId : pId,
				bloodGlucoseBeforeBreakfast : bloodGlucoseBeforeBreakfast,
				bloodGlucoseAfterBreakfast : bloodGlucoseAfterBreakfast,
				bloodGlucoseBeforeLunch : bloodGlucoseBeforeLunch,
				bloodGlucoseAfterLunch : bloodGlucoseAfterLunch,
				bloodGlucoseBeforeDinner : bloodGlucoseBeforeDinner,
				bloodGlucoseAfterDinner : bloodGlucoseAfterDinner,
				bloodGlucoseBeforeSleep : bloodGlucoseBeforeSleep,
				HbAlc : HbAlc
			}, function(text) {
				if (text == "1") {
					alert("保存成功！");
					setTimeout(1000);
					window.location.href = "../user/user_index";
				} else {
					alert("保存失败！");
				}
			});
		}

	}
</script>
</html>
