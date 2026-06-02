/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

@Test
class Test_log10_1 {
    @TestCase
    func test_log10_01(): Unit {
        let x: Float16 = 1000.0
        let log10 = log10(x)
        @Expect(log10,3.000000)
    }

    @TestCase
    func test_log10_02(): Unit {
        let x: Float32 = 1000.0
        let log10 = log10(x)
        @Expect(log10,3.000000)
    }

    @TestCase
    func test__log10_03(): Unit {
        let x: Float64 = 1000.0
        let log10 = log10(x)
        @Expect(log10,3.000000)
    }
}
