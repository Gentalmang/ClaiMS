package com.bootdo.oaForm.controller;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.oaForm.domain.OaForm;
import com.bootdo.oaForm.domain.OaFormSet;
import com.bootdo.oaForm.service.OaFormService;
import com.bootdo.oaForm.service.OaFormSetService;
import com.bootdo.system.SendMsg;
import com.bootdo.system.domain.UserDO;
import com.bootdo.system.service.MenuService;
import com.bootdo.system.service.UserService;
import lombok.AllArgsConstructor;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
public class DoctorController {
    private OaFormService oaFormService;

    private OaFormSetService oaFormSetService;

    private MenuService menuService;

    private UserService userService;

    private SendMsg sendMsg;


    /**
     * 路由至医生页面
     * @return
     */
    @RequestMapping("oa/doctor/doctor")
    @RequiresPermissions("oa:doctor:doctor")
    public String toDoctorPage(){
        return "oa/doctor/doctor";
    }

    @RequestMapping("oa/doctor/doctorEdit/{id}")
    @RequiresPermissions("oa:doctor:doctorEdit")
    public String toDoctorEditPage(@PathVariable("id") Long id, Model model) {
        OaForm form = oaFormService.get(id);
        model.addAttribute("form", form);
        if(form!=null){
            if(form.getJob()!=null&&form.getJob()!=""){
                OaFormSet set =oaFormSetService.getOne(Long.valueOf(form.getJob()));
                model.addAttribute("set",set);
            }
        }
        return "oa/doctor/doctorEdit";
    }

    @ResponseBody
    @GetMapping("oa/doctor/list")
    @RequiresPermissions("oa:doctor:doctorEdit")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        UserDO obj=(UserDO) SecurityUtils.getSubject().getPrincipal();
        params.put("doctor_name",obj.getUsername());
        List<OaForm> formList = oaFormService.list(params);
        int total = formList.size();
        PageUtils pageUtils = new PageUtils(formList, total);
        return pageUtils;
    }


    @ResponseBody
    @RequestMapping("oa/doctor/update")
    @RequiresPermissions("oa:doctor:doctorEdit")
    public R update(OaForm form) {
        OaForm ent =oaFormService.get(form.getId());
        UserDO userDO=userService.get(ent.getUser_id());
        if(
                form.getIs_body()==null||form.getIs_color()==null||
                        form.getIs_hearing()==null||form.getIs_limb()==null||
                        form.getIs_version()==null||form.getIs_strength()==null
        ){
            form.setIs_use(0);
            form.setStatus(4);
            if(userDO!=null){
                if(userDO.getEmail()!=null){
                    sendMsg.sendMessage("ClaiMS","Payment Approved",userDO.getEmail());
                }
            }
        }else{
            if(
                    form.getIs_body()==1&&form.getIs_color()==1&&
                            form.getIs_hearing()==1&&form.getIs_limb()==1&&
                            form.getIs_version()==1&&form.getIs_strength()==1
            ){
                form.setStatus(5);
                form.setIs_use(1);
                if(userDO!=null){
                    if(userDO.getEmail()!=null){
                        sendMsg.sendMessage("ClaiMS","Payment Declined",userDO.getEmail());
                    }
                }
            }else{
                form.setStatus(4);
                form.setIs_use(0);

                if(userDO!=null){
                    if(userDO.getEmail()!=null){
                        sendMsg.sendMessage("ClaiMS","Payment Approved",userDO.getEmail());
                    }
                }
            }
        }

        oaFormService.update(form);


        return R.ok();
    }


    @RequestMapping("oa/doctor/getUserByPermission/{permission}")
    @ResponseBody
    @RequiresPermissions("oa:form:userAdd")
    public List<UserDO> getUserByPermission(@PathVariable("permission") String permission){
        //先获取所有用户信息
        List<UserDO> sysUserList = userService.list();
        List<UserDO> list= sysUserList.stream().map(
               userDO -> {
                   Set<String> perms = menuService.listPerms(userDO.getUserId());
                   if(perms.contains(permission)){
                       return userDO;
                   }
                   return null;
               }
        ).filter(userDO -> userDO!=null).collect(Collectors.toList());
//        list.stream();
        return list;
    }
}
