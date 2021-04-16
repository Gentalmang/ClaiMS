package com.bootdo.oaForm.service.impl;

import com.bootdo.oaForm.dao.OaFormSetMapper;
import com.bootdo.oaForm.domain.OaFormSet;
import com.bootdo.oaForm.service.OaFormSetService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OaFormSetServiceImpl implements OaFormSetService {

    private OaFormSetMapper oaFormSetMapper;
    @Override
    public List<OaFormSet> getJobType() {
        return oaFormSetMapper.getJobType();
    }

    @Override
    public OaFormSet getOne(Long id) {
        return oaFormSetMapper.getOne(id);
    }
}
