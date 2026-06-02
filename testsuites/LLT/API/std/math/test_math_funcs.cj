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
 * Test description: Test the funcs for math
 */
@Test
class FuncTest {
    private static let PI = 3.141592653589793

    @TestCase
    func testAtan2(): Unit {
        // float64
        @Expect(atan2(1.0, 1.0) / PI * 180.0, 45.0)
        @Expect(atan2(1.0, -1.0) / PI * 180.0, 135.0)
        @Expect(atan2(-1.0, -1.0) / PI * 180.0, -135.0)
        @Expect(atan2(-1.0, 1.0) / PI * 180.0, -45.0)

        @Expect(atan2(0.0, -1.0) / PI * 180.0, 180.0)
        @Expect(atan2(-0.0, -1.0) / PI * 180.0, -180.0)
        @Expect(atan2(0.0, 1.0) / PI * 180.0, 0.0)
        @Expect(atan2(-0.0, 1.0) / PI * 180.0, -0.0)

        @Expect(atan2(-1.0, 0.0) / PI * 180.0, -90.0)
        @Expect(atan2(-1.0, -0.0) / PI * 180.0, -90.0)
        @Expect(atan2(1.0, 0.0) / PI * 180.0, 90.0)
        @Expect(atan2(1.0, -0.0) / PI * 180.0, 90.0)

        @Expect(atan2(0.0, 0.0) / PI * 180.0, 0.0)
        @Expect(atan2(-0.0, 0.0) / PI * 180.0, 0.0)
        @Expect(atan2(0.0, -0.0) / PI * 180.0, 180.0)
        @Expect(atan2(-0.0, -0.0) / PI * 180.0, -180.0)

        @Expect((atan2(-Float64.NaN, 1.0) / PI * 180.0).isNaN())
        @Expect((atan2(Float64.NaN, 1.0) / PI * 180.0).isNaN())
        @Expect((atan2(1.0, Float64.NaN) / PI * 180.0).isNaN())
        @Expect((atan2(1.0, -Float64.NaN) / PI * 180.0).isNaN())

        @Expect(atan2(-Float64.Inf, 1.0) / PI * 180.0, -90.0)
        @Expect(atan2(-Float64.Inf, -1.0) / PI * 180.0, -90.0)
        @Expect(atan2(Float64.Inf, 1.0) / PI * 180.0, 90.0)
        @Expect(atan2(Float64.Inf, -1.0) / PI * 180.0, 90.0)

        @Expect(atan2(1.0, -Float64.Inf) / PI * 180.0, 180.0)
        @Expect(atan2(-1.0, -Float64.Inf) / PI * 180.0, -180.0)
        @Expect(atan2(1.0, Float64.Inf) / PI * 180.0, 0.0)
        @Expect(atan2(-1.0, Float64.Inf) / PI * 180.0, 0.0)

        @Expect(atan2(Float64.Inf, Float64.Inf) / PI * 180.0, 45.0)
        @Expect(atan2(-Float64.Inf, Float64.Inf) / PI * 180.0, -45.0)
        @Expect(atan2(-Float64.Inf, -Float64.Inf) / PI * 180.0, -135.0)
        @Expect(atan2(Float64.Inf, -Float64.Inf) / PI * 180.0, 135.0)

        // float 32
        @Expect(atan2(Float32(1.0), Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(45.0))
        @Expect(atan2(Float32(1.0), Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(135.0))
        @Expect(atan2(Float32(-1.0), Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(-135.0))
        @Expect(atan2(Float32(-1.0), Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(-45.0))

        @Expect(atan2(Float32(0.0), Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(180.0))
        @Expect(atan2(Float32(-0.0), Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(-180.0))
        @Expect(atan2(Float32(0.0), Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(0.0))
        @Expect(atan2(Float32(-0.0), Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(-0.0))

        @Expect(atan2(Float32(-1.0), Float32(0.0)) / Float32(PI) * Float32(180.0), Float32(-90.0))
        @Expect(atan2(Float32(-1.0), Float32(-0.0)) / Float32(PI) * Float32(180.0), Float32(-90.0))
        @Expect(atan2(Float32(1.0), Float32(0.0)) / Float32(PI) * Float32(180.0), Float32(90.0))
        @Expect(atan2(Float32(1.0), Float32(-0.0)) / Float32(PI) * Float32(180.0), Float32(90.0))

        @Expect(atan2(Float32(0.0), Float32(0.0)) / Float32(PI) * Float32(180.0), Float32(0.0))
        @Expect(atan2(Float32(-0.0), Float32(0.0)) / Float32(PI) * Float32(180.0), Float32(0.0))
        @Expect(atan2(Float32(0.0), Float32(-0.0)) / Float32(PI) * Float32(180.0), Float32(180.0))
        @Expect(atan2(Float32(-0.0), Float32(-0.0)) / Float32(PI) * Float32(180.0), Float32(-180.0))

        @Expect((atan2(-Float32.NaN, Float32(1.0)) / Float32(PI) * Float32(180.0)).isNaN())
        @Expect((atan2(Float32.NaN, Float32(1.0)) / Float32(PI) * Float32(180.0)).isNaN())
        @Expect((atan2(Float32(1.0), Float32.NaN) / Float32(PI) * Float32(180.0)).isNaN())
        @Expect((atan2(Float32(1.0), -Float32.NaN) / Float32(PI) * Float32(180.0)).isNaN())

        @Expect(atan2(-Float32.Inf, Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(-90.0))
        @Expect(atan2(-Float32.Inf, Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(-90.0))
        @Expect(atan2(Float32.Inf, Float32(1.0)) / Float32(PI) * Float32(180.0), Float32(90.0))
        @Expect(atan2(Float32.Inf, Float32(-1.0)) / Float32(PI) * Float32(180.0), Float32(90.0))

        @Expect(atan2(Float32(1.0), -Float32.Inf) / Float32(PI) * Float32(180.0), Float32(180.0))
        @Expect(atan2(Float32(-1.0), -Float32.Inf) / Float32(PI) * Float32(180.0), Float32(-180.0))
        @Expect(atan2(Float32(1.0), Float32.Inf) / Float32(PI) * Float32(180.0), Float32(0.0))
        @Expect(atan2(Float32(-1.0), Float32.Inf) / Float32(PI) * Float32(180.0), Float32(0.0))

        @Expect(atan2(Float32.Inf, Float32.Inf) / Float32(PI) * Float32(180.0), Float32(45.0))
        @Expect(atan2(-Float32.Inf, Float32.Inf) / Float32(PI) * Float32(180.0), Float32(-45.0))
        @Expect(atan2(-Float32.Inf, -Float32.Inf) / Float32(PI) * Float32(180.0), Float32(-135.0))
        @Expect(atan2(Float32.Inf, -Float32.Inf) / Float32(PI) * Float32(180.0), Float32(135.0))

        // float16
        @Expect(atan2(Float16(1.0), Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(45.0))
        @Expect(atan2(Float16(1.0), Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(135.0))
        @Expect(atan2(Float16(-1.0), Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(-135.0))
        @Expect(atan2(Float16(-1.0), Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(-45.0))

        @Expect(atan2(Float16(0.0), Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(180.0))
        @Expect(atan2(Float16(-0.0), Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(-180.0))
        @Expect(atan2(Float16(0.0), Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(0.0))
        @Expect(atan2(Float16(-0.0), Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(-0.0))

        @Expect(atan2(Float16(-1.0), Float16(0.0)) / Float16(PI) * Float16(180.0), Float16(-90.0))
        @Expect(atan2(Float16(-1.0), Float16(-0.0)) / Float16(PI) * Float16(180.0), Float16(-90.0))
        @Expect(atan2(Float16(1.0), Float16(0.0)) / Float16(PI) * Float16(180.0), Float16(90.0))
        @Expect(atan2(Float16(1.0), Float16(-0.0)) / Float16(PI) * Float16(180.0), Float16(90.0))

        @Expect(atan2(Float16(0.0), Float16(0.0)) / Float16(PI) * Float16(180.0), Float16(0.0))
        @Expect(atan2(Float16(-0.0), Float16(0.0)) / Float16(PI) * Float16(180.0), Float16(0.0))
        @Expect(atan2(Float16(0.0), Float16(-0.0)) / Float16(PI) * Float16(180.0), Float16(180.0))
        @Expect(atan2(Float16(-0.0), Float16(-0.0)) / Float16(PI) * Float16(180.0), Float16(-180.0))

        @Expect((atan2(-Float16.NaN, Float16(1.0)) / Float16(PI) * Float16(180.0)).isNaN())
        @Expect((atan2(Float16.NaN, Float16(1.0)) / Float16(PI) * Float16(180.0)).isNaN())
        @Expect((atan2(Float16(1.0), Float16.NaN) / Float16(PI) * Float16(180.0)).isNaN())
        @Expect((atan2(Float16(1.0), -Float16.NaN) / Float16(PI) * Float16(180.0)).isNaN())

        @Expect(atan2(-Float16.Inf, Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(-90.0))
        @Expect(atan2(-Float16.Inf, Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(-90.0))
        @Expect(atan2(Float16.Inf, Float16(1.0)) / Float16(PI) * Float16(180.0), Float16(90.0))
        @Expect(atan2(Float16.Inf, Float16(-1.0)) / Float16(PI) * Float16(180.0), Float16(90.0))

        @Expect(atan2(Float16(1.0), -Float16.Inf) / Float16(PI) * Float16(180.0), Float16(180.0))
        @Expect(atan2(Float16(-1.0), -Float16.Inf) / Float16(PI) * Float16(180.0), Float16(-180.0))
        @Expect(atan2(Float16(1.0), Float16.Inf) / Float16(PI) * Float16(180.0), Float16(0.0))
        @Expect(atan2(Float16(-1.0), Float16.Inf) / Float16(PI) * Float16(180.0), Float16(0.0))

        @Expect(atan2(Float16.Inf, Float16.Inf) / Float16(PI) * Float16(180.0), Float16(45.0))
        @Expect(atan2(-Float16.Inf, Float16.Inf) / Float16(PI) * Float16(180.0), Float16(-45.0))
        @Expect(atan2(-Float16.Inf, -Float16.Inf) / Float16(PI) * Float16(180.0), Float16(-135.0))
        @Expect(atan2(Float16.Inf, -Float16.Inf) / Float16(PI) * Float16(180.0), Float16(135.0))
    }

    @TestCase
    func testFmod(): Unit {
        // float64
        @Expect(fmod(Float64(5.5), Float64(3.3)), Float64(2.2))
        @Expect(fmod(Float64(-5.5), Float64(3.3)), Float64(-2.2))
        @Expect(fmod(Float64(-5.5), Float64(-3.3)), Float64(-2.2))
        @Expect(fmod(Float64(5.5), Float64(-3.3)), Float64(2.2))

        @Expect(fmod(Float64(0.0), Float64(-3.3)), Float64(0.0))
        @Expect(fmod(Float64(0.0), Float64(3.3)), Float64(0.0))
        @Expect(fmod(Float64(-0.0), Float64(-3.3)), Float64(-0.0))
        @Expect(fmod(Float64(-0.0), Float64(3.3)), Float64(-0.0))

        @Expect(fmod(Float64.NaN, Float64(1.0)).isNaN())
        @Expect(fmod(-Float64.NaN, Float64(1.0)).isNaN())
        @Expect(fmod(Float64(1.0), Float64.NaN).isNaN())
        @Expect(fmod(Float64(1.0), -Float64.NaN).isNaN())

        @Expect(fmod(Float64(1.1), Float64.Inf), Float64(1.1))
        @Expect(fmod(Float64(1.1), -Float64.Inf), Float64(1.1))
        @Expect(fmod(Float64(-1.1), Float64.Inf), Float64(-1.1))
        @Expect(fmod(Float64(-1.1), -Float64.Inf), Float64(-1.1))

        @AssertThrows[IllegalArgumentException](fmod(Float64(1.0), Float64(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float64.Inf, Float64(0.0)))

        // float32
        @Expect(fmod(Float32(5.5), Float32(3.3)), Float32(2.2))
        @Expect(fmod(Float32(-5.5), Float32(3.3)), Float32(-2.2))
        @Expect(fmod(Float32(-5.5), Float32(-3.3)), Float32(-2.2))
        @Expect(fmod(Float32(5.5), Float32(-3.3)), Float32(2.2))

        @Expect(fmod(Float32(0.0), Float32(-3.3)), Float32(0.0))
        @Expect(fmod(Float32(0.0), Float32(3.3)), Float32(0.0))
        @Expect(fmod(Float32(-0.0), Float32(-3.3)), Float32(-0.0))
        @Expect(fmod(Float32(-0.0), Float32(3.3)), Float32(-0.0))

        @Expect(fmod(Float32.NaN, Float32(1.0)).isNaN())
        @Expect(fmod(-Float32.NaN, Float32(1.0)).isNaN())
        @Expect(fmod(Float32(1.0), Float32.NaN).isNaN())
        @Expect(fmod(Float32(1.0), -Float32.NaN).isNaN())

        @Expect(fmod(Float32(1.1), Float32.Inf), Float32(1.1))
        @Expect(fmod(Float32(1.1), -Float32.Inf), Float32(1.1))
        @Expect(fmod(Float32(-1.1), Float32.Inf), Float32(-1.1))
        @Expect(fmod(Float32(-1.1), -Float32.Inf), Float32(-1.1))

        @AssertThrows[IllegalArgumentException](fmod(Float32(1.0), Float32(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float32.Inf, Float32(0.0)))

        // float16
        @Expect(fmod(Float16(5.5), Float16(3.3)), Float16(2.2))
        @Expect(fmod(Float16(-5.5), Float16(3.3)), Float16(-2.2))
        @Expect(fmod(Float16(-5.5), Float16(-3.3)), Float16(-2.2))
        @Expect(fmod(Float16(5.5), Float16(-3.3)), Float16(2.2))

        @Expect(fmod(Float16(0.0), Float16(-3.3)), Float16(0.0))
        @Expect(fmod(Float16(0.0), Float16(3.3)), Float16(0.0))
        @Expect(fmod(Float16(-0.0), Float16(-3.3)), Float16(-0.0))
        @Expect(fmod(Float16(-0.0), Float16(3.3)), Float16(-0.0))

        @Expect(fmod(Float16.NaN, Float16(1.0)).isNaN())
        @Expect(fmod(-Float16.NaN, Float16(1.0)).isNaN())
        @Expect(fmod(Float16(1.0), Float16.NaN).isNaN())
        @Expect(fmod(Float16(1.0), -Float16.NaN).isNaN())

        @Expect(fmod(Float16(1.1), Float16.Inf), Float16(1.1))
        @Expect(fmod(Float16(1.1), -Float16.Inf), Float16(1.1))
        @Expect(fmod(Float16(-1.1), Float16.Inf), Float16(-1.1))
        @Expect(fmod(Float16(-1.1), -Float16.Inf), Float16(-1.1))

        @AssertThrows[IllegalArgumentException](fmod(Float16(1.0), Float16(0.0)))
        @AssertThrows[IllegalArgumentException](fmod(Float16.Inf, Float16(0.0)))
    }
}
