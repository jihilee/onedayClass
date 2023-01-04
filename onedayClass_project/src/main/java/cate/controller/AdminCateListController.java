package cate.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cate.model.CateBean;
import cate.model.CateDao;
import cate.model.ScateDao;

@Controller
@ComponentScan({"cate.*"})
public class AdminCateListController {
	private final String cateList = "adminClsCateList.cate";
	private String getcateList = "/adminClsCateList";
	
	private final String cateDelete = "adminClsCateDelete.cate";
	
	@Autowired CateDao cateDao;
	
	@Autowired ScateDao scateDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(cateList)
	public String clsCate(Model model) {
		
		List<CateBean> cateList = new ArrayList<CateBean>();
		
		int totalCount = cateDao.getCateListTotalCount();
		
		cateList = cateDao.getCateList();
		System.out.println(cateList.size());
		
		model.addAttribute("cateList",cateList);
		model.addAttribute("totalCount",totalCount);
		return getcateList;
	}
	
	@RequestMapping(cateDelete)
	public String clsCatedelete(@RequestParam(value="bcatenum", required=false) int bcatenum,
							@RequestParam(value="bcateimg", required=false) String bcateimg,
							@RequestParam(value="bcate", required=false) String bcate,
							Model model) {
		
		System.out.println(bcateimg);
		System.out.println(bcatenum);
		System.out.println(bcate);
		CateBean cb = new CateBean(bcatenum,bcate,bcateimg);
		
		String url = config.getRealPath("resources/cateImage/")+bcateimg;
		File fileDel = new File(url);
		fileDel.delete();
		
		scateDao.deleteFrgCate(bcate); //small cate delete
		cateDao.deleteCate(bcatenum);
		
		return "redirect:/"+cateList;
	}
	
}
