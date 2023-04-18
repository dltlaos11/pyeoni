package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data


public class ProductHistoryVO {
	String productName; 
	String promotion;
	String brand;
	String price;
}
