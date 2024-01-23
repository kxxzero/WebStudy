package com.sist.temp;

public class MainClass_1 {
	
	public static void main(String[] args) {
		String price="20,300원";
		price=price.replaceAll("[^0-9]", ""); // 숫자 외에 나머지는 공백
		System.out.println(price);
	}
	
}
