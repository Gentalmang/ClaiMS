package com.bootdo.oaForm.service;

import com.bootdo.oaForm.domain.OaFormSet;

import java.util.List;

public interface OaFormSetService {
    List<OaFormSet> getJobType();

    OaFormSet getOne(Long id);
}
