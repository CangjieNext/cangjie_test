/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*

var n: Int64 = 0

@Test
public class test_bench_3 {
    @Bench[0]
    func case1(): Unit {
        n++
        @Assert(n, 100)
    }

    @Bench[1] //报错
    func case2(): Unit {
        n++
        @Assert(n, 100)
    }

    @Bench[10000]
    func case3(): Unit {
        n++
        @Assert(n, 100)
    }

    @TestCase
    func case4(): Unit {
        n++
        @Assert(n, 1)
    }
}
