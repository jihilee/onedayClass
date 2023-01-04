package cls.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cls.model.ClsBean;
import cls.model.ClsDao;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
@ComponentScan({"cls.*","review.*"})
public class GuestClsDetailController {
	private final String command = "GuestClsDetail.cls";
	private String getPage = "/guestClsDetail";
	
	@Autowired ClsDao clsDao;
	
	@Autowired ReviewDao reviewDao;
	
	@Autowired ServletContext config;
	
	@RequestMapping(command)
	public String clsMain(@RequestParam("cnum") String cnum,
					Model model, HttpServletRequest request) {
		
		List<ClsBean> clsLists = new ArrayList<ClsBean>();
		clsLists = clsDao.getClsList();
		
		ClsBean cb = clsDao.getClsByNum(cnum);
		
		List<ReviewBean> reviewLists = new ArrayList<ReviewBean>();
		reviewLists = reviewDao.getAllReviewByCls(cb.getCname());
		
		model.addAttribute("clsLists",clsLists);
		model.addAttribute("cb",cb);
		model.addAttribute("reviewLists",reviewLists);
		
		return getPage;
	}
}
