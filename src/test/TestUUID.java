package test;

import java.util.UUID;

import org.junit.jupiter.api.Test;

public class TestUUID {

	@Test
	public void test() {
		UUID id = UUID.randomUUID();
		String idstr = id.toString().replaceAll("-", "").toUpperCase();
		System.out.println(idstr.length());
		System.out.println(idstr);
		System.out.println(id.toString());
	}
}
