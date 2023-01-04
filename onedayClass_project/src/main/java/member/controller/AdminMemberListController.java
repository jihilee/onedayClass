package member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class AdminMemberListController {

	private final String command = "AdminMemberList.mb";
	private String getPage = "/adminMemberList";

	@Autowired MemberDao memberDao;
	
	@RequestMapping(command)
	public String clsMain(@RequestParam(value="keyword", required=false) String keyword,
            @RequestParam(value="whatColumn", required=false) String whatColumn,
            @RequestParam(value="pageNumber", required=false) String pageNumber,
            Model model, HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("whatColumn", whatColumn);
		
		int totalCount = memberDao.getMemberListTotalCount(map);
		System.out.println("totalcount : " + totalCount);
		String url = request.getContextPath() + "/" + command;
		System.out.println("url : " + url);
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<MemberBean> memberLists = new ArrayList<MemberBean>();

		memberLists =memberDao.getMemberList(map,pageInfo);
		System.out.println(memberLists.size());
		model.addAttribute("memberLists",memberLists);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("pageInfo",pageInfo);
		return getPage;
	}
	
}
