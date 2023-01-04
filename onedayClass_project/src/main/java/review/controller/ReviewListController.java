package review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import review.model.ReviewBean;
import review.model.ReviewDao;

@Controller
public class ReviewListController {
	
	private final String command = "myReviewList.rv";
	private String getPage = "/myReviewList";
	
	private final String delete = "deleteMyReview.rv";
	
	@Autowired
	ReviewDao reviewDao;
	
	
	@RequestMapping(command)
	public String list(Model model,HttpServletRequest request, HttpSession session) {
	
		MemberBean mem = (MemberBean)session.getAttribute("loginInfo");
		List<ReviewBean> reviewLists = new ArrayList<ReviewBean>();
		reviewLists = reviewDao.getAllReviewById(mem.getId());
		
		model.addAttribute("reviewLists",reviewLists);
		return getPage;
	}
	
	@RequestMapping(delete)
	public String delete(Model model,@RequestParam("rnum") String rnum) {
		
		reviewDao.deleteReview(rnum);
		return "redirect:/"+command;
	}
}
