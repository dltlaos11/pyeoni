package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data


public class ProductHistoryVO {
	private String productName; 
	private String promotion;
	private String brand;
	private String price;
}
