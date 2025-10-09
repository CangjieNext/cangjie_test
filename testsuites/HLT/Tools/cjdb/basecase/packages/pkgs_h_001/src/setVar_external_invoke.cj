/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import pkgs.*

var top_C = Exter_C1(5, 6)
let test: Int32 = top_C.width
 var test1: Int8 = 1

main() {
    var newc = Exter_C1(100, 200)
    var main_Rect = newc.rectangle_Ins
    var main_c_area: Int32 = newc.area()
    var mian_year = newc.year
    main_c_area =  -89
    var val_4 = Exter_C1.f_static() //类中静态成员函数
    var val_5 = main_Rect.area() //struct中实例成员函数
    var val_6 = Rectangle_ex.f_static() //struct中静态成员函数
    var val_7 = Rectangle_ex.vc_2
    var val_8 = main_Rect.length
  //泛型class | struct |enum
    var val_ge1 = TimeUnit_1<Int32>.Day
    var val_ge2 = TimeUnit_1<Int32>.fun_s1(12)
    var val_ge3 = TimeUnit_1<Int32>.Year.f1(12)

    var val_gr1 = R1<Int32>.var_R1  //Int16->Int32
    var val_gr2 = R1<Int64>.fun_rs1(52)
    var val_gr3 = R1<Float32>(1.02).width
    var val_gr4 = R1<Float32>(1.02).fun_r1(0.005)

    var val_gc1 = C1<Rune>(r'k').fun_c1(r'g')
    var val_gc2 = C1<UInt32>(26).length
    var val_gc3 = C1<Int16>.par_s1
    var val_gc4 = C1<Bool>.fun_cs1(true)
    var fun_v1 = f_003(132)



    return -1
}

var top_v1 = Exter_C1.f_static()
var top_v2 = top_var_2

var val_f1 :Int32 = -1
func f_002(val_f1 :Int32 ,para! :Int32 = Exter_C1.f_static()){
    return val_f1+para

}
func f_003(val_f1 :Int32){
    f_002(21,para:-10)
 return val_f1

}
