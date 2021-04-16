package com.bootdo.oaForm.controller;

import com.bootdo.common.config.Constant;
import com.bootdo.common.controller.BaseController;
import com.bootdo.common.domain.DictDO;
import com.bootdo.common.service.DictService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.R;
import com.bootdo.oaForm.domain.OaForm;
import com.bootdo.oaForm.domain.OaFormSet;
import com.bootdo.oaForm.service.FormService;
import com.bootdo.oaForm.service.OaFormService;
import com.bootdo.oaForm.service.OaFormSetService;
import com.bootdo.system.SendMsg;
import com.bootdo.system.domain.UserDO;
import com.bootdo.system.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 *
 *
 * @author Bowen SU
 * @email asgrrem98@gmail.com
 * @date 2 March 2021
 */

@Controller
@RequestMapping("/oa/form")
public class FormController extends BaseController {
	@Autowired
	private FormService formService;
	@Autowired
	private OaFormService oaFormService;
	@Autowired
	private DictService dictService;
	@Autowired
	private OaFormSetService oaFormSetService;

	@Autowired
	private UserService userService;

	@Value("${spring.mail.msg}")
	private String msg;

	@Value("${spring.mail.company}")
	private String company;

	@Value("${spring.mail.IsSend}")
	private String IsSend;

	@Autowired
	private SendMsg sendMsg;


	@ResponseBody
	@RequestMapping("/updateByInsure")
	@RequiresPermissions("oa:form:edit")
	public R updateByInsure(OaForm form) {
		oaFormService.update(form);
		OaForm ent =oaFormService.get(form.getId());
		if(ent!=null){
			UserDO userDO=userService.get(ent.getUser_id());
			if(userDO!=null){
				if(userDO.getEmail()!=null){
					if(IsSend.equals("true")){
						if (ent.getStatus() == 4){
						sendMsg.sendMessage(company,"More information requested",userDO.getEmail());
						}else if (ent.getStatus() == 3){
							sendMsg.sendMessage(company,"Your case is closed. Thanks for using ClaiMS.",userDO.getEmail());
						}
					}
				}
			}
		}
		return R.ok();
	}

	@GetMapping()
	@RequiresPermissions("oa:form:form")
	String oaForm() {
		return "oa/form/form";
	}

	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("oa:form:form")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		List<OaForm> formList = oaFormService.list(params);
		int total = formList.size();
		PageUtils pageUtils = new PageUtils(formList, total);
		return pageUtils;
	}

	@GetMapping("/add")
	@RequiresPermissions("oa:form:add")
	String add() {
		return "oa/form/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("oa:form:edit")
	String edit(@PathVariable("id") Long id, Model model) {
		OaForm form = oaFormService.get(id);
		model.addAttribute("form", form);
		if(form!=null){
			if(form.getJob()!=null&&form.getJob()!=""){
				OaFormSet set =oaFormSetService.getOne(Long.valueOf(form.getJob()));
				model.addAttribute("set",set);
			}
		}
		return "oa/form/edit";
	}

	@GetMapping("/userForm")
	@RequiresPermissions("oa:form:userForm")
	String oaUserForm() {
		return "oa/form/userForm";
	}

	@ResponseBody
	@GetMapping("/userList")
	@RequiresPermissions("oa:form:userForm")
	public PageUtils userList(@RequestParam Map<String, Object> params) {
		UserDO obj=(UserDO)SecurityUtils.getSubject().getPrincipal();
		params.put("user_id",obj.getUserId());
		List<OaForm> formList = oaFormService.list(params);
		int total = formList.size();
		PageUtils pageUtils = new PageUtils(formList, total);
		return pageUtils;
	}

	@GetMapping("/userAdd")
	@RequiresPermissions("oa:form:userAdd")
	String userAdd() {
		return "oa/form/userAdd";
	}

	@GetMapping("/userEdit/{id}")
	@RequiresPermissions("oa:form:userEdit")
	String userEdit(@PathVariable("id") Long id, Model model) {
		OaForm form = oaFormService.get(id);
		List<DictDO> dictDOS = dictService.listByType("sex");
		Long type = form.getSex();
		/*for (DictDO dictDO:dictDOS){
		if (type.toString().equals(dictDO.getValue())) {
			dictDO.setRemarks("checked");
		}
		}*/
		model.addAttribute("sexdic",dictDOS);
		model.addAttribute("form",form);
		return"oa/form/userEdit";
	}

	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("oa:form:add")
	public R save(OaForm form) {
		if (oaFormService.save(form) > 0) {
			return R.ok();
		}
		return R.error();
	}

	@ResponseBody
	@PostMapping("/userSave")
	@RequiresPermissions("oa:form:userAdd")
	public R userSave(OaForm form) {
		UserDO obj=(UserDO)SecurityUtils.getSubject().getPrincipal();
		form.setUser_id(obj.getUserId());
		UserDO userDO=userService.getByUsername(form.getDoctor_name());
		sendMsg.sendMessage(company,"Submission succeed",obj.getEmail());
		sendMsg.sendMessage(company,"You have a new evaluation to be done",userDO.getEmail());

		if (oaFormService.save(form) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("oa:form:edit")
	public R update(OaForm form) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "The demo system is not allowed to be modified, please deploy the program for the complete experience");
		}
		oaFormService.update(form);
		return R.ok();
	}


	@ResponseBody
	@RequestMapping("/userUpdate")
	@RequiresPermissions("oa:form:userEdit")
	public R userUpdate(OaForm form) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "The demo system is not allowed to be modified, please deploy the program for the complete experience");
		}
		oaFormService.update(form);

		return R.ok();
	}


	@PostMapping("/remove")
	@ResponseBody
	@RequiresPermissions("oa:form:remove")
	public R remove(Long id) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "The demo system is not allowed to be modified, please deploy the program for the complete experience");
		}
		if (oaFormService.remove(id) > 0) {
			return R.ok();
		}
		return R.error();
	}


	@PostMapping("/batchRemove")
	@ResponseBody
	@RequiresPermissions("oa:form:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids) {
		if (Constant.DEMO_ACCOUNT.equals(getUsername())) {
			return R.error(1, "The demo system is not allowed to be modified, please deploy the program for the complete experience");
		}
		formService.batchRemove(ids);
		return R.ok();
	}



}
