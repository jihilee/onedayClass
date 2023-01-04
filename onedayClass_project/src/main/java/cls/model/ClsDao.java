package cls.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cate.model.CateBean;
@Component
public class ClsDao {

	private final String namespace = "cls.model.Cls";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ClsBean> getClsList() {
		List<ClsBean> clsLists = new ArrayList<ClsBean>();
		clsLists = sqlSessionTemplate.selectList(namespace+".getClsList");
		return clsLists;
	}

	public int getClsListTotalCount() {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getClsListTotalCount");
		System.out.println("getClsListTotalCount : " + cnt);
		return cnt;
	}

	public void insertCls(ClsBean cb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertCls",cb);
		System.out.println("insertCls : " + cnt);
	}

	public ClsBean getClsByNum(String cnum) {
		ClsBean cb = new ClsBean();
		cb = sqlSessionTemplate.selectOne(namespace+".getClsByNum",cnum);
		System.out.println("getClsByNum : "+cb.getCname());
		return cb;
	}

	public void updateCls(ClsBean cb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateCls",cb);
		System.out.println("updateCls : "+cnt);
	}

	public void deleteCls(String cnum) {
		int cnt = sqlSessionTemplate.update(namespace+".deleteCls",cnum);
		System.out.println("deleteCls : "+cnt);
	}
	
	public ClsBean getClsAddress() {
		ClsBean cb = sqlSessionTemplate.selectOne(namespace+".getClsAddress");
		System.out.println("getClsAddress : "+cb.getCaddress() +"/"+cb.getClocation());
		return cb;
	}

	public void updateAddress(ClsBean cb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateAddress",cb);
		System.out.println("updateAddress : "+cnt);
	}

	public int getCtimeBycname(String cname) {
		int ctime = sqlSessionTemplate.selectOne(namespace+".getCtimeBycname",cname);
		System.out.println("getCtimeBycname : "+ctime);
		return ctime;
	}
}
