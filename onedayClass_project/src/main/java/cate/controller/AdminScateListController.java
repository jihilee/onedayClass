package cate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cate.model.CateBean;
import cate.model.ScateBean;
import cate.model.ScateDao;
import utility.Paging;

@Controller
public class AdminScateListController {
	
	private final String command = "adminScateList.cate";
	private String getPage = "/adminScateList";
	
	private final String scateDelete = "adminScateDelete.cate";
	
	@Autowired ScateDao scateDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(command)
	public String clsCate(@RequestParam(value="keyword", required=false) String keyword,
            @RequestParam(value="whatColumn", required=false) String whatColumn,
            @RequestParam(value="pageNumber", required=false) String pageNumber,
            Model model, HttpServletRequest request) {
		
		System.out.println("keyword/whatColunm : " + keyword +"/"+ whatColumn);
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("whatColumn", whatColumn);
		
		int totalCount = scateDao.getScateListTotalCount(map);
		System.out.println("totalcount : " + totalCount);
		String url = request.getContextPath() + "/" + command;
		System.out.println("url : " + url);
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<ScateBean> scateList = new ArrayList<ScateBean>();

		scateList = scateDao.getScateList(map,pageInfo);
		System.out.println(scateList.size());
		
		model.addAttribute("scateList",scateList);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(scateDelete)
	public String scateDelete(@RequestParam(value="scatenum") int scatenum,
							@RequestParam(value="pageNumber", required=false) String pageNumber,
							Model model) {
		
		System.out.println("scatenum : " + scatenum);
		System.out.println("pageNumber : " + pageNumber);
		
		scateDao.deleteScate(scatenum);
		
		model.addAttribute("pageNumber",pageNumber);
		return "redirect:/"+command;
	}
}
