package com.qianfeng.pojo.po;

import java.util.Date;

public class Mail {
	 /* `mailtitle` VARCHAR(50) DEFAULT NULL,
	  `mailcontent` VARCHAR(200) DEFAULT NULL,
	  `mailstate` VARCHAR(20) DEFAULT NULL,
	  `mailtime` TIME DEFAULT NULL*/
	private Integer uid;
	private Integer mrid;
	private Integer mgid;
	private String mailtitle;
	private String mailcontent;
	private String mailstate;
	private String mailtime;
	private String mailsource;
	private String mailfile;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getMailtitle() {
		return mailtitle;
	}
	public void setMailtitle(String mailtitle) {
		this.mailtitle = mailtitle;
	}
	public String getMailcontent() {
		return mailcontent;
	}
	public void setMailcontent(String mailcontent) {
		this.mailcontent = mailcontent;
	}
	public String getMailstate() {
		return mailstate;
	}
	public void setMailstate(String mailstate) {
		this.mailstate = mailstate;
	}
	public String getMailtime() {
		return mailtime;
	}
	public void setMailtime(String mailtime) {
		this.mailtime = mailtime;
	}
	public String getMailsource() {
		return mailsource;
	}
	public void setMailsource(String mailsource) {
		this.mailsource = mailsource;
	}
	public Integer getMrid() {
		return mrid;
	}
	public void setMrid(Integer mrid) {
		this.mrid = mrid;
	}
	public Integer getMgid() {
		return mgid;
	}
	public void setMgid(Integer mgid) {
		this.mgid = mgid;
	}
	
	public String getMailfile() {
		return mailfile;
	}
	public void setMailfile(String mailfile) {
		this.mailfile = mailfile;
	}
	public Mail() {}
	public Mail(Integer uid, String mailtitle, String mailcontent, String mailtime, String mailsource) {
		this.uid = uid;
		this.mailtitle = mailtitle;
		this.mailcontent = mailcontent;
		this.mailtime = mailtime;
		this.mailsource = mailsource;
	}
	public Mail(Integer uid, String mailtitle, String mailcontent, String mailstate, String mailtime,
			String mailsource) {
		this.uid = uid;
		this.mailtitle = mailtitle;
		this.mailcontent = mailcontent;
		this.mailstate = mailstate;
		this.mailtime = mailtime;
		this.mailsource = mailsource;
	}
	public Mail(Integer uid, String mailtitle, String mailcontent, String mailstate, String mailtime, String mailsource,
			String mailfile) {
		this.uid = uid;
		this.mailtitle = mailtitle;
		this.mailcontent = mailcontent;
		this.mailstate = mailstate;
		this.mailtime = mailtime;
		this.mailsource = mailsource;
		this.mailfile = mailfile;
	}
	
	
	
}
