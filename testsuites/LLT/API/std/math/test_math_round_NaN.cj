/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

/**
 * Test description: Test round with NaN input
 */
@Test
class RoundNaNTest {
    @TestCase
    func testRoundFloat16NaN(): Unit {
        @Expect(round(Float16.NaN).isNaN())
        @Expect(round(-Float16.NaN).isNaN())
    }

    @TestCase
    func testRoundFloat32NaN(): Unit {
        @Expect(round(Float32.NaN).isNaN())
        @Expect(round(-Float32.NaN).isNaN())
    }

    @TestCase
    func testRoundFloat64NaN(): Unit {
        @Expect(round(Float64.NaN).isNaN())
        @Expect(round(-Float64.NaN).isNaN())
    }
}