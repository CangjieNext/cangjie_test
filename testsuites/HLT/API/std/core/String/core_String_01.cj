/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*
import std.collection.*

@Test
class TestString_01 {
    @TestCase
    func test_isAscii(): Unit {
        var a0 = "Hello, World!"
        @Assert(a0.isAscii(), true)

        var a1 = ""
        @Assert(a1.isAscii(), true)

        var a2 = " "
        @Assert(a2.isAscii(), true)

        var a3 = "你好"
        @Assert(a3.isAscii(), false)

        var a4 = "，"
        @Assert(a4.isAscii(), false)

        var a5 = ","
        @Assert(a5.isAscii(), true)
    }

    @TestCase
    func test_lazySplit(): Unit {
        var a0 = "HelloWor ld!"
        var b = a0.lazySplit("W", removeEmpty: true)
        for (noumenon in b) {
            print(noumenon)
        }
    }

    @TestCase
    func test_join(): Unit {
        let a0: Array<String> = ["ni", "hao", "仓", "颉", "!"]
        let a1 = String.join(a0, delimiter: String.empty)
        @Assert(a1, "nihao仓颉!")
    }

    @TestCase
    func test_join1(): Unit {
        let a0: Array<String> = ["#", "￥", "仓", "颉", "!"]
        let a1 = String.join(a0, delimiter: String.empty)
        @Assert(a1, "#￥仓颉!")
    }

    @TestCase
    func test_join2(): Unit {
        let a0: Array<String> = []
        let a1 = String.join(a0, delimiter: String.empty)
        @Assert(a1, "")
    }
}
