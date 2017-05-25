package com.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 用户分组
 * @author Administrator
 *
 */
public class GroupUtil {

	 /**
     * 获得ACCESS_TOKEN
    * @Title: getAccess_token
    * @Description: 获得ACCESS_TOKEN
    * @param @return    设定文件
    * @return String    返回类型
    * @throws
     */
    private static String getAccess_token(){  
          
        String APPID = "wx84ee0f61c8ab5c10";
        String APPSECRET = "00a9b2f6be0f56a6c123b2e677a1d634";
         
          String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+ APPID + "&secret=" +APPSECRET;
          String accessToken = null;
         try {
                URL urlGet = new URL(url);
                HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();    
                  
                http.setRequestMethod("GET");      //必须是get方式请求    
                http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
                http.setDoOutput(true);        
                http.setDoInput(true);
                System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
                System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
                http.connect();
              
                InputStream is =http.getInputStream();
                int size =is.available();
                byte[] jsonBytes =new byte[size];
                is.read(jsonBytes);
                String message=new String(jsonBytes,"UTF-8");
                  
                JSONObject demoJson = JSONObject.fromObject(message);
                accessToken = demoJson.getString("access_token");
                  
                System.out.println(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
           return accessToken;
        }
    
    /**
     * 创建用户分组
     * @return
     */
    public static String createGroup(String groupName) { 
    	String group = "{\"group\":{\"name\":\""+groupName+"\"}}";
        //此处改为自己想要的结构体，替换即可
        String access_token= getAccess_token();
 
        String action = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token="+access_token;
        try {
           URL url = new URL(action);
           HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
             
           http.setRequestMethod("POST");        
           http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
           http.setDoOutput(true);        
           http.setDoInput(true);
           System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
           System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
           http.connect();
           OutputStream os= http.getOutputStream();    
           os.write(group.getBytes("UTF-8"));//传入参数    
           os.flush();
           os.close();
         
           InputStream is =http.getInputStream();
           int size =is.available();
           byte[] jsonBytes =new byte[size];
           is.read(jsonBytes);
           String message=new String(jsonBytes,"UTF-8");
           return "返回信息"+message;
           } catch (MalformedURLException e) {
               e.printStackTrace();
           } catch (IOException e) {
               e.printStackTrace();
           }    
        return "createGroup 失败";
   }
    
   /**
    * 删除用户分组
    * @return
    */
	public static String deleteGroup(String groupName){
	       String access_token= getAccess_token();
	       JSONObject json = JSONObject.fromObject(getGroups());
	       JSONArray arr = json.getJSONArray("groups");
	       Iterator<Object> it = arr.iterator();
	       String id = "";
	       while(it.hasNext()){
	    	   JSONObject jsonObj = JSONObject.fromObject(it.next());
	    	   if(groupName.equals(jsonObj.getString("name"))){
	    		   id = jsonObj.getString("id");
	    	   }
	       }
	       String group = "{\"group\":{\"id\":\""+id+"\"}}";
	       String action = "https://api.weixin.qq.com/cgi-bin/groups/delete?access_token="+access_token;
	       try {
	          URL url = new URL(action);
	          HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
	            
	          http.setRequestMethod("POST");        
	          http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
	          http.setDoOutput(true);        
	          http.setDoInput(true);
	          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
	          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
	 
	          http.connect();
	          OutputStream os= http.getOutputStream();  
	          os.write(group.getBytes("UTF-8"));//传入参数    
	          os.flush();
	          os.close();
	        
	          InputStream is =http.getInputStream();
	          int size =is.available();
	          byte[] jsonBytes =new byte[size];
	          is.read(jsonBytes);
	          String message=new String(jsonBytes,"UTF-8");
	          return "返回信息:"+message;
	          } catch (MalformedURLException e) {
	              e.printStackTrace();
	          } catch (IOException e) {
	              e.printStackTrace();
	          }
	       return "deleteGroup 失败";   
	   }
	
	/**
	 * 查询所有分组
	 * @return
	 */
	public static String getGroups(){
       String access_token= getAccess_token();
       String action = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token="+access_token;
       try {
          URL url = new URL(action);
          HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
            
          http.setRequestMethod("GET");        
          http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
          http.setDoOutput(true);        
          http.setDoInput(true);
          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
          http.connect();
          OutputStream os= http.getOutputStream();    
          os.flush();
          os.close();
        
          InputStream is =http.getInputStream();
          int size =is.available();
          byte[] jsonBytes =new byte[size];
          is.read(jsonBytes);
          String message=new String(jsonBytes,"UTF-8");
          return message;
          } catch (MalformedURLException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
       return "getGroups 失败";   
   }
	
   public static String getGroupIdByUser(String openId){
       String access_token= getAccess_token();
       String action = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token="+access_token;
       String user = "{\"openid\":\""+openId+"\"}";
       try {
          URL url = new URL(action);
          HttpURLConnection http =   (HttpURLConnection) url.openConnection();    
            
          http.setRequestMethod("POST");        
          http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");    
          http.setDoOutput(true);        
          http.setDoInput(true);
          System.setProperty("sun.net.client.defaultConnectTimeout", "30000");//连接超时30秒
          System.setProperty("sun.net.client.defaultReadTimeout", "30000"); //读取超时30秒
 
          http.connect();
          OutputStream os= http.getOutputStream();  
          os.write(user.getBytes("UTF-8"));//传入参数    
          os.flush();
          os.close();
        
          InputStream is =http.getInputStream();
          int size =is.available();
          byte[] jsonBytes =new byte[size];
          is.read(jsonBytes);
          String message=new String(jsonBytes,"UTF-8");
          JSONObject demoJson = JSONObject.fromObject(message);
          String groupid = demoJson.getString("groupid");
          return groupid;
          } catch (MalformedURLException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }
       return null;  
	   
   }
   
   public static void main(String[] args) {
	   createGroup("doctor");
	   createGroup("patient");
   }
}
