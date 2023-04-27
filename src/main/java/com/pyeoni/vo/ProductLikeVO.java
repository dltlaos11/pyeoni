package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductLikeVO {
	private String productName; 
	private String promotion;
	private String brand;
	private int price;
	private String kind;
	private String productImg;
	private int likenum;
	private int check;
}
