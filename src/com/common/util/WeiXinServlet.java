package com.common.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.user.service.UserService;

public class WeiXinServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6177563525491130993L;
	
	private static Logger logger = Logger.getLogger(WeiXinServlet.class);

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = null;

	        // 发送给微信端的的xml数据
	        String respXmlMsg = "";
	        // xml请求解析
	        Map<String, String> requestMap;
	        try {
	            requestMap = MessageUtil.parseXml(request);// 解析xml对象
	            String fromUserName = requestMap.get("FromUserName");// 发送方帐号（open_id）
	            String toUserName = requestMap.get("ToUserName");// 公众帐号
	            String creatTime = requestMap.get("CreateTime");
	            String msgType = requestMap.get("MsgType");// 消息类型
	            String content = requestMap.get("Content");// text内容
	            String event = requestMap.get("Event");// event内容
	            String eventKey = requestMap.get("EventKey");
	            UserService userService = (UserService)SpringContextUtil.getBeanByClass(UserService.class);
	            if("subscribe".equals(event)){
	            	respXmlMsg = "<xml><ToUserName><![CDATA["+fromUserName+"]]></ToUserName><FromUserName><![CDATA["+toUserName
	            			+"]]></FromUserName><CreateTime>"+new Date().getTime()+"</CreateTime><MsgType><![CDATA[text]]></MsgType><Content>"
	            			+ "<![CDATA[        亲，终于等到你 /::B                     欢迎加入孕糖宝！/:rose                  请先选择绑定您的身份（身份不可变更，医生需审核通过）。"
	            			+ " 如果您是准麻麻会有医生为您提供及时的饮食指导认真及时地填写每天的饮食、运动及血糖情况将有助于医生给出更合理的建议。"
	            			+ "                           主页中'加餐偏好'中选择习惯的加餐种类（以默认三餐，选择加餐类型），宝宝为您量身计算每餐目标能量。"
	            			+ "                                                        您有任何建议请在下方输入栏给孕糖宝留言哦，欢迎大家多提宝贵意见。]]></Content></xml>";
	            	userService.saveOpenId(fromUserName);
	            }else if("unsubscribe".equals(event)){
	            	userService.deleteOpenId(fromUserName);
	            //	 if(userService.checkOpenId(fromUserName)>0){
	 	            	
	 	           /* }else{
	 	            	respXmlMsg= "<xml><ToUserName><![CDATA["+fromUserName+"]]></ToUserName><FromUserName><![CDATA["+toUserName
	 	            			+"]]></FromUserName><CreateTime>"+new Date().getTime()+"</CreateTime><MsgType><![CDATA[text]]></MsgType><Content>"
	 	            			+ "<![CDATA[亲，终于等到你  欢迎加入孕糖宝       请先选择绑定您的身份（身份不可变更，医生需审核通过）。"
	 	            			+ "   如果您是准麻麻会有医生为您提供及时的饮食指导认真及时地填写每天的饮食、运动及血糖情况将有助于医生给出更合理的建议"
	 	            			+ "主页中'加餐偏好'中选择习惯的加餐种类（以默认三餐，选择加餐类型），宝宝为您量身计算每餐目标能量]]></Content></xml>";
	 	            	userService.saveOpenId(fromUserName);
	 	            }*/
	            }else{
	            	respXmlMsg = "success";
	            }
	           
	            out = response.getWriter();
	            out.print(respXmlMsg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            out.close();
	            out = null;
	        }
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		PrintWriter out = resp.getWriter();
		if(CheckUtil.checkSignature(signature, timestamp, nonce)){
			out.print(echostr);
		}
	}
}
