/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import pkgs.*

var top_C_1 = Exter_C1(5, 6)
var top_Cg_1 = C1<Rune>(r'k')
var top_R_1 = Rectangle_ex(12,-69)
var top_Rg_1 = R1<Float32>(1.02)

main() {
    var cla_ins_1 = Exter_C1(100, 200)
    let cla_ins_2 = Exter_C1(-69, 360)
    var arr_mc_1 : Array<Exter_C1> = [top_C_1, cla_ins_2] //无泛型class
    var multiArr_m_cd1 : Array<Array<Exter_C1>> = [arr_mc_1,[cla_ins_1, cla_ins_2]]

    let cla_ins_g1 = C1<Rune>(r'F')
    var cla_ins_g2 = C1<Rune>(r'H')
    var arr_mc_g1 : Array<C1<Rune>> = [top_Cg_1, cla_ins_g1] //泛型class
    var multiArr_m_cgd1 : Array<Array<C1<Rune>>> = [arr_mc_g1,[cla_ins_g1, cla_ins_g2]]

    var re_ins_1 = Rectangle_ex(100, -102)
    var re_ins_2 = Rectangle_ex(-96, 235)
    var arr_mr_1 : Array<Rectangle_ex> = [top_R_1, re_ins_1] //非泛型struct
    var multiArr_m_rd1 : Array<Array<Rectangle_ex>> = [arr_mr_1,[re_ins_1, re_ins_1]]

    var re_ins_g1 = R1<Float32>(3.14)
    var re_ins_g2 = R1<Float32>(2.768)
    var arr_mr_g1 : Array<R1<Float32>> = [top_Rg_1, re_ins_g1] //泛型struct
    var multiArr_m_rgd1 : Array<Array<R1<Float32>>> = [arr_mr_g1,[re_ins_g1, re_ins_g2]]

    var enum_ins_1 = TimeUnit.Year(100)
    var enum_ins_2 = TimeUnit.Month(32,-64)
    var enum_ins_3 = TimeUnit.Year
    var arr_me_1 : Array<TimeUnit> = [enum_ins_1, enum_ins_3] //非泛型enum
    var multiArr_m_ed1 : Array<Array<TimeUnit>> = [arr_me_1,[enum_ins_1, enum_ins_2]]

    var enum_ins_g1 = TimeUnit_1<Int32>.Day
    var enum_ins_g2 = TimeUnit_1<Int32>.Year
    var arr_me_g1 : Array<TimeUnit_1<Int32>> = [enum_ins_g1, enum_ins_g2] //泛型enum
    var multiArr_m_egd1 : Array<Array<TimeUnit_1<Int32>>> = [arr_me_g1,[enum_ins_g1, TimeUnit_1<Int32>.Month]]



    return -1
}
