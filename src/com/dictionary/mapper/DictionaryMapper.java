package com.dictionary.mapper;

import java.util.List;
import java.util.Map;

public interface DictionaryMapper {

	public List<Map<String, Object>> getDictionaryList();
	
	public List<Map<String, Object>> getDictionaryListByType(String type);
	
	public Map<String, Object> getDictionaryListById(Map<String, Object> param);
	
	public void addDictionary(Map<String, Object> param);
	
	public void deleteDictionaryById(String id);
	
	public void updateDictionary(Map<String,Object> param);
}
