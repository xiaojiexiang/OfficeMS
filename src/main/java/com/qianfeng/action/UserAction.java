package com.qianfeng.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qianfeng.pojo.po.Leave;
import com.qianfeng.pojo.po.Mail;
import com.qianfeng.pojo.po.User;
import com.qianfeng.service.IUserService;

@Controller
@RequestMapping(value = "/user")
public class UserAction {
	@Autowired
	IUserService service;

	/*
	 * 转到登录页面
	 */
	@RequestMapping("/tologin.do")
	public String toLogin() {

		return "login";
	}

	/*
	 * 登录
	 */
	@RequestMapping("/login.do")
	@ResponseBody
	public String doLogin(User user, HttpSession session) {
		User findUser = service.findByName(user);
		if (findUser != null) {
			session.setAttribute("sessionUser", findUser);
			return "1";
		}
		return "0";
	}

	@RequestMapping("toindex.do")
	public String doIndex() {
		return "index";
	}

	// 跳转到编辑页面
	@RequestMapping("/infoEdit.do")
	public String infoEdit() {
		return "infoEdit";
	}

	// 编辑内容保存并跳转到用户信息显示页面
	@RequestMapping("/infoSave.do")
	public String infoSave(User user, HttpSession session) {
		service.updateUserInfo(user);
		User newUser = service.selectUserById(user.getId());
		session.setAttribute("sessionUser", newUser);
		return "index";
	}

	@RequestMapping("/infoUser")
	public String infoUser() {
		return "infoUser";
	}

	@RequestMapping("/mailSend.do")
	public String mailSend(HttpSession session) {
		List<User> userList = service.selectAll();
		session.setAttribute("userList", userList);
		return "mailSend";
	}

	@RequestMapping("/toSend.do")
	@ResponseBody
	public void send(String mailTitle, String mailContent, String sendUname, Integer sendId,
			@RequestParam(value = "receiveId") Integer receiveId, @RequestParam("mailFile") MultipartFile file)
			throws IOException {
		// 接收表单提交的数据,包含文件
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String mailTime = sdf.format(System.currentTimeMillis());
		String mailSource = sendUname + "(" + sendId + ")";
		String mailfile = null;
		if (!file.isEmpty()) {
			// String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// String str = mailTime.replaceAll("-", "").replaceAll(":",
			// "").replaceAll(" ", "");
			mailfile = file.getOriginalFilename();
			file.transferTo(new File("F:/temp/" + mailfile));
		}
		// 将接收到的数据封装到mail中,mailstate初始为0,即为未读
		Mail mail = new Mail(receiveId, mailTitle, mailContent, "0", mailTime, mailSource, mailfile);

		// 将mail放入数据库收件箱中
		service.insertMailRepo(mail);
	}

	// 收件箱
	@RequestMapping("/mailReceive.do/{id}")
	public String mailReceive(@PathVariable(value = "id") Integer id, HttpSession session) {
		List<Mail> mailList = service.selectMailFromRepo(id);
		session.setAttribute("sessionMailRepo", mailList);
		return "mailReceive";
	}

	// 收件箱邮件详情
	@RequestMapping("/mailDetail.do/{id}")
	public String mailDetail(@PathVariable(value = "id") Integer mrid, Model model) {
		Mail mail = service.selectMailByMrid(mrid);
		service.updateMailState(mrid);
		model.addAttribute("mail", mail);
		return "mailDetail";
	}

	// 附件下载
	@RequestMapping("/mailDownload.do/{id}")
	public void mailDownload(@PathVariable(value = "id") Integer mrid, HttpServletResponse response)
			throws IOException {
		Mail mail = service.selectMailByMrid(mrid);
		// 找到附件路径
		File file = new File("F:/temp/" + mail.getMailfile());
		// 设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition",
				"attachment;filename=" + URLEncoder.encode(mail.getMailfile(), "UTF-8"));
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(file);
		// 创建输出流
		OutputStream out = response.getOutputStream();
		// 创建缓冲区
		byte buf[] = new byte[1024];
		int len = 0;
		// 循环将输入流中的内容读取到缓冲区当中
		while ((len = in.read(buf)) > 0) {
			// 输出缓冲区的内容到浏览器，实现文件下载
			out.write(buf, 0, len);
		}
		// 关闭文件输入流
		in.close();
		// 关闭输出流
		out.close();
	}

	// 删除邮件(到垃圾箱)
	@RequestMapping("/toDeleteMailRepoById.do/{id}")
	@ResponseBody
	public void deleteMailRepoById(@PathVariable(value = "id") Integer mrid) {
		// 将要删除的邮件找到并添加到垃圾箱中
		Mail dmail = service.selectMailByMrid(mrid);
		service.insertMailGarage(dmail);
		// 将邮件从收件箱中删除
		service.deleteMailRepoById(mrid);
	}

	// 垃圾箱
	@RequestMapping("/mailGarage.do/{id}")
	public String mailGarage(@PathVariable(value = "id") Integer id, HttpSession session) {
		List<Mail> mailList = service.selectMailFromGara(id);
		session.setAttribute("sessionMailGara", mailList);
		return "mailGarage";
	}

	// 垃圾箱邮件彻底删除
	@RequestMapping("/toDeleteMailGaraById.do/{id}")
	@ResponseBody
	public void deleteMailGaraById(@PathVariable(value = "id") Integer mgid) {
		// 将邮件从辣鸡箱中删除
		service.deleteMailGaraById(mgid);
	}

	// 还原邮件
	@RequestMapping("/toRestoreMailGaraById.do/{id}")
	@ResponseBody
	public void restoreMailGaraById(@PathVariable(value = "id") Integer mgid) {
		// 将要还原的邮件找到并还原到收件箱中
		Mail rmail = service.selectMailByMgid(mgid);
		service.insertMailRepo(rmail);
		// 将邮件从辣鸡箱中删除
		service.deleteMailGaraById(mgid);
	}

	// 休假
	@RequestMapping("/leave.do/{id}")
	public String leave(@PathVariable(value = "id") Integer id, Model model) {
		// 在这里做判断,是否是经理
		List<Leave> leaveList = null;
		User user = service.selectUserById(id);
		if (user.getIsadmin() == 1) {
			// 如果是经理,则查找提交到该经理下的申请
			leaveList = service.selectLeaveByAdminId(user.getId());
		} else {
			leaveList = service.selectLeaveInfoById(user.getId());
		}
		model.addAttribute("leaveList", leaveList);
		return "leave";
	}

	// 申请休假
	@RequestMapping("/toapply.do")
	public String apply(Model model) {
		// 回显审批人
		List<User> adminUserList = service.selectAdminUser();
		model.addAttribute("adminUserList", adminUserList);
		return "apply";
	}

	// 将提交的休假申请保存
	@RequestMapping("/applySubmit.do")
	@ResponseBody
	public void applySubmit(Leave leave) {
		// 保存提交
		service.insertLeaveInfo(leave);
	}

	// 审核休假申请
	@RequestMapping("/check.do/{id}")
	public String check(@PathVariable(value = "id") Integer leaveid, Model model) {
		// 保存提交
		Leave leave = service.selectLeaveDetailById(leaveid);
		model.addAttribute("leave", leave);
		return "check";
	}

	// 审核通过
	@RequestMapping("/approve.do/{id}")
	@ResponseBody
	public void approve(@PathVariable(value = "id") Integer leaveid) {
		// 保存提交
		service.updateApproveLeave(leaveid);
	}

	// 审核不通过
	@RequestMapping("/refuse.do/{id}")
	@ResponseBody
	public void refuse(@PathVariable(value = "id") Integer leaveid) {
		// 保存提交
		service.updateRefuseLeave(leaveid);
	}

	// 显示个人账户页面
	@RequestMapping("/userAccount.do")
	public String userAccount() {
		return "userAccount";
	}

	// 跳转到账户编辑页面
	@RequestMapping("/userEdit.do")
	public String userEdit() {
		return "userEdit";
	}

	// 个人账户编辑保存
	@RequestMapping("/userSave.do")
	public String userSave(User user, HttpSession session) {
		service.updateUserAccount(user);
		User newUser = service.selectUserById(user.getId());
		session.setAttribute("sessionUser", newUser);
		return "userAccount";
	}

	// 显示管理账户页面
	@RequestMapping("/manageAccount.do")
	public String manageAccount(Model model) {
		List<User> userList = service.selectAll();
		model.addAttribute("userList", userList);
		return "userAccountManage";
	}

	// 添加账号页面。
	@RequestMapping("/addAccount.do")
	public String addAccount(Model model) {
		return "userAccountAdd";
	}

	// 添加账号页面。
	@RequestMapping("/userAccountSave.do")
	@ResponseBody
	public void userAccountSave(User user) {
		service.insertUser(user);
	}
	//注销
	@RequestMapping("/loginOut.do")
	public String loginOut(HttpSession session) {
		User user = new User();
		session.setAttribute("sessionUser", user);
		return "login";
	}
}
