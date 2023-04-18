package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class MemberVO {
	String email;
	int isAdmin;
	String userName;
	String password;
	int withDraw;
}
