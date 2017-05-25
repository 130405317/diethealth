package com.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface  UserService {
	
	/**
	 *   <p>【校验用户是否存在】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> checkUser(Map<String, Object> param);
	
	/**
	 *   <p>【添加用户】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	public String saveUser(Map<String, Object> param);
	
	/**
	 *   <p>【显示用户详细信息】</p>
	 *
	 * @author 林军雄  2015年1月21日 
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> showUserInfo(Map<String, Object> param);
	
	public Map<String, Object> showDoctorInfo(Map<String, Object> param);
	
	/**
	 * 获取医师列表
	 * @return
	 */
	public List<Map<String, Object>> getDoctorList(Map<String, Object> param);

	public String saveDoctorInfo(Map<String, Object> param);

	public String updateDoctorState(Map<String, Object> param);

	public int countDoctorTotal();
	
	public List<Map<String, Object>> getDoctorList();

	public List<Map<String, Object>> getPatientList(Map<String, Object> map);

	public int countPatientTotal();
    
	public String deletePatientInfo(Map<String, Object> param);

	public List<Map<String, Object>> getPatientListWithState(
			Map<String, Object> map);

	public int countPatientTotalWithState(Map<String, Object> map);

	public String updatePatientState(Map<String, Object> param);

	public String updateUser(Map<String, Object> map);
	
	public String saveAdvice(Map<String, Object> param);

	public List<Map<String, Object>> getAdviceInfo(Map<String, Object> map);
	
	public List<Map<String, Object>> getAdviceListWithPage(Map<String, Object> map);

	public int countAdviceTotal(Map<String, Object> map);

	public String delectDoctor(Map<String, Object> param);
	
	public int checkOpenId(String openid);
	
	public void saveOpenId(String openId);

	public void deleteOpenId(String openId);

}
