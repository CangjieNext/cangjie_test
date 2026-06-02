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
 * Test description: Test the hyperbolic functions with NaN input validation
 */
@Test
class HyperbolicNaNTest {
    @TestCase
    func testSinh(): Unit {
        // float64 - NaN input test
        @Expect(sinh(Float64.NaN).isNaN())
        @Expect(sinh(-Float64.NaN).isNaN())

        // float64 - normal values
        @Expect(sinh(0.0), 0.0)
        @Expect(sinh(1.0) > 1.0)
        @Expect(sinh(-1.0) < -1.0)

        // float32 - NaN input test
        @Expect(sinh(Float32.NaN).isNaN())
        @Expect(sinh(-Float32.NaN).isNaN())

        // float32 - normal values
        @Expect(sinh(Float32(0.0)), Float32(0.0))
        @Expect(sinh(Float32(1.0)) > Float32(1.0))
        @Expect(sinh(Float32(-1.0)) < Float32(-1.0))

        // float16 - NaN input test
        @Expect(sinh(Float16.NaN).isNaN())
        @Expect(sinh(-Float16.NaN).isNaN())

        // float16 - normal values
        @Expect(sinh(Float16(0.0)), Float16(0.0))
        @Expect(sinh(Float16(1.0)) > Float16(1.0))
        @Expect(sinh(Float16(-1.0)) < Float16(-1.0))
    }

    @TestCase
    func testCosh(): Unit {
        // float64 - NaN input test
        @Expect(cosh(Float64.NaN).isNaN())
        @Expect(cosh(-Float64.NaN).isNaN())

        // float64 - normal values
        @Expect(cosh(0.0), 1.0)
        @Expect(cosh(1.0) > 1.0)
        @Expect(cosh(-1.0) > 1.0)

        // float32 - NaN input test
        @Expect(cosh(Float32.NaN).isNaN())
        @Expect(cosh(-Float32.NaN).isNaN())

        // float32 - normal values
        @Expect(cosh(Float32(0.0)), Float32(1.0))
        @Expect(cosh(Float32(1.0)) > Float32(1.0))
        @Expect(cosh(Float32(-1.0)) > Float32(1.0))

        // float16 - NaN input test
        @Expect(cosh(Float16.NaN).isNaN())
        @Expect(cosh(-Float16.NaN).isNaN())

        // float16 - normal values
        @Expect(cosh(Float16(0.0)), Float16(1.0))
        @Expect(cosh(Float16(1.0)) > Float16(1.0))
        @Expect(cosh(Float16(-1.0)) > Float16(1.0))
    }

    @TestCase
    func testTanh(): Unit {
        // float64 - NaN input test
        @Expect(tanh(Float64.NaN).isNaN())
        @Expect(tanh(-Float64.NaN).isNaN())

        // float64 - normal values
        @Expect(tanh(0.0), 0.0)
        @Expect(tanh(1.0) > 0.0)
        @Expect(tanh(-1.0) < 0.0)

        // float32 - NaN input test
        @Expect(tanh(Float32.NaN).isNaN())
        @Expect(tanh(-Float32.NaN).isNaN())

        // float32 - normal values
        @Expect(tanh(Float32(0.0)), Float32(0.0))
        @Expect(tanh(Float32(1.0)) > Float32(0.0))
        @Expect(tanh(Float32(-1.0)) < Float32(0.0))

        // float16 - NaN input test
        @Expect(tanh(Float16.NaN).isNaN())
        @Expect(tanh(-Float16.NaN).isNaN())

        // float16 - normal values
        @Expect(tanh(Float16(0.0)), Float16(0.0))
        @Expect(tanh(Float16(1.0)) > Float16(0.0))
        @Expect(tanh(Float16(-1.0)) < Float16(0.0))
    }

    @TestCase
    func testAsinh(): Unit {
        // float64 - NaN input test
        @Expect(asinh(Float64.NaN).isNaN())
        @Expect(asinh(-Float64.NaN).isNaN())

        // float64 - normal values
        @Expect(asinh(0.0), 0.0)
        @Expect(asinh(1.0) > 0.0)
        @Expect(asinh(-1.0) < 0.0)

        // float32 - NaN input test
        @Expect(asinh(Float32.NaN).isNaN())
        @Expect(asinh(-Float32.NaN).isNaN())

        // float32 - normal values
        @Expect(asinh(Float32(0.0)), Float32(0.0))
        @Expect(asinh(Float32(1.0)) > Float32(0.0))
        @Expect(asinh(Float32(-1.0)) < Float32(0.0))

        // float16 - NaN input test
        @Expect(asinh(Float16.NaN).isNaN())
        @Expect(asinh(-Float16.NaN).isNaN())

        // float16 - normal values
        @Expect(asinh(Float16(0.0)), Float16(0.0))
        @Expect(asinh(Float16(1.0)) > Float16(0.0))
        @Expect(asinh(Float16(-1.0)) < Float16(0.0))
    }
}
