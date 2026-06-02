// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Assigning a Lambda Expression to a Variable
var g1: (Int64, Int64) -> Int64 = {a, b => a + b}
var g2 = {a: Int64 => a}

// Lambda expression is used as a parameter
func f1(a1: (Int64) -> Int64): Int64 {
    a1(1)
}

// Lambda expression is used as a return value
func f2(): (Int64) -> Int64 {
    {a: Int64 => a}
}

// Lambda expressions support immediate invocation
let r1 = {a: Int64, b: Int64 => a + b}(1, 2) // r1 = 3
let r2 = {=> 123}() // r2 = 123

var c = 3
main(): Int64 {
    f1({a2 => a2 + 10})
    f2()(2)
    g2(2)
    let l1 = {a: Int64, b: Int64 => a + b}
    var l2 = {a: Int64 => a + c}
    l1(1, 2)
    l2(2)
}
