package com.dictionary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.FormDataCollectUtil;
import com.dictionary.service.DictionaryService;


@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	
	@Autowired(required=true)
	private DictionaryService dictionaryService;  //定义dictionaryService对象
	//定义log对象
	private Logger log = Logger.getLogger(DictionaryController.class);
	
	/**
	 * 
	 * <p>Title:跳转到字典列表界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/dictionary_list")
	public String getDictList(HttpServletRequest requset, Model model){
		List<Map<String, Object>> list = dictionaryService.getDictionaryList();
		model.addAttribute("dictList",list);
		return "dictionary/dictionary_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到修改字典界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("dictionary_edit")
	public String dictionaryEdit(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dict", dictionaryService.getDictionaryListById(param));
		return "dictionary/dictionary_edit";
	}
	
	/**
	 * 
	 * <p>Title:跳转到新增字典界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("dictionary_add")
	public String dictionaryAdd(){
		return "dictionary/dictionary_add";
	}
	
	/**
	 * 
	 * <p>Title:添加字典</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveDict")
	public void saveDict(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dictionaryService.saveDcit(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:删除字典</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("deleteDict")
	public void deleteDict(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		try {
			dictionaryService.deleteDictionaryById(id);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("1");
		} catch (Exception e) {
			log.error(e);
		}
	}
}


