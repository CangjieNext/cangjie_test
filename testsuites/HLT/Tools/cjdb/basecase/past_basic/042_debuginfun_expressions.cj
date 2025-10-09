/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    //自增自减表达式 ：10/11
    var owni: Int64 = 5
    owni++ //6
    owni-- //5

    //算术表达式 ：14 count=11.000000
    var count = 6.0 + 10.0 - 3.0 * 4.0 + 6.6 / 1.1 + Float64(4 % 3)

    //关系表达式：17-22
    3 < 4 // return true
    3 <= 3 // return true
    3 > 4 // return false
    3 >= 3 // return true
    3.14 == 3.15 // return false
    3.14 != 3.15 // return true

    //位运算表达式：25/26
    var weip: Int8 = -30
    var weiq = weip << 2 // weiq = -120

    //逻辑表达式 30/31
    var expr1: Bool = false
    var expr2: Bool = true
    expr1 = false && expr1 || expr2 // return true.

    return owni
}









