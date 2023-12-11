package com.sist.temp;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Container c=new Container();
		Model m=c.getBean("board");
		m.execute(); // 호출
		
		Model m1=c.getBean("board");
		m1.execute();
		
		Model m2=c.getBean("board");
		m2.execute();
		
		System.out.println("m="+m);
		System.out.println("m="+m1);
		System.out.println("m="+m2);
		
		// 싱글턴을 따로 만들 필요 없이 메모리 하나로 사용 => 메모리 절약
		
//		m=c.getBean("member");
//		m.execute();
//		
//		m=c.getBean("food");
//		m.execute();
		
		// => 1개로 여러 개를 제어할 수 있음 => 인터페이스
	}

}
