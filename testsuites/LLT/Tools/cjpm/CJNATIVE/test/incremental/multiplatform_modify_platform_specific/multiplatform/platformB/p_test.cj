// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

internal import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestPlatformB {
    @TestCase
    func testGetValue(): Unit {
        @Assert(getValue(), 200)
    }

    @TestCase
    func testDoubleValue(): Unit {
        @Assert(doubleValue(), 400)
    }

    @TestCase
    func testPlatformName(): Unit {
        @Assert(getPlatformName(), "little")
    }
}
