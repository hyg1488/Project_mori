package test;

import java.io.IOException;
import java.util.*;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import service.test.WordDAO;

public class test {

   public static void main(String[] args) {
         WordDAO dao = WordDAO.getInstance();
         int lv=5;
         List<String> word = getWord(lv);
         List<String> explain = getExplain(lv);
         
         
         dao.setword(word, explain, lv);
      }
   
   public static List<String> getWord(int level){
      List<String> list = getJp(level);

      List<String> word = new ArrayList<String>();
      

      for (String str : list) {
         String temp = str.replace("발음 재생", "");

         word.add(temp.substring(temp.indexOf("사]") + 2));
      }
      return word;

   }
   public static List<String> getExplain(int level){
      List<String> list = getJp(level);

      List<String> explain = new ArrayList<String>();
      

      for (String str : list) {
         String temp = str.replace("발음 재생", "");

         explain.add(temp.substring(temp.indexOf("사]") + 2, temp.length()));
      }
      return explain;

   }
   private static List<String> getJp(int level) {
      List<String> list = new ArrayList<String>();
      int page = 1;
      
      String chk = "0000";
      String mi = "";
      String first = "1";
      boolean out = false;

      while (page < 80) {
         String url = "https://ja.dict.naver.com/jlpt/level-" + level + "/parts-0/p" + page + ".nhn";
         Document doc = null;
         int num = 1;
         try {
            doc = Jsoup.connect(url).get();
         } catch (IOException e) {
            e.printStackTrace();
         }
         Elements element = doc.select("ul.lst");
         Iterator<Element> ie1 = element.select("li").iterator();
         try {

            while (true) {
               chk = ie1.next().text();
               if (num == 1) {
                  first = chk;
               }
               list.add(chk);
               if (first.equals(mi)) {
                  out = true;
                  break;
               }

               if (!ie1.hasNext())
                  break;
               num++;
            }

         } catch (NoSuchElementException e) {

         } finally {
            // System.out.println(first + " " + mi);
            page++;
            mi = first;
            if (out) {
               list.remove(list.size() - 1);
               break;
            }
         }

      }
      return list;
   }
}