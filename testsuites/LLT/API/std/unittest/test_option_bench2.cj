/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt | compare %f
// ASSERT: scan CASE: sayhi2
// ASSERT: scan CASE: sayhi3
// ASSERT: scan CASE: ttt
// ASSERT: scan-not sayhiBench0
// ASSERT: scan-not sayhiBench1

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class TestCCC {
    @TestCase
    func sayhi2(): Unit {
        println("case_hi2")
    }

    @TestCase
    func sayhi3(): Unit {
        println("case_hi3")
    }

    @Bench[10]
    @TestCase
    func ttt(): Unit {
        println("case_ttt")
    }

    @Bench[0]
    func sayhiBench0(): Unit {
        println("case_bench0")
    }

    @Bench[1]
    func sayhiBench1(): Unit {
        println("case_bench1")
    }
}
