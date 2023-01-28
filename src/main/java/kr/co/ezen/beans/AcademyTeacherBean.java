package kr.co.ezen.beans;

import org.springframework.web.multipart.MultipartFile;

public class AcademyTeacherBean {

	private int a_memberNo;
	private String t_name;
	private String t_subject;
	private String t_contents;
	private String t_file;
	
	private MultipartFile upload_file;
	
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public int getA_memberNo() {
		return a_memberNo;
	}
	public void setA_memberNo(int a_memberNo) {
		this.a_memberNo = a_memberNo;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_subject() {
		return t_subject;
	}
	public void setT_subject(String t_subject) {
		this.t_subject = t_subject;
	}
	public String getT_contents() {
		return t_contents;
	}
	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}
	public String getT_file() {
		return t_file;
	}
	public void setT_file(String t_file) {
		this.t_file = t_file;
	}
	

}
