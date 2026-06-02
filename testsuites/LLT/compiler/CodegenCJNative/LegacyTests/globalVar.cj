// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

let i: Int32 = 3
var g_x: Int32 = 3
var sss: String = "111"

func add(x: Int32, y: Int32): Int32 {
    return x + y
}

var g_f: (Int32, Int32) -> Int32 = add
var g_call = add(1, 2)

func foo1(a: Int32, b: Int32): Int32 {
    g_x = a
    sss = "hello"
    let c: Int32 = g_f(g_x, b) + i
    return c + g_call
}

func codegenUnitTest(): Int32 {
    return foo1(2, 3)
}

var a: Array<Rune> = [r'a', r'b']
var s1 = a[0]
var s2 = a[1]
var b = if (true) {}
var c = while (false) {}
var d = do {} while (false)
var e = [1, 2, 3]
var f = for (i in e) {
    i
}

class C {
    static let m2 = if (true) {}
}

interface I {}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 11) {
        return 0
    } else {
        return -1
    }
}
