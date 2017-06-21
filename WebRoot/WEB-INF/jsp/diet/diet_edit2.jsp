<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%
	String path = request.getContextPath();
	//String pId = session.getAttribute("pId").toString();
	String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
%>
<html>
<head>

<title>个人饮食录入</title>
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
<!-- <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" /> -->
<style>
.suggest {
	background-color: #fff;
	border: 1px solid #999;
}

.suggest ul {
	list-style: none;
	height: 200px;
	overflow-x: hidden;
	overflow-y: scroll;
	overflow-x: hidden;
}

.suggest ul li {
	padding: 3px;
	font-size: 14px;
	line-height: 25px;
	border-bottom: 1px solid #CCCCCC;
}

.suggest ul li:hover {
	text-decoration: underline;
	background-color: #e5e5e5;
}
</style>
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<a href="" data-role="button"
				onclick="window.location.href='../user/user_index'">主页</a>
			<h1>饮食录入</h1>
			<a href="" data-role="button"
				onclick="window.location.href='../diet/diet_img_upload'">图片上传</a>
		</div>
		<div data-role="content">
			<div data-role="fieldcontain">
				<p id="energy" style="display: none">${energy}</p>
				<p>
					目标能量(kal)：<span id="targetenergy"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					总能量(kal)：<span id="sumenergy">0</span>
				</p>
			</div>
			<div data-role="fieldcontain">
				<label for="diettype">餐饮类型：</label> <select name="diettype"
					id="diettype" required="true" onchange="setTargetEnergy()">
					<c:forEach var="diettype" items="${typeList}" varStatus="s">
						<option value="${diettype.value }">${diettype.name }</option>
					</c:forEach>
				</select>
			</div>
			<div data-role="collapsible">
				<h1>主食</h1>
				<div id="mainfood">
					<div name="mainfoodtype" id="mainfoodtype1">
						<p>
						<div id="mainfood1_div">
							<!-- 输入框 -->
							<input id="mainfood1_keyword" type="text" size="50"
								onkeyup="getMoreContents_mainfood('mainfood1')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="mainfood1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>

						<input id="mainfood1" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>
					</div>
					<div data-role="fieldcontain" id="mainfoodnums1" name="mainfoodnum">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('mainfoodnum1')" onchange="changeNumber('mainfoodnum1')" id="mainfoodnum1" name="number"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="mainfoodtype" id="mainfoodtype2" style="display: none">
						<p>
						<div id="mainfood2_div">
							<!-- 输入框 -->
							<input id="mainfood2_keyword" type="text" size="50"
								onkeyup="getMoreContents_mainfood('mainfood2')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="mainfood2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="mainfood2" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>





					</div>
					<div data-role="fieldcontain" name="mainfoodnum" id="mainfoodnums2"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('mainfoodnum2')" onchange="changeNumber('mainfoodnum2')" id="mainfoodnum2" name="number"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="mainfoodtype" id="mainfoodtype3" style="display: none">
						<p>
						<div id="mainfood3_div">
							<!-- 输入框 -->
							<input id="mainfood3_keyword" type="text" size="50"
								onkeyup="getMoreContents_mainfood('mainfood3')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="mainfood3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="mainfood3" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>



					</div>
					<div data-role="fieldcontain" id="mainfoodnums3" name="mainfoodnum"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('mainfoodnum3')" onchange="changeNumber('mainfoodnum3')" id="mainfoodnum3" name="number"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="mainfoodtype" id="mainfoodtype4" style="display: none">
						<p>
						<div id="mainfood4_div">
							<!-- 输入框 -->
							<input id="mainfood4_keyword" type="text" size="50"
								onkeyup="getMoreContents_mainfood('mainfood4')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="mainfood4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="mainfood4" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" id="mainfoodnums4" name="mainfoodnum"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('mainfoodnum4')" onchange="changeNumber('mainfoodnum4')" id="mainfoodnum4" name="number"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="mainfoodtype" id="mainfoodtype5" style="display: none">
						<p>
						<div id="mainfood5_div">
							<!-- 输入框 -->
							<input id="mainfood5_keyword" type="text" size="50"
								onkeyup="getMoreContents_mainfood('mainfood5')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="mainfood5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="mainfood5" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" id="mainfoodnums5" name="mainfoodnum"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('mainfoodnum5')" onchange="changeNumber('mainfoodnum5')" id="mainfoodnum5" name="number"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('mainfood');">新增主食</button>
					<button onclick="removefood('mainfood');">移除主食</button>
				</div>
			</div>

			<div data-role="collapsible">
				<h1>肉类</h1>
				<div id="meat">
					<div name="meattype" id="meattype1">
						<p>
						<div id="meat1_div">
							<!-- 输入框 -->
							<input id="meat1_keyword" type="text" size="50"
								onkeyup="getMoreContents_meat('meat1')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="meat1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="meat1" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums1">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('meatnum1')" onchange="changeNumber('meatnum1')" name="number" id="meatnum1"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="meattype" id="meattype2" style="display: none">
						<p>
						<div id="meat2_div">
							<!-- 输入框 -->
							<input id="meat2_keyword" type="text" size="50"
								onkeyup="getMoreContents_meat('meat2')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="meat2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="meat2" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums2"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('meatnum2')" onchange="changeNumber('meatnum2')" name="number" id="meatnum2"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="meattype" id="meattype3" style="display: none">
						<p>
						<div id="meat3_div">
							<!-- 输入框 -->
							<input id="meat3_keyword" type="text" size="50"
								onkeyup="getMoreContents_meat('meat3')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="meat3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="meat3" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums3"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('meatnum3')" onchange="changeNumber('meatnum3')" name="number" id="meatnum3"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="meattype" id="meattype4" style="display: none">
						<p>
						<div id="meat4_div">
							<!-- 输入框 -->
							<input id="meat4_keyword" type="text" size="50"
								onkeyup="getMoreContents_meat('meat4')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="meat4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="meat4" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums4"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('meatnum4')" onchange="changeNumber('meatnum4')" name="number" id="meatnum4"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="meattype" id="meattype5" style="display: none">
						<p>
						<div id="meat5_div">
							<!-- 输入框 -->
							<input id="meat5_keyword" type="text" size="50"
								onkeyup="getMoreContents_meat('meat5')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="meat5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="meat5" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="meatnum" id="meatnums5"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('meatnum5')" onchange="changeNumber('meatnum5')" name="number" id="meatnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('meat');">新增肉类</button>
					<button onclick="removefood('meat');">移除肉类</button>
				</div>
			</div>

			<div data-role="collapsible">
				<h1>蔬菜</h1>
				<div id="vegetables">
					<div name="vegetablestype" id="vegetablestype1">
						<p>
						<div id="vegetables1_div">
							<!-- 输入框 -->
							<input id="vegetables1_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables1')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables1" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums1">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum1')" onchange="changeNumber('vegetablesnum1')" name="number"
							id="vegetablesnum1" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype2"
						style="display: none">
						<p>
						<div id="vegetables2_div">
							<!-- 输入框 -->
							<input id="vegetables2_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables2')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables2" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums2" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum2')" onchange="changeNumber('vegetablesnum2')" name="number"
							id="vegetablesnum2" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype3"
						style="display: none">
						<p>
						<div id="vegetables3_div">
							<!-- 输入框 -->
							<input id="vegetables3_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables3')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables3" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums3" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum3')" onchange="changeNumber('vegetablesnum3')" name="number"
							id="vegetablesnum3" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype4"
						style="display: none">
						<p>
						<div id="vegetables4_div">
							<!-- 输入框 -->
							<input id="vegetables4_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables4')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables4" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums4" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum4')" onchange="changeNumber('vegetablesnum4')" name="number"
							id="vegetablesnum4" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype5"
						style="display: none">
						<p>
						<div id="vegetables5_div">
							<!-- 输入框 -->
							<input id="vegetables5_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables5')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables5" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums5" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum5')" onchange="changeNumber('vegetablesnum5')" name="number"
							id="vegetablesnum5" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype6"
						style="display: none">
						<p>
						<div id="vegetables6_div">
							<!-- 输入框 -->
							<input id="vegetables6_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables6')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables6_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables6" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums6" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum6')" onchange="changeNumber('vegetablesnum6')" name="number"
							id="vegetablesnum6" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype7"
						style="display: none">
						<p>
						<div id="vegetables7_div">
							<!-- 输入框 -->
							<input id="vegetables7_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables7')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables7_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables7" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums7" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum7')" onchange="changeNumber('vegetablesnum7')" name="number"
							id="vegetablesnum7" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype8"
						style="display: none">
						<p>
						<div id="vegetables8_div">
							<!-- 输入框 -->
							<input id="vegetables8_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables8')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables8_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables8" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums8" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum8')" onchange="changeNumber('vegetablesnum8')" name="number"
							id="vegetablesnum8" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype9"
						style="display: none">
						<p>
						<div id="vegetables9_div">
							<!-- 输入框 -->
							<input id="vegetables9_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables9')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables9_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables9" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums9" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum9')" onchange="changeNumber('vegetablesnum9')" name="number"
							id="vegetablesnum9" required="true" value="200" min="0"
							max="1000">
					</div>

					<div name="vegetablestype" id="vegetablestype10"
						style="display: none">
						<p>
						<div id="vegetables10_div">
							<!-- 输入框 -->
							<input id="vegetables10_keyword" type="text" size="50"
								onkeyup="getMoreContents_vegetables('vegetables10')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="vegetables10_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="vegetables10" placeholder="请输入您需要的食物，我们会尽快录入"
							type="text" style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="vegetablesnum"
						id="vegetablesnums10" style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('vegetablesnum10')" onchange="changeNumber('vegetablesnum10')" name="number"
							id="vegetablesnum10" required="true" value="200" min="0"
							max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addvegetables()">新增蔬菜</button>
					<button onclick="removevegetables()">移除蔬菜</button>
				</div>
			</div>

			<div data-role="collapsible">
				<h1>饮品</h1>
				<div id="drink">
					<div name="drinktype" id="drinktype1">
						<p>
						<div id="drink1_div">
							<!-- 输入框 -->
							<input id="drink1_keyword" type="text" size="50"
								onkeyup="getMoreContents_drink('drink1')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="drink1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="drink1" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>
					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums1">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('drinknum1')" onchange="changeNumber('drinknum1')" name="number" id="drinknum1"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="drinktype" id="drinktype2" style="display: none">
						<p>
						<div id="drink2_div">
							<!-- 输入框 -->
							<input id="drink2_keyword" type="text" size="50"
								onkeyup="getMoreContents_drink('drink2')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="drink2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="drink2" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums2"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('drinknum2')" onchange="changeNumber('drinknum2')" name="number" id="drinknum2"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="drinktype" id="drinktype3" style="display: none">
						<p>
						<div id="drink3_div">
							<!-- 输入框 -->
							<input id="drink3_keyword" type="text" size="50"
								onkeyup="getMoreContents_drink('drink3')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="drink3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="drink3" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums3"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('drinknum3')" onchange="changeNumber('drinknum3')" name="number" id="drinknum3"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="drinktype" id="drinktype4" style="display: none">
						<p>
						<div id="drink4_div">
							<!-- 输入框 -->
							<input id="drink4_keyword" type="text" size="50"
								onkeyup="getMoreContents_drink('drink4')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="drink4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="drink4" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums4"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('drinknum4')" onchange="changeNumber('drinknum4')" name="number" id="drinknum4"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="drinktype" id="drinktype5" style="display: none">
						<p>
						<div id="drink5_div">
							<!-- 输入框 -->
							<input id="drink5_keyword" type="text" size="50"
								onkeyup="getMoreContents_drink('drink5')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="drink5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div>
						<input id="drink5" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
							style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="drinknum" id="drinknums5"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('drinknum5')" onchange="changeNumber('drinknum5')" name="number" id="drinknum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('drink');">新增饮品</button>
					<button onclick="removefood('drink');">移除饮品</button>

				</div>
			</div>
			<div data-role="collapsible">
				<h1>干果/油/零食</h1>
				<div id="nut">
					<div name="nuttype" id="nuttype1">
						<p>

							<div id="nut1_div">
							<!-- 输入框 -->
							<input id="nut1_keyword" type="text" size="50"
								onkeyup="getMoreContents_nut('nut1')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="nut1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="nut1" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums1">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('nutnum1')" onchange="changeNumber('nutnum1')" name="number" id="nutnum1"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="nuttype" id="nuttype2" style="display: none">
						<p>

							<div id="nut2_div">
							<!-- 输入框 -->
							<input id="nut2_keyword" type="text" size="50"
								onkeyup="getMoreContents_nut('nut2')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="nut2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="nut2" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums2"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('nutnum2')" onchange="changeNumber('nutnum2')" name="number" id="nutnum2"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="nuttype" id="nuttype3" style="display: none">
						<p>

							<div id="nut3_div">
							<!-- 输入框 -->
							<input id="nut3_keyword" type="text" size="50"
								onkeyup="getMoreContents_nut('nut3')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="nut3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="nut3" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums3"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('nutnum3')" onchange="changeNumber('nutnum3')" name="number" id="nutnum3"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="nuttype" id="nuttype4" style="display: none">
						<p>

							<div id="nut4_div">
							<!-- 输入框 -->
							<input id="nut4_keyword" type="text" size="50"
								onkeyup="getMoreContents_nut('nut4')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="nut4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="nut4" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums4"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('nutnum4')" onchange="changeNumber('nutnum4')" name="number" id="nutnum4"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="nuttype" id="nuttype5" style="display: none">
						<p>

							<div id="nut5_div">
							<!-- 输入框 -->
							<input id="nut5_keyword" type="text" size="50"
								onkeyup="getMoreContents_nut('nut5')" placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="nut5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="nut5" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>


					</div>
					<div data-role="fieldcontain" name="nutnum" id="nutnums5"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('nutnum5')" onchange="changeNumber('nutnum5')" name="number" id="nutnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('nut');">新增干果</button>
					<button onclick="removefood('nut');">移除干果</button>

				</div>
			</div>

			<div data-role="collapsible">
				<h1>水果</h1>
				<div id="fruits">
					<div name="fruitstype" id="fruitstype1">
						<p>

							<div id="fruits1_div">
							<!-- 输入框 -->
							<input id="fruits1_keyword" type="text" size="50"
								onkeyup="getMoreContents_fruits('fruits1')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="fruits1_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="fruits1" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums1">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('fruitsnum1')" onchange="changeNumber('fruitsnum1')" name="number" id="fruitsnum1"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="fruitstype" id="fruitstype2" style="display: none">
						<p>

							<div id="fruits2_div">
							<!-- 输入框 -->
							<input id="fruits2_keyword" type="text" size="50"
								onkeyup="getMoreContents_fruits('fruits2')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="fruits2_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="fruits2" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums2"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('fruitsnum2')" onchange="changeNumber('fruitsnum2')" name="number" id="fruitsnum2"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="fruitstype" id="fruitstype3" style="display: none">
						<p>

							<div id="fruits3_div">
							<!-- 输入框 -->
							<input id="fruits3_keyword" type="text" size="50"
								onkeyup="getMoreContents_fruits('fruits3')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="fruits3_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="fruits3" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums3"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('fruitsnum3')" onchange="changeNumber('fruitsnum3')" name="number" id="fruitsnum3"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="fruitstype" id="fruitstype4" style="display: none">
						<p>

							<div id="fruits4_div">
							<!-- 输入框 -->
							<input id="fruits4_keyword" type="text" size="50"
								onkeyup="getMoreContents_fruits('fruits4')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="fruits4_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="fruits4" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums4"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('fruitsnum4')" onchange="changeNumber('fruitsnum4')" name="number" id="fruitsnum4"
							required="true" value="200" min="0" max="1000">
					</div>

					<div name="fruitstype" id="fruitstype5" style="display: none">
						<p>

							<div id="fruits5_div">
							<!-- 输入框 -->
							<input id="fruits5_keyword" type="text" size="50"
								onkeyup="getMoreContents_fruits('fruits5')"
								placeholder="请输入并选择食物" />
						</div>
						<div class="suggest" id="fruits5_search_suggest"
							style="display: none">
							<ul>
								<li>搜索结果1</li>
								<li>搜索结果2</li>
							</ul>
						</div><input id="fruits5" placeholder="请输入您需要的食物，我们会尽快录入" type="text"
								style="display: none" />
						</p>

					</div>
					<div data-role="fieldcontain" name="fruitsnum" id="fruitsnums5"
						style="display: none">
						<label for="number">食量（克）：</label> <input type="range"
							onblur="standard('fruitsnum5')" onchange="changeNumber('fruitsnum5')" name="number" id="fruitsnum5"
							required="true" value="200" min="0" max="1000">
					</div>

				</div>
				<div data-role="fieldcontain">
					<button onclick="addfood('fruits');">新增水果</button>
					<button onclick="removefood('fruits');">移除水果</button>
				</div>
			</div>

			<div data-role="fieldcontain">
				<label for="remarks">烹饪方式及说明：</label>
				<textarea name="remarks" id="remarks"
					placeholder="如：水煮大虾、油炸大虾、西红柿炒蛋"></textarea>
			</div>
			<div data-role="fieldcontain">
				<label for="prompt">提示：</label>
				<p name="prompt">详细记录每餐饮食情况，可以进入个人主页【饮食记录】中查看每天为您量身定制的智能分析报告。</p>
			</div>
		</div>
		<div id="detailcontent">
			<p>单位：能量(千卡)、蛋白质(克)、脂肪(克)</p>
			<div class="ui-grid-c" id="detailtable">
				<div class="ui-block-a"
					style="border: 1px solid black; text-align: center; width: 31%; border-style: ridge ridge ridge ridge;">
					食物名称</div>
				<div class="ui-block-b"
					style="border: 1px solid black; text-align: center; width: 22.5%; border-style: ridge ridge ridge none;">能量</div>
				<div class="ui-block-c"
					style="border: 1px solid black; text-align: center; border-style: ridge ridge ridge none;">蛋白质</div>
				<div class="ui-block-d"
					style="border: 1px solid black; text-align: center; width: 21.5%; border-style: ridge ridge ridge none;">脂肪</div>

			</div>

			<div data-role="fieldcontain">
				<input type="button" value="提交" onclick="onSubmit();">
			</div>
		</div>

		<div data-role="footer">
			<h1>&nbsp;</h1>
		</div>
	</div>
</body>
<script src="<%=path%>/js/toast.js"></script>
<script type="text/javascript">
	//**************************加载食物数据***************************//
	var mainfood_data = [];
	var mainfood_data_name = [];
	var mainfood_select1 = [];
	var mainfood_select2 = [];
	var mainfood_select3 = [];
	var mainfood_select4 = [];
	var mainfood_select5 = [];
	var meat_data = [];
	var meat_data_name = [];
	var meat_select1 = [];
	var meat_select2 = [];
	var meat_select3 = [];
	var meat_select4 = [];
	var meat_select5 = [];
	var vegetables_data = [];
	var vegetables_data_name = [];
	var vegetables_select1 = [];
	var vegetables_select2 = [];
	var vegetables_select3 = [];
	var vegetables_select4 = [];
	var vegetables_select5 = [];
	var vegetables_select6 = [];
	var vegetables_select7 = [];
	var vegetables_select8 = [];
	var vegetables_select9 = [];
	var vegetables_select10 = [];
	var drink_data = [];
	var drink_data_name = [];
	var drink_select1 = [];
	var drink_select2 = [];
	var drink_select3 = [];
	var drink_select4 = [];
	var drink_select5 = [];
	var nut_data = [];
	var nut_data_name = [];
	var nut_select1 = [];
	var nut_select2 = [];
	var nut_select3 = [];
	var nut_select4 = [];
	var nut_select5 = [];
	var fruits_data = [];
	var fruits_data_name = [];
	var fruits_select1 = [];
	var fruits_select2 = [];
	var fruits_select3 = [];
	var fruits_select4 = [];
	var fruits_select5 = [];

	$("#pageone").bind(
			"pageshow",
			function(e) {
				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/mainfood",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							mainfood_data[i] = data[i];
							mainfood_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}
					}
				});

				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/meat",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							meat_data[i] = data[i];
							meat_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}

					}
				});

				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/vegetables",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							vegetables_data[i] = data[i];
							vegetables_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}
					}
				});

				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/drink",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							drink_data[i] = data[i];
							drink_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}
					}
				});

				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/nut",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							nut_data[i] = data[i];
							nut_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}
					}
				});

				$.ajax({
					data : null,
					type : "GET",
					dataType : 'json',
					url : "../diet/fruits",
					error : function() {
						alert("出错了！！");
					},
					success : function(data) {
						for (i = 0; i < data.length; i++) {
							fruits_data[i] = data[i];
							fruits_data_name[i] = data[i].name + "["
									+ data[i].pinyin + "]";
						}
					}
				});

			});
	//**************************加载食物数据***************************//
	//在关闭页面时弹出确认提示窗口
	pushHistory();
	setTimeout(function() {
		window.addEventListener("popstate", function(e) {
			showBox("再按一次退出程序", 2000, function() {
				pushHistory();
			});
		}, false);
	}, 300);

	function pushHistory() {
		var state = {
			title : "title",
			url : "#"
		};
		window.history.pushState(state, "title", "#");
	}

	function showBox(msg, timeOut, onTimeOut) {
		new Toast({
			context : $('body'),
			message : '再按一次退出'
		}).show();
		/*  if (typeof alertBoxDiv === "undefined") {  
		   alertBoxDiv = $("<div/>").addClass("alert-box hide").append( $("<div/>").addClass("label label-primary")).appendTo($("body"));  
		 }  
		 alertBoxDiv.children(".label").html(msg);  
		 alertBoxDiv.removeClass("hide"); */
		if (typeof timeOut === "undefined")
			timeOut = 2000;
		setTimeout(function() {
			// alertBoxDiv.addClass("hide");  
			if (typeof onTimeOut !== "undefined")
				onTimeOut();
		}, timeOut);
	}

	function standard(id) {
		var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/  
		var num = $('#' + id).val();
		if (!re.test(num)) {
			alert("您输入的数值有误，请输入0-1000的数值！");
			$('#' + id).val("200");
		}
	}

	function addnewfood(id) {
		$('#' + id + '_div').hide();
		$('#' + id).show();
	}

	var mainfoodCount = 1;
	var meatCount = 1;
	var vegetablesCount = 1;
	var drinkCount = 1;
	var nutCount = 1;
	var fruitsCount = 1;
	var addnewfood_data = [];
	var targetsumenergy = $('#energy').text();
	var pId = "";
	function typechange(id, idnum, select) {
		var num = $('#' + id + 'num' + idnum).val();
		var html = '<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
				+ select[1]
				+ '</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
				+ (num * select[2] / 100).toFixed(2)
				+ '</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
				+ (num * select[3] / 100).toFixed(2)
				+ '</div>'
				+ '<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
				+ (num * select[4] / 100).toFixed(2) + '</div>';
		if ($('#detail' + id + idnum).html() == undefined) {
			$('#detailtable').after(
					"<div class='ui-grid-c' id='detail"+id+idnum+"'></div>");
			$('#detail' + id + idnum).append(html);
		} else {
			$('#detail' + id + idnum).html(html);
		}
		updateEnergy();
	}
	function numberchange(num, id, idnum, select) {
		var sumenergy = parseInt($('#sumenergy').text());
		if (select != null) {
			var html = '<div class="ui-block-a" style="border: 1px solid black;text-align:center;width:31%;border-style:none ridge ridge ridge;">'
					+ select[1]
					+ '</div><div class="ui-block-b"style="border: 1px solid black;text-align:center;width:22.5%;border-style:none ridge ridge none;" name="energyinfo">'
					+ (num * select[2] / 100).toFixed(2)
					+ '</div><div class="ui-block-c" style="border: 1px solid black;text-align:center;border-style:none ridge ridge none;">'
					+ (num * select[3] / 100).toFixed(2)
					+ '</div>'
					+ '<div class="ui-block-d" style="border: 1px solid black;text-align:center;width:21.5%;border-style:none ridge ridge none;">'
					+ (num * select[4] / 100).toFixed(2) + '</div>';
			$('#detail' + id + idnum).html(html);
		}
		updateEnergy();
	}
	function removefood(id) {
		var divId = $('#' + id);
		var len = countChange(id, false) + 1;
		if (len > 1) {
			$('#' + id + 'type' + len).hide();
			$('#' + id + 'nums' + len).hide();
			$('#detail' + id + len).remove();
			$('#searchField_' + id + len).val("");
			removeselect(id, len);
			updateEnergy();
		} else {
			alert("不可移除!");
			countChange(id, true);
		}
	}

	function addfood(id) {
		var divId = $('#' + id);
		var len = countChange(id, true);
		if (len < 6) {
			$('#' + id + 'type' + len).show();
			$('#' + id + 'nums' + len).show();
			var detailDiv = $('#detail' + id + (len - 1)).clone(false);
			detailDiv.attr("id", "detail" + id + len);
			$('#detail' + id + (len - 1)).after(detailDiv);
			updateEnergy();
		} else {
			alert("已达上限！");
			countChange(id, false);
		}

	}
	function removevegetables() {
		var divId = $('#vegetables');
		var len = countChange("vegetables", false) + 1;
		if (len > 1) {
			$('#vegetablestype' + len).hide();
			$('#vegetablesnums' + len).hide();
			$('#detailvegetables' + len).remove();
			$('#searchField_vegetables' + len).val("");
			removeselect("vegetables", len);
			updateEnergy();
		} else {
			alert("不可移除!");
			countChange("vegetables", true);
		}

	}
	function addvegetables() {
		var divId = $('#vegetables');
		var len = countChange("vegetables", true);
		if (len < 11) {
			$('#vegetablestype' + len).show();
			$('#vegetablesnums' + len).show();
			var detailDiv = $('#detailvegetables' + (len - 1)).clone(false);
			detailDiv.attr("id", "detailvegetables" + len);
			$('#detailvegetables' + (len - 1)).after(detailDiv);
			updateEnergy();
		} else {
			alert("已达上限！");
			countChange("vegetables", false);
		}
	}

	function removeselect(id, len) {
		switch (id) {
		case "mainfood":
			if (len == 1) {
				mainfood_select1.length = 0;
			}
			if (len == 2) {
				mainfood_select2.length = 0;
			}
			if (len == 3) {
				mainfood_select3.length = 0;
			}
			if (len == 4) {
				mainfood_select4.length = 0;
			}
			if (len == 5) {
				mainfood_select5.length = 0;
			}
			break;
		case "meat":
			if (len == 1) {
				meat_select1.length = 0;
			}
			if (len == 2) {
				meat_select2.length = 0;
			}
			if (len == 3) {
				meat_select3.length = 0;
			}
			if (len == 4) {
				meat_select4.length = 0;
			}
			if (len == 5) {
				meat_select5.length = 0;
			}
			break;
		case "vegetables":
			if (len == 1) {
				vegetables_select1.length = 0;
			}
			if (len == 2) {
				vegetables_select2.length = 0;
			}
			if (len == 3) {
				vegetables_select3.length = 0;
			}
			if (len == 4) {
				vegetables_select4.length = 0;
			}
			if (len == 5) {
				vegetables_select5.length = 0;
			}
			if (len == 6) {
				vegetables_select6.length = 0;
			}
			if (len == 7) {
				vegetables_select7.length = 0;
			}

			if (len == 8) {
				vegetables_select8.length = 0;
			}
			if (len == 9) {
				vegetables_select9.length = 0;
			}
			if (len == 10) {
				vegetables_select10.length = 0;
			}
			break;
		case "drink":
			if (len == 1) {
				drink_select1.length = 0;
			}
			if (len == 2) {
				drink_select2.length = 0;
			}
			if (len == 3) {
				drink_select3.length = 0;
			}
			if (len == 4) {
				drink_select4.length = 0;
			}
			if (len == 5) {
				drink_select5.length = 0;
			}
			break;
		case "nut":
			if (len == 1) {
				nut_select1.length = 0;
			}
			if (len == 2) {
				nut_select2.length = 0;
			}
			if (len == 3) {
				nut_select3.length = 0;
			}
			if (len == 4) {
				nut_select4.length = 0;
			}
			if (len == 5) {
				nut_select5.length = 0;
			}
			break;
		case "fruits":
			if (len == 1) {
				fruits_select1.length = 0;
			}
			if (len == 2) {
				fruits_select2.length = 0;
			}
			if (len == 3) {
				fruits_select3.length = 0;
			}
			if (len == 4) {
				fruits_select4.length = 0;
			}
			if (len == 5) {
				fruits_select5.length = 0;
			}
			break;
		}
	}

	function countChange(id, isAdd) {
		if (isAdd) {
			if ("mainfood" == id) {
				mainfoodCount++;
				return mainfoodCount;
			} else if ("meat" == id) {
				meatCount++;
				return meatCount;
			} else if ("vegetables" == id) {
				vegetablesCount++;
				return vegetablesCount;
			} else if ("drink" == id) {
				drinkCount++;
				return drinkCount;
			} else if ("nut" == id) {
				nutCount++;
				return nutCount;
			} else if ("fruits" == id) {
				fruitsCount++;
				return fruitsCount;
			}
		} else {
			if ("mainfood" == id) {
				mainfoodCount--;
				return mainfoodCount;
			} else if ("meat" == id) {
				meatCount--;
				return meatCount;
			} else if ("vegetables" == id) {
				vegetablesCount--;
				return vegetablesCount;
			} else if ("drink" == id) {
				drinkCount--;
				return drinkCount;
			} else if ("nut" == id) {
				nutCount--;
				return nutCount;
			} else if ("fruits" == id) {
				fruitsCount--;
				return fruitsCount;
			}
		}
	}

	function onSubmit() {
		var sumenergy = $('#sumenergy').text();
		var diettype = $('#diettype').find("option:selected").val();
		var mainfoodJson = parseFoodList("mainfood");
		var meatJson = parseFoodList("meat");
		var vegetablesJson = parseFoodList("vegetables");
		var drinkJson = parseFoodList("drink");
		var nutJson = parseFoodList("nut");
		var fruitsJson = parseFoodList("fruits");
		var remarks = $('#remarks').val();

		for (m = 1; m < 6; m++) {
			addnewfood_data[m - 1] = $('#mainfood' + m).val();
		}
		for (me = 1; me < 6; me++) {
			addnewfood_data[me - 1 + 5] = $('#meat' + me).val();
		}
		for (v = 1; v < 11; v++) {
			addnewfood_data[v - 1 + 10] = $('#vegetables' + v).val();
		}
		for (d = 1; d < 6; d++) {
			addnewfood_data[d - 1 + 20] = $('#drink' + d).val();
		}
		for (n = 1; n < 6; n++) {
			addnewfood_data[n - 1 + 25] = $('#nut' + n).val();
		}
		for (f = 1; f < 6; f++) {
			addnewfood_data[f - 1 + 30] = $('#fruits' + f).val();
		}

		for (i = 0; i < 35; i++) {
			if (addnewfood_data[i] != "") {
				$.post("../diet/insert_newfood", {
					foodname : addnewfood_data[i]
				}, function(text) {
					if (text == "1") {
						console.log("保存成功！");
					} else {
						alert("新食物保存失败！");
					}
				});
			}
		}

		$.post("../diet/saveDiet", {
			energy : sumenergy,
			type : diettype,
			pId : pId,
			mainfood : mainfoodJson.mainfood,
			mainfoodNum : mainfoodJson.mainfoodNum,
			meat : meatJson.meat,
			meatNum : meatJson.meatNum,
			vegetables : vegetablesJson.vegetables,
			vegetablesNum : vegetablesJson.vegetablesNum,
			drink : drinkJson.drink,
			drinkNum : drinkJson.drinkNum,
			nut : nutJson.nut,
			nutNum : nutJson.nutNum,
			fruits : fruitsJson.fruits,
			fruitsNum : fruitsJson.fruitsNum,
			remarks : remarks
		}, function(text) {
			if (text == "1") {
				alert("保存成功！");
				window.location.href = "../user/user_index";
			} else {
				alert("保存失败！");
			}
		});
	}

	function parseFoodList(id) {
		var nums = $('#' + id).find('div').filter("[name='" + id + "num']");
		var typevalues = "";
		var numvalues = "";
		if (id == "mainfood") {
			if (mainfood_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = mainfood_select1[0] + ",";
			}
			if (mainfood_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += mainfood_select2[0] + ",";
			}
			if (mainfood_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += mainfood_select3[0] + ",";
			}
			if (mainfood_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += mainfood_select4[0] + ",";
			}
			if (mainfood_select5.length == 0) {
				typevalues += "0";
			} else {
				typevalues += mainfood_select5[0];
			}

			numvalues = $('#mainfoodnum1').val() + ","
					+ $('#mainfoodnum2').val() + "," + $('#mainfoodnum3').val()
					+ "," + $('#mainfoodnum4').val() + ","
					+ $('#mainfoodnum5').val();
		}

		if (id == "meat") {
			if (meat_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = meat_select1[0] + ",";
			}
			if (meat_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += meat_select2[0] + ",";
			}
			if (meat_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += meat_select3[0] + ",";
			}
			if (meat_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += meat_select4[0] + ",";
			}
			if (meat_select5.length == 0) {
				typevalues += "0";
			} else {
				typevalues += meat_select5[0];
			}

			numvalues = $('#meatnum1').val() + "," + $('#meatnum2').val() + ","
					+ $('#meatnum3').val() + "," + $('#meatnum4').val() + ","
					+ $('#meatnum5').val();
		}

		if (id == "vegetables") {
			if (vegetables_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = vegetables_select1[0] + ",";
			}
			if (vegetables_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select2[0] + ",";
			}
			if (vegetables_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select3[0] + ",";
			}
			if (vegetables_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select4[0] + ",";
			}
			if (vegetables_select5.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select5[0] + ",";
			}
			if (vegetables_select6.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select6[0] + ",";
			}
			if (vegetables_select7.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select7[0] + ",";
			}
			if (vegetables_select8.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select8[0] + ",";
			}
			if (vegetables_select9.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += vegetables_select9[0] + ",";
			}
			if (vegetables_select10.length == 0) {
				typevalues += "0";
			} else {
				typevalues += vegetables_select10[0];
			}

			numvalues = $('#vegetablesnum1').val() + ","
					+ $('#vegetablesnum2').val() + ","
					+ $('#vegetablesnum3').val() + ","
					+ $('#vegetablesnum4').val() + ","
					+ $('#vegetablesnum5').val() + ","
					+ $('#vegetablesnum6').val() + ","
					+ $('#vegetablesnum7').val() + ","
					+ $('#vegetablesnum8').val() + ","
					+ $('#vegetablesnum9').val() + ","
					+ $('#vegetablesnum10').val();
		}

		if (id == "drink") {
			if (drink_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = drink_select1[0] + ",";
			}
			if (drink_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += drink_select2[0] + ",";
			}
			if (drink_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += drink_select3[0] + ",";
			}
			if (drink_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += drink_select4[0] + ",";
			}
			if (drink_select5.length == 0) {
				typevalues += "0";
			} else {
				typevalues += drink_select5[0];
			}

			numvalues = $('#drinknum1').val() + "," + $('#drinknum2').val()
					+ "," + $('#drinknum3').val() + "," + $('#drinknum4').val()
					+ "," + $('#drinknum5').val();
		}

		if (id == "nut") {
			if (nut_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = nut_select1[0] + ",";
			}
			if (nut_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += nut_select2[0] + ",";
			}
			if (nut_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += nut_select3[0] + ",";
			}
			if (nut_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += nut_select4[0] + ",";
			}
			if (nut_select5.length == 0) {
				typevalues += "0";
			} else {
				typevalues += nut_select5[0];
			}

			numvalues = $('#nutnum1').val() + "," + $('#nutnum2').val() + ","
					+ $('#nutnum3').val() + "," + $('#nutnum4').val() + ","
					+ $('#nutnum5').val();
		}

		if (id == "fruits") {
			if (fruits_select1.length == 0) {
				typevalues = "0,";
			} else {
				typevalues = fruits_select1[0] + ",";
			}
			if (fruits_select2.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += fruits_select2[0] + ",";
			}
			if (fruits_select3.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += fruits_select3[0] + ",";
			}
			if (fruits_select4.length == 0) {
				typevalues += "0,";
			} else {
				typevalues += fruits_select4[0] + ",";
			}
			if (fruits_select5.length == 0) {
				typevalues += "0";
			} else {
				typevalues += fruits_select5[0];
			}

			numvalues = $('#fruitsnum1').val() + "," + $('#fruitsnum2').val()
					+ "," + $('#fruitsnum3').val() + ","
					+ $('#fruitsnum4').val() + "," + $('#fruitsnum5').val();
		}
		return eval("({'" + id + "':'" + typevalues + "','" + id + "Num"
				+ "':'" + numvalues + "'})");
	}

	function updateEnergy() {
		var divs = $('#detailcontent').find('div.ui-block-b').filter(
				"[name='energyinfo']");
		var energy = 0;
		for (var i = 0; i < divs.length; i++) {
			energy += parseInt(divs[i].innerText);
		}
		$('#sumenergy').text(energy);
		if (parseInt($('#targetenergy').text()) < energy) {
			$('#sumenergy').css("color", "red");
		}
	}
	function setTargetEnergy() {
		var type = $('#diettype');
		var options = type[0].options;
		var opt = [];
		for (var i = 0, len = options.length; i < len; i++) {
			opt[i] = options[i].value;
		}
		var num = $('#diettype').find("option").length - 3;
		var i = 0;//
		if (num > 0) {
			for (j = 0; j < opt.length; j++) {
				if (opt[j] == "5") {
					if (num == 1) {
						i = 0.2; //只有5
					} else if (num == 2) {
						i = 0.1; //4+5或5+6
					} else if (num == 3) {
						i = 0; //4+5+6
					}
				} else if (num == 1) {
					i = 0.35; //4或6
				} else if (num == 2) {
					i = 0.25; //4+6
				}
			}
		}
		var select_option = $("#diettype option:selected").val();
		var tmpEnergy = 0;
		if (select_option == "1") {
			tmpEnergy = parseInt(targetsumenergy * 0.15 + targetsumenergy * i);
		} else if (select_option == "2") {
			tmpEnergy = parseInt(targetsumenergy * 0.1 + targetsumenergy * i);
		} else if (select_option == "3") {
			tmpEnergy = parseInt(targetsumenergy * 0.3 + targetsumenergy * i);
		} else if (select_option == "4") {
			tmpEnergy = parseInt(targetsumenergy * 0.1 + targetsumenergy * i);
		} else if (select_option == "5") {
			tmpEnergy = parseInt(targetsumenergy * 0.25 + targetsumenergy * i);
		} else if (select_option == "6") {
			tmpEnergy = parseInt(targetsumenergy * 0.1 + targetsumenergy * i);
		}
		$('#targetenergy').text(tmpEnergy);
	}//
	setTargetEnergy();

	//*****************************饮食录入选择*****************************************//
	// 判断字符串是否包含
	function isContains(str, substr) {
		return str.indexOf(substr) >= 0;
	}

	// 获得用户输的关联信息(主食)
	function getMoreContents_mainfood(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in mainfood_data_name) {
			if (isContains(mainfood_data_name[i], content)) {
				html += "<li id=" + mainfood_data[i].id + " energy="
						+ mainfood_data[i].energy + " protein="
						+ mainfood_data[i].protein + " fat="
						+ mainfood_data[i].fat + " carbohydrate="
						+ mainfood_data[i].carbohydrate + " cellulose="
						+ mainfood_data[i].cellulose + " calcium="
						+ mainfood_data[i].calcium + " ferrum="
						+ mainfood_data[i].ferrum + " zinc="
						+ mainfood_data[i].zinc + " carotene="
						+ mainfood_data[i].carotene
						+ " onclick=\"selectResult(" + mainfood_data[i].id
						+ ",'" + id + "')\">" + mainfood_data[i].name + "</li>";
			}
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	// 获得用户输的关联信息(肉类)
	function getMoreContents_meat(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in meat_data_name) {
			if (isContains(meat_data_name[i], content)) {
				// $("#"+id).hide();
				html += "<li id=" + meat_data[i].id + " energy="
						+ meat_data[i].energy + " protein="
						+ meat_data[i].protein + " fat=" + meat_data[i].fat
						+ " carbohydrate=" + meat_data[i].carbohydrate
						+ " cellulose=" + meat_data[i].cellulose + " calcium="
						+ meat_data[i].calcium + " ferrum="
						+ meat_data[i].ferrum + " zinc=" + meat_data[i].zinc
						+ " carotene=" + meat_data[i].carotene
						+ " onclick=\"selectResult(" + meat_data[i].id + ",'"
						+ id + "')\">" + meat_data[i].name + "</li>";
			} 
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	// 获得用户输的关联信息(蔬菜)
	function getMoreContents_vegetables(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in vegetables_data_name) {
			if (isContains(vegetables_data_name[i], content)) {
				// $("#"+id).hide();
				html += "<li id=" + vegetables_data[i].id + " energy="
						+ vegetables_data[i].energy + " protein="
						+ vegetables_data[i].protein + " fat="
						+ vegetables_data[i].fat + " carbohydrate="
						+ vegetables_data[i].carbohydrate + " cellulose="
						+ vegetables_data[i].cellulose + " calcium="
						+ vegetables_data[i].calcium + " ferrum="
						+ vegetables_data[i].ferrum + " zinc="
						+ vegetables_data[i].zinc + " carotene="
						+ vegetables_data[i].carotene
						+ " onclick=\"selectResult(" + vegetables_data[i].id
						+ ",'" + id + "')\">" + vegetables_data[i].name
						+ "</li>";
			} 
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	// 获得用户输的关联信息(饮品)
	function getMoreContents_drink(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in drink_data_name) {
			if (isContains(drink_data_name[i], content)) {
				// $("#"+id).hide();
				html += "<li id=" + drink_data[i].id + " energy="
						+ drink_data[i].energy + " protein="
						+ drink_data[i].protein + " fat=" + drink_data[i].fat
						+ " carbohydrate=" + drink_data[i].carbohydrate
						+ " cellulose=" + drink_data[i].cellulose + " calcium="
						+ drink_data[i].calcium + " ferrum="
						+ drink_data[i].ferrum + " zinc=" + drink_data[i].zinc
						+ " carotene=" + drink_data[i].carotene
						+ " onclick=\"selectResult(" + drink_data[i].id + ",'"
						+ id + "')\">" + drink_data[i].name + "</li>";
			} 
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	// 获得用户输的关联信息(干果)
	function getMoreContents_nut(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in nut_data_name) {
			if (isContains(nut_data_name[i], content)) {
				// $("#"+id).hide();
				html += "<li id=" + nut_data[i].id + " energy="
						+ nut_data[i].energy + " protein="
						+ nut_data[i].protein + " fat=" + nut_data[i].fat
						+ " carbohydrate=" + nut_data[i].carbohydrate
						+ " cellulose=" + nut_data[i].cellulose + " calcium="
						+ nut_data[i].calcium + " ferrum=" + nut_data[i].ferrum
						+ " zinc=" + nut_data[i].zinc + " carotene="
						+ nut_data[i].carotene + " onclick=\"selectResult("
						+ nut_data[i].id + ",'" + id + "')\">"
						+ nut_data[i].name + "</li>";
			} 
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	// 获得用户输的关联信息(水果)
	function getMoreContents_fruits(id) {
		$("#" + id + "_search_suggest").show();
		var content = $("#" + id + "_keyword").val();
		var html = "";
		for ( var i in fruits_data_name) {
			if (isContains(fruits_data_name[i], content)) {
				// $("#"+id).hide();
				html += "<li id=" + fruits_data[i].id + " energy="
						+ fruits_data[i].energy + " protein="
						+ fruits_data[i].protein + " fat=" + fruits_data[i].fat
						+ " carbohydrate=" + fruits_data[i].carbohydrate
						+ " cellulose=" + fruits_data[i].cellulose
						+ " calcium=" + fruits_data[i].calcium + " ferrum="
						+ fruits_data[i].ferrum + " zinc="
						+ fruits_data[i].zinc + " carotene="
						+ fruits_data[i].carotene + " onclick=\"selectResult("
						+ fruits_data[i].id + ",'" + id + "')\">"
						+ fruits_data[i].name + "</li>";
			} 
		}
		if(html == ""){
			html = "<li onclick=\"showAddNewFood('"+id+"')\">找不到您输入的食物</li>"
		}
		$("#" + id + "_search_suggest ul").html(html);

	}

	function showAddNewFood(id){
		$("#"+id).show();
		$("#" + id + "_keyword").val("");
		$("#" + id + "_search_suggest").hide();
	}
	
	function selectResult(liId, divId) {
		var result_data = [];
		result_data[0] = $("#" + liId).attr("id");
		result_data[1] = $("#" + liId).text();
		result_data[2] = $("#" + liId).attr("energy");
		result_data[3] = $("#" + liId).attr("protein");
		result_data[4] = $("#" + liId).attr("fat");
		result_data[5] = $("#" + liId).attr("carbohydrate");
		result_data[6] = $("#" + liId).attr("cellulose");
		result_data[7] = $("#" + liId).attr("calcium");
		result_data[8] = $("#" + liId).attr("ferrum");
		result_data[9] = $("#" + liId).attr("zinc");
		result_data[10] = $("#" + liId).attr("carotene");
		$("#" + divId + "_keyword").val(result_data[1]);
		$("#" + divId + "_search_suggest").hide();
		switch (divId) {
		case "mainfood1": {
			for ( var i in result_data) {
				mainfood_select1[i] = result_data[i];
			}
			typechange('mainfood', '1', result_data);
			break;
		}
		case "mainfood2": {
			for ( var i in result_data) {
				mainfood_select2[i] = result_data[i];
			}
			typechange('mainfood', '2', result_data);
			break;
		}
		case "mainfood3": {
			for ( var i in result_data) {
				mainfood_select3[i] = result_data[i];
			}
			typechange('mainfood', '3', result_data);
			break;
		}
		case "mainfood4": {
			for ( var i in result_data) {
				mainfood_select4[i] = result_data[i];
			}
			typechange('mainfood', '4', result_data);
			break;
		}
		case "mainfood5": {
			for ( var i in result_data) {
				mainfood_select5[i] = result_data[i];
			}
			typechange('mainfood', '5', result_data);
			break;
		}
		case "meat1": {
			for ( var i in result_data) {
				meat_select1[i] = result_data[i];
			}
			typechange('meat', '1', result_data);
			break;
		}
		case "meat2": {
			for ( var i in result_data) {
				meat_select2[i] = result_data[i];
			}
			typechange('meat', '2', result_data);
			break;
		}
		case "meat3": {
			for ( var i in result_data) {
				meat_select3[i] = result_data[i];
			}
			typechange('meat', '3', result_data);
			break;
		}
		case "meat4": {
			for ( var i in result_data) {
				meat_select4[i] = result_data[i];
			}
			typechange('meat', '4', result_data);
			break;
		}
		case "meat5": {
			for ( var i in result_data) {
				meat_select5[i] = result_data[i];
			}
			typechange('meat', '5', result_data);
			break;
		}
		case "vegetables1": {
			for ( var i in result_data) {
				vegetables_select1[i] = result_data[i];
			}
			typechange('vegetables', '1', result_data);
			break;
		}
		case "vegetables2": {
			for ( var i in result_data) {
				vegetables_select2[i] = result_data[i];
			}
			typechange('vegetables', '2', result_data);
			break;
		}
		case "vegetables3": {
			for ( var i in result_data) {
				vegetables_select3[i] = result_data[i];
			}
			typechange('vegetables', '3', result_data);
			break;
		}
		case "vegetables4": {
			for ( var i in result_data) {
				vegetables_select4[i] = result_data[i];
			}
			typechange('vegetables', '4', result_data);
			break;
		}
		case "vegetables5": {
			for ( var i in result_data) {
				vegetables_select5[i] = result_data[i];
			}
			typechange('vegetables', '5', result_data);
			break;
		}
		case "vegetables6": {
			for ( var i in result_data) {
				vegetables_select6[i] = result_data[i];
			}
			typechange('vegetables', '6', result_data);
			break;
		}

		case "vegetables7": {
			for ( var i in result_data) {
				vegetables_select7[i] = result_data[i];
			}
			typechange('vegetables', '7', result_data);
			break;
		}
		case "vegetables8": {
			for ( var i in result_data) {
				vegetables_select8[i] = result_data[i];
			}
			typechange('vegetables', '8', result_data);
			break;
		}
		case "vegetables9": {
			for ( var i in result_data) {
				vegetables_select9[i] = result_data[i];
			}
			typechange('vegetables', '9', result_data);
			break;
		}
		case "vegetables10": {
			for ( var i in result_data) {
				vegetables_select10[i] = result_data[i];
			}
			typechange('vegetables', '10', result_data);
			break;
		}
		case "drink1": {
			for ( var i in result_data) {
				drink_select1[i] = result_data[i];
			}
			typechange('drink', '1', result_data);
			break;
		}
		case "drink2": {
			for ( var i in result_data) {
				drink_select2[i] = result_data[i];
			}
			typechange('drink', '2', result_data);
			break;
		}
		case "drink3": {
			for ( var i in result_data) {
				drink_select3[i] = result_data[i];
			}
			typechange('drink', '3', result_data);
			break;
		}
		case "drink4": {
			for ( var i in result_data) {
				drink_select4[i] = result_data[i];
			}
			typechange('drink', '4', result_data);
			break;
		}
		case "drink5": {
			for ( var i in result_data) {
				drink_select5[i] = result_data[i];
			}
			typechange('drink', '5', result_data);
			break;
		}
		case "nut1": {
			for ( var i in result_data) {
				nut_select1[i] = result_data[i];
			}
			typechange('nut', '1', result_data);
			break;
		}
		case "nut2": {
			for ( var i in result_data) {
				nut_select2[i] = result_data[i];
			}
			typechange('nut', '2', result_data);
			break;
		}
		case "nut3": {
			for ( var i in result_data) {
				nut_select3[i] = result_data[i];
			}
			typechange('nut', '3', result_data);
			break;
		}
		case "nut4": {
			for ( var i in result_data) {
				nut_select4[i] = result_data[i];
			}
			typechange('nut', '4', result_data);
			break;
		}
		case "nut5": {
			for ( var i in result_data) {
				nut_select5[i] = result_data[i];
			}
			typechange('nut', '5', result_data);
			break;
		}
		case "fruits1": {
			for ( var i in result_data) {
				fruits_select1[i] = result_data[i];
			}
			typechange('fruits', '1', result_data);
			break;
		}
		case "fruits2": {
			for ( var i in result_data) {
				fruits_select2[i] = result_data[i];
			}
			typechange('fruits', '2', result_data);
			break;
		}
		case "fruits3": {
			for ( var i in result_data) {
				fruits_select3[i] = result_data[i];
			}
			typechange('fruits', '3', result_data);
			break;
		}
		case "fruits4": {
			for ( var i in result_data) {
				fruits_select4[i] = result_data[i];
			}
			typechange('fruits', '4', result_data);
			break;
		}
		case "fruits5": {
			for ( var i in result_data) {
				fruits_select5[i] = result_data[i];
			}
			typechange('fruits', '5', result_data);
			break;
		}
		default:
			break;
		}
	}
	//***************************食量改变********************************//
	
	function changeNumber(id){
		var val = $("#"+id).val();
		switch (id) {
		case "mainfoodnum1":{
			numberchange(val, 'mainfood', '1', mainfood_select1);
			break;
		}
		case "mainfoodnum2":{
			numberchange(val, 'mainfood', '2', mainfood_select2);
			break;
		}
		case "mainfoodnum3":{
			numberchange(val, 'mainfood', '3', mainfood_select3);
			break;
		}
		case "mainfoodnum4":{
			numberchange(val, 'mainfood', '4', mainfood_select4);
			break;
		}
		case "mainfoodnum5":{
			numberchange(val, 'mainfood', '5', mainfood_select5);
			break;
		}
		case "meatnum1":{
			numberchange(val, 'meat', '1', meat_select1);
			break;
		}
		case "meatnum2":{
			numberchange(val, 'meat', '2', meat_select2);
			break;
		}
		case "meatnum3":{
			numberchange(val, 'meat', '3', meat_select3);
			break;
		}
		case "meatnum4":{
			numberchange(val, 'meat', '4', meat_select4);
			break;
		}
		case "meatnum5":{
			numberchange(val, 'meat', '5', meat_select5);
			break;
		}
		case "vegetablesnum1":{
			numberchange(val, 'vegetables', '1', vegetables_select1);
			break;
		}
		case "vegetablesnum2":{
			numberchange(val, 'vegetables', '2', vegetables_select2);
			break;
		}
		case "vegetablesnum1":{
			numberchange(val, 'vegetables', '2', vegetables_select2);
			break;
		}
		
		case "vegetablesnum3":{
			numberchange(val, 'vegetables', '3', vegetables_select3);
			break;
		}
		case "vegetablesnum4":{
			numberchange(val, 'vegetables', '4', vegetables_select4);
			break;
		}
		case "vegetablesnum5":{
			numberchange(val, 'vegetables', '5', vegetables_select5);
			break;
		}
		case "vegetablesnum6":{
			numberchange(val, 'vegetables', '6', vegetables_select6);
			break;
		}
		case "vegetablesnum7":{
			numberchange(val, 'vegetables', '7', vegetables_select7);
			break;
		}
		case "vegetablesnum8":{
			numberchange(val, 'vegetables', '8', vegetables_select8);
			break;
		}
		case "vegetablesnum9":{
			numberchange(val, 'vegetables', '9', vegetables_select9);
			break;
		}
		case "vegetablesnum10":{
			numberchange(val, 'vegetables', '10', vegetables_select10);
			break;
		}
		case "drinknum1":{
			numberchange(val, 'drink', '1', drink_select1);
			break;
		}
		case "drinknum2":{
			numberchange(val, 'drink', '2', drink_select2);
			break;
		}
		case "drinknum3":{
			numberchange(val, 'drink', '3', drink_select3);
			break;
		}
		case "drinknum4":{
			numberchange(val, 'drink', '4', drink_select4);
			break;
		}
		case "drinknum5":{
			numberchange(val, 'drink', '5', drink_select5);
			break;
		}
		case "nutnum1":{
			numberchange(val, 'nut', '1', nut_select1);
			break;
		}
		case "nutnum2":{
			numberchange(val, 'nut', '2', nut_select2);
			break;
		}
		case "nutnum3":{
			numberchange(val, 'nut', '3', nut_select3);
			break;
		}
		case "nutnum4":{
			numberchange(val, 'nut', '4', nut_select4);
			break;
		}
		case "nutnum5":{
			numberchange(val, 'nut', '5', nut_select5);
			break;
		}
		case "fruitsnum1":{
			numberchange(val, 'fruits', '1', fruits_select1);
			break;
		}
		case "fruitsnum2":{
			numberchange(val, 'fruits', '2', fruits_select2);
			break;
		}
		case "fruitsnum3":{
			numberchange(val, 'fruits', '3', fruits_select3);
			break;
		}
		case "fruitsnum4":{
			numberchange(val, 'fruits', '4', fruits_select4);
			break;
		}
		case "fruitsnum5":{
			numberchange(val, 'fruits', '5', fruits_select5);
			break;
		}
		default:
			break;
		}
		
	}
	
</script>
</html>
