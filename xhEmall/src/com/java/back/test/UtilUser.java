package com.java.back.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xh.back.bean.Xhadmin;
import com.xh.back.serviceImpl.AdminServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class UtilUser {
	//查找admin信息测试
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl adminService;
	@Test
	public void test(){
		Xhadmin admin = new Xhadmin();
		admin.setAdminname("admin");
		admin = adminService.selectAdminByName(admin);
		System.out.println("----------------------------------");
		System.out.println(admin);
	}
	
	@Test
	public void test2(){
		Xhadmin admin = new Xhadmin();
		admin.setAdminname("admin");
		admin.setAdminpassword("admin");
		admin.setAdminlastip("123456798");
		admin.setAdminlasttime(new Date());
		adminService.updateAdminIpAndTime(admin);
	}
	
}
