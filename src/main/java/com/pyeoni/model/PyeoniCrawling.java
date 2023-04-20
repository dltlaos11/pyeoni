package com.pyeoni.model;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class PyeoniCrawling {
   public static void main(String[] args) throws IOException {
      String URL = "https://pyony.com/search/";
      /* document가져오는것 */
      Document doc = Jsoup.connect(URL).get(); 
      /* page 마지막 값 */ 
      String stringpage = doc.select(
            "body > div > div > div.col-md-12.col-lg-8 > div.pagination.justify-content-center.mt-2.mb-3 > ul > li:last-child > a")
            .attr("href"); 
      /* 숫자만 */ 
      int page = Integer.parseInt(stringpage.replaceAll("[^0-9]", "")); 
      
      for (int i = 1; i <= page; i++) {
    	 /* document가져오는것 */
         doc = Jsoup.connect(URL + "?page=" + i).get(); 
         /* 한줄씩 받아오는 것여기서 고른다 */ 
         Elements product = doc.select("div.col-md-6"); 
         getNames(doc, product);
      }
   }

   public static String[] getNames(Document doc, Elements products) {
      String[] names = new String[products.size()];
      
      for (int i = 0; i < products.size(); ++i) {
    	 /* name */
         String name = (String) products.get(i).select("div.card-body > div > strong").get(0).text();
         names[i] = name; 
         String stringprice = (String) products.get(i).select("div.card-body > div > i.fa-coins + span").get(0)
               .text();
         /* price */
         int price = Integer.parseInt(stringprice.replaceAll("[^0-9]", ""));  
         /* brand */ 
         String brand = (String) products.get(i).select("div small.font-weight-bold").get(0).text(); 
         /* kind */
         String kind = (String) products.get(i).select("div small.font-weight-bold").get(1).text(); 
         /* promotion */
         String promotion = "";
         promotion = products.get(i).select("div.card-body span.badge.bg-gs25.text-white").text();
         /* productImg */
         String productImg = products.get(i).select("img.prod_img").attr("src"); 
         
         if (promotion.equals("")) {
            promotion = products.get(i).select("div.card-body span.badge.bg-emart24.text-white").text();
         }
         if (promotion.equals("")) {
            promotion = products.get(i).select("div.card-body span.badge.bg-cu.text-white").text();
         }
         if (promotion.equals("")) {
            promotion = products.get(i).select("div.card-body span.badge.bg-seven.text-white").text();
         }
         if (promotion.equals("")) {
            promotion = products.get(i).select("div.card-body span.badge.bg-ministop.text-white").text();
         }
         if (promotion.equals("")) {
            promotion = products.get(i).select("div.card-body span.badge.bg-cspace.text-white").text();
         }
         /*
           행사 2+1, 1+1
           gs25 : span.badge.bg-gs25.text-white 
           emart : span.badge.bg-emart24.text-white
           cu : span.badge.bg-cu.text-white 
           711 : span.badge.bg-seven.text-white
           ministop : span.badge.bg-ministop.text-white 
           cspace : span.badge.bg-cspace.text-white   
		 */
         
         System.out.println(name + " " + price + " " + brand + " " + kind + " " + promotion + " " + productImg);
      }
      return names;
   }
}