/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var varInt: Int8 = -128
var varUInt: UInt64 = 1
var varfloat: Float64 = 1.00
var varunit: Unit = ()
var varBool: Bool = true
var varchar: Rune = '5'
//不可变变量
let varlet: Int64 = 9

class A {
    static var varInt: Int8 = -128
    static var varUInt: UInt64 = 1
    static var varfloat: Float64 = 1.00
    static var varunit: Unit = ()
    static var varBool: Bool = true
    static var varchar: Rune = '5'
    //不可变变量
    static let varlet: Int64 = 9
}

struct B {
    static var varInt: Int8 = -128
    static var varUInt: UInt64 = 1
    static var varfloat: Float64 = 1.00
    static var varunit: Unit = ()
    static var varBool: Bool = true
    static var varchar: Rune = '5'
    //不可变变量
    static let varlet: Int64 = 9
}

main() {
    0
}
