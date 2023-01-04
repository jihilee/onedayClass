package cate.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cate.model.CateBean;
import cate.model.CateDao;

@Controller
public class AdminCateInsertController {
	
	private final String command = "adminClsCateInsert.cate";
	private String getCateInsert = "/adminClsCateInsert";
	
	private final String checkBcatedul= "checkBcatedul.cate";
	
	private String gotoList = "redirect:/adminClsCateList.cate";
	
	
	@Autowired CateDao cateDao;

	@Autowired ServletContext config;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String cateinsert() {
		return getCateInsert;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cateinsert(@Valid CateBean cateBean, BindingResult result, 
							Model model) throws IllegalStateException, IOException {
	
		System.out.println(cateBean.getBcate()+"/"+cateBean.getBcateimg()+"/"+cateBean.getBcatenum());
		
		MultipartFile mf = cateBean.getUpload();
		String img = mf.getOriginalFilename();
		String url = config.getRealPath("resources/cateImage/");
		File file = new File(url+img);
		mf.transferTo(file);
		
		cateDao.insertBcate(cateBean);
		
		return gotoList;
	}

	@RequestMapping(value=checkBcatedul,method=RequestMethod.GET)
	@ResponseBody
	public String checkBcatedul(@RequestParam("bcate") String bcate) {
		
		String check = "";
		
		int cnt = cateDao.checkBcate(bcate);
		if(cnt > 0) {
			check = "N";
		}
		else {
			check = "Y";
		}
		return check;
	}
}
