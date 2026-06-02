/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import pkgs.*


var map_top_1 : HashMap<Int32, Rune> = HashMap<Int32, Rune>([(209,r'N'), (-120,r'L'),(736,r'Y')])
var map_top_2 : HashMap<Float32, Float64> = HashMap<Float32, Float64>([(12.15654,1.7755560), (2.457563,1.2545836),(5.6,35.45778794)])
var map_top_empty_uint32 : HashMap<UInt32, UInt32> = HashMap<UInt32, UInt32>()

main() {
       var newc = Cla_exter_1(120,"help me!")
       var main_rect = rec_exter_1(10,12)

       var val_1 :HashMap<Int32, Rune> =newc.map_c_1 //Cla_exter_1成员变量
       var val_2 :HashMap<Int32, Rune> =newc.fun_c1(map_top_1) //Cla_exter_1成员函数
       var val_3 :HashMap<Int32, Rune> =Cla_exter_1.fun_cs1(map_top_1,r'J') //Cla_exter_1静态函数

       var val_4 :HashMap<Int32, Rune> =map_top_char //跨包_主调 ：top_level
       var val_5 :HashMap<UInt32, UInt32> = map_top_empty_uint32 //本包：top_level  空map

       var val_6 :HashMap<Int32, Rune> =main_rect.map_rm //struct成员变量
       var fun_pmap_1 :HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(12,17750), (23,1836),(56,3594)])
       var fun_pmap_2 :HashMap<UInt16, Int64> = HashMap<UInt16, Int64>([(132,17), (29,1136),(52,3729)])
       var fun_pmap_3 : HashMap<Int64, Bool> = HashMap<Int64, Bool>([(19,true), (-160,false),(76,true)])
       var val_7 :HashMap<UInt16, Int64> =main_rect.fun_r1(fun_pmap_1,par_2:fun_pmap_2) //实例成员函数
       var val_8 :HashMap<Int64, Bool> =rec_exter_1.fun_rs1(64,true,fun_pmap_3) //静态函数
     //  var val_9 :HashMap<UInt16, Int64> =main_rect.fun_r1(fun_pmap_1) //实例成员函数 参数默认值




    return -1
}
