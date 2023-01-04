package book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import book.model.BookBean;
import book.model.BookDao;
import book.model.TimetableBean;
import cls.model.ClsBean;
import cls.model.ClsDao;
import member.model.MemberBean;
import utility.Paging;

@Controller
@ComponentScan({"cls.*","book.*"}) 
public class AdminTimeTableListController{ 
	private final String command = "AdminTimeTableList.bk"; 
	private String getPage = "/AdminTimeTableList";
	
	private final String delete = "AdminTimeTableDelete.bk";

	@Autowired ClsDao clsDao;
	@Autowired BookDao bookDao;

	@RequestMapping(command) 
	public String listopen(Model model,HttpServletRequest request,
			@RequestParam(value="keyword", required=false) String keyword,
			@RequestParam(value="whatColumn", required=false) String whatColumn,
			@RequestParam(value="pageNumber", required=false) String pageNumber) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("whatColumn", whatColumn);
		System.out.println("keyword:"+keyword);
		System.out.println("whatColumn:"+whatColumn);
		
		int totalCount = bookDao.getTotalTimeTable(map);
		String url = request.getContextPath()+"/"+command;
		Paging pageInfo = new Paging(pageNumber,"10",totalCount, url, whatColumn, keyword, null); 
		
		System.out.println("url:"+url);
		System.out.println("pageInfo:"+pageInfo);
		System.out.println("totalCount:"+totalCount);
		
		List<TimetableBean> tbList = new ArrayList<TimetableBean>(); 
		tbList = bookDao.getTbList(map, pageInfo);
		
		model.addAttribute("tbList",tbList); 
		model.addAttribute("pageInfo",pageInfo); 
		model.addAttribute("totalCount",totalCount); 
		
		return getPage; 
	}

}