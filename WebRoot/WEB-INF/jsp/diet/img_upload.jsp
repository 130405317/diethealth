<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
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
			<form>
				<h3 style="text-align: center;">早餐</h3>
				<div id="box1">

					<div id="breakfast" class="webuploader-container" style="text-align: center;">
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
			<br/>
			<form>
				<h3 style="text-align: center;">早上加餐</h3>
				<div id="box2">

					<div id="breakfast_add" class="webuploader-container" style="text-align: center;">
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
			<br/>
			<form>
				<h3 style="text-align: center;">午餐</h3>
				<div id="box3">

					<div id="lunch" class="webuploader-container" style="text-align: center;">
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
			<br/>
			<form>
				<h3 style="text-align: center;">中午加餐</h3>
				<div id="box4">

					<div id="lunch_add" class="webuploader-container" style="text-align: center;">
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
			<br/>
			<form>
				<h3 style="text-align: center;">晚餐</h3>
				<div id="box5">

					<div id="dinner" class="webuploader-container" style="text-align: center;">
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
			<br/>
			<form>
				<h3 style="text-align: center;">晚上加餐</h3>
				<div id="box6">

					<div id="dinner_add" class="webuploader-container" style="text-align: center;">
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
		</div>
	</div>
	<script type="text/javascript">
		/*

		 * 服务器地址,成功返回,失败返回参数格式依照jquery.ajax习惯;

		 * 其他参数同WebUploader

		 */

		$('#breakfast').diyUpload({

			url : '../diet/img_moreUpload',

			success : function(data) {

				console.info(data);

			},

			error : function(err) {

				console.info(err);

			},
			// 分片大小
			chunkSize:512 * 1024,
			//最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
			fileNumLimit:10,
			fileSizeLimit:500000 * 1024,
			fileSingleSizeLimit:50000 * 1024,
			accept: {}

		});
		 
		 $('#breakfast_add').diyUpload({

				url : '../diet/img_moreUpload',

				success : function(data) {

					console.info(data);

				},

				error : function(err) {

					console.info(err);

				}

			});

		 $('#lunch').diyUpload({

				url : '../diet/img_moreUpload',

				success : function(data) {

					console.info(data);

				},

				error : function(err) {

					console.info(err);

				}

			});
		 
		 $('#lunch_add').diyUpload({

				url : '../diet/img_moreUpload',

				success : function(data) {

					console.info(data);

				},

				error : function(err) {

					console.info(err);

				}

			});
		 
		 $('#dinner').diyUpload({

				url : '../diet/img_moreUpload',

				success : function(data) {

					console.info(data);

				},

				error : function(err) {

					console.info(err);

				}

			});
		 $('#dinner_add').diyUpload({

				url : '../diet/img_moreUpload',

				success : function(data) {

					console.info(data);

				},

				error : function(err) {

					console.info(err);

				}

			});
	</script>
</body>
</html>