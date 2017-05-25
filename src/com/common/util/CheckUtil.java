package com.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class CheckUtil {

	private static String token = "testToken";
	public static boolean checkSignature(String signature, String timestamp, String nonce){
		String[] arr = new String[]{token,timestamp,nonce};
		//排序
		Arrays.sort(arr);
		//生成字符串
		StringBuffer content = new StringBuffer();
		for(int i=0; i<arr.length; i++){
			content.append(arr[i]);
		}
		//SHA1加密
		MessageDigest alga = null;
		String temp = null;
		try {
		    alga = MessageDigest.getInstance("SHA-1");
		    byte[] bt = content.toString().getBytes();
		    alga.update(bt);
		    temp = byte2hex(alga.digest()); //to HexString
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return temp.equals(signature);
	}
	
	 public static String byte2hex(byte[] b) {
	        String des = "";
	        String tmp = null;
	        for (int i = 0; i < b.length; i++) {
	            tmp = (Integer.toHexString(b[i] & 0xFF));
	            if (tmp.length() == 1) {
	                des += "0";
	            }
	            des += tmp;
	        }
	        return des;
	    }
}
