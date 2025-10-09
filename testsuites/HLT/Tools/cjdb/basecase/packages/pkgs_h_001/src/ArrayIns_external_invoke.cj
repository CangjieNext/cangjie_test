/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import pkgs.*

var top_C_1 = Exter_Cla1(5, 6)
var top_Cg_1 = C1<Rune>(r'k')
var top_R_1 = Rectangle_ex1(12,-69)
var top_Rg_1 = R1<Float32>(1.02)

main() {
    var cla_ins_1 = Exter_Cla1(100, 200)
    let cla_ins_2 = Exter_Cla1(-69, 360)
    var arr_mc_1 : Array<Exter_Cla1> = [top_C_1, cla_ins_2] //无泛型class
    var multiArr_m_cd1 : Array<Array<Exter_Cla1>> = [arr_mc_1,[cla_ins_1, cla_ins_2]]

    let cla_ins_g1 = C1<Rune>(r'F')
    var cla_ins_g2 = C1<Rune>(r'H')
    var arr_mc_g1 : Array<C1<Rune>> = [top_Cg_1, cla_ins_g1] //泛型class
    var multiArr_m_cgd1 : Array<Array<C1<Rune>>> = [arr_mc_g1,[cla_ins_g1, cla_ins_g2]]

    let cla_ins_sub_1 = cla_sub_1(-32)
    var cla_ins_sub_2 = cla_sub_1(23)
    var arr_mc_sub_1 : Array<cla_sub_1> = [cla_ins_sub_1, cla_ins_sub_2] //非泛型继承class
    var multiArr_sub_cd1 : Array<Array<cla_sub_1>> = [arr_mc_sub_1,arr_mc_sub_1]

    let cla_ins_sub_g1 = cla_sub_2<Bool>(true)
    var cla_ins_sub_g2 = cla_sub_2<Bool>(false)
    var arr_mc_sub_g1 : Array<cla_sub_2<Bool>> = [cla_ins_sub_g1, cla_ins_sub_g2] //泛型继承class
    var multiArr_sub_cdg1 : Array<Array<cla_sub_2<Bool>>> = [arr_mc_sub_g1,arr_mc_sub_g1]

    var re_ins_1 = Rectangle_ex1(100, -102)
    var re_ins_2 = Rectangle_ex1(-96, 235)
    var arr_mr_1 : Array<Rectangle_ex1> = [top_R_1, re_ins_1] //非泛型struct
    var multiArr_m_rd1 : Array<Array<Rectangle_ex1>> = [arr_mr_1,[re_ins_1, re_ins_1]]

    var re_ins_g1 = R1<Float32>(3.14)
    var re_ins_g2 = R1<Float32>(2.768)
    var arr_mr_g1 : Array<R1<Float32>> = [top_Rg_1, re_ins_g1] //泛型struct
    var multiArr_m_rgd1 : Array<Array<R1<Float32>>> = [arr_mr_g1,[re_ins_g1, re_ins_g2]]

    var enum_ins_1 = Times.Year(100)
    var enum_ins_2 = Times.Month(32,-64)
    var enum_ins_3 = Times.Year
    var arr_me_1 : Array<Times> = [enum_ins_1, enum_ins_3] //非泛型enum
    var multiArr_m_ed1 : Array<Array<Times>> = [arr_me_1,[enum_ins_1, enum_ins_2]]

    var enum_ins_g1 = TimeUnit_e<Int32>.Day
    var enum_ins_g2 = TimeUnit_e<Int32>.Year
    var arr_me_g1 : Array<TimeUnit_e<Int32>> = [enum_ins_g1, enum_ins_g2] //泛型enum
    var multiArr_m_egd1 : Array<Array<TimeUnit_e<Int32>>> = [arr_me_g1,[enum_ins_g1, TimeUnit_e<Int32>.Month]]

     var arr_external_1 = cla_ins_1.arrayInt32_d
     var arr_external_2 = cla_ins_1.fc_001(arr_external_1,arr_external_1)
     var arr_external_top = arr




    return -1
}
