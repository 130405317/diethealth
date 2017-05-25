package com.dictionary.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.util.CommonUtil;
import com.dictionary.mapper.DictionaryMapper;
import com.dictionary.service.DictionaryService;

@Service("DictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Autowired(required=true)
	private DictionaryMapper DictionaryDao;  //定义DictionaryDao对象
	
	/**
	 * 查询字典信息
	 */
	public List<Map<String, Object>> getDictionaryList(){
		return DictionaryDao.getDictionaryList();
	}
	
	/**
	 * 根据字典类型查询字典信息
	 */
	public List<Map<String, Object>> getDictionaryListByType(String type){
		return DictionaryDao.getDictionaryListByType(type);
	}
	
	/**
	 * 根据字典id查询字典信息
	 */
	public Map<String, Object> getDictionaryListById(Map<String, Object> param){
		return DictionaryDao.getDictionaryListById(param);
	}
	
	/**
	 * 删除字典
	 */
	public void deleteDictionaryById(String id){
		DictionaryDao.deleteDictionaryById(id);
	}
	
	/**
	 * 添加或更新字典
	 */
	public String saveDcit(Map<String, Object> param){
		if(param.containsKey("id")){
			//更新字典
			DictionaryDao.updateDictionary(param);
		}else{
			//添加字典
			param.put("id", CommonUtil.getUUID());
			DictionaryDao.addDictionary(param);
		}
		return "1";
	}
}
