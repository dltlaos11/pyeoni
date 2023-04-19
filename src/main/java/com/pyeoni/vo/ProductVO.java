package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductVO {
	private String productName; 
	private String promotion;
	private String brand;
	private int price;
	private String kind;
	private String productImg;
}
