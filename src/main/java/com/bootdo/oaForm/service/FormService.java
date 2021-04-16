package com.bootdo.oaForm.service;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.oaForm.domain.FormDO;

import java.util.List;
import java.util.Map;

/**
 * 通知通告
 *
 *
 * @author Bowen SU
 * @email asgrrem98@gmail.com
 * @date 2 March 2021
 */
public interface FormService {

	FormDO get(Long id);

	List<FormDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(FormDO form);

	int update(FormDO form);

	int remove(Long id);

	int batchRemove(Long[] ids);

//	Map<String, Object> message(Long userId);

	PageUtils selfList(Map<String, Object> map);
}
