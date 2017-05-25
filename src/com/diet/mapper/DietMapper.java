package com.diet.mapper;


import java.util.List;
import java.util.Map;


public interface DietMapper {
    
    
    /**
     * 保存膳食信息
     * @param param
     */
    void saveDiet(Map<String, Object> param);
    
    void updateDiet(Map<String, Object> param);
    
    /**
     * 查询膳食信息
     * @param param
     * @return
     */
    int countDietBypIdAndType(Map<String, Object> param);

	List<Map<String, Object>> getFoodList(Map<String, Object> map);
	
	List<Map<String, Object>> getFoodListWithPage(Map<String, Object> map);

	Map<String, Object> getFoodInfo(Map<String, Object> param);
	
	void saveFoodInfo(Map<String, Object> param);
	
	void deleteFoodInfo(Map<String, Object> param);
	
	void updateFoodInfo(Map<String, Object> param);

	int countFoodTotal();

	Map<String, Object> showBloodGlucoseInfo(Map<String, Object> param);

	int checkBloodGlucoseUpdate(Map<String, Object> param);
	
	void updateBloodGlucoseInfo(Map<String, Object> param);
	
	void saveBloodGlucoseInfo(Map<String, Object> param);
	
	void saveSportInfo(Map<String, Object> param);

	List<Map<String, Object>>  getDietList(Map<String, Object> map);
	
	List<Map<String, Object>>  getSportList(Map<String, Object> map);

	List<Map<String, Object>> countDietTotal(Map<String, Object> map);
	
	List<Map<String, Object>> countSportTotal(Map<String, Object> map);

	List<Map<String, Object>> showDietInfo(Map<String, Object> param);
	
	Map<String, Object> showSportInfo(Map<String, Object> param);

	List<Map<String, Object>> getBloodGlucoseList(Map<String, Object> map);

	int countBloodGlucoseTotal(Map<String, Object> map);

	void saveAdvice(Map<String, Object> param);
	
	void updateAdvice(Map<String, Object> param);
	
    void saveSnacks(Map<String, Object> param);
	
	void updateSnacks(Map<String, Object> param);
	
	int countSnacks(Map<String, Object> map);
	 
	int countAdvice(Map<String, Object> map);

	List<Map<String, Object>> getAdviceInfo(Map<String, Object> param);

	void updateSportInfo(Map<String, Object> param);

	int checkSportUpdate(Map<String, Object> param);

	Map<String, Object> getSnacks(Map<String, Object> param);
	
	void insertNewfood(Map<String, Object> param);
	
	List<Map<String, Object>> getAllFoodList();
}
