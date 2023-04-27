package com.pyeoni.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.pyeoni.model.LikeServices;
import com.pyeoni.vo.LikeVO;

public class LikeAddController implements CommonControllerInterface {

   @Override
   public String execute(Map<String, Object> data) throws Exception {
      
      String method = (String)data.get("method");
      
      HttpServletRequest request = (HttpServletRequest)data.get("request");
      
      if(method.equals("POST")) {
         LikeVO like = makeLike(request);
         
         LikeServices service = new LikeServices();
         
         int result = service.addLike(like);
         int newlikenum = service.selectLike(like.getBrand(), like.getPrice(), like.getProductName(),like.getPromotion());
     	request.setAttribute("newlikenum", newlikenum);
         System.out.println("newlike" + newlikenum);
         if (result == 0 ) {
            /* 실패 */
            return "responseBody:" + newlikenum;
         }else {
            /* 성공 */
            return "responseBody:" + newlikenum;
         }
      }
      
      return "responseBody:false";
   }

   public static LikeVO makeLike(HttpServletRequest request) throws UnsupportedEncodingException {
      request.setCharacterEncoding("utf-8");
      
      String productName = request.getParameter("productName");
      String promotion = request.getParameter("promotion");
      String brand = request.getParameter("brand");
      int price = Integer.parseInt(request.getParameter("price"));
      String email = request.getParameter("email");
      
      LikeVO like = new LikeVO();
      
      like.setProductName(productName);
      like.setPromotion(promotion);
      like.setBrand(brand);
      like.setPrice(price);
      like.setEmail(email);
      
      return like;
   }

}