package com.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Random;

/**
 * 自定义菜单
 * 
 * @author Administrator
 * 
 */
public class MenuUtil {

	private static String APPID = CommonUtil.APPID;
	private static String APPSECRET = CommonUtil.APPSECRET;

	/**
	 * 创建Menu
	 * 
	 * @Title: createMenu
	 * @Description: 创建Menu
	 * @param @return
	 * @param @throws IOException 设定文件
	 * @return int 返回类型
	 * @throws
	 */
	public static String createMenu() {
		// 此处改为自己想要的结构体，替换即可
		String menu = "{\"button\":[{\"type\":\"view\",\"name\":\"绑定业务\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			    +APPID+"&redirect_uri=http://yuntangbao.top/diethealth/user/user_bind&response_type=code&scope=snsapi_userinfo&state="+new Random().nextInt(10000)+"#wechat_redirect\"},"
				+"{\"type\":\"view\",\"name\":\"我的主页\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			    +APPID+"&redirect_uri=http://yuntangbao.top/diethealth/user/toIndex&response_type=code&scope=snsapi_userinfo&state="+new Random().nextInt(10000)+"#wechat_redirect\"},"
			    + "{\"type\":\"view\",\"name\":\"使用说明 \",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			    +APPID+"&redirect_uri=http://yuntangbao.top/diethealth/user/introduce&response_type=code&scope=snsapi_userinfo&state="+new Random().nextInt(10000)+"#wechat_redirect\"}]}";
		/*String menu = "{\"button\":[{\"type\":\"view\",\"name\":\"绑定业务\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			    +APPID+"&redirect_uri=http://rrgcll2mwr.proxy.qqbrowser.cc/diethealth/user/user_bind&response_type=code&scope=snsapi_base&state=1#wechat_redirect\"},"
				+"{\"type\":\"view\",\"name\":\"我的业务\",\"url\":\"https://open.weixin.qq.com/connect/oauth2/authorize?appid="
			    +APPID+"&redirect_uri=http://rrgcll2mwr.proxy.qqbrowser.cc/diethealth/user/toIndex&response_type=code&scope=snsapi_base&state=1#wechat_redirect\"},"
				+"{\"type\":\"click\",\"name\":\"健康资讯\",\"key\":\"healthMsg\"}]}";*/
		String access_token = CommonUtil.getToken().getAccessToken();
		String action = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token="
				+ access_token;
		try { 
			URL url = new URL(action);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();

			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒

			http.connect();
			OutputStream os = http.getOutputStream();
			os.write(menu.getBytes("UTF-8"));// 传入参数
			os.flush();
			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			System.out.println(message);
			return "返回信息" + message;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "createMenu 失败";
	}

	/**
	 * 删除当前Menu
	 * 
	 * @Title: deleteMenu
	 * @Description: 删除当前Menu
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public static String deleteMenu() {
		String access_token = CommonUtil.getToken().getAccessToken();
		String action = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token="
				+ access_token;
		try {
			URL url = new URL(action);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();

			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			http.setDoOutput(true);
			http.setDoInput(true);
			System.setProperty("sun.net.client.defaultConnectTimeout", "30000");// 连接超时30秒
			System.setProperty("sun.net.client.defaultReadTimeout", "30000"); // 读取超时30秒

			http.connect();
			OutputStream os = http.getOutputStream();
			os.flush();
			os.close();

			InputStream is = http.getInputStream();
			int size = is.available();
			byte[] jsonBytes = new byte[size];
			is.read(jsonBytes);
			String message = new String(jsonBytes, "UTF-8");
			System.out.println(message);
			return "deleteMenu返回信息:" + message;
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "deleteMenu 失败";
	}

	public static void main(String[] args) {
		deleteMenu();
		createMenu();

	}
}
