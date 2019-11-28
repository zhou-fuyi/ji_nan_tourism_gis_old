package test;

import java.util.ArrayList;
import java.util.List;

public class TestString {

	public static void main(String[] args) {
		String str = "id=A0AEA093B6FD4169AA502C854F727333&name=大迷糊&lng=15&lat=152&tel=&url=&file=&subject=";
		String[] strs = str.split("&");
		List<String> list = new ArrayList<>();
		for (String st : strs) {
			String[] temp = st.split("=");
			if (temp.length == 1) {
				continue;
			} else {
				list.add(temp[1]);
			}
		}
		System.out.println(list);
		System.out.println(Double.parseDouble(new String("12")));
	}

	@org.junit.Test
	void test() {
		System.out.println(Double.parseDouble(new String("12")));
	}
}
