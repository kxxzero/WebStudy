package com.sist.exam;
import java.lang.reflect.Method;
import java.util.*;
class Model
{	
	@RequestMapping("a")
	public void aaa()
	{
		System.out.println("Model:aaa()");
	}
	
	@RequestMapping("b")
	public void bbb()
	{
		System.out.println("Model:bbb()");
	}
	
	@RequestMapping("c")
	public void ccc()
	{
		System.out.println("Model:ccc()");
	}
}

public class MainClass {
	public static void main(String[] args) {
		Scanner scan=new Scanner(System.in);
		System.out.print("검색어 입력:");
		String fd=scan.next();
		
//		Model model=new Model();
//		if(fd.equals("a"))
//		{
//			model.aaa();
//		}
//		else if(fd.equals("b"))
//		{
//			model.bbb();
//		}
//		else if(fd.equals("c"))
//		{
//			model.ccc();
//		}
		
		try
		{
			// 클래스 정보를 읽어 옴
			Class clsName=Class.forName("com.sist.exam.Model");
			
			Object obj=clsName.getDeclaredConstructor().newInstance();
			
			// 메소드 읽기
			Method[] methods=clsName.getDeclaredMethods();
			for(Method m:methods)
			{
//				System.out.println(m.getName());
				RequestMapping rm=m.getAnnotation(RequestMapping.class);
				if(rm.value().equals(fd))
				{
					m.invoke(obj, null);
					break;
				}
			}
		}catch(Exception ex) {}
	}
}
