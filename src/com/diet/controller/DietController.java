package com.diet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.common.util.CacheUtil;
import com.common.util.FormDataCollectUtil;
import com.common.util.SpringContextUtil;
import com.dictionary.service.DictionaryService;
import com.diet.service.DietService;
import com.user.service.UserService;


@Controller
@RequestMapping("/diet")
public class DietController {
	
	@Autowired(required=true)
	private DietService dietService;   //定义dietService对象
	
	private Logger log = Logger.getLogger(DietController.class); //定义log对象
	
	
	/**
	 * 
	 * <p>Title:跳转到饮食录入界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/diet_edit")
	public  String toDietForm(HttpServletRequest request, Model model) throws IOException{
		String pId = (String)request.getSession().getAttribute("pId");
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		model.addAttribute("energy",dietService.getTargetEnergy(pId));   
		model.addAttribute("typeList",dietService.getTypeList(pId));
		//model.addAttribute("mainfoodList",CacheUtil.getInstance().getMainFoodList());
		//model.addAttribute("meatList",CacheUtil.getInstance().getMeatList());
		//model.addAttribute("vegetablesList",CacheUtil.getInstance().getVegetablesList());
		//model.addAttribute("drinkList",CacheUtil.getInstance().getDrinkList());
		//model.addAttribute("nutList",CacheUtil.getInstance().getNutList());
		//model.addAttribute("fruitsList",CacheUtil.getInstance().getFruitsList());
		return "diet/diet_edit";
	}
	
	/**
	 * 
	 * <p>Title:获取主食信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/mainfood")
	@ResponseBody 
	public List<Map<String, Object>> getMainfood(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getMainFoodList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:获取肉类信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/meat")
	@ResponseBody 
	public List<Map<String, Object>> getMeat(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getMeatList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:获取蔬菜信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/vegetables")
	@ResponseBody 
	public List<Map<String, Object>> getVegetables(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getVegetablesList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:获取饮品信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/drink")
	@ResponseBody 
	public List<Map<String, Object>> getDrink(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getDrinkList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:获取零食干果信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/nut")
	@ResponseBody 
	public List<Map<String, Object>> getNut(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getNutList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:获取水果信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/fruits")
	@ResponseBody 
	public List<Map<String, Object>> getFruits(HttpServletRequest request, HttpServletResponse response){
		 List<Map<String, Object>> list = null; 
		 list = CacheUtil.getInstance().getFruitsList();
		 return list;
	}
	
	/**
	 * 
	 * <p>Title:跳转到图片上传页面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("diet_img_upload")
	public String dietImgUpload(HttpServletRequest request, Model model){
		String pId = (String)request.getSession().getAttribute("pId");
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		model.addAttribute("typeList",dietService.getTypeList(pId));
		return "diet/img_upload";
	}
	
	/**
	 * 
	 * <p>Title:多图片上传</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/img_moreUpload")
	@ResponseBody 
	public List<String> imgMoreUpload(HttpServletRequest request){
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Map<String, MultipartFile> files = multipartHttpServletRequest.getFileMap();
		String uploadUrl = "/home/wxdiethealth_upload/";
		//String uploadUrl = "E:/file/upload/";
		File dir = new File(uploadUrl);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		List<String> fileList = new ArrayList<String>();
		for (MultipartFile file :  files.values()) {
			File targetFile = new File(uploadUrl + file.getOriginalFilename());
			fileList.add(file.getOriginalFilename());
			if (!targetFile.exists()) {
				try {
					targetFile.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				try {
					file.transferTo(targetFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		
		return fileList;
	}
	
	/**
	 * 
	 * <p>Title:跳转到添加食物信息页面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("food_add")
	public String foodAdd(HttpServletRequest request){
		return "diet/food_add";
	}
	
	/**
	 * 
	 * <p>Title:添加新食物(饮食录入)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("insert_newfood")
	public void insertNewfood(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String result = dietService.insertNewfood(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
	}
	
	/**
	 * 
	 * <p>Title:录入饮食</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/saveDiet")
	public  void addUser(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		String pId = request.getSession().getAttribute("pId").toString();
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		map.put("pId", pId);
		try {
			String result = dietService.saveDiet(map);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
			} catch (Exception e) {
				log.error(e);
			}
	}
	
	/**
	 * 
	 * <p>Title:跳转到食物列表页面(管理员)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/food_list")
	public String getFoodListWithPage(HttpServletRequest request,Model model){
		/*Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = dietService.getFoodListWithPage(map);
		model.addAttribute("foodList",list);
		int total = dietService.countFoodTotal();
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);*/
		List<Map<String, Object>> list = dietService.getAllFoodList();
		model.addAttribute("foodList",list);
		return "diet/food_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到饮食记录列表(病人)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/diet_list")
	public String getDietListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		String pId = (String)session.getAttribute("pId");
		//String pId = (String)request.getSession().getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("pId",pId);
		model.addAttribute("dietList",list);
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/diet_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到运动记录列表界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/sport_list")
	public String getSportListWithPage(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getSportList(map);
		model.addAttribute("sportList",list);
		int total = dietService.countSportTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/sport_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到饮食记录列表界面(医生)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("/dietary_list")
	public String getDietList(HttpServletRequest request,Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = dietService.getDietList(map);
		model.addAttribute("p_id",list.get(0).get("p_id"));
		model.addAttribute("dietList",list);
		int total = dietService.countDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		return "diet/dietary_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到设置加餐偏好界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("snack")
	public String toSnack(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
	//	String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> map = dietService.getSnacks(param);
		model.addAttribute("snackInfo", map==null?"":map.get("snacks"));
		return "diet/snack";
	}
	
	/**
	 * 
	 * <p>Title:跳转到编辑食物信息界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("food_edit")
	public String patientEdit(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("food", dietService.showFoodInfo(param));
		model.addAttribute("curPage",param.get("curPage"));
		return "diet/food_edit";
	}
	
	/**
	 * 
	 * <p>Title:跳转到饮食记录界面(病人)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("diet_info")
	public String getDietInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		String pId = (String)request.getSession().getAttribute("pId");
		//String pId = "o-1WTwgc5wIiSvUy0-8V92XA0sic";
		model.addAttribute("targetEnergy",dietService.getTargetEnergy(pId));
		model.addAttribute("dietEnergy", dietService.showDietEnergy(param));
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		return "diet/diet_info";
	}
	
	/**
	 * 
	 * <p>Title:跳转到饮食记录界面(医生)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("diet_info_d")
	public String getDietInfo1(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		return "diet/diet_info_d";
	}
	
	/**
	 * 
	 * <p>Title:跳转到运动记录界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("sport_info")
	public String getSportInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("sportInfo", dietService.getSportInfo(param));
		return "diet/sport_info";
	}
	
	/**
	 * 
	 * <p>Title:跳转到患者记录界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("dietary_info")
	public String getDietaryInfo(HttpServletRequest request, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		String pId = request.getParameter("pId");
		//String pId = (String)request.getSession().getAttribute("pId");
		//String pId = "o-1WTwgc5wIiSvUy0-8V92XA0sic";
		model.addAttribute("dietList", dietService.showDietInfo(param));
		model.addAttribute("targetEnergy",dietService.getTargetEnergy(pId));
		model.addAttribute("dietEnergy", dietService.showDietEnergy(param));
		model.addAttribute("bg", dietService.showBloodGlucoseInfo(param));
		model.addAttribute("sportInfo", dietService.getSportInfo(param));
		model.addAttribute("advice", dietService.showAdviceInfo(param));
		model.addAttribute("date", param.get("date"));
		model.addAttribute("pId", param.get("pId"));
		return "diet/dietary_info";
	}
	
	/**
	 * 
	 * <p>Title:跳转到血糖录入界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("bg_edit1")
	public String bloodGlucoseEdit(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		//String pId ="o-1WTwnmE5MzetfXjm_02IjLG8m4";
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		model.addAttribute("bg", dietService.getBloodGlucoseInfo(param));
		return "diet/bg_edit";
	}
	
	/**
	 * 
	 * <p>Title:跳转到运动量录入界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("sport_edit")
	public String sportEdit(HttpServletRequest request, Model model){
		DictionaryService dictionaryService = (DictionaryService)SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("sprotTypeList",dictionaryService.getDictionaryListByType("6"));
		Map<String, Object> param = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		param.put("pId", pId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		model.addAttribute("sportInfo",dietService.showSportInfo(param));
		return "diet/sport_edit";
	}
	
	/**
	 * 
	 * <p>Title:运动量录入</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveSport")
	public void saveSportInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			HttpSession session = request.getSession();
			String pId = (String)session.getAttribute("pId");
			//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
			param.put("pId", pId);
			String str = dietService.saveSportInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:设置加餐偏好</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveSnacks")
	public void saveSnack(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			HttpSession session = request.getSession();
			String pId = (String)session.getAttribute("pId");
			//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
			param.put("pId", pId);
			String str = dietService.saveSnacks(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:跳转到血糖记录界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("bg_list")
	public String bloodGlucoseList(HttpServletRequest request, Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String)session.getAttribute("pId");
		//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		map.put("pId", pId);
		List<Map<String, Object>> list = dietService.getBloodGlucoseList(map);
		UserService uservice = (UserService)SpringContextUtil.getBeanById("UserService");
		Map<String, Object> userMap = uservice.showUserInfo(map);
		model.addAttribute("bgList",list);
		DictionaryService dictionaryService = (DictionaryService)SpringContextUtil.getBeanById("DictionaryService");
		if("0".equals(userMap.get("diabetesType").toString())){
			model.addAttribute("standard1",dictionaryService.getDictionaryListByType("2").get(0));
			model.addAttribute("standard2",dictionaryService.getDictionaryListByType("3").get(0));
		}else{
			model.addAttribute("standard1",dictionaryService.getDictionaryListByType("4").get(0));
			model.addAttribute("standard2",dictionaryService.getDictionaryListByType("5").get(0));
		}
		int total = dietService.countBloodGlucoseTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		model.addAttribute("totalPage",totalPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		return "diet/bg_list";
	}
	
	/**
	 * 
	 * <p>Title:添加食物信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveFoodInfo")
	public void saveFoodInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:添加血糖信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveBloodGlucose")
	public void saveBloodGlucoseInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveBloodGlucoseInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:删除食物信息</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("deleteFoodInfo")
	public void deleteDoctorInfo(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.deleteFoodInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:添加医生建议</p>
	 * @author: 徐德荣
	 * @date: 2016年12月29日
	 *
	 */
	@RequestMapping("saveAdvice")
	public void saveAdvice(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = dietService.saveAdvice(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 保存图片分析的食物数据
	 * 
	 * @author: xuderong
	 * @date: 2017年5月25日
	 *
	 */
	@RequestMapping("savePhotoDiet")
	public void savePhotoDiet(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String pId = request.getSession().getAttribute("pId").toString();
			//String pId = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
			param.put("pId", pId);
			String str = dietService.savePhotoDiet(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	@RequestMapping("img_diet_list")
	public String showImgDietList(HttpServletRequest request, HttpServletResponse response, Model model){
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		List<Map<String, Object>> list = dietService.getImgDietList(map);
		model.addAttribute("dietList",list);
		int total = dietService.countImgDietTotal(map);
		int numPerPage = (Integer)map.get("numPerPage");
		int totalPage = (int)Math.ceil((total*1.0)/numPerPage);
		if(totalPage==0){
			model.addAttribute("curPage",0);
		}else{
			model.addAttribute("curPage",map.get("curPage"));
		}
		model.addAttribute("totalPage",totalPage);
		return "diet/img_diet_list";
	}
	
	@RequestMapping("img_diet_info")
	public String showImgDietInfo(HttpServletRequest request, HttpServletResponse response, Model model){
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		//String pId = (String)request.getSession().getAttribute("pId");
		String pId = param.get("pId").toString();
		List  list =dietService.showDietInfo(param);
		model.addAttribute("targetEnergy",dietService.getTargetEnergy(pId));
		model.addAttribute("dietInfo", dietService.showImgDietInfo(param));
		return"diet/img_diet_info";
	}
}


