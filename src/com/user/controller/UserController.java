package com.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.util.CommonUtil;
import com.common.util.FormDataCollectUtil;
import com.common.util.SpringContextUtil;
import com.dictionary.service.DictionaryService;
import com.user.pojo.WeixinUserInfo;
import com.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;  //定义userService对象
	private Logger log = Logger.getLogger(UserController.class); //定义log对象

	/**
	 * <p>
	 * 【跳转到注册页面】
	 * </p>
	 *
	 * @author 林军雄 2014年12月2日
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping("/register")
	public String register(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		// String id = "o-1WTwnmE5MzetfXjm_02IjLG8m4";
		model.addAttribute("id", id);
		model.addAttribute("doctorlist", userService.getDoctorList());
		return "user/register";

	}
	
	/**
	 * 
	 * <p>Title:绑定用户</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/user_bind")
	public String bindUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		WeixinUserInfo user = CommonUtil.getUserInfoByCode(code);
		String id = user.getOpenId();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", "patient");
		param.put("id", id);
		session.setAttribute("id", id);
		Map<String, Object> map = userService.checkUser(param);
		if (map == null) {
			param.put("type", "doctor");
			map = userService.checkUser(param);
			if (map == null) {
				session.setAttribute("isBinded", "false");
			} else {
				session.setAttribute("isBinded", "true");
				session.setAttribute("dId", id);
			}
		} else {
			session.setAttribute("isBinded", "true");
			session.setAttribute("pId", id);
		}
		session.setAttribute("userImage", user.getHeadImgUrl());
		return "user/user_bind";

	}
	
	/**
	 * 
	 * <p>Title:跳转到管理员主页</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/admin_index")
	public String toAdminIndex(HttpServletRequest request) {
		return "user/admin_index";

	}
	
	/**
	 * 
	 * <p>Title:跳转到医生主页</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/doctor_index")
	public String toDoctorIndex(HttpServletRequest request) {
		return "user/doctor_index";

	}
	
	/**
	 * 
	 * <p>Title:用户登录身份确认</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/user_check")
	public void check(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		String type = map.get("type") == null ? null : map.get("type").toString();
		try {
			Map<String, Object> result = userService.checkUser(map);
			response.setContentType("text/html;charset=utf-8");

			if (result != null) {
				request.getSession().setAttribute("name", result.get("name"));
				if ("patient".equals(type)) {
					request.getSession().setAttribute("pId", result.get("p_id"));
				} else if ("doctor".equals(type)) {
					request.getSession().setAttribute("dId", result.get("d_id"));
				}
				response.getWriter().print("1");

			} else {
				response.getWriter().print("0");
			}
		} catch (Exception e) {
			log.error(e);
		}

	}

	/**
	 * 
	 * <p>Title:用户(病人)信息修改</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/saveUserInfo")
	public void updateUser(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String result = userService.updateUser(map);
			if ("1".equals(result)) {
				request.getSession().setAttribute("name", map.get("name"));
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
		} catch (Exception e) {
			log.error(e);
		}

	}
	
	/**
	 * 
	 * <p>Title:跳转到用户(病人)信息界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("user_info")
	public String showUserInfo(HttpServletRequest request, Model model) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("user", userService.showUserInfo(param));
		return "user/user_info";
	}

	/*
	 * @RequestMapping("advice_info") public String
	 * showAdviceInfo(HttpServletRequest request,Model model){ HttpSession
	 * session = request.getSession(); String pId =
	 * (String)session.getAttribute("pId"); Map<String, Object> param = new
	 * HashMap<String, Object>(); param.put("pId", pId);
	 * model.addAttribute("user", userService.showUserInfo(param)); return
	 * "user/advice_info"; }
	 */
	
	/**
	 * 
	 * <p>Title:保存医生建议</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("saveAdvice")
	public void saveAdvice(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.saveAdvice(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:跳转到用户(病人)信息修改界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("user_edit")
	public String patientEdit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String pId = (String) session.getAttribute("pId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		model.addAttribute("user", userService.showUserInfo(param));
		model.addAttribute("doctorlist", userService.getDoctorList());
		return "user/user_edit";
	}
	
	/**
	 * 
	 * <p>Title:判断用户类型并跳转到我的主页</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("toIndex")
	public String toIndex(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		WeixinUserInfo user = CommonUtil.getUserInfoByCode(code);
		String id = user.getOpenId();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", "patient");
		param.put("id", id);
		session.setAttribute("id", id);
		Map<String, Object> map = userService.checkUser(param);
		String page = "user_index";
		if (map == null) {
			param.put("type", "doctor");
			map = userService.checkUser(param);
			if (map == null) {
				session.setAttribute("isBinded", "false");
				session.setAttribute("name", "");
				session.setAttribute("userImage", "");
			} else {
				session.setAttribute("isBinded", "true");
				session.setAttribute("dId", id);
				session.setAttribute("name", map.get("name"));
				session.setAttribute("userImage", user.getHeadImgUrl());
				page = "doctor_index";
			}
		} else {
			session.setAttribute("isBinded", "true");
			session.setAttribute("pId", id);
			session.setAttribute("name", map.get("name"));
			session.setAttribute("userImage", user.getHeadImgUrl());
		}

		return "redirect:" + page;
	}
	
	/**
	 * 
	 * <p>Title:跳转到我的主页(病人)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("user_index")
	public String toUserIndex(HttpServletRequest request) {
		return "user/user_index";
	}
	
	/**
	 * 
	 * <p>Title:用户注册信息保存</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("add_user")
	public void addUser(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String result = userService.saveUser(map);
			if ("1".equals(result)) {
				HttpSession session = request.getSession();
				session.setAttribute("pId", map.get("pId"));
				session.setAttribute("name", map.get("name"));
				session.setAttribute("isBinded", "true");
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(result);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:跳转到患者列表界面(管理员)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("patient_list")
	public String toPatientList(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = userService.getPatientList(map);
		model.addAttribute("patientList", list);
		int total = userService.countPatientTotal();
		int numPerPage = (Integer) map.get("numPerPage");
		int totalPage = (int) Math.ceil((total * 1.0) / numPerPage);
		model.addAttribute("totalPage", totalPage);
		if (totalPage == 0) {
			model.addAttribute("curPage", 0);
		} else {
			model.addAttribute("curPage", map.get("curPage"));
		}
		return "user/patient_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到患者列表界面(医生-患者信息)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("confirm_list")
	public String toConfirmList(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		map.put("state", "1");
		String doctorId = (String) request.getSession().getAttribute("dId");
		map.put("doctorId", doctorId);
		List<Map<String, Object>> list = userService.getPatientListWithState(map);
		model.addAttribute("patientList", list);
		int total = userService.countPatientTotalWithState(map);
		int numPerPage = (Integer) map.get("numPerPage");
		int totalPage = (int) Math.ceil((total * 1.0) / numPerPage);
		model.addAttribute("totalPage", totalPage);
		if (totalPage == 0) {
			model.addAttribute("curPage", 0);
		} else {
			model.addAttribute("curPage", map.get("curPage"));
		}
		return "user/confirm_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到患者列表界面(医生-患者记录)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("confirmed_list")
	public String toConfirmedList(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		String doctorId = (String) request.getSession().getAttribute("dId");
		//String doctorId = "o-1WTwq3CBIC4fEbSGcRk8oI7120";
		map.put("doctorId", doctorId);
		List<Map<String, Object>> list = userService.getPatientListWithState(map);
		model.addAttribute("patientList", list);
		int total = userService.countPatientTotalWithState(map);
		int numPerPage = (Integer) map.get("numPerPage");
		int totalPage = (int) Math.ceil((total * 1.0) / numPerPage);
		model.addAttribute("totalPage", totalPage);
		if (totalPage == 0) {
			model.addAttribute("curPage", 0);
		} else {
			model.addAttribute("curPage", map.get("curPage"));
		}
		return "user/confirmed_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生列表界面(管理员)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("doctor_list")
	public String toDoctorList(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> list = userService.getDoctorList(map);
		model.addAttribute("doctorList", list);
		int total = userService.countDoctorTotal();
		int numPerPage = (Integer) map.get("numPerPage");
		int totalPage = (int) Math.ceil((total * 1.0) / numPerPage);
		model.addAttribute("totalPage", totalPage);
		if (totalPage == 0) {
			model.addAttribute("curPage", 0);
		} else {
			model.addAttribute("curPage", map.get("curPage"));
		}
		return "user/doctor_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生信息修改界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("doctor_edit")
	public String doctorEdit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String dId = (String) session.getAttribute("dId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dId", dId);
		model.addAttribute("doctor", userService.showDoctorInfo(param));
		DictionaryService dictionaryService = (DictionaryService) SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("dictList", dictionaryService.getDictionaryListByType("1"));
		return "user/doctor_edit";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生信息界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("doctor_info")
	public String doctorInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String pId = (String) session.getAttribute("pId");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> map = userService.showUserInfo(param);
		param.put("dId", map.get("doctorId"));
		model.addAttribute("doctor", userService.showDoctorInfo(param));
		DictionaryService dictionaryService = (DictionaryService) SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("dictList", dictionaryService.getDictionaryListByType("1"));
		return "user/doctor_info";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生注册界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("doctor_add")
	public String doctorAdd(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		DictionaryService dictionaryService = (DictionaryService) SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("dictList", dictionaryService.getDictionaryListByType("1"));
		model.addAttribute("id", id);
		return "user/doctor_add";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生信息审核界面(管理员)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("doctor_update")
	public String doctorupdate(HttpServletRequest request, Model model) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("doctor", userService.showDoctorInfo(param));
		DictionaryService dictionaryService = (DictionaryService) SpringContextUtil.getBeanById("DictionaryService");
		model.addAttribute("dictList", dictionaryService.getDictionaryListByType("1"));
		return "user/doctor_update";
	}
	
	/**
	 * 
	 * <p>Title:跳转到患者信息删除界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("patient_delete")
	public String patientDelete(HttpServletRequest request, Model model) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		model.addAttribute("user", userService.showUserInfo(param));
		return "user/patient_delete";
	}

	
	@RequestMapping("updatePatientState")
	public void updatePatientState(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.updatePatientState(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:删除医生(管理员)</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("delectDoctor")
	public void delectDoctor(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.delectDoctor(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:医生注册信息保存</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("saveDoctorInfo")
	public void saveDoctorInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.saveDoctorInfo(param);
			HttpSession session = request.getSession();
			session.setAttribute("dId", param.get("dId"));
			session.setAttribute("name", param.get("name"));
			session.setAttribute("isBinded", "true");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:医生信息修改</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("updateDoctorInfo")
	public void updateDoctorInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			request.getSession().setAttribute("name", param.get("name"));
			String str = userService.saveDoctorInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:医生审核状态更改</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("updateDoctorState")
	public void deleteDoctorInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.updateDoctorState(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:患者信息删除</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("deletePatientInfo")
	public void deletePatientInfo(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> param = FormDataCollectUtil.getInstance().getFormData(request);
		try {
			String str = userService.deletePatientInfo(param);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(str);
		} catch (Exception e) {
			log.error(e);
		}
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生建议列表界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("advice_list")
	public String getAdviceListWithPage(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		HttpSession session = request.getSession();
		String pId = (String) session.getAttribute("pId");
		//String pId = "o-1WTwgc5wIiSvUy0-8V92XA0sic";
		map.put("pId", pId);
		List<Map<String, Object>> list = userService.getAdviceListWithPage(map);
		model.addAttribute("adviceList", list);
		int total = userService.countAdviceTotal(map);
		int numPerPage = (Integer) map.get("numPerPage");
		int totalPage = (int) Math.ceil((total * 1.0) / numPerPage);
		if (totalPage == 0) {
			model.addAttribute("curPage", 0);
		} else {
			model.addAttribute("curPage", map.get("curPage"));
		}
		model.addAttribute("totalPage", totalPage);
		return "user/advice_list";
	}
	
	/**
	 * 
	 * <p>Title:跳转到医生建议界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("advice_info")
	public String getAdviceList(HttpServletRequest request, Model model) {
		Map<String, Object> map = FormDataCollectUtil.getInstance().getFormDataWithPage(request);
		List<Map<String, Object>> info = userService.getAdviceInfo(map);
		model.addAttribute("advice", info);
		return "user/advice_info";
	}
	
	/**
	 * 
	 * <p>Title:跳转到使用说明界面</p>
	 * @author: 徐德荣
	 * @date: 2016年12月28日
	 *
	 */
	@RequestMapping("/introduce")
	public String getIntroduce(HttpServletRequest request, HttpServletResponse response) {
		return "user/introduce";
	}

}
