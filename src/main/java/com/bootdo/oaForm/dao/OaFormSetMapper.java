package com.bootdo.oaForm.dao;


import com.bootdo.oaForm.domain.OaFormSet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OaFormSetMapper {
    List<OaFormSet> getJobType();
    OaFormSet getOne(Long id);
}
