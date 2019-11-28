package test;

import java.util.HashSet;
import java.util.Set;

import com.tourism.gis.bean.User;
import com.tourism.gis.util.CommonUtils;

public class Test {

	public static void main(String[] args) {
		String code = "ED358975B462486DAD54E77E1F39EB8E";
		String code1 = "ED358975B462486DAD54E77E1F39EB8E";
		System.out.println(code == code1);
	}

	@org.junit.Test
	public void test() {
		System.out.println(CommonUtils.uuid());
	}

	@org.junit.Test
	public void test1() {
		Set<User> set = new HashSet<>();
		User user = new User();
		user.setUserName("wamgke");
		set.add(user);
		System.out.println(set);
	}

	@org.junit.Test
	public void main1(String[] args) {

	}
}
