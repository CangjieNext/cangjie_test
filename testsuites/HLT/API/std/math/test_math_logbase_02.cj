/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

import std.math.*

@Test
class Test_math_logbase_02 {
    @TestCase
    func test_logbase_float32_01(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(-1),Float32(9)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_02(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(0),Float32(9)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_03(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(1),Float32(-100)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_04(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(1),Float32(0)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_05(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(1),Float32(1)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_06(): Unit {
        let e = @AssertThrows[IllegalArgumentException](logBase(Float32(-100),Float32(1)))
        @Expect(e.message, "The input parameter is invalid. Please enter a correct parameter.")
    }

    @TestCase
    func test_logbase_float32_07(): Unit {
        let logbase = logBase(Float32(32.0), Float32(2.0))
        @Expect(logbase, 5.0)
    }

    @TestCase
    func test_logbase_float32_08(): Unit {
        let logbase = logBase(Float32(32.234), Float32(2.12))
        @Expect(logbase, 4.62196922)
    }
}
