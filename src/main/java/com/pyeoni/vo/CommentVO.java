package com.pyeoni.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class CommentVO {
	private int commentId;
	private String content;
	private String commentDate;
	private String productName; 
	private String promotion;
	private String brand;
	private int price;
	private String email;
}
