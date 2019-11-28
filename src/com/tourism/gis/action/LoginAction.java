package com.tourism.gis.action;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.tourism.gis.bean.User;
import com.tourism.gis.service.UserService;
import com.tourism.gis.util.CommonUtils;
import com.tourism.gis.util.MailUtil;
import com.tourism.gis.util.bean.EmailInfo;

public class LoginAction extends ActionSupport implements ModelDriven<User> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserService userService;
	private User user;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}

	public String login() {
		System.out.println(user);
		User existUser = userService.getUser(user);
		if (existUser != null) {
			System.out.println("欢迎您登陆魅力济南网站！");
			// 在成功登录之后 修改在线状态为在线
			existUser.setIsOnline(1);
			userService.updateUser(existUser);
			ActionContext.getContext().getSession().put("user", existUser);
			return "login";
		} else {
			System.out.println("登陆失败！");
			this.addActionError("用户名或密码错误！");
			return INPUT;
		}
	}

	/**
	 * 在进行用户注册之前 首先要对邮箱进行检测是否已经被使用
	 * 
	 * @return
	 */
	public String register() {
		System.out.println(user);
		String code = (String) ActionContext.getContext().getSession().get("activationCode");
		if (user == null) {
			System.out.println("没有接收到用户信息");
			this.addActionError("系统异常！");
			return "register";
		}
		if (code == null) {
			System.out.println("验证码已过过期");
			this.addActionError("验证码已过期！");
			return "register";
		}
		if (user.getActivationCode() != code) {
			if (!userService.isExistUser(user)) {
				if (!userService.isExistUserName(user)) {
					user.setUserId(CommonUtils.uuid());
					user.setActivationCode(code);
					user.setDisabled(1);
					user.setUserLevel(1);
					user.setRegisterTime(new Timestamp(new Date().getTime()));
					System.out.println(user);
					userService.registerUser(user);
					return "info";
				} else {
					System.out.println("用户名已存在！");
					this.addActionError("该用户名已经被使用！");
					return "register";
				}
			} else {
				System.out.println("邮箱号已经被使用！");
				this.addActionError("邮箱号已经被使用！");
				return "register";
			}
		} else {
			System.out.println("验证码输入错误！");
			this.addActionError("验证码输入错误！");
			return "register";
		}
	}

	public String validateActivationCode() throws UnsupportedEncodingException {
		System.out.println("进行验证码校验");
		System.out.println(user);
		String result = "1"; // 1代表校验通过
		String code = user.getActivationCode().trim();
		String sessionCode = (String) ActionContext.getContext().getSession().get("activationCode");
		if (sessionCode == null || sessionCode == "") {
			System.out.println("验证码已过过期");
			this.addActionError("验证码已过期！");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		System.out.println(!code.equals(sessionCode));
		if (!code.equals(sessionCode)) {
			System.out.println("据说不相等");
			System.out.println(code + "1");
			System.out.println(sessionCode + "2");
			System.out.println("验证码输入错误");
			this.addActionError("验证码输入错误");
			result = "-1";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		return "isExistUserJson";
	}

	/**
	 * 后台验证
	 * 
	 * @param user
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String validateUser() throws UnsupportedEncodingException {
		System.out.println("进行后台检测");
		System.out.println(user);
		String result = "1";
		String userEmail = user.getUserEmail().trim();
		String userName = user.getUserName().trim();
		String userPass = user.getUserPass().trim();
		String rePassword = user.getRePassword().trim();
		String code = user.getActivationCode().trim();
		String sessionCode = (String) ActionContext.getContext().getSession().get("activationCode");
		if (sessionCode == null || sessionCode == "") {
			System.out.println("验证码已过过期");
			this.addActionError("验证码已过期！");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		System.out.println(!code.equals(sessionCode));
		if (!code.equals(sessionCode)) {
			System.out.println("据说不相等");
			System.out.println(code + "1");
			System.out.println(sessionCode + "2");
			System.out.println("验证码输入错误");
			this.addActionError("验证码输入错误");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		if (userEmail.equals("") || userEmail == null || userEmail.length() > 30) {
			this.addActionError("邮箱格式错误");
			System.out.println("邮箱格式错误");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		String reg = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
		Pattern pattern = Pattern.compile(reg);
		Matcher matcher = pattern.matcher(user.getUserEmail());// 验证邮箱
		boolean email = matcher.matches();
		if (email) {
			result = "1";
		} else {
			result = "0";
			this.addActionError("邮箱格式错误");
			System.out.println("邮箱格式错误2");
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		if (userService.isExistUser(user)) {
			// 存在
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			this.addActionError("该邮箱号已经被使用");
			System.out.println("该邮箱号已经被使用");
			return "isExistUserJson";
		} else {
			result = "1";
		}

		// 验证用户名
		if (userName.equals("") || userName == null || userName.length() > 30 || userName.length() < 2) {
			this.addActionError("用户名格式错误");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			System.out.println("用户名格式错误");
			return "isExistUserJson";
		}
		reg = "^[0-9a-zA-Z]{0,}$";
		pattern = Pattern.compile(reg);
		matcher = pattern.matcher(user.getUserName());// 验证用户名
		boolean name = matcher.matches();
		if (name) {
			result = "1";
		} else {
			this.addActionError("用户名格式错误");
			result = "0";
			System.out.println("用户名格式错误2");
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		if (userService.isExistUserName(user)) {
			// 存在
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			this.addActionError("该用户名已经被使用");
			System.out.println("该用户名已经被使用");
			return "isExistUserJson";
		} else {
			// 不存在
			result = "1";
		}

		if (userPass.equals("") || userPass == null || userPass.length() > 20 || userPass.length() < 5) {
			this.addActionError("密码格式错误");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			System.out.println("密码格式错误");
			return "isExistUserJson";
		}
		reg = "^[0-9a-zA-Z]{0,}$";
		pattern = Pattern.compile(reg);
		matcher = pattern.matcher(user.getUserPass());// 验证密码
		boolean pass = matcher.matches();
		if (pass) {
			result = "1";
		} else {
			this.addActionError("密码格式错误");
			System.out.println("密码格式错误2");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			return "isExistUserJson";
		}
		if (!userPass.equals(rePassword) || rePassword.length() < 5) {
			this.addActionError("两次密码不一致错误");
			result = "0";
			inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
			System.out.println("两次密码不一致");
			return "isExistUserJson";
		} else {
			result = "1";
		}
		inputStream = new ByteArrayInputStream(result.getBytes("UTF-8"));
		System.out.println("到底了");
		return "isExistUserJson";
	}

	/**
	 * 根据邮箱号查询该邮箱号是否已经被使用
	 * 
	 * @param user
	 * @return
	 */
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public String isExistUser() throws UnsupportedEncodingException {
		System.out.println("检测邮箱是否已经被使用");
		System.out.println(user);
		if (userService.isExistUser(user)) {
			// 存在
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else {
			// 不存在
			// sendMail();
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "isExistUserJson";
	}

	/**
	 * 根据用户名检测该用户名是否已经被使用
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String isExistUserName() throws UnsupportedEncodingException {
		System.out.println("用户名查重");
		System.out.println(user);
		if (userService.isExistUserName(user)) {
			// 存在
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} else {
			// 不存在
			inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		return "isExistUserJson";
	}

	/**
	 * 发送邮件
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String sendMail() throws UnsupportedEncodingException {
		if (user.getUserEmail() != null && !user.getUserEmail().equals("")) {
			EmailInfo info = new EmailInfo();
			Properties prop = new Properties();
			InputStream stream = getClass().getClassLoader().getResourceAsStream("email.properties");
			try {
				String code = CommonUtils.uuid();
				prop.load(stream);
				info.setActivationCode(code);
				info.setContent(prop.getProperty("content"));
				info.setFrom(prop.getProperty("from"));
				info.setHost(prop.getProperty("host"));
				info.setPassword(prop.getProperty("password"));
				info.setSubject(prop.getProperty("subject"));
				info.setTo(user.getUserEmail());
				info.setUsername(prop.getProperty("username"));
				MailUtil.sendWithWangyi(info);
				// activationCode
				ActionContext.getContext().getSession().put("activationCode", code);
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// 邮件发送失败
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		}

		return "isExistUserJson";
	}

	public String logout() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		System.out.println(user);
		System.out.println("下线操作");
		if (user != null) {
			ActionContext.getContext().getSession().remove("user");
			user.setIsOnline(0);
			user.setLastLoginTime(new Timestamp(new Date().getTime()));
			userService.updateUser(user);
		}
		return "success";
	}

	@Override
	public User getModel() {
		user = new User();
		return user;
	}

}
