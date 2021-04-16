package com.bootdo.oaForm.service.impl;

import com.bootdo.common.utils.DateUtils;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.oaForm.dao.FormDao;
import com.bootdo.oaForm.domain.FormDO;
import com.bootdo.oaForm.domain.FormDTO;
import com.bootdo.oaForm.service.FormService;
import com.bootdo.system.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class FormServiceImpl implements FormService {
    @Autowired
    private FormDao formDao;
    /*@Autowired
    private FormRecordDao recordDao;*/
    @Autowired
    private UserDao userDao;
/*    @Autowired
    private DictService dictService;
    @Autowired
    private SessionService sessionService;
    @Autowired
    private SimpMessagingTemplate template;*/

    @Override
    public FormDO get(Long id) {
        FormDO rDO = formDao.get(id);
        return rDO;
    }

    /*@Override
    public List<FormDO> list(Map<String, Object> map) {
        List<FormDO> forms = formDao.list(map);
        return forms;
    }*/


    @Override
    public List<FormDO> list(Map<String, Object> map) {
        return null;
    }

    @Override
    public int count(Map<String, Object> map) {
        return formDao.count(map);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public int save(FormDO form) {
        /*form.setUpdateDate(new Date());*/
        int r = formDao.save(form);
        // 保存到接受者列表中
        /*Long[] userIds = form.getUserIds();
        Long formId = form.getId();
        List<FormRecordDO> records = new ArrayList<>();
        for (Long userId : userIds) {
            FormRecordDO record = new FormRecordDO();
            record.setFormId(formId);
            record.setUserId(userId);
            record.setIsRead(0);
            records.add(record);
        }
        recordDao.batchSave(records);*/
        //给在线用户发送通知
        /*ThreadPoolExecutor executor = new ThreadPoolExecutor(1,1,0, TimeUnit.MILLISECONDS,new LinkedBlockingDeque<>());
        executor.execute(new Runnable() {
            @Override
            public void run() {
                for (UserDO userDO : sessionService.listOnlineUser()) {
                    for (Long userId : userIds) {
                        if (userId.equals(userDO.getUserId())) {
                            template.convertAndSendToUser(userDO.toString(), "/queue/notifications", "新消息：" + form.getTitle());
                        }
                    }
                }
            }
        });
        executor.shutdown();*/
        return r;
    }

    @Override
    public int update(FormDO form) {
        return formDao.update(form);
    }

    @Transactional
    @Override
    public int remove(Long id) {
        return formDao.remove(id);
    }

    @Transactional
    @Override
    public int batchRemove(Long[] ids) {
        return formDao.batchRemove(ids);
    }


    @Override
    public PageUtils selfList(Map<String, Object> map) {
        List<FormDTO> rows = formDao.listDTO(map);
        /*for (FormDTO formDTO : rows) {
            formDTO.setBefore(DateUtils.getTimeBefore(formDTO.getUpdateDate()));
            formDTO.setSender(userDao.get(formDTO.getCreateBy()).getName());
        }*/
        PageUtils page = new PageUtils(rows, formDao.countDTO(map));
        return page;
    }

}
