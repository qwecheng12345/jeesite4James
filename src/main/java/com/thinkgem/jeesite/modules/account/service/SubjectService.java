/**
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.thinkgem.jeesite.modules.account.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.account.dao.SubjectDao;

/**
 * Subject Service
 * @author James
 * @version 2013-11-14
 */
@Service
@Transactional(readOnly = true)
public class SubjectService extends BaseService {

	@Autowired
	private SubjectDao subjectDao;
}
