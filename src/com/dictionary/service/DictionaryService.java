package com.dictionary.service;

import java.util.List;
import java.util.Map;

public interface DictionaryService {

	public List<Map<String, Object>> getDictionaryList();
	
	public List<Map<String, Object>> getDictionaryListByType(String type);
	
	public Map<String, Object> getDictionaryListById(Map<String, Object> param);
	
	public void deleteDictionaryById(String id);
	
	public String saveDcit(Map<String, Object> param);

}
