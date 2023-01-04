package cls.model;

import org.springframework.web.multipart.MultipartFile;

public class ClsBean {
	private int cnum;
	private String cname;
	private String ctime;
	private String caddress;
	private String clocation;
	private String cprice;
	private String cinfo;
	private String ccontent;
	private String cimage1;
	private String cimage2;
	private String cimage3;
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getClocation() {
		return clocation;
	}
	public void setClocation(String clocation) {
		this.clocation = clocation;
	}
	public String getCprice() {
		return cprice;
	}
	public void setCprice(String cprice) {
		this.cprice = cprice;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCimage1() {
		return cimage1;
	}
	public void setCimage1(String cimage1) {
		this.cimage1 = cimage1;
	}
	public String getCimage2() {
		return cimage2;
	}
	public void setCimage2(String cimage2) {
		this.cimage2 = cimage2;
	}
	public String getCimage3() {
		return cimage3;
	}
	public void setCimage3(String cimage3) {
		this.cimage3 = cimage3;
	}
	
	private MultipartFile upload1; 
	private MultipartFile upload2; 
	private MultipartFile upload3; 
	
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
		System.out.println("setUpload1 : " + upload1);
		System.out.println("upload1.getName : " + upload1.getName());
		this.cimage1 = upload1.getOriginalFilename();
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		System.out.println("setUpload2 : " + upload2);
		System.out.println("upload1.getName : " + upload2.getName());
		this.cimage2 = upload2.getOriginalFilename();
	}
	public MultipartFile getUpload3() {
		return upload3;
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		System.out.println("setUpload3 : " + upload3);
		System.out.println("upload3.getName : " + upload3.getName());
		this.cimage3 = upload3.getOriginalFilename();
	}
}
