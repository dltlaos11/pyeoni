package com.pyeoni.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class CommentVO {
	int commentId;
	String content;
	Date commentDate;
	String productName; 
	String promotion;
	String brand;
	int price;
	String email;
}
