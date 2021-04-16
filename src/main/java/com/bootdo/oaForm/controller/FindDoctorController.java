package com.bootdo.oaForm.controller;

import com.bootdo.common.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 *
 *
 * @author Bowen SU
 * @email asgrrem98@gmail.com
 * @date 2 March 2021
 */

@Controller
@RequestMapping("/oa/findDoctor")
public class FindDoctorController extends BaseController {

	@GetMapping()
	@RequiresPermissions("oa:findDoctor:findDoctor")
	String oaFindDoctor() {
		return "oa/form/findDoctor";
	}


}
