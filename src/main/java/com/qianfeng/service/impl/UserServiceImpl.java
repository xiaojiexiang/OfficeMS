package com.qianfeng.service.impl;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qianfeng.mapper.IUserMapper;
import com.qianfeng.pojo.po.Leave;
import com.qianfeng.pojo.po.Mail;
import com.qianfeng.pojo.po.User;
import com.qianfeng.service.IUserService;
@Transactional
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	IUserMapper userMapper;
	@Override
	public User findByName(User user) {
		return userMapper.findByName(user);
	}
	@Override
	public User selectUserById(Integer id) {
		return userMapper.selectUserById(id);
	}
	@Override
	public void updateUserInfo(User user) {
		userMapper.updateUserInfo(user);
	}
	@Override
	public List<User> selectAll() {
		return userMapper.selectAll();
	}
	@Override
	public List<Mail> selectMailFromRepo(Integer id) {
		return userMapper.selectMailFromRepo(id);
	}
	@Override
	public Mail selectMailByMrid(Integer mrid) {
		return userMapper.selectMailByMrid(mrid);
	}
	@Override
	public void updateMailState(Integer mrid) {
		userMapper.updateMailState(mrid);
		
	}
	@Override
	public void deleteMailRepoById(Integer mrid) {
		userMapper.deleteMailRepoById(mrid);
	}
	@Override
	public void insertMailGarage(Mail dmail) {
		userMapper.insertMailGarage(dmail);
	}
	@Override
	public List<Mail> selectMailFromGara(Integer mgid) {
		return userMapper.selectMailFromGara(mgid);
	}
	@Override
	public void deleteMailGaraById(Integer mgid) {
		userMapper.deleteMailGaraById(mgid);
	}
	@Override
	public Mail selectMailByMgid(Integer mgid) {
		return userMapper.selectMailByMgid(mgid);
	}
	@Override
	public void insertMailRepo(Mail rmail) {
		userMapper.insertMailRepo(rmail);
	}
	@Override
	public List<Leave> selectLeaveInfoById(Integer id) {
		return userMapper.selectLeaveInfoById(id);
	}
	@Override
	public List<Leave> selectAllLeave() {
		return userMapper.selectAllLeave();
	}
	@Override
	public List<Leave> selectLeaveByAdminId(Integer id) {
		return userMapper.selectLeaveByAdminId(id);
	}
	@Override
	public List<User> selectAdminUser() {
		return userMapper.selectAdminUser();
	}
	@Override
	public void insertLeaveInfo(Leave leave) {
		userMapper.insertLeaveInfo(leave);
	}
	@Override
	public Leave selectLeaveDetailById(Integer leaveid) {
		return userMapper.selectLeaveDetailById(leaveid);
	}
	@Override
	public void updateApproveLeave(Integer leaveid) {
		userMapper.updateApproveLeave(leaveid);
	}
	@Override
	public void updateRefuseLeave(Integer leaveid) {
		userMapper.updateRefuseLeave(leaveid);
	}
	@Override
	public void updateUserAccount(User user) {
		userMapper.updateUserAccount(user);
	}
	@Override
	public void insertUser(User user) {
		userMapper.insertUser(user);
	}
	@Override
	public Integer findMaxId() {
		return userMapper.findMaxId();
	}

}
