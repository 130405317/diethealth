<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>

<title>患者记录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/green.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/green.icons.min.css">
<link rel="stylesheet"
	href="<%=path%>/jquerymobile/jquery.mobile.structure-1.4.5.min.css" />
<!-- <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" /> -->
</head>

<body onload="init()">
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/doctor_index'">主页</a>
			<h1>患者记录</h1>
		</div>

		<div data-role="fieldcontain">
			<p>
				蛋白质目标范围：<span id="protein_min"></span>-<span id="protein_max"></span>
			</p>
			<p>
				脂肪目标范围：<span id="fat_min"></span>-<span id="fat_max"></span>
			</p>
			<p>
				碳水化合物目标范围：<span id="carbohydrate_min"></span>-<span
					id="carbohydrate_max"></span>
			</p>
		</div>

		<p id="targetEnergy" style="display: none">${targetEnergy }</p>
		<h3 style="text-align: center;">孕糖宝温馨提示</h3>
		<div>
			<div data-role="fieldcontain">
				<div class="ui-grid-b">
					<div class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">总蛋白质</div>
					<div class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">总脂肪</div>
					<div class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">总碳水化合物</div>
				</div>
				<div class="ui-grid-b">
					<div id="protein" class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">${dietEnergy.protein}</div>
					<div id="fat" class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${dietEnergy.fat}</div>
					<div id="carbohydrate" class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">${dietEnergy.carbohydrate}</div>
				</div>
				<div class="ui-grid-b">
					<div id="protein_range" class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">-</div>
					<div id="fat_range" class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">-</div>
					<div id="carbohydrate_range" class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">-</div>
				</div>
			</div>

			<div>
				<a href="diet_info_d?pId=${pId }&date=${date}"><h3
						style="text-align: center;">饮食记录</h3></a>
				<div class="ui-grid-c">
					<div class="ui-block-a"
						style="border: 1px solid black; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">
						能量</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						蛋白质</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						脂肪</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						碳水化合物</div>
				</div>
				<div class="ui-grid-c">
					<div class="ui-block-a"
						style="border: 1px solid black; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">
						${dietEnergy.energy}</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						${dietEnergy.protein}</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						${dietEnergy.fat}</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						${dietEnergy.carbohydrate}</div>
				</div>
				<h3 style="text-align: center;">血糖记录</h3>
				<div class="ui-grid-d" id="bggrid">
					<div class="ui-block-a"
						style="height: 35px; border: 1px solid black; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">
						早餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>
					<div class="ui-block-b"
						style="height: 35px; border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						午餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="height: 35px; border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						晚餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="height: 35px; border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						睡前
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
						</div>
					</div>
					<div class="ui-block-e"
						style="height: 35px; border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						糖化血糖蛋白</div>
					<div class="ui-block-a"
						style="border: 1px solid black; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${bg.bloodGlucoseBeforeBreakfast }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${bg.bloodGlucoseAfterBreakfast }</div>
						</div>
					</div>
					<div class="ui-block-b"
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
					<div class="ui-block-c"
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
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;"
						name="before">${bg.bloodGlucoseBeforeSleep }</div>
					<div class="ui-block-e"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						${bg.HbAlc }</div>
				</div>
				<h3 style="text-align: center;">运动量记录</h3>
				<div class="ui-grid-c">
					<div class="ui-block-a"
						style="border: 1px solid black; border-style: ridge ridge ridge ridge; text-align: center; font-size: 10px;">
						早餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>

					<div class="ui-block-b"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						午餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						晚餐
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: ridge ridge none none; text-align: center; font-size: 10px;">前</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: ridge none none none; text-align: center; font-size: 10px;">后</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: ridge ridge ridge none; text-align: center; font-size: 10px;">
						睡前
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;">&nbsp;</div>
						</div>
					</div>

					<div class="ui-block-a"
						style="border: 1px solid black; border-style: none ridge none ridge; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforebreakfasttype }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterbreakfasttype }</div>
						</div>
					</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforelaunchtype }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterlaunchtype }</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforedinnertype }</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterdinnertype }</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
						name="before">${sportInfo.beforesleeptype }</div>

					<div class="ui-block-a"
						style="border: 1px solid black; border-style: none ridge ridge ridge; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforebreakfasttime }分钟</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterbreakfasttime }分钟</div>
						</div>
					</div>
					<div class="ui-block-b"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforelaunchtime }分钟</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterlaunchtime }分钟</div>
						</div>
					</div>
					<div class="ui-block-c"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;">
						<div class="ui-grid-a">
							<div class="ui-block-a"
								style="border: 1px solid black; border-style: none ridge none none; text-align: center; font-size: 10px;"
								name="before">${sportInfo.beforedinnertime }分钟</div>
							<div class="ui-block-b"
								style="border: 1px solid black; border-style: none none none none; text-align: center; font-size: 10px;"
								name="after">${sportInfo.afterdinnertime }分钟</div>
						</div>
					</div>
					<div class="ui-block-d"
						style="border: 1px solid black; border-style: none ridge ridge none; text-align: center; font-size: 10px;"
						name="before">${sportInfo.beforesleeptime }分钟</div>
				</div>


				<div data-role="fieldcontain">
					<input type="hidden" value="${pId }" id="pId"> <input
						type="hidden" value="${date}" id="bgdate">
				</div>
				<div data-role="fieldcontain">
					<p>医生建议：</p>
					<textarea id="content"></textarea>
				</div>
				<div data-role="fieldcontain">
					<input id="advice_sub" type="button" value="提交" onclick="onSubmit();">
				</div>
			</div>

		</div>
</body>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>
<script>
	function init() {
		var targetEnergy = $("#targetEnergy").text();
		var protein1 = targetEnergy * 0.15;
		var protein2 = targetEnergy * 0.2;
		var protein = $("#protein").text();
		var fat1 = targetEnergy * 0.25;
		var fat2 = targetEnergy * 0.3;
		var fat = $("#fat").text();
		var carbohydrate1 = targetEnergy * 0.5;
		var carbohydrate2 = targetEnergy * 0.6;
		var carbohydrate = $("#carbohydrate").text();
		$("#protein_min").text(protein1);
		$("#protein_max").text(protein2);
		$("#fat_min").text(fat1);
		$("#fat_max").text(fat2);
		$("#carbohydrate_min").text(carbohydrate1);
		$("#carbohydrate_max").text(carbohydrate2);
		if (protein < protein1) {
			$("#protein_range").text("不足");
		} else if (protein > protein2) {
			$("#protein_range").text("偏高");
		} else {
			$("#protein_range").text("正常");
		}
		if (fat < fat1) {
			$("#fat_range").text("不足");
		} else if (fat > fat2) {
			$("#fat_range").text("偏高");
		} else {
			$("#fat_range").text("正常");
		}
		if (carbohydrate < carbohydrate1) {
			$("#carbohydrate_range").text("不足");
		} else if (carbohydrate > carbohydrate2) {
			$("#carbohydrate_range").text("偏高");
		} else {
			$("#carbohydrate_range").text("正常");
		}
	}

	function onSubmit() {
		var content = $('#content').val();
		if(content == ""){
			alert("医生建议不能为空！");
			return;
		}
		$("#advice_sub").attr("disabled", true);
		var pId = $('#pId').val();
		var date = $('#bgdate').val();
		var myDate= new Date();
		var time = myDate.getFullYear()+"年"+(myDate.getMonth()+1)+"月"+myDate.getDate()+"日"+myDate.getHours()+"时"+myDate.getMinutes()+"分"+myDate.getSeconds()+"秒";
		$.post("saveAdvice", {
			content : content,
			pId : pId,
			date : date,
			time : time
		}, function(text) {
			if (text == "1") {
				alert("保存成功！");
				
			} else {
				alert("保存失败！");
				$("#advice_sub").attr("disabled", false);
			}
		});
	}
</script>
</html>
