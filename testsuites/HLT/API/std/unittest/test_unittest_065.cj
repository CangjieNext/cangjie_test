/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output 
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt --bench %run_args | compare %f
// ASSERT: scan getOutput

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*

var n: Int64 = 0

@Test
public class test_bench_2 {
    @Bench[0]
    @TestCase
    func case1(): Unit {
        n++
    }

    @Bench[1]
    @TestCase
    func case2(): Unit {
        sleep(Duration.millisecond * 100)
        n++
        @Assert(n >= 1)
        println("getOutput")
    }

    @Bench[10]
    @TestCase
    func case3(): Unit {
        n++
        @Assert(n >= 10)
    }
}
