// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func run(): Int64 {
    var s1: String = "hello Rune lang "
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var s2 = String(chs)
    var s3 = "hello Rune lang \u{5324}"
    var s4 = s1.substring(0, 5)

    var res1 = s1 != s2
    var res2 = s3 != "hello Rune lang \u{5233}"
    var res3 = "hello Rune lang \u{5233}" != s3
    var res4 = "hello" != s4 + " "
    var res5 = "" != " "
    var res6 = " " != "\n"
    var res7 = "a\n" != """
a\r"""
    var res8 = "a\n" != #"a\n"#

    if (res1 && res2 && res3 && res4 && res5 && res6 && res7 && res8) {
        return 0
    }
    return 1
}

func case01() {
    var a = "abc"
    var b = 1
    if ("${foo(a)}" != "abc") {
        return 1
    }
    if ("${Aoo(a).a}" != "abc") {
        return 1
    }
    if ("${b + b}" != "2") {
        return 1
    }
    if ({=> "abc"}() != "abc") {
        return 1
    }
    if ("${{=> "abc"}()}" != "abc") {
        return 1
    }
    return 0
}

func foo(x: String) {
    return x
}

class Aoo {
    public var a: String = ""
    public init(x: String) {
        a = x
    }
}

main(): Int64 {
    let s1 = "hello world"
    let s2 = "test_\${s1}"
    let s3 = "hello world"
    let s4 = "test_\${" + s1
    let s5 = "worl"
    let s6 = "test_${"${s1 + "d"}"}"
    let s7 = "world"
    let s8 = "hello ${if (s1 == "") { "world ${s1}" } else { s1 }}"
    print(s2)
    return 0
}
