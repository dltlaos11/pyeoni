package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class MemberVO {
	private String email;
	private int isAdmin;
	private String userName;
	private String password;
	private int withDraw;
}
