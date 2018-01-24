package com.qianfeng.mapper;


import java.util.List;

import com.qianfeng.pojo.po.Leave;
import com.qianfeng.pojo.po.Mail;
import com.qianfeng.pojo.po.User;

public interface IUserMapper {
	User findByName(User user);
	User selectUserById(Integer id);
	void updateUserInfo(User user);
	List<User> selectAll();
	List<Mail> selectMailFromRepo(Integer id);
	List<Mail> selectMailFromGarage();
	Mail selectMailByMrid(Integer mrid);
	void updateMailState(Integer mrid);
	void deleteMailRepoById(Integer mrid);
	void insertMailGarage(Mail dmail);
	List<Mail> selectMailFromGara(Integer mgid);
	void deleteMailGaraById(Integer mgid);
	Mail selectMailByMgid(Integer mgid);
	void insertMailRepo(Mail rmail);
	List<Leave> selectLeaveInfoById(Integer id);
	List<Leave> selectAllLeave();
	List<Leave> selectLeaveByAdminId(Integer id);
	List<User> selectAdminUser();
	void insertLeaveInfo(Leave leave);
	Leave selectLeaveDetailById(Integer leaveid);
	void updateApproveLeave(Integer leaveid);
	void updateRefuseLeave(Integer leaveid);
	void updateUserAccount(User user);
	void insertUser(User user);
}
