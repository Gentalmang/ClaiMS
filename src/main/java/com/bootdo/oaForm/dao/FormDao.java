package com.bootdo.oaForm.dao;

import com.bootdo.oaForm.domain.FormDO;
import com.bootdo.oaForm.domain.FormDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * 通知通告
 *
 * @author Bowen SU
 * @email asgrrem98@gmail.com
 * @date 2 March 2021
 */
@Mapper
public interface FormDao {

	FormDO get(Long id);

	List<FormDO> list(Map<String, Object> map);

	int count(Map<String, Object> map);

	int save(FormDO form);

	int update(FormDO form);

	int remove(Long id);

	int batchRemove(Long[] ids);

	List<FormDO> listByIds(Long[] ids);

	int countDTO(Map<String, Object> map);

	List<FormDTO> listDTO(Map<String, Object> map);
}
