/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.net.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class NetEdgeBranchTest {

    @TestCase
    func test_net_dummy(): Unit {
        @Assert(true)
    }
}
