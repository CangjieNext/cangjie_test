/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import pkgs.*


var arrayInt32 : Array<Int32> = [321, 322, 10,120]
var set_int32 : HashSet<Int32> = HashSet<Int32>([-74,9,-6954])
var set_top_empty_uint32 : HashSet<UInt32> = HashSet<UInt32>()
var set_top_uint32 : HashSet<UInt32> = HashSet<UInt32>([32,126,5,6978,13354])


main() {
       var newc = Class_sub_exter1()
       var main_rect = Rec_r1(10,12)

       var val_1 :HashSet<Int32> =newc.sub_cp1 //父类Exter_Cla_1成员变量
       var val_2 :HashSet<UInt32> =newc.fun_c1(set_top_uint32)  // 父类Exter_Cla_1成员函数 取参数默认值
       var val_3 :HashSet<UInt8> = Class_sub_exter1.fun_cs1(21)  //父类Exter_Cla_1静态函数

       var val_4 :HashSet<UInt32> =newc.set_sub_uint32 //子类Class_sub_exter1成员变量
       var val_5 :HashSet<UInt32> =newc.fun_sub_c1(32) //子类Class_sub_exter1成员函数
       var val_6 :HashSet<UInt8> =Class_sub_exter1.fun_sub_cs1(18) //子类Class_sub_exter1静态函数

       var val_7 :HashSet<Int32> = set_int32 //跨包_主调 ：top_level
       var val_8 :HashSet<UInt32> = set_top_empty_uint32 //本包：top_level  空set

       var val_9 :HashSet<Bool> =main_rect.set_rbool //struct成员变量
       var fun_pset_1 :HashSet<Int32> =HashSet<Int32>([158,531,-597])
       var val_10 :HashSet<Int32> =main_rect.fun_r1(set_int32,par_2:fun_pset_1) //实例成员函数
       var val_11 :HashSet<Int16> =Rec_r1.fun_rs1(16) //静态函数
    // var val_12 :HashSet<Int32> =main_rect.fun_r1(set_int32) //实例成员函数 参数默认值




    return -1
}
