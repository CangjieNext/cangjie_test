// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package corrupted_unittest_cache

internal import std.unittest.*
import std.unittest.testmacro.*

@Test
public class CacheTest {
    @TestCase
    func testAnswer(): Unit {
        @Assert(answer(), 42)
    }
}
