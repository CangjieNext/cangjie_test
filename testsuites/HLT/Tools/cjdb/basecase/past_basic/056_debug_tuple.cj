/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main() {
    let str = "cangjie"
    let tuple1: (String, String) = ("String", "cangjie")
    var tuple2 = (b'a', b'b')
    let tuple3: (Rune, Rune, Rune, Rune) = (r'b', r'\\', r'\u{597d}', r'\"')
    var tuple4: (Bool, Bool, ) = (true, false )
    let tuple_F:(Float16,Float32,Float64) = (16.12,32642.32,64.621325947594)
    let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    let tuple_I1:(Int64,Int64) = (-8,16)
    let tuple_F1:(Float64,Float64) = (16.12,64.621325947594)
    var var1:IntNative = 10;
    var var2:UIntNative = 8;
    return 0
}
