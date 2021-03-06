/*
 * Powered By chanjetpay-code-generator
 * Web Site: http://www.chanjetpay.com
 * Since 2014 - 2015
 */

package com.rkylin.settle.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.rkylin.settle.dao.SettleBatchManageDao;
import com.rkylin.settle.manager.SettleBatchManageManager;
import com.rkylin.settle.pojo.SettleBatchManage;
import com.rkylin.settle.pojo.SettleBatchManageQuery;

@Component("settleBatchManageManager")
public class SettleBatchManageManagerImpl implements SettleBatchManageManager {
	
	@Autowired
	@Qualifier("settleBatchManageDao")
	private SettleBatchManageDao settleBatchManageDao;
	
	@Override
	public void saveSettleBatchManage(SettleBatchManage settleBatchManage) {
		if (settleBatchManage.getBatchId() == null) {
			settleBatchManageDao.insertSelective(settleBatchManage);
		} else {
			settleBatchManageDao.updateByPrimaryKeySelective(settleBatchManage);
		}
	}
	
	@Override
	public SettleBatchManage findSettleBatchManageById(Long id) {
		return settleBatchManageDao.selectByPrimaryKey(id);
	}
	
	@Override
	public List<SettleBatchManage> queryList(SettleBatchManageQuery query) {
		return settleBatchManageDao.selectByExample(query);
	}
	
	@Override
	public void deleteSettleBatchManageById(Long id) {
		settleBatchManageDao.deleteByPrimaryKey(id);
	}
	
	@Override
	public void deleteSettleBatchManage(SettleBatchManageQuery query) {
		settleBatchManageDao.deleteByExample(query);
	}
}

