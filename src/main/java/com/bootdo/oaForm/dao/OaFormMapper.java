package com.bootdo.oaForm.dao;


import com.bootdo.oaForm.domain.OaForm;

import java.util.List;
import java.util.Map;

public interface OaFormMapper {
    /**
     *  ...
     * @param id
     * @return 
     */
    int deleteByPrimaryKey(Long id);

    /**
     *  ...
     * @param record
     * @return 
     */
    int insert(OaForm record);

    /**
     *  ...
     * @param record
     * @return 
     */
    int insertSelective(OaForm record);

    /**
     *  根据主键查询记录
     * @param id 主键
     * @return 
     */
    OaForm selectByPrimaryKey(Long id);

    /**
     *  ...
     * @param record
     * @return 
     */
    int updateByPrimaryKeySelective(OaForm record);

    /**
     *  ...
     * @param record
     * @return 
     */
    int updateByPrimaryKey(OaForm record);

    /**
     * ...
     * @param map
     * @return
     */
    List<OaForm> selectOaFormByMap(Map map);
}