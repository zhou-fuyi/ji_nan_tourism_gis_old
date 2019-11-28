package test;

public class TestSystem {

	public static void main(String[] args) {
		long time1 = System.currentTimeMillis();
		try {
			Thread.sleep(1050);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long time2 = System.currentTimeMillis();
		long cost = time2 - time1;
		System.out.println(cost / 1000);
		float cost1 = (float) cost;
		System.out.println(cost1 / 1000);
		System.out.println(time2 - time1);
	}
}
