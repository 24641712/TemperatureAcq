package cn.lnu.util;

import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 将数据库中获取的日期数据转换成
 * 指定的日期格式
 * @Author：ccl
 * @Date：19-3-24 下午12:33
 */
@Component
public class FormatDate {

     /*
      *Thu May 16 00:00:00 CST 2019
      * @param null
      * @return 
      */
    public static String format(String dateStr){
            String[] aStrings = dateStr.split(" ");
            Date date = new Date();
            // 5
            if (aStrings[1].equals("Jan")) {
                aStrings[1] = "01";
            }
            if (aStrings[1].equals("Feb")) {
                aStrings[1] = "02";
            }
            if (aStrings[1].equals("Mar")) {
                aStrings[1] = "03";
            }
            if (aStrings[1].equals("Apr")) {
                aStrings[1] = "04";
            }
            if (aStrings[1].equals("May")) {
                aStrings[1] = "05";
            }
            if (aStrings[1].equals("Jun")) {
                aStrings[1] = "06";
            }
            if (aStrings[1].equals("Jul")) {
                aStrings[1] = "07";
            }
            if (aStrings[1].equals("Aug")) {
                aStrings[1] = "08";
            }
            if (aStrings[1].equals("Sep")) {
                aStrings[1] = "09";
            }
            if (aStrings[1].equals("Oct")) {
                aStrings[1] = "10";
            }
            if (aStrings[1].equals("Nov")) {
                aStrings[1] = "11";
            }
            if (aStrings[1].equals("Dec")) {
                aStrings[1] = "12";
            }
        return aStrings[5] + "-" + aStrings[1] + "-" + aStrings[2];
    }



}
