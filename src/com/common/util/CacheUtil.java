package com.common.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.diet.mapper.DietMapper;

public class CacheUtil {
	
	
	private static DietMapper dietMapper;
	
	private static CacheUtil instance;
	private static List<Map<String, Object>> mainfoodList;
	private static List<Map<String, Object>> meatList;
	private static List<Map<String, Object>> vegetablesList;
	private static List<Map<String, Object>> drinkList;
	private static List<Map<String, Object>> nutList;
	private static List<Map<String, Object>> fruitsList;
	
	static{
		dietMapper =	(DietMapper) SpringContextUtil.getBeanById("dietMapper");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", 1);
		mainfoodList = dietMapper.getFoodList(map);
		map.put("type", 2);
		meatList = dietMapper.getFoodList(map);
		map.put("type", 3);
		vegetablesList = dietMapper.getFoodList(map);
		map.put("type", 4);
		drinkList = dietMapper.getFoodList(map);
		map.put("type", 5);
		nutList = dietMapper.getFoodList(map);
		map.put("type", 6);
		fruitsList = dietMapper.getFoodList(map);
	}
	
	public static CacheUtil getInstance() {
		if (instance == null) {
			instance = new CacheUtil();
		}
		return instance;
	}
	
	public List<Map<String, Object>> getMainFoodList(){
		if(mainfoodList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 1);
			mainfoodList = dietMapper.getFoodList(map);
		}
		return mainfoodList;
	}
	
	public List<Map<String, Object>> getMeatList(){
		if(meatList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 2);
			meatList = dietMapper.getFoodList(map);
		}
		return meatList;
	}
	
	public List<Map<String, Object>> getVegetablesList(){
		if(vegetablesList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 3);
			vegetablesList = dietMapper.getFoodList(map);
		}
		return vegetablesList;
	}
	
	
	public List<Map<String, Object>> getDrinkList(){
		if(drinkList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 4);
			drinkList = dietMapper.getFoodList(map);
		}
		return drinkList;
	}
	
	public List<Map<String, Object>> getNutList(){
		if(nutList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 5);
			nutList = dietMapper.getFoodList(map);
		}
		return nutList;
	}
	
	public List<Map<String, Object>> getFruitsList(){
		if(fruitsList==null){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("type", 6);
			fruitsList = dietMapper.getFoodList(map);
		}
		return fruitsList;
	}
	
	/**
	 * 插入，排序，由低到高
	 * @param list
	 * @param param
	 */
	private void saveFoodList(List<Map<String, Object>> list, Map<String, Object> param){
		for(int i=0; i<list.size(); i++){
			Map<String, Object> map = list.get(i);
			if((Float.parseFloat(map.get("ordername").toString()))>(Float.parseFloat(param.get("ordername").toString()))){
				list.add(i-1,param);
				break;
			}
		}
	}
	
	public void deleteFoodFromList(Map<String, Object> param){
		String type = (String)param.get("type");
		if(type!=null){
			if("1".equals(type)){
				deleteFood(param, mainfoodList);
			}else if("2".equals(type)){
				deleteFood(param, meatList);
			}else if("3".equals(type)){
				deleteFood(param, vegetablesList);
			}else if("4".equals(type)){
				deleteFood(param, drinkList);
			}else if("5".equals(type)){
				deleteFood(param, nutList);
			}else if("6".equals(type)){
				deleteFood(param, fruitsList);
			}
		}
	}
	
	private void deleteFood(Map<String, Object> param, List<Map<String, Object>> list){
		for(int i=0; i<list.size(); i++){
			Map<String, Object> map = list.get(i);
			if(map.get("id").toString().equals(param.get("id").toString())){
				list.remove(i);
				break;
			}
		}
	}
	
	/**
	 * 更新列表,
	 * @param param
	 * @param isUpdate true ：更新 ， false : 插入
	 */
	public void updateFoodList(Map<String, Object> param, boolean isUpdate){
		String type = param.get("type").toString();
		if(type!=null){
			if("1".equals(type)){
				if(isUpdate){
					updateList(param, mainfoodList);
				}else{
					saveFoodList(mainfoodList, param);
				}
			}else if("2".equals(type)){
				if(isUpdate){
					updateList(param, meatList);
				}else{
					saveFoodList(mainfoodList, param);
				}
			}else if("3".equals(type)){
				if(isUpdate){
					updateList(param, vegetablesList);
				}else{
					saveFoodList(vegetablesList, param);
				}
			}else if("4".equals(type)){
				if(isUpdate){
					updateList(param, drinkList);
				}else{
					saveFoodList(vegetablesList, param);
				}
			}else if("5".equals(type)){
				if(isUpdate){
					updateList(param, nutList);
				}else{
					saveFoodList(nutList, param);
				}
			}else if("6".equals(type)){
				if(isUpdate){
					updateList(param, fruitsList);
				}else{
					saveFoodList(fruitsList, param);
				}
			}
		}
	}

	private void updateList(Map<String, Object> param, List<Map<String, Object>> list) {
		for(int i=0; i<list.size(); i++){
			Map<String, Object> map = list.get(i);
			if(map.get("id").toString().equals(param.get("id").toString())){
				list.get(i).put("type", param.get("type").toString());
				list.get(i).put("name", param.get("name").toString());
				list.get(i).put("energy", param.get("energy").toString());
				list.get(i).put("protein", param.get("protein").toString());
				list.get(i).put("fat", param.get("fat").toString());
				list.get(i).put("carbohydrate", param.get("carbohydrate").toString());
				list.get(i).put("cellulose", param.get("cellulose").toString());
				list.get(i).put("ordername", param.get("ordername").toString());
			}
		}
	}
	
	public Map<String, Object> getFoodInfo(Map<String, Object> param){
		Map<String, Object> map = null;
		String type = (String)param.get("type");
		if(type!=null){
			if("1".equals(type)){
				map = getFoodInfoFromList(param, mainfoodList);
			}else if("2".equals(type)){
				map = getFoodInfoFromList(param, meatList);
			}else if("3".equals(type)){
				map = getFoodInfoFromList(param, vegetablesList);
			}else if("4".equals(type)){
				map = getFoodInfoFromList(param, drinkList);
			}else if("5".equals(type)){
				map = getFoodInfoFromList(param, nutList);
			}else if("6".equals(type)){
				map = getFoodInfoFromList(param, fruitsList);
			}
		}
		return map;
	}
	
	private Map<String, Object> getFoodInfoFromList(Map<String, Object> param, List<Map<String, Object>> list){
		Map<String, Object> resultMap = null;
		for(Map<String, Object> map : list){
			if(map.get("id").toString().equals(param.get("id").toString())){
				resultMap  = map;
				break;
			}
		}
		return resultMap;
	}

}
