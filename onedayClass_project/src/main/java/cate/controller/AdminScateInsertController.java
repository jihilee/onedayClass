package cate.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cate.model.CateBean;
import cate.model.CateDao;
import cate.model.ScateBean;
import cate.model.ScateDao;

@Controller
@ComponentScan({"cate.*"})
public class AdminScateInsertController {
	
	private final String command = "adminScateInsert.cate";
	private String getScateInsert = "/adminScateInsert";
	
	private final String checkScatedul= "checkScatedul.cate";
	
	private String gotoList = "redirect:/adminScateList.cate";
	
	@Autowired ScateDao scateDao;
	
	@Autowired CateDao cateDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String scateinsert(Model model) {

		//get bcate list weile select
		List<CateBean> cateList = new ArrayList<CateBean>();
		cateList = cateDao.getCateList();
		
		model.addAttribute("cateList",cateList);
		return getScateInsert;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cateinsert(@Valid ScateBean scateBean, BindingResult result, 
							Model model)  {
	
		System.out.println(scateBean.getBcate()+"/"+scateBean.getScate());
		
		//insert
		scateDao.insertScate(scateBean);
		
		return gotoList;
	}
	
	@RequestMapping(value=checkScatedul,method=RequestMethod.GET)
	@ResponseBody
	public String checkScatedul(@RequestParam("scate") String scate) {
		
		String check = "";
		
		int cnt = scateDao.checkScate(scate);
		if(cnt > 0) {
			check = "N";
		}
		else {
			check = "Y";
		}
		return check;
	}
}
