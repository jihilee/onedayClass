package cls.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cls.model.ClsBean;
import cls.model.ClsDao;

@Controller
public class GuestClsMainController {
	private final String command = "GuestClsMain.cls";
	private String getPage = "/guestClsMain";
	
	@Autowired ClsDao clsDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(command)
	public String clsMain(Model model, HttpServletRequest request) {
		
		List<ClsBean> clsLists = new ArrayList<ClsBean>();
		clsLists = clsDao.getClsList();
		
		model.addAttribute("clsLists",clsLists);
		
		return getPage;
	}
	
}
