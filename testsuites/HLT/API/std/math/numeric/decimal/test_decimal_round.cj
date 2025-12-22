/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.math.numeric.*
import std.math.*
import std.collection.*

@Test
class Test_decimal_round {
    @TestCase
    func test_decimal_round_01(): Unit {
        let n: Float16 = 1.5
        let round = round(n)
        @Expect(round, 2.000000)
    }

    @TestCase
    func test_decimal_round_02(): Unit {
        let n: Float16 = 1.5
        let round = round(n)
        @Expect(round, 2.000000)
        println(round)
    }

    @TestCase
    func test_decimal_round_03(): Unit {
        let n: Float16 = 1.5
        let round = round(n)
        @Expect(round, 2.000000)
    }
}
