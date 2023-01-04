package cls.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
public class AdminClsListController {

	private final String command = "adminClsList.cls";
	private String getPage = "/adminClsList";
	
	private final String command2 = "adminClsDelete.cls";
	
	@Autowired ClsDao clsDao;
	
	@Autowired ServletContext config;

	@RequestMapping(command)
	public String clsList(
            Model model, HttpServletRequest request) {
		
		int totalCount = clsDao.getClsListTotalCount();
		
		List<ClsBean> clsLists = new ArrayList<ClsBean>();
		clsLists = clsDao.getClsList();
		
		model.addAttribute("clsLists",clsLists);
		model.addAttribute("totalCount",totalCount);
		return getPage;
	}
	
	@RequestMapping(command2)
	public String clsDelete(@RequestParam("cnum") String cnum,
            Model model, HttpServletRequest request) {
		
		ClsBean cb = clsDao.getClsByNum(cnum);
		
		String url = config.getRealPath("resources/clsimage/"); 
		
		File fileDel1 = new File(url+cb.getCimage1());
		File fileDel2 = new File(url+cb.getCimage2());
		File fileDel3 = new File(url+cb.getCimage3());
		if(fileDel1.exists()) {
			fileDel1.delete();
		}
		if(fileDel2.exists()) {
			fileDel2.delete();
		}
		if(fileDel3.exists()) {
			fileDel3.delete();
		}
		
		clsDao.deleteCls(cnum);
		
		return "redirect:/"+command;
	}
	
}
