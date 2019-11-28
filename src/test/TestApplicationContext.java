package test;

import java.io.UnsupportedEncodingException;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tourism.gis.action.LandMarkAction;

public class TestApplicationContext {

	@Test
	public void test() throws UnsupportedEncodingException {
		String[] locations = { "applicationContext-beans.xml", "applicationContext-core.xml" };
		ApplicationContext ac = new ClassPathXmlApplicationContext(locations);
		LandMarkAction l = (LandMarkAction) ac.getBean("landMarkAction");
		l.testAdd(TestLandMark.getList());
		/*
		 * System.out.println(ac.getBean("articleAction"));
		 * System.out.println(ac.getBean("imageAction"));
		 * System.out.println(ac.getBean("resultAction"));
		 * System.out.println(ac.getBean("scenicTypeAction"));
		 * System.out.println(ac.getBean("scenicTypeAction"));
		 */
	}
}
