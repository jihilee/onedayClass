package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component
public class MemberDao {
	
	private final String namespace = "member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int memberCheck(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".memberCheck",map);
		System.out.println("memberCheck cnt : " + cnt);
		return cnt;
	}

	public MemberBean getMemberId(Map<String, String> map) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".getMemberId",map);
		System.out.println("getMemberId : " + mb.getId());
		return mb;
	}

	public List<MemberBean> getCheckById(String id) {
		List<MemberBean> mlist = new ArrayList<MemberBean>();
		mlist = sqlSessionTemplate.selectList(namespace+".getCheckById",id);
		System.out.println(mlist.size());
		return mlist;
	}

	public int joinMember(MemberBean mb) {
		int cnt = sqlSessionTemplate.insert(namespace+".joinMember",mb);
		System.out.println("joinMember : " + cnt);
		return cnt;
	}

	public MemberBean findId(Map<String, String> map) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".findId",map);
		System.out.println("findId : " + mb.getId());
		return mb;
	}

	public MemberBean findPw(MemberBean mbean) {
		System.out.println(mbean.getId());
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".findPw",mbean);
		System.out.println(mb);
		System.out.println("findPw > id : " + mb.getId());
		System.out.println("findPw > pw : " + mb.getPw());
		return mb;
	}

	public void updateTempw(MemberBean memberbean) {
		int cnt = sqlSessionTemplate.update(namespace+".updateTempw",memberbean);
		System.out.println("updateTempw : " + cnt);
	}

	public List<MemberBean> getMemberList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> memberLists =new ArrayList<MemberBean>();
		memberLists = sqlSessionTemplate.selectList(namespace+".getMemberList",map,rowBounds);
		System.out.println("getMemberList : " + memberLists.size());
		return memberLists;
	}
	public List<MemberBean> getHostList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> memberLists =new ArrayList<MemberBean>();
		memberLists = sqlSessionTemplate.selectList(namespace+".getHostList",map,rowBounds);
		System.out.println("getHostList : " + memberLists.size());
		return memberLists;
	}
	public List<MemberBean> getGuestList(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<MemberBean> memberLists =new ArrayList<MemberBean>();
		memberLists = sqlSessionTemplate.selectList(namespace+".getGuestList",map,rowBounds);
		System.out.println("getGuestList : " + memberLists.size());
		return memberLists;
	}

	public int getMemberListTotalCount(Map<String, String> map) {
		int totalcount = sqlSessionTemplate.selectOne(namespace+".getMemberListTotalCount",map);
		System.out.println("getMemberListTotalCount : " + totalcount);
		return totalcount;
	}
	public int getHostTotalCount(Map<String, String> map) {
		int totalcount = sqlSessionTemplate.selectOne(namespace+".getHostTotalCount",map);
		System.out.println("getHostTotalCount : " + totalcount);
		return totalcount;
	}
	public int getGuestTotalCount(Map<String, String> map) {
		int totalcount = sqlSessionTemplate.selectOne(namespace+".getGuestTotalCount",map);
		System.out.println("getGuestTotalCount : " + totalcount);
		return totalcount;
	}

	public int emailcheck(String email) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".emailcheck",email);
		System.out.println("emailcheck : " + cnt);
		return cnt;
	}

	public void myDataUpdate(MemberBean mb) {
		int cnt = sqlSessionTemplate.update(namespace+".myDataUpdate",mb);
		System.out.println("myDataUpdate : " + cnt);
	}

	public int CheckAdminIdDul(String adminid) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".CheckAdminIdDul",adminid);
		return cnt;
	}

	public void updateAdminData(MemberBean mb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateAdminData",mb);
		System.out.println("updateAdminData : "+cnt);
	}

	public int CheckAdminEmailDul(String email) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".CheckAdminEmailDul",email);
		return cnt;
	}
}
