/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum RGBColor {
    | Red | Green | Blue(UInt8)
}

enum RGBColor2<T> {
    Green(T)
}

enum RGBColor3<T,R> {
    Green(T,R)
}

func foo<T>(para: T) {
    var aaa: T = para
    let bbb: T = para
    aaa
}

func foo<T,R>(para: T,para2:R) {
    var aaa: T = para
    let bbb: R = para2
    aaa
}

main(): Int64 {
    let red = RGBColor.Red
    var rf = foo(red)
    var rf2 = foo(Blue(4))
    var rf3 = foo(Green(true))
    var rf4 = foo<RGBColor>(RGBColor.Red)
    var rf5 = foo(Green(1.1,2))
    var rf6 = foo(Green(1.1,2),Green(1.1,2))
    return 0
}
