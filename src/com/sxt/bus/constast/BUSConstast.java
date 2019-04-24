package com.sxt.bus.constast;

public interface BUSConstast {
    /**
     * 存放汽车常量
     */
    //出租单
    String  PREFIX_CZ="CZ";
    //检查单
    String  PREFIX_JC="JC";
    //出租单状态
    Integer RENT_FLAG_TRUE=1;
    Integer RENT_FLAG_FALSE=0;

    //汽车出租单
    Integer  RENT_ZERO=0;//不存在
    Integer  RENT_ONE=1;//存在已归还
    Integer  RENT_TWO=02;//存在，未归还

}
