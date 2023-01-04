package cls.controller;

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
import org.springframework.web.multipart.MultipartFile;

import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
public class AdminClsInsertController {

	private final String command = "adminClsInsert.cls";
	private String getPage = "/adminClsInsert";
	
	private String gotoList = "redirect:/adminClsList.cls";
	
	@Autowired ClsDao clsDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(command)
	public String insert() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String insert(@Valid ClsBean cb, BindingResult result, Model model) throws IllegalStateException, IOException {
		
		MultipartFile mf1 = cb.getUpload1();
		MultipartFile mf2 = cb.getUpload2();
		MultipartFile mf3 = cb.getUpload3();
		
		String cimage1 = mf1.getOriginalFilename();
		String cimage2  = mf2.getOriginalFilename();
		String cimage3  = mf3.getOriginalFilename();
		String url = config.getRealPath("resources/clsimage/");
		File file1 = new File(url+cimage1);
		File file2 = new File(url+cimage2);
		File file3 = new File(url+cimage3);
		mf1.transferTo(file1);
		mf2.transferTo(file2);
		mf3.transferTo(file3);
		
		clsDao.insertCls(cb);
		
		return gotoList;
	}
	
}
