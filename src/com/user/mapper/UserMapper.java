package com.user.mapper;


import java.util.List;
import java.util.Map;

public interface UserMapper {
    
    
    /**
     *   <p>【校验用户是否存在】</p>
     *
     * @author 林军雄  2014年12月2日 
     *
     * @param param
     * @return
     */
    List<Map<String, Object>> checkUser(Map<String, Object> param);
    
    /**
     *   <p>【添加用户】</p>
     *
     * @author 林军雄  2014年12月2日 
     *
     * @param param
     */
    void saveUser(Map<String, Object> param);
    
    /**
     *   <p>【显示用户详细信息】</p>
     *
     * @author 林军雄  2015年1月21日 
     *
     * @param param
     * @return
     */
    Map<String, Object> showUserInfo(Map<String, Object> param);
    
    
    Map<String, Object> showDoctorInfo(Map<String, Object> param);
    
    /**
     *   <p>【更新用户信息】</p>
     *
     * @author 林军雄  2015年1月21日 
     *
     * @param param
     */
    void updateUser(Map<String, Object> param);
    
    List<Map<String, Object>> getDoctorList();

	List<Map<String, Object>> getDoctor(Map<String, Object> param);
	
	List<Map<String, Object>> checkDoctor(Map<String, Object> param);

	void saveDoctorInfo(Map<String, Object> param);
	
	void updateDoctorInfo(Map<String, Object> param);
	
	int checkDoctorById(Map<String, Object> param);

	void updateDoctorState(Map<String, Object> param);

	int countDoctorTotal();

	List<Map<String, Object>> getPatientList(Map<String, Object> map);

	int countPatientTotal();
	
	void deletePatientInfo(Map<String, Object> param);

	int countPatientTotalWithState(Map<String, Object> map);

	List<Map<String, Object>> getPatientListWithState(Map<String, Object> map);

	void updatePatientState(Map<String, Object> param);
	
	void saveAdvice(Map<String, Object> param);

	List<Map<String, Object>> getAdviceListWithPage(Map<String, Object> map);
	
	List<Map<String, Object>> getAdviceInfo(Map<String, Object> map);

	int countAdviceTotal(Map<String, Object> map);

	void deleteDoctorInfo(Map<String, Object> param);
	
    public int checkOpenId(String openid);
	
	public void saveOpenId(String openId);
	
	public void deleteOpenId(String openId);
    
}