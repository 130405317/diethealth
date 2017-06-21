<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String pId = session.getAttribute("pId").toString();
	//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食物图片上传</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta content="width=device-width" name="viewport" />
<link rel="shortcut icon" href="<%=path%>/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/jquerymobile/pink.icons.min.css">
<link rel="stylesheet"
	href="<%=path%>/jquerymobile/jquery.mobile.structure-1.4.5.min.css" />

<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/jquerymobile/jquery.mobile-1.4.5.min.js"></script>



<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/webuploader.css">

<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/diyUpload.css">

<script type="text/javascript"
	src="<%=path%>/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/diyUpload.js"></script>


</head>
<body>

	<div data-role="page">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../diet/diet_edit'">返回</a>
			<h1>食物图片上传</h1>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<label for="diettype">餐饮类型：</label> <select name="diettype"
					id="diettype" required="true">
					<c:forEach var="diettype" items="${typeList}" varStatus="s">
						<option value="${diettype.value }">${diettype.name }</option>
					</c:forEach>
				</select>
			</div>
			<form>

				<div id="box1">

					<div id="food" class="webuploader-container"
						style="text-align: center;">
						<div class="webuploader-pick">点击选择图片</div>
						<div id="rt_rt_1b4vip7u5d5g1n0f1an51prs9191"
							style="position: absolute; top: 0px; left: 0px; width: 126px; height: 38px; overflow: hidden; bottom: auto; right: auto;">
							<input type="file" name="file"
								class="webuploader-element-invisible" multiple="multiple"
								accept="image/*"><label
								style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);"></label>
						</div>
					</div>

				</div>
			</form>
			<br /> <br />
			<div id="image_result" style="display: none">
				<span>请选择匹配的食物：</span>
				<div>
					<img id="picture1" width="32%" alt=""
						src="<%=path%>/img_food/hong1.jpg" onclick="getPhotoName('picture1')">
					<img id="picture2" width="32%" alt=""
						src="<%=path%>/img_food/hong2.jpg" onclick="getPhotoName('picture2')">
					<img id="picture3" width="32%" alt=""
						src="<%=path%>/img_food/hong3.jpg" onclick="getPhotoName('picture3')">
				</div>
				<div>
					<div class="ui-grid-b">
						<div id="picture1_span" class="ui-block-a"
							style="border: 0px solid black; text-align: center; border-style: ridge ridge ridge ridge;">总蛋白质</div>
						<div id="picture2_span" class="ui-block-b"
							style="border: 0px solid black; text-align: center; border-style: ridge ridge ridge none;">总脂肪</div>
						<div id="picture3_span" class="ui-block-c"
							style="border: 0px solid black; text-align: center; border-style: ridge ridge ridge none;">总碳水化合物</div>
					</div>
				</div>
			</div>
			<br />
			<div id="food_result" style="display: none">
				<div class="ui-grid-b">
					<div class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge ridge;">食物名称</div>
					<div class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">食物重量</div>
					<div class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">食物能量</div>
				</div>
				<div class="ui-grid-b">
					<div id="food_name" class="ui-block-a"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge ridge;">&nbsp;</div>
					<div id="food_weight" class="ui-block-b"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">0</div>
					<div id="food_energy" class="ui-block-c"
						style="border: 1px solid black; text-align: center; border-style: none ridge ridge none;">0</div>
				</div>
			</div>

			<div data-role="fieldcontain">
				<input type="button" value="提交" onclick="onSubmit();">
			</div>
		</div>

	</div>
	<script type="text/javascript">
	var path = getRootPath();
	
	//js获取项目根路径，如： http://localhost:8083/uimcardprj
	function getRootPath(){
	    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName);
	}
		/*

		 * 服务器地址,成功返回,失败返回参数格式依照jquery.ajax习惯;

		 * 其他参数同WebUploader

		 */

		$('#food').diyUpload(
				{

					url : '../diet/img_moreUpload',

					success : function(data) {
						$(".webuploader-pick").hide();
						var fileName;
						for (i = 0; i < data.length; i++) {
							fileName = data[0];
							console.log(fileName);
			
							if (fileName.indexOf("hsr1.jpg")>=0
									|| fileName.indexOf("hsr2.jpg")>=0
									|| fileName.indexOf("hsr3.jpg")>=0
									|| fileName.indexOf("hszt.jpg")>=0
									|| fileName.indexOf("hspg.jpg")>=0) {
								 $("#picture1").attr("src",
										path+"/img_food/hsr3.jpg");
								$("#picture2").attr("src",
										path+"/img_food/hszt.jpg");
								$("#picture3").attr("src",
										path+"/img_food/hspg.jpg");
								 
								$("#picture1_span").text("红烧肉");
								$("#picture2_span").text("红烧猪蹄");
								$("#picture3_span").text("红烧排骨");
								$("#image_result").show();
								$("#food_weight").text("200");
								$("#food_energy").text("556");
							}else 
							if (fileName.indexOf("gbdj.jpg")>=0
									|| fileName.indexOf("gbsjd.jpg")>=0
									|| fileName.indexOf("phg.jpg")>=0) {
								 $("#picture1").attr("src",
										path+"/img_food/gbdj.jpg");
								$("#picture2").attr("src",
										path+"/img_food/gbsjd.jpg");
								$("#picture3").attr("src",
										path+"/img_food/phg.jpg");
								 
								$("#picture1_span").text("干煸豆角");
								$("#picture2_span").text("干煸四季豆");
								$("#picture3_span").text("拍黄瓜");
								$("#image_result").show();
								$("#food_weight").text("145");
								$("#food_energy").text("253");
							}else 
							if (fileName.indexOf("jdg.jpg")>=0 || fileName.indexOf("zd.jpg")>=0
									|| fileName.indexOf("jdt.jpg")>=0) {
								 $("#picture1").attr("src",
										path+"/img_food/jdg.jpg");
								$("#picture2").attr("src",
										path+"/img_food/zd.jpg");
								$("#picture3").attr("src",
										path+"/img_food/jdt.jpg");
								
								$("#picture1_span").text("鸡蛋羹");
								$("#picture2_span").text("蒸蛋");
								$("#picture3_span").text("蛋汤");
								$("#image_result").show();
								$("#food_weight").text("362");
								$("#food_energy").text("184");
							}else 
							if (fileName.indexOf("qcxr.jpg")>=0 || fileName.indexOf("xlx.jpg")>=0
									|| fileName.indexOf("ymdx.jpg")>=0) {
								$("#picture1").attr("src",
										path+"/img_food/qcxr.jpg");
								$("#picture2").attr("src",
										path+"/img_food/xlx.jpg");
								$("#picture3").attr("src",
										path+"/img_food/ymdx.jpg");
								
								$("#picture1_span").text("清蒸虾仁");
								$("#picture2_span").text("香辣虾");
								$("#picture3_span").text("油焖大虾");
								$("#image_result").show();
								$("#food_weight").text("368");
								$("#food_energy").text("472");
							}else{
								alert("没有匹配的食物！");
							}
						}

					},

					error : function(err) {

						console.info(err);

					},
					// 分片大小
					chunkSize : 512 * 1024,
					//最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
					fileNumLimit : 1,
					fileSizeLimit : 500000 * 1024,
					fileSingleSizeLimit : 50000 * 1024,
					accept : {}

				});
		function getPhotoName(id) {
			var name = $("#" + id + "_span").text();
			$("#food_name").text(name);
			$("#food_result").show();
		}

		var pId = "";
		function onSubmit() {
			var diettype = $('#diettype').find("option:selected").val();
			var food_name = $("#food_name").text();
			var food_weight = $("#food_weight").text();
			var food_energy = $("#food_energy").text();
			if(food_energy == 0){
				alert("请录入饮食数据！");
				return;
			}
			$.post("../diet/savePhotoDiet", {
				type : diettype,
				pId : pId,
				food_name : food_name,
				food_weight : food_weight,
				food_energy : food_energy
			}, function(text) {
				if (text == "1") {
					alert("保存成功！");
					window.location.href = "../user/user_index";
				} else {
					alert("保存失败！");
				}
			});
		}
	</script>
</body>
</html>