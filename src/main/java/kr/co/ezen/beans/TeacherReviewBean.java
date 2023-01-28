package kr.co.ezen.beans;

public class TeacherReviewBean {

	private int a_memberNo;
	private String t_name;
	private int m_memberNo;
	private int t_score;
	private String t_reviewContents;
	
		
	public String getT_reviewContents() {
		return t_reviewContents;
	}
	public void setT_reviewContents(String t_reviewContents) {
		this.t_reviewContents = t_reviewContents;
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
	public int getM_memberNo() {
		return m_memberNo;
	}
	public void setM_memberNo(int m_memberNo) {
		this.m_memberNo = m_memberNo;
	}
	public int getT_score() {
		return t_score;
	}
	public void setT_score(int t_score) {
		this.t_score = t_score;
	}
	

}
