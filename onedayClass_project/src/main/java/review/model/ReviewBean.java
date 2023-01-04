package review.model;

public class ReviewBean {
	
	private int rnum;
	private int bnum; //book primary key
	private String reviewer;
	private String rday;
	private String rimage;
	private String rcontent;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public String getRimage() {
		return rimage;
	}
	public void setRimage(String rimage) {
		this.rimage = rimage;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	//review.xml getReviewListCount
	private String b_cname; 
	private String b_day; 
	private String b_stime; 
	private String b_etime; 
	
	public String getB_cname() {
		return b_cname;
	}
	public void setB_cname(String b_cname) {
		this.b_cname = b_cname;
	}
	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}
	public String getB_stime() {
		return b_stime;
	}
	public void setB_stime(String b_stime) {
		this.b_stime = b_stime;
	}
	public String getB_etime() {
		return b_etime;
	}
	public void setB_etime(String b_etime) {
		this.b_etime = b_etime;
	}
	
}