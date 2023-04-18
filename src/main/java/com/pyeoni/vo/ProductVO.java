package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class ProductVO {
	String productName; 
	String promotion;
	String brand;
	int price;
	String kind;
	String productImg;
}
