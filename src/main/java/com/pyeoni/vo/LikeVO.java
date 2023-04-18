package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class LikeVO {
	String productName; 
	String promotion;
	String brand;
	String price;
	String email;
}
