package com.pyeoni.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class LikeVO {
	private String productName; 
	private String promotion;
	private String brand;
	private String price;
	private String email;
}
