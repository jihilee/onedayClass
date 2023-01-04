package book.model;

public class TimetableBean {
	
	private String t_num;
	private String t_cname;
	private String t_day;
	private String t_stime;
	private String t_etime;
	private String t_check;
	
	
	
	public TimetableBean() {
		super();
	}
	
	/* insert timetable */
	public TimetableBean(String t_cname, String t_day, String t_stime, String t_etime) {
		super();
		this.t_cname = t_cname;
		this.t_day = t_day;
		this.t_stime = t_stime;
		this.t_etime = t_etime;
	}
	
	/* update timetable */
	public TimetableBean(String t_num, String t_cname, String t_day, String t_stime, String t_etime) {
		super();
		this.t_num = t_num;
		this.t_cname = t_cname;
		this.t_day = t_day;
		this.t_stime = t_stime;
		this.t_etime = t_etime;
	}
	
	public String getT_num() {
		return t_num;
	}
	public void setT_num(String t_num) {
		this.t_num = t_num;
	}
	
	public String getT_cname() {
		return t_cname;
	}
	public void setT_cname(String t_cname) {
		this.t_cname = t_cname;
	}
	public String getT_day() {
		return t_day;
	}
	public void setT_day(String t_day) {
		this.t_day = t_day;
	}
	public String getT_stime() {
		return t_stime;
	}
	public void setT_stime(String t_stime) {
		this.t_stime = t_stime;
	}
	public String getT_etime() {
		return t_etime;
	}
	public void setT_etime(String t_etime) {
		this.t_etime = t_etime;
	}
	public String getT_check() {
		return t_check;
	}
	public void setT_check(String t_check) {
		this.t_check = t_check;
	}
	
	
}
