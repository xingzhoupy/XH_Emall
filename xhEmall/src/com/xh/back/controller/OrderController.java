package com.xh.back.controller;


import java.io.File;
import java.io.IOException;
import java.security.Provider.Service;
import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.other.getImage.FileUtil;
import com.other.getip.GetIp;
import com.other.msg.Msg;
import com.xh.back.bean.OrderArea;
import com.xh.back.bean.OrderCity;
import com.xh.back.bean.OrderProvince;
import com.xh.back.bean.Xhbrand;
import com.xh.back.bean.Xhorderinfo;
import com.xh.back.service.OrderService;
import com.xh.back.service.XhUserService;
import com.xh.front.bean.Xhusers;
import com.xh.front.bean.XhusersBean;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	@RequestMapping("queryAllOrderController.action")
	public String queryAllOrderController(Model model){
        List<Xhorderinfo> order = orderService.queryAllUsersOreder();		
		model.addAttribute("order", order);
		//返回到查询JSP
		return "/jsp/back/order/queryOrders.jsp";
	}
	
	@ResponseBody
	@RequestMapping("queryOrderByIdForDetail")
	public Xhorderinfo queryOrderByIdForDetail(int id){
		Xhorderinfo order =orderService.queryOrderById(id);
		System.out.println(order);
		return order;
	}
		
	@RequestMapping("addOrder.action")
	public String addOrder(Xhorderinfo order,HttpServletRequest request,HttpSession session){
		order.setOrdertime(new Date());
		order.setPaytime(new Date());
		orderService.addOrder(order);
		return "/order/queryAllOrderController.action";
	}
	
	@RequestMapping("deleteOrder.action")
	public String deleteOrder(int id){
		//通过ID
		orderService.deleteOrderById(id);
		return "/order/queryAllOrderController.action";
	}
	
	
	@RequestMapping("updateOrder.action")
	public String updateOrder(Xhorderinfo order){
		//通过ID
		order.setOrdertime(new Date());
		order.setPaytime(new Date());
		orderService.modifyOrderById(order);
		return "/order/queryAllOrderController.action";
	}
	
	//获取省份、城市、地区
	//获取省份
	@RequestMapping("getProvincelist.action")
	@ResponseBody
	public Msg getProvincelist(Model model){
		List<OrderProvince> provincelist=orderService.getAllProvince();
		if(provincelist!=null){
			return Msg.success().add("provincelist", provincelist);
		}
		return Msg.fail();
	}	
	
	//根据省份id获取城市数据后直接使用@ResponseBody装成json数据
	@RequestMapping("getCityByProvinceId.action")
    @ResponseBody
	public Msg getCityByProvinceId(String id){
	    List<OrderCity> citylist = orderService.getCityByProvinceId(id);
	    if (citylist!=null){
	    	return Msg.success().add("citylist", citylist);
	    } else {
	    	return Msg.fail();
	    }
	}
	  
    //根据城市id获取区域数据后直接使用@ResponseBody装成json数据
    @RequestMapping("getAreaByCityId.action")
    @ResponseBody
    public Msg getAreaByCityId(String id){
        List<OrderArea> arealist = orderService.getAreaByCityId(id);
        if (arealist!=null){
        	return Msg.success().add("arealist", arealist);
        } else {
        	return Msg.fail();
        }
    } 
	
	
}