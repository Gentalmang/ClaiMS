package com.bootdo.oaForm.controller;


import com.bootdo.oaForm.domain.OaFormSet;
import com.bootdo.oaForm.service.OaFormSetService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/claim")
@AllArgsConstructor
public class ClaimController {
    private OaFormSetService oaFormSetService;

    @RequestMapping("/list/jobType")
    @ResponseBody
    public List<OaFormSet> getJobType(){
        List<OaFormSet> list =oaFormSetService.getJobType();
        return list;
    }
}
