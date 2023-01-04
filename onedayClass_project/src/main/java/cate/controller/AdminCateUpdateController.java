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
public class AdminCateUpdateController {
	
	private final String command = "adminClsCateUpdate.cate";
	private String getPage = "/adminClsCateUpdate";
	
	private final String checkBcate = "checkBcate.cate";
	
	private String gotoList = "redirect:/adminClsCateList.cate";
	
	@Autowired CateDao cateDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String cateupdate(@RequestParam("bcatenum") String bcatenum, 
							Model model) {
		
		System.out.println(bcatenum);
		CateBean cateBean = cateDao.getCateByNum(bcatenum);
		
		model.addAttribute("cateBean",cateBean);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String cateupdate(@Valid CateBean cateBean, BindingResult result, 
							@RequestParam(required=false) String gu_bcateimg,
							Model model) throws IllegalStateException, IOException {
	
		System.out.println(cateBean.getBcate()+"/"+cateBean.getBcateimg()+"/"+cateBean.getBcatenum());
		System.out.println("gu_bcateimg : "+gu_bcateimg);
		
		MultipartFile mf = cateBean.getUpload();
		String img = mf.getOriginalFilename();
		String url = config.getRealPath("resources/cateImage/");
		File file = new File(url+img);
		mf.transferTo(file);
		
		cateDao.updateBcate(cateBean);
		
		
		File fileDel = new File(url+gu_bcateimg);
		if(fileDel.exists()) {
			fileDel.delete();
		}
		
		return gotoList;
	}
	
	@RequestMapping(value=checkBcate,method=RequestMethod.GET)
	@ResponseBody
	public String checkBcate(@RequestParam("bcate") String bcate) {
		
		System.out.println(bcate);
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

