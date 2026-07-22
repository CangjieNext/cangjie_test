/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

@Test
public class FloatPropertiesTest {
    @TestCase
    func test_float64_isInf(): Unit {
        @Expect(Float64.Inf.isInf())
        @Expect((-Float64.Inf).isInf())
        @Expect(!(1.0f64.isInf()))
        @Expect(!(0.0f64.isInf()))
    }

    @TestCase
    func test_float64_isNaN(): Unit {
        @Expect(Float64.NaN.isNaN())
        @Expect(!(1.0f64.isNaN()))
        @Expect(!(0.0f64.isNaN()))
        @Expect(!(Float64.Inf.isNaN()))
    }

    @TestCase
    func test_float64_isNormal(): Unit {
        @Expect(1.0f64.isNormal())
        @Expect(3.14f64.isNormal())
        @Expect(!Float64.NaN.isNormal())
        @Expect(!Float64.Inf.isNormal())
        @Expect(!0.0f64.isNormal())
    }

    @TestCase
    func test_float64_max(): Unit {
        @Expect(Float64.max(1.0f64, 2.0f64), 2.0f64)
        @Expect(Float64.max(3.0f64, 1.0f64), 3.0f64)
        @Expect(Float64.max(1.0f64, 1.0f64), 1.0f64)
        @Expect(Float64.max(1.0f64, 2.0f64, [3.0f64, 4.0f64]), 4.0f64)
        @Expect(Float64.max(-1.0f64, -2.0f64), -1.0f64)
    }

    @TestCase
    func test_float64_max_nan(): Unit {
        @Expect(Float64.max(Float64.NaN, 1.0f64).isNaN())
        @Expect(Float64.max(1.0f64, Float64.NaN).isNaN())
        @Expect(Float64.max(1.0f64, 2.0f64, [Float64.NaN]).isNaN())
    }

    @TestCase
    func test_float64_min(): Unit {
        @Expect(Float64.min(1.0f64, 2.0f64), 1.0f64)
        @Expect(Float64.min(3.0f64, 1.0f64), 1.0f64)
        @Expect(Float64.min(1.0f64, 1.0f64), 1.0f64)
        @Expect(Float64.min(1.0f64, 2.0f64, [0.5f64, 3.0f64]), 0.5f64)
        @Expect(Float64.min(-1.0f64, -2.0f64), -2.0f64)
    }

    @TestCase
    func test_float64_min_nan(): Unit {
        @Expect(Float64.min(Float64.NaN, 1.0f64).isNaN())
        @Expect(Float64.min(1.0f64, Float64.NaN).isNaN())
        @Expect(Float64.min(1.0f64, 2.0f64, [Float64.NaN]).isNaN())
    }

    @TestCase
    func test_float64_max_empty_others(): Unit {
        @Expect(Float64.max(5.0f64, 3.0f64, []), 5.0f64)
    }

    @TestCase
    func test_float64_min_empty_others(): Unit {
        @Expect(Float64.min(5.0f64, 3.0f64, []), 3.0f64)
    }

    @TestCase
    func test_float64_static_props(): Unit {
        @Expect(Float64.NaN.isNaN())
        @Expect(Float64.Inf.isInf())
        @Expect(Float64.Max > 0.0f64)
        @Expect(Float64.Min < 0.0f64)
        @Expect(Float64.MinNormal > 0.0f64)
        @Expect(Float64.MinDenormal > 0.0f64)
        @Expect(Float64.MinDenormal < Float64.MinNormal)
    }

    @TestCase
    func test_float32_isInf(): Unit {
        @Expect(Float32.Inf.isInf())
        @Expect((-Float32.Inf).isInf())
        @Expect(!(1.0f32.isInf()))
    }

    @TestCase
    func test_float32_isNaN(): Unit {
        @Expect(Float32.NaN.isNaN())
        @Expect(!(1.0f32.isNaN()))
        @Expect(!(Float32.Inf.isNaN()))
    }

    @TestCase
    func test_float32_isNormal(): Unit {
        @Expect(1.0f32.isNormal())
        @Expect(!Float32.NaN.isNormal())
        @Expect(!Float32.Inf.isNormal())
        @Expect(!0.0f32.isNormal())
    }

    @TestCase
    func test_float32_max_min(): Unit {
        @Expect(Float32.max(1.0f32, 2.0f32), 2.0f32)
        @Expect(Float32.min(1.0f32, 2.0f32), 1.0f32)
        @Expect(Float32.max(1.0f32, 2.0f32, [3.0f32]), 3.0f32)
        @Expect(Float32.min(1.0f32, 2.0f32, [0.5f32]), 0.5f32)
    }

    @TestCase
    func test_float32_max_nan(): Unit {
        @Expect(Float32.max(Float32.NaN, 1.0f32).isNaN())
        @Expect(Float32.min(Float32.NaN, 1.0f32).isNaN())
    }

    @TestCase
    func test_float32_static_props(): Unit {
        @Expect(Float32.NaN.isNaN())
        @Expect(Float32.Inf.isInf())
        @Expect(Float32.Max > 0.0f32)
        @Expect(Float32.Min < 0.0f32)
    }

    @TestCase
    func test_float16_isInf(): Unit {
        @Expect(Float16.Inf.isInf())
        @Expect((-Float16.Inf).isInf())
        @Expect(!(1.0f16.isInf()))
    }

    @TestCase
    func test_float16_isNaN(): Unit {
        @Expect(Float16.NaN.isNaN())
        @Expect(!(1.0f16.isNaN()))
    }

    @TestCase
    func test_float16_isNormal(): Unit {
        @Expect(1.0f16.isNormal())
        @Expect(!Float16.NaN.isNormal())
        @Expect(!Float16.Inf.isNormal())
        @Expect(!Float16(0).isNormal())
    }

    @TestCase
    func test_float16_max_min(): Unit {
        @Expect(Float16.max(1.0f16, 2.0f16), 2.0f16)
        @Expect(Float16.min(1.0f16, 2.0f16), 1.0f16)
        @Expect(Float16.max(1.0f16, 2.0f16, [3.0f16]), 3.0f16)
        @Expect(Float16.min(1.0f16, 2.0f16, [0.5f16]), 0.5f16)
    }

    @TestCase
    func test_float16_max_nan(): Unit {
        @Expect(Float16.max(Float16.NaN, 1.0f16).isNaN())
        @Expect(Float16.min(Float16.NaN, 1.0f16).isNaN())
    }

    @TestCase
    func test_float16_static_props(): Unit {
        @Expect(Float16.NaN.isNaN())
        @Expect(Float16.Inf.isInf())
        @Expect(Float16.Max > 0.0f16)
        @Expect(Float16.Min < 0.0f16)
    }
}
