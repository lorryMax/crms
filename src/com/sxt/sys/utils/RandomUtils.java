package com.sxt.sys.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 生成字符串的工具类
 *
 * @author LJH
 */
public class RandomUtils {

    //时间生成规则
    private static SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    private static SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
    private static SimpleDateFormat format3 = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");

    //生成随机数对象
    private static Random random = new Random();

    /**
     * 使用时间+四位随机数生成新的文件名
     *
     * @param oldName
     * @return
     */
    public static String createFileNameUseTime(String oldName) {
        //1,得到文件的后缀
        String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
        //2,得到时间的字符串
        String time = format1.format(new Date());
        //3,得到四位随机数
        Integer num = random.nextInt(9000) + 1000;
        //4,拼接
        return time + "_" + num + suffix;
    }

    /**
     * 使用uuid生成新的文件名
     *
     * @param oldName
     * @return
     */
    public static String createFileNameUseUUID(String oldName) {
        //1,得到文件的后缀
        String suffix = oldName.substring(oldName.lastIndexOf("."), oldName.length());
        //2,得到uuid
        String uuid = UUID.randomUUID().toString().replace("-", "");
        return uuid + suffix;
    }

    /**
     * 生成新的文件夹名字
     * 按照这个格式("yyyy-MM-dd")
     */
    public static String createDirFileNameUserTime() {
        String dirFileName = format2.format(new Date());
        return dirFileName;
    }

    /**
     * 生成出租单号CZ_YYYYDDmm_hhssmm_sss_4位随机数
     */
    public static String createRentID(String params) {
        //获取时间
        String data = format3.format(new Date());
        //获取随机数
        Integer i = random.nextInt(9000) + 1000;
        return params + "_" + data + "_" + i;
    }
/*
   public static void main(String[] args){
        System.out.println(createRentID("ZC"));
    }
*/


}