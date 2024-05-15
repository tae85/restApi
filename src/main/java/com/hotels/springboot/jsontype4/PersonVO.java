package com.hotels.springboot.jsontype4;

import lombok.AllArgsConstructor;
import lombok.Data;

/*
@Data : 멤버변수 접근을 위한 getter, setter, 기본생성자 및 Object에서 제공하는
	toString()과 같은 메서드가 자동으로 생성된다.
@AllArgsConstructor : 멤버변수의 개수만큼의 인자를 가진 생성자가 추가된다.
	단, 인자생성자를 추가했기 때문에 기본생성자는 제거된다. 따라서 기본생성자까지 필요하다면
	@NoArgsConstructor를 추가해야 한다.
 */
@Data
@AllArgsConstructor
public class PersonVO {
	private String name;
	private int age;
	private String job;
}
