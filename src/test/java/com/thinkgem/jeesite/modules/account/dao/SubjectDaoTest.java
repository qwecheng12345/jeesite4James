package com.thinkgem.jeesite.modules.account.dao;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.thinkgem.jeesite.common.test.SpringTransactionalContextTests;
import com.thinkgem.jeesite.modules.account.entity.Subject;
import com.thinkgem.jeesite.modules.sys.utils.AccountUtils;

/**
 * SubjectDaoTest
 * @author James
 * @version 2013-11-15
 */
public class SubjectDaoTest extends SpringTransactionalContextTests {

	@Autowired
	private SubjectDao subjectDao;
	
	@Test
	public void testSaveS() {
		Subject subject = new Subject(2L);
		subject.setName("subject1");
		subject.setParent(subjectDao.findOne(1L));
		subjectDao.save(subject);
	}

	@Test
	public void testSaveIterableOfS() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindOne() {
		Subject subject = subjectDao.findOne(1L);
		Assert.assertEquals(new Long(2), subject.getId());
	}

	@Test
	public void testExists() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() {
		List<Subject> subjects = AccountUtils.getSubjectList();
		System.out.println(subjects.size());
	}

	@Test
	public void testFindAllIterableOfID() {
		fail("Not yet implemented");
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteID() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteT() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteIterableOfQextendsT() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteAll() {
		fail("Not yet implemented");
	}

}
