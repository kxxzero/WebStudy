package com.sist.temp;

import java.util.*;
public class Container {

	private Map map=new HashMap();
	private String[] cls= {"com.sist.temp.BoardModel",
			"com.sist.temp.MemberModel",
			"com.sist.temp.FoodModel"};
	private String[] key= {"board", "member", "food"};
	// 클래스와 키의 개수를 맞춰주어야 함
	
	// <bean id="key" class="메모리 할당 클래스">
	public Container()
	{
		try
		{
			for(int i=0; i<cls.length; i++)
			{
				// => 1차 => Spring => factory pattern
				Class clsName=Class.forName(cls[i]);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				map.put(key[i], obj);
			}
		}catch(Exception ex) {}
	}
	public Model getBean(String key)
	{
		return (Model)map.get(key);
	}
}
