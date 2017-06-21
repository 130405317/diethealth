package com.diet.service.impl;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.aspectj.weaver.ArrayAnnotationValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.util.CacheUtil;
import com.common.util.CommonUtil;
import com.common.util.SpringContextUtil;
import com.dictionary.service.DictionaryService;
import com.diet.mapper.DietMapper;
import com.diet.service.DietService;
import com.user.mapper.UserMapper;

@Service("DietService")
public class DietServiceImpl implements DietService {
	@Autowired(required = true)
	private DietMapper dietDao;

	/**
	 * <p>
	 * 【保存膳食信息】
	 * </p>
	 *
	 * @author 林军雄
	 *
	 * @param param
	 * @return
	 */
	@Override
	public String saveDiet(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		if (isUpdate(param)) {
			dietDao.updateDiet(param);
		} else {
			dietDao.saveDiet(param);
		}
		return "1";
	}

	/**
	 * 
	 * <p>
	 * Title:查找饮食记录数量
	 * </p>
	 * 
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	private boolean isUpdate(Map<String, Object> param) {
		if (dietDao.countDietBypIdAndType(param) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 查找食物信息(分页)
	 */
	@Override
	public List<Map<String, Object>> getFoodListWithPage(Map<String, Object> map) {
		return dietDao.getFoodListWithPage(map);
	}

	/**
	 * 查找食物信息
	 */
	@Override
	public Map<String, Object> showFoodInfo(Map<String, Object> param) {
		return dietDao.getFoodInfo(param);
	}

	/**
	 * 添加或更新食物信息
	 */
	@Override
	public String saveFoodInfo(Map<String, Object> param) {
		if (param.get("id") == null) {
			param.put("id", CommonUtil.getUUID());
			dietDao.saveFoodInfo(param); // 添加食物信息
			// CacheUtil.getInstance().updateFoodList(param, false);
		} else {
			dietDao.updateFoodInfo(param); // 更新食物信息
			// CacheUtil.getInstance().updateFoodList(param, true);
		}
		return "1";
	}

	/**
	 * 删除食物信息
	 */
	@Override
	public String deleteFoodInfo(Map<String, Object> param) {
		dietDao.deleteFoodInfo(param);
		CacheUtil.getInstance().deleteFoodFromList(param);
		return "1";
	}

	/**
	 * 查询食物总数
	 */
	@Override
	public int countFoodTotal() {
		return dietDao.countFoodTotal();
	}

	/**
	 * 查询当天血糖信息 并处理
	 */
	@Override
	public Map<String, Object> showBloodGlucoseInfo(Map<String, Object> param) {
		if (param.get("date") == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			param.put("date", today);
		}
		Map<String, Object> map = dietDao.showBloodGlucoseInfo(param);
		if (null != map) {
			Set<Entry<String, Object>> set = map.entrySet();
			Iterator<Entry<String, Object>> it = set.iterator();
			while (it.hasNext()) {
				Entry<String, Object> entry = it.next();
				if (!"p_id".equals(entry.getKey()) && !"date".equals(entry.getKey())) {
					float value = (Float) entry.getValue();
					if (value == 0) {
						map.put(entry.getKey(), "-");
					}
				}
			}
		}
		return map;
	}

	/**
	 * 查询当天血糖信息
	 */
	@Override
	public Map<String, Object> getBloodGlucoseInfo(Map<String, Object> param) {
		if (param.get("date") == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			param.put("date", today);
		}
		return dietDao.showBloodGlucoseInfo(param);
	}

	/**
	 * 添加或更新血糖信息
	 */
	@Override
	public String saveBloodGlucoseInfo(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		if (dietDao.checkBloodGlucoseUpdate(param) > 0) {
			// 更新血糖信息
			dietDao.updateBloodGlucoseInfo(setDefaultValue(param));
		} else {
			// 添加血糖信息
			dietDao.saveBloodGlucoseInfo(setDefaultValue(param));
		}
		return "1";
	}

	/**
	 * 
	 * <p>
	 * Title:设置默认参数
	 * </p>
	 * 
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	private Map<String, Object> setDefaultValue(Map<String, Object> param) {
		Set<Entry<String, Object>> sets = param.entrySet();
		Iterator<Entry<String, Object>> it = sets.iterator();
		while (it.hasNext()) {
			Entry<String, Object> entry = it.next();
			if (null == entry.getValue() || "".equals(entry.getValue().toString())) {
				param.put(entry.getKey(), "0");
			} else {
				continue;
			}
		}
		return param;
	}

	/**
	 * 查询饮食记录
	 */
	@Override
	public List<Map<String, Object>> getDietList(Map<String, Object> map) {
		return dietDao.getDietList(map);
	}

	/**
	 * 查询饮食记录总数
	 */
	@Override
	public int countDietTotal(Map<String, Object> map) {
		return dietDao.countDietTotal(map).size();
	}

	/**
	 * 查询运动量记录(分页)
	 */
	@Override
	public List<Map<String, Object>> getSportList(Map<String, Object> map) {
		return dietDao.getSportList(map);
	}

	/**
	 * 查询运动量总数
	 */
	@Override
	public int countSportTotal(Map<String, Object> map) {
		return dietDao.countSportTotal(map).size();
	}

	/**
	 * 查询饮食记录并处理
	 */
	@Override
	public List<Map<String, Object>> showDietInfo(Map<String, Object> param) {
		List<Map<String, Object>> list = dietDao.showDietInfo(param);
		for (int i = 0; i < list.size(); i++) {
			String mainfood = (String) list.get(i).get("mainfood");
			String mainfoodNum = (String) list.get(i).get("mainfoodNum");
			String meat = (String) list.get(i).get("meat");
			String meatNum = (String) list.get(i).get("meatNum");
			String vegetables = (String) list.get(i).get("vegetables");
			String vegetablesNum = (String) list.get(i).get("vegetablesNum");
			String drink = (String) list.get(i).get("drink");
			String drinkNum = (String) list.get(i).get("drinkNum");
			String nut = (String) list.get(i).get("nut");
			String nutNum = (String) list.get(i).get("nutNum");
			String fruits = (String) list.get(i).get("fruits");
			String fruitsNum = (String) list.get(i).get("fruitsNum");
			if (!"".equals(mainfood) && mainfood != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(mainfood, "1", mainfoodNum);
				list.get(i).put("mainfood", tmpList);
			}
			if (!"".equals(meat) && meat != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(meat, "2", meatNum);
				list.get(i).put("meat", tmpList);
			}
			if (!"".equals(vegetables) && vegetables != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(vegetables, "3", vegetablesNum);
				list.get(i).put("vegetables", tmpList);
			}
			if (!"".equals(drink) && drink != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(drink, "4", drinkNum);
				list.get(i).put("drink", tmpList);
			}
			if (!"".equals(nut) && nut != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(nut, "5", nutNum);
				list.get(i).put("nut", tmpList);
			}
			if (!"".equals(fruits) && fruits != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(fruits, "6", fruitsNum);
				list.get(i).put("fruits", tmpList);
			}
			int type = (Integer) list.get(i).get("type");
			switch (type) {
			case 1: {
				list.get(i).put("type", "早餐");
				break;
			}
			case 2: {
				list.get(i).put("type", "午餐");
				break;
			}
			case 3: {
				list.get(i).put("type", "晚餐");
				break;
			}
			case 4: {
				list.get(i).put("type", "上午加餐");
				break;
			}
			case 5: {
				list.get(i).put("type", "下午加餐");
				break;
			}
			case 6: {
				list.get(i).put("type", "晚上加餐");
				break;
			}
			default: {
				list.get(i).put("type", "夜宵");
			}
			}
		}
		return list;
	}

	/**
	 * 
	 * <p>
	 * Title:根据食物id查询食物信息
	 * </p>
	 * 
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	private List<Map<String, Object>> getFoodListByIds(String foodIds, String type, String nums) {
		String[] ids = foodIds.split(",");
		String[] numbers = nums.split(",");
		List<Map<String, Object>> tmpList = new LinkedList<Map<String, Object>>();
		for (int i = 0; i < ids.length; i++) {
			if ("0".equals(ids[i])) {
				continue;
			}
			Map<String, Object> tmp = new HashMap<String, Object>();
			tmp.put("id", ids[i]);
			tmp.put("type", type);
			Map<String, Object> map = dietDao.getFoodInfo(tmp);
			tmpList.add(getCalculateFoodInfo(map, Integer.valueOf(numbers[i])));
		}
		return tmpList;
	}

	/**
	 * 
	 * <p>
	 * Title:获取饮食记录中各营养素的总量
	 * </p>
	 * 
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	private Map<String, Object> getCalculateFoodInfo(Map<String, Object> param, int num) {
		if (param == null) {
			return param;
		}
		param.remove("pinyin");
		NumberFormat nf = NumberFormat.getNumberInstance();
		nf.setMaximumFractionDigits(2);
		for (Entry<String, Object> entry : param.entrySet()) {
			String key = entry.getKey();
			if (key != null && !"id".equals(key) && !"type".equals(key) && !"name".equals(key)
					&& !"ordername".equals(key)) {
				param.put(key, nf.format(num * ((Float) entry.getValue()) / 100));
			}
		}
		return param;

	}

	/**
	 * 查询血糖记录(分页)
	 */
	@Override
	public List<Map<String, Object>> getBloodGlucoseList(Map<String, Object> map) {
		List<Map<String, Object>> list = dietDao.getBloodGlucoseList(map);
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> tmp = list.get(i);
			Set<Entry<String, Object>> set = tmp.entrySet();
			Iterator<Entry<String, Object>> it = set.iterator();
			while (it.hasNext()) {
				Entry<String, Object> entry = it.next();
				if (!"p_id".equals(entry.getKey()) && !"date".equals(entry.getKey())) {
					float value = (Float) entry.getValue();
					if (value == 0) {
						list.get(i).put(entry.getKey(), "-");
					}
				}
			}

		}
		return list;
	}

	/**
	 * 查询血糖记录总数
	 */
	@Override
	public int countBloodGlucoseTotal(Map<String, Object> map) {
		return dietDao.countBloodGlucoseTotal(map);
	}

	/**
	 * 添加医生建议
	 */
	@Override
	public String saveAdvice(Map<String, Object> param) {

		dietDao.saveAdvice(param);

		return "1";
	}

	/**
	 * 查询医生建议
	 */
	@Override
	public List<Map<String, Object>> showAdviceInfo(Map<String, Object> param) {
		return dietDao.getAdviceInfo(param);
	}

	/**
	 * 查询运动量记录
	 */
	@Override
	public Map<String, Object> showSportInfo(Map<String, Object> param) {
		return dietDao.showSportInfo(param);
	}

	/**
	 * 查询用户信息并计算出目标能量
	 */
	@Override
	public int getTargetEnergy(String pId) {
		int energy = 0;
		UserMapper userMapper = (UserMapper) SpringContextUtil.getBeanById("userMapper");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> patient = userMapper.showUserInfo(param);
		int height = (Integer) patient.get("height");
		String strength = (String) patient.get("strength");
		if ("0".equals(strength)) {
			energy = (height - 105) * 30;
		} else if ("1".equals(strength)) {
			energy = (height - 105) * 34;
		} else if ("2".equals(strength)) {
			energy = (height - 105) * 38;
		}
		int pregnancy = (Integer) patient.get("pregnancy");
		if (pregnancy > 12) {
			energy = energy + 200;
		}
		String fetus_num = (String) patient.get("fetus_num");
		if ("2".equals(fetus_num)) {
			energy = energy + 200;
		}
		return energy;
	}

	/**
	 * 获取加餐偏好
	 */
	@Override
	public List<Map<String, Object>> getTypeList(String pId) {
		List<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> map = dietDao.getSnacks(param);
		String snacks = map == null ? "" : map.get("snacks").toString();
		Map<String, Object> diettype1 = new HashMap<String, Object>();
		diettype1.put("value", "1");
		diettype1.put("name", "早餐");
		list.add(diettype1);
		Map<String, Object> diettype2 = new HashMap<String, Object>();
		diettype2.put("value", "2");
		diettype2.put("name", "午餐");
		list.add(diettype2);
		Map<String, Object> diettype3 = new HashMap<String, Object>();
		diettype3.put("value", "3");
		diettype3.put("name", "晚餐");
		list.add(diettype3);
		String[] types = snacks.split("|");
		for (int i = 0; i < types.length; i++) {
			Map<String, Object> type = new HashMap<String, Object>();
			if (!"|".equals(types[i]) && !"".equals(types[i])) {
				type.put("value", types[i]);
				if ("4".equals(types[i])) {
					type.put("name", "上午加餐");
				} else if ("5".equals(types[i])) {
					type.put("name", "下午加餐");
				} else if ("6".equals(types[i])) {
					type.put("name", "晚上加餐");
				}
				list.add(type);
			}
		}
		return list;
	}

	/**
	 * 添加或更新运动量
	 */
	@Override
	public String saveSportInfo(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		if (dietDao.checkSportUpdate(param) > 0) {
			// 更新运动量
			dietDao.updateSportInfo(param);
		} else {
			// 添加运动量
			dietDao.saveSportInfo(param);
		}
		return "1";
	}

	// 添加或更新加餐偏好
	@Override
	public String saveSnacks(Map<String, Object> param) {
		if (dietDao.countSnacks(param) > 0) {
			// 更新加餐偏好
			dietDao.updateSnacks(param);
		} else {
			// 添加加餐偏好
			dietDao.saveSnacks(param);
		}
		return "1";
	}

	/**
	 * 获取加餐偏好
	 */
	@Override
	public Map<String, Object> getSnacks(Map<String, Object> param) {
		return dietDao.getSnacks(param);
	}

	/**
	 * 获取运动量记录
	 */
	@Override
	public Map<String, Object> getSportInfo(Map<String, Object> param) {
		Map<String, Object> map = showSportInfo(param);
		if (map == null)
			return null;
		DictionaryService dictionaryService = (DictionaryService) SpringContextUtil.getBeanById("DictionaryService");
		List<Map<String, Object>> list = dictionaryService.getDictionaryListByType("6");
		for (Map<String, Object> tmp : list) {
			if (tmp.get("id").toString().equals(map.get("beforebreakfasttype"))) {
				String beforebreakfasttype = sporttype(String.valueOf(tmp.get("name")));
				map.put("beforebreakfasttype", beforebreakfasttype);
			}
			if (tmp.get("id").toString().equals(map.get("afterbreakfasttype"))) {
				String afterbreakfasttype = sporttype(String.valueOf(tmp.get("name")));
				map.put("afterbreakfasttype", afterbreakfasttype);
			}
			if (tmp.get("id").toString().equals(map.get("beforelaunchtype"))) {
				String beforelaunchtype = sporttype(String.valueOf(tmp.get("name")));
				map.put("beforelaunchtype", beforelaunchtype);
			}
			if (tmp.get("id").toString().equals(map.get("afterlaunchtype"))) {
				String afterlaunchtype = sporttype(String.valueOf(tmp.get("name")));
				map.put("afterlaunchtype", afterlaunchtype);
			}
			if (tmp.get("id").toString().equals(map.get("beforedinnertype"))) {
				String beforedinnertype = sporttype(String.valueOf(tmp.get("name")));
				map.put("beforedinnertype", beforedinnertype);
			}
			if (tmp.get("id").toString().equals(map.get("afterdinnertype"))) {
				String afterdinnertype = sporttype(String.valueOf(tmp.get("name")));
				map.put("afterdinnertype", afterdinnertype);
			}
			if (tmp.get("id").toString().equals(map.get("beforesleeptype"))) {
				String beforesleeptype = sporttype(String.valueOf(tmp.get("name")));
				map.put("beforesleeptype", beforesleeptype);
			}
		}
		return map;
	}

	/**
	 * 添加新食物
	 */
	@Override
	public String insertNewfood(Map<String, Object> param) {
		dietDao.insertNewfood(param);
		return "1";
	}

	/**
	 * 获取饮食记录
	 */
	@Override
	public Map<String, Object> showDietEnergy(Map<String, Object> param) {
		List<Map<String, Object>> list = dietDao.showDietInfo(param);
		int energy = 0;
		Double protein = 0.0;
		Double fat = 0.0;
		Double carbohydrate = 0.0;
		for (int i = 0; i < list.size(); i++) {
			String mainfood = (String) list.get(i).get("mainfood");
			String mainfoodNum = (String) list.get(i).get("mainfoodNum");
			String meat = (String) list.get(i).get("meat");
			String meatNum = (String) list.get(i).get("meatNum");
			String vegetables = (String) list.get(i).get("vegetables");
			String vegetablesNum = (String) list.get(i).get("vegetablesNum");
			String drink = (String) list.get(i).get("drink");
			String drinkNum = (String) list.get(i).get("drinkNum");
			String nut = (String) list.get(i).get("nut");
			String nutNum = (String) list.get(i).get("nutNum");
			String fruits = (String) list.get(i).get("fruits");
			String fruitsNum = (String) list.get(i).get("fruitsNum");
			if (!"".equals(mainfood) && mainfood != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(mainfood, "1", mainfoodNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}
			if (!"".equals(meat) && meat != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(meat, "2", meatNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}
			if (!"".equals(vegetables) && vegetables != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(vegetables, "3", vegetablesNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}
			if (!"".equals(drink) && drink != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(drink, "4", drinkNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}
			if (!"".equals(nut) && nut != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(nut, "5", nutNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}
			if (!"".equals(fruits) && fruits != null) {
				List<Map<String, Object>> tmpList = getFoodListByIds(fruits, "6", fruitsNum);
				if (tmpList.size() != 0) {
					protein += Double.parseDouble(String.valueOf(tmpList.get(0).get("protein")));
					fat += Double.parseDouble(String.valueOf(tmpList.get(0).get("fat")));
					carbohydrate += Double.parseDouble(String.valueOf(tmpList.get(0).get("carbohydrate")));
				}
			}

		}
		for (int j = 0; j < list.size(); j++) {
			energy += Integer.parseInt(String.valueOf(list.get(j).get("energy")));
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("energy", energy);
		map.put("protein", String.format("%.2f", protein));
		map.put("fat", String.format("%.2f", fat));
		map.put("carbohydrate", String.format("%.2f", carbohydrate));
		return map;
	}

	/**
	 * 
	 * <p>
	 * Title:设置运动强度
	 * </p>
	 * 
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	public String sporttype(String sport) {
		String result = "";
		if ("散步".equals(sport) || "瑜伽".equals(sport)) {
			result = "中";
		} else if ("慢跑".equals(sport) || "游泳".equals(sport)) {
			result = "强";
		} else if ("上肢运动".equals(sport)) {
			result = "弱";
		} else {
			result = "其他";
		}
		return result;
	}

	@Override
	public List<Map<String, Object>> getAllFoodList() {

		return dietDao.getAllFoodList();
	}

	@Override
	public String savePhotoDiet(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		dietDao.savePhotoDiet(param);
		return "1";
	}

	@Override
	public List<Map<String, Object>> getImgDietList(Map<String, Object> param) {
		return dietDao.getImgDietList(param);
	}

	@Override
	public int countImgDietTotal(Map<String, Object> map) {
		return dietDao.countImgDietTotal(map).size();
	}

	@Override
	public List<Map<String, Object>> showImgDietInfo(Map<String, Object> map) {
		List<Map<String, Object>> ret_list = new ArrayList<Map<String,Object>>();
		for (int i = 1; i <= 6; i++) {
			map.put("type", i);
			List<Map<String, Object>> list = dietDao.getImgDietInfo(map);
			Map<String, Object> retMap = new HashMap<String, Object>();
			if (list.size() > 0) {
				String typeName = "";
				switch (i) {
				case 1: {
					retMap.put("type", "早餐");
					break;
				}
				case 2: {
					retMap.put("type", "午餐");
					break;
				}
				case 3: {
					retMap.put("type", "晚餐");
					break;
				}
				case 4: {
					retMap.put("type", "上午加餐");
					break;
				}
				case 5: {
					retMap.put("type", "下午加餐");
					break;
				}
				case 6: {
					retMap.put("type", "晚上加餐");
					break;
				}
				default: {
					retMap.put("type", "夜宵");
					break;
				}

				}
				retMap.put("food_list", list);
				ret_list.add(retMap);
			}
		}

		return ret_list;
	}
}
