package cate.controller;

import java.io.File;
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
public class AdminScateUpdateController {
	
	
	private final String command = "adminScateUpdate.cate";
	private String getPage = "/adminScateUpdate";
	
	private final String checkScate= "checkScate.cate";
	
	private String gotoList = "redirect:/adminScateList.cate";
	
	@Autowired ScateDao scateDao;
	
	@Autowired CateDao cateDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String scateupdate(@RequestParam() String scatenum, 
							@RequestParam() String pageNumber, 
							Model model) {
		System.out.println("update scate : "+scatenum);
		
		//get scate bean by num
		ScateBean scateBean = scateDao.getScateByNum(scatenum);
		
		//get bcate list weile select
		List<CateBean> cateList = new ArrayList<CateBean>();
		cateList = cateDao.getCateList();
		
		model.addAttribute("scateBean",scateBean);
		model.addAttribute("cateList",cateList);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cateupdate(@Valid ScateBean scateBean, BindingResult result, 
							@RequestParam("pageNumber") String pageNumber, 				
							Model model) {
	
		System.out.println(scateBean.getBcate()+"/"+scateBean.getScate()+"/"+scateBean.getScatenum());
		
		scateDao.updateScate(scateBean);
		
		model.addAttribute("pageNumber",pageNumber);
		return gotoList;
	}
	
	@RequestMapping(value=checkScate,method=RequestMethod.GET)
	@ResponseBody
	public String checkScate(@RequestParam("scate") String scate) {
		
		System.out.println(scate);
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
