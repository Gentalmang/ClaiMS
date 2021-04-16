package com.bootdo.oaForm.service;


import com.bootdo.oaForm.domain.OaForm;

import java.util.List;
import java.util.Map;

/**
 * @author Bowen Su
 */
public interface OaFormService {

	public int save(OaForm form);

	public OaForm get(Long id);

	public int  update(OaForm form);

	public int  remove(Long id);

	public List<OaForm> list(Map<String, Object> map);

}
