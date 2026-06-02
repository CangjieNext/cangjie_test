/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

internal import std.unittest.*
import std.unittest.testmacro.*

func getRes(a: String, b: String): String {
    var c: String = a + b
    return c
}

@Test
class TestA {
    @TestCase
    public func caseA01(): Unit {
        var expect: String = "HelloWorld"
        var actual: String = "Bye"
        expectEqual("", "", expect, actual)
    }

    @TestCase
    public func caseA02(): Unit {
        var expect: String = "CangJie"
        expectEqual("", "", expect, getRes("Cang", "Jie"))
    }

    @TestCase
    public func caseA03(): Unit {
        var expect: String = "CangJie, Hello"
        expectEqual("", "", expect, getRes("CangJie", ", Hello"))
    }
}

main(): Unit {}
