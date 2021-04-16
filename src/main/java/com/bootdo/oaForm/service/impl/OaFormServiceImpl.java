package com.bootdo.oaForm.service.impl;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.oaForm.dao.FormDao;
import com.bootdo.oaForm.dao.OaFormMapper;
import com.bootdo.oaForm.domain.FormDO;
import com.bootdo.oaForm.domain.FormDTO;
import com.bootdo.oaForm.domain.OaForm;
import com.bootdo.oaForm.service.FormService;
import com.bootdo.oaForm.service.OaFormService;
import com.bootdo.system.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
@Service
public class OaFormServiceImpl implements OaFormService {
    @Autowired
    private OaFormMapper oaFormMapper;

    @Override
    public int save(OaForm form) {
        return oaFormMapper.insertSelective(form);
    }

    @Override
    public OaForm get(Long id) {
        OaForm rDO = oaFormMapper.selectByPrimaryKey(id);
        return rDO;
    }

    @Override
    public int update(OaForm form) {
        return oaFormMapper.updateByPrimaryKeySelective(form);
    }

    @Override
    public int remove(Long id) {
        return oaFormMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<OaForm> list(Map<String, Object> map) {
        return oaFormMapper.selectOaFormByMap(map);
    }

}
