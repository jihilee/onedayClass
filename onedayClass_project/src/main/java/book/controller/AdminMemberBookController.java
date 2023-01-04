package book.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import book.model.BookBean;
import book.model.BookDao;
import utility.Paging;

@Controller
public class AdminMemberBookController {

	private final String command = "adminBookList.bk"; 
	private String getPage = "/AdminMemberBookList";
	
	private final String bCheck = "updateBcheck.bk"; 
	
	@Autowired BookDao bookDao;

	@RequestMapping(command)
	public String list(Model model, HttpServletRequest request,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("whatColumn", whatColumn);
		System.out.println("keyword:"+keyword);
		System.out.println("whatColumn:"+whatColumn);
		
		int totalCount =  bookDao.getTotalBookList(map);
		String url = request.getContextPath()+"/"+command;
		Paging pageInfo = new Paging(pageNumber,"10",totalCount,url, whatColumn,keyword,null);
		
		System.out.println("url:"+url);
		System.out.println("pageInfo:"+pageInfo);
		System.out.println("totalCount:"+totalCount);
		
		List<BookBean> blist =  new ArrayList<BookBean>();
		blist = bookDao.getBookList(map, pageInfo);
		
		model.addAttribute("blist",blist);
		model.addAttribute("pageInfo",pageInfo);
		return getPage;
	}
	
	@RequestMapping(value=bCheck, method=RequestMethod.POST) 
	public @ResponseBody String bCheck(@RequestParam("b_num") String b_num){
		//book b_check 1
		bookDao.updateBcheckByNum(b_num);
		
		String bcheck = bookDao.getTcheckByNum(b_num);
		return bcheck;
	}
		
	
}
