package com.diet.service;

import java.util.List;
import java.util.Map;

public interface  DietService {
	
	
	/**
	 * 保存膳食信息
	 * @param param
	 * @return
	 */
	public String saveDiet(Map<String, Object> param);
	
	public String insertNewfood(Map<String, Object> param);

	public List<Map<String, Object>> getFoodListWithPage(Map<String, Object> map);

	public Map<String, Object> showFoodInfo(Map<String, Object> param);
	
	public String saveFoodInfo(Map<String, Object> param);
	
	public String deleteFoodInfo(Map<String, Object> param);

	public int countFoodTotal();

	public Map<String, Object> showBloodGlucoseInfo(Map<String, Object> param);
	
	public Map<String, Object> getBloodGlucoseInfo(Map<String, Object> param);

	public String saveBloodGlucoseInfo(Map<String, Object> param);

	public List<Map<String, Object>> getDietList(Map<String, Object> map);

	public int countDietTotal(Map<String, Object> map);
	
	public List<Map<String, Object>> getSportList(Map<String, Object> map);

	public int countSportTotal(Map<String, Object> map);

	public List<Map<String, Object>> showDietInfo(Map<String, Object> param);

	public List<Map<String, Object>> getBloodGlucoseList(Map<String, Object> map);

	public int countBloodGlucoseTotal(Map<String, Object> map);

	public String saveAdvice(Map<String, Object> param);

	public List<Map<String, Object>> showAdviceInfo(Map<String, Object> param);
	
	public Map<String, Object> showSportInfo(Map<String, Object> param);
	
	public int getTargetEnergy(String pId);

	public List<Map<String, Object>> getTypeList(String pId);
	
	public Map<String, Object> showDietEnergy(Map<String, Object> param);

	public String saveSportInfo(Map<String, Object> param);
	
	public String saveSnacks(Map<String, Object> param);
	
	public Map<String, Object> getSnacks(Map<String, Object> param);

	public Map<String, Object> getSportInfo(Map<String, Object> param);
	
	public List<Map<String, Object>> getAllFoodList();
}
