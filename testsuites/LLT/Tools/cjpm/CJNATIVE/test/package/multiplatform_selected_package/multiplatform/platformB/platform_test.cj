// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

internal import std.unittest.*
import std.unittest.testmacro.*

@Test
public class PlatformTest {
    @TestCase
    func testPlatformValue(): Unit {
        @Assert(platformValue(), 200)
    }
}
