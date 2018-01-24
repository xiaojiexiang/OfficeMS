package com.qianfeng.pojo.po;

public class Leave {
	/*
	  `username` varchar(50) DEFAULT NULL,
	  `begintime` varchar(50) DEFAULT NULL,
	  `endtime` varchar(50) DEFAULT NULL,
	  `day` int(2) DEFAULT NULL,
	  `isapprove` int(1) DEFAULT '0',
	  `reason` varchar(200) DEFAULT NULL,
	  `uid` int(11) DEFAULT NULL
	 */
	private String username;
	private String begintime;
	private String endtime;
	private Integer day;
	private Integer isapprove;
	private String reason;
	private Integer uid;
	private Integer leaveid;
	private Integer auditer;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public Integer getDay() {
		return day;
	}
	public void setDay(Integer day) {
		this.day = day;
	}
	public Integer getIsapprove() {
		return isapprove;
	}
	public void setIsapprove(Integer isapprove) {
		this.isapprove = isapprove;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getLeaveid() {
		return leaveid;
	}
	public void setLeaveid(Integer leaveid) {
		this.leaveid = leaveid;
	}
	public Integer getAuditer() {
		return auditer;
	}
	public void setAuditer(Integer auditer) {
		this.auditer = auditer;
	} 
	
}
