package com.user.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.user.mapper.UserMapper;
import com.user.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userDao;
	

	/**
	 * 验证用户身份
	 */
	@Override
	public Map<String, Object> checkUser(Map<String, Object> param) {
		List<Map<String, Object>> list = null;
		String type = param.get("type")==null?null:param.get("type").toString();
		if(type==null){
			if("admin".equals(param.get("username"))&&"password".equals(param.get("password"))){
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("name", "管理员");
				return map;
			}
		}else{
			if("patient".equals(type)){
				list = userDao.checkUser(param);
			}else if("doctor".equals(type)){
				list = userDao.checkDoctor(param);
			}
			if(list.size()>0){
				return list.get(0);
			}
		}
		return null;
	}

	/**
	 *   <p>【添加用户】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	@Override
	public String saveUser(Map<String, Object> param) {
		Date now = new Date();
		param.put("registerDate", now);
		userDao.saveUser(param);
		return "1";
	}
	
	/**
	 * 查询病人信息
	 */
	@Override
	public Map<String, Object> showUserInfo(Map<String, Object> param) {
		return userDao.showUserInfo(param);
	}
	
	/**
	 * 查询审核通过的所有医生
	 */
	@Override
	public List<Map<String, Object>> getDoctorList(Map<String, Object> param) {
		List<Map<String, Object>> list = userDao.getDoctor(param);
		for(int i=0; i<list.size(); i++){
					String state = (String)list.get(i).get("state");
					if("1".equals(state)){
						list.get(i).put("state","未审核");
					}else if("2".equals(state)){
						list.get(i).put("state","审核通过");
					}else if("3".equals(state)){
						list.get(i).put("state","审核不通过");
					}
					
		}
		return list;
	}
	
	/**
	 * 查询医生信息
	 */
	@Override
	public Map<String, Object> showDoctorInfo(Map<String, Object> param) {
		return userDao.showDoctorInfo(param);
	}
	
	/**
	 * 添加医生
	 */
	@Override
	public String saveDoctorInfo(Map<String, Object> param) {
		if(userDao.checkDoctorById(param)>0){
			userDao.updateDoctorInfo(param);
		}else{
			userDao.saveDoctorInfo(param);
		}
		
		return "1";
	}
	
	/**
	 * 更新医生审核状态
	 */
	@Override
	public String updateDoctorState(Map<String, Object> param) {
		userDao.updateDoctorState(param);
		return "1";
	}
	
	/**
	 * 查询所有医生数量
	 */
	@Override
	public int countDoctorTotal() {
		return userDao.countDoctorTotal();
	}
	
	/**
	 * 查询所有病人数量
	 */
	@Override
	public int countPatientTotal() {
		return userDao.countPatientTotal();
	}
	
	/**
	 * 获取所有医生负责的所有病人
	 */
	@Override
	public List<Map<String, Object>> getPatientList(Map<String, Object> map) {
		return userDao.getPatientList(map);
	}
	
	/**
	 * 删除病人信息
	 */
	@Override
	public String deletePatientInfo(Map<String, Object> param) {
		userDao.deletePatientInfo(param);
		return "1";
	}
	
	/**
	 * 获取医生负责的病人数量
	 */
	@Override
	public int countPatientTotalWithState(Map<String, Object> map) {
		return userDao.countPatientTotalWithState(map);
	}
	
	/**
	 * 获取医生所负责的病人信息
	 */
	@Override
	public List<Map<String, Object>> getPatientListWithState(
			Map<String, Object> map) {
		return userDao.getPatientListWithState(map);
	}
	
	@Override
	public String updatePatientState(Map<String, Object> param) {
		userDao.updatePatientState(param);
		return "1";
	}
	
	/**
	 * 查询所有审核通过的医生
	 */
	@Override
	public List<Map<String, Object>> getDoctorList() {
		return userDao.getDoctorList();
	}
	
	/**
	 * 更新病人信息
	 */
	@Override
	public String updateUser(Map<String, Object> map) {
		userDao.updateUser(map);
		return "1";
	}
	
	/**
	 * 添加医生建议
	 */
	@Override
	public String saveAdvice(Map<String, Object> param) {
		userDao.saveAdvice(param);
		return "1";
	}

	/**
	 * 查询医生建议
	 */
	@Override
	public List<Map<String, Object>> getAdviceListWithPage(Map<String, Object> map) {
		return userDao.getAdviceListWithPage(map);
	}
	
	/**
	 * 查询某天的医生建议
	 */
	@Override
	public List<Map<String, Object>> getAdviceInfo(Map<String, Object> map) {
		return userDao.getAdviceInfo(map);
	}
	
	/**
	 * 查询医生建议的数量
	 */
	@Override
	public int countAdviceTotal(Map<String, Object> map) {
		return userDao.countAdviceTotal(map);
	}
	
	/**
	 * 删除医生
	 */
	@Override
	public String delectDoctor(Map<String, Object> param) {
		userDao.deleteDoctorInfo(param);
		return "1";
	}
	
	
	@Override
	public int checkOpenId(String openid) {
		return userDao.checkOpenId(openid);
	}

	@Override
	public void saveOpenId(String openId) {
		userDao.saveOpenId(openId);
		
	}

	@Override
	public void deleteOpenId(String openId) {
		userDao.deleteOpenId(openId);
		
	}

}
