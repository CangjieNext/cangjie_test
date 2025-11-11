/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

internal import std.unittest.*
import std.unittest.testmacro.*

let expected = "${Rune(0x0030)}\u{0030}"

@Test
class TestDemo {
    @TestCase
    func test(): Unit {
        @Assert(expected, "${Rune(0x0030)}\u{0030}")
    }
}

main(): Unit {}
