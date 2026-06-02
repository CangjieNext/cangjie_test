/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.net.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class Test {
    @TestCase
    func testQuirks(): Unit {
        // we should reject the leading zero in ip
        @Assert(IPAddress.resolve("00.0.0.0").size == 0)
        @Assert(IPAddress.resolve("0.01.0.0").size == 0)
        @Assert(IPAddress.resolve("0.0.010.0").size == 0)
        @Assert(IPAddress.resolve("0.0.0.00").size == 0)
    }
}
