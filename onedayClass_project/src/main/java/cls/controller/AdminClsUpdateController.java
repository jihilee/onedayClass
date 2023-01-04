package cls.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cate.model.CateBean;
import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
public class AdminClsUpdateController {
	
	private final String command = "adminClsUpdate.cls";
	private String getPage = "/adminClsUpdate";
	
	private String gotoList = "redirect:/adminClsList.cls";
	
	@Autowired ServletContext config;
	
	@Autowired ClsDao clsDao;
	
	@RequestMapping(command)
	public String clsUpdate(@RequestParam("cnum") String cnum,
            Model model, HttpServletRequest request) {
		
		ClsBean cb = new ClsBean();
		cb = clsDao.getClsByNum(cnum);
		
		model.addAttribute("cb",cb);
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String clsUpdate(@Valid ClsBean cb, BindingResult result, 
			@RequestParam(required=false) String gu_cimage1,
			@RequestParam(required=false) String gu_cimage2,
			@RequestParam(required=false) String gu_cimage3,
			Model model) throws IllegalStateException, IOException {

		
		System.out.println(gu_cimage1);
		System.out.println(gu_cimage2);
		System.out.println(gu_cimage3);

		String url = config.getRealPath("resources/clsimage/");
		
		//update
		MultipartFile mf1 = cb.getUpload1();
		MultipartFile mf2 = cb.getUpload2();
		MultipartFile mf3 = cb.getUpload3();
		
		String img1 = mf1.getOriginalFilename();
		String img2 = mf2.getOriginalFilename();
		String img3 = mf3.getOriginalFilename();
		
		File file1 = new File(url+img1);
		File file2 = new File(url+img2);
		File file3 = new File(url+img3);
		
		mf1.transferTo(file1);
		mf2.transferTo(file2);
		mf3.transferTo(file3);
		
		clsDao.updateCls(cb);
		
		//delete
		File fileDel1 = new File(url+gu_cimage1);
		File fileDel2 = new File(url+gu_cimage2);
		File fileDel3 = new File(url+gu_cimage3);
		if(fileDel1.exists()) {
			fileDel1.delete();
		}
		if(fileDel2.exists()) {
			fileDel2.delete();
		}
		if(fileDel3.exists()) {
			fileDel3.delete();
		}
		return gotoList;
	}

	
}
