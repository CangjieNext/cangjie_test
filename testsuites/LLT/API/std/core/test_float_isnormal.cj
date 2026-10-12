/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output %run_args

@Test
class FloatIsNormalTest {
    /*
     * Test description: Test Float16/Float32/Float64 isNormal for denormal numbers
     * Test API:
     * extend Float16 <: Hashable { func isNormal(): Bool }
     * extend Float32 <: Hashable { func isNormal(): Bool }
     * extend Float64 <: Hashable { func isNormal(): Bool }
     */

    @TestCase
    func testFloat16IsNormal(): Unit {
        // denormal numbers return false
        @Expect(Float16.MinDenormal.isNormal(), false)
        @Expect((-Float16.MinDenormal).isNormal(), false)
        @Expect((Float16.MinDenormal * Float16(2.0)).isNormal(), false)
        // zero, infinity and NaN return false
        @Expect(Float16(0.0).isNormal(), false)
        @Expect(Float16.Inf.isNormal(), false)
        @Expect(Float16.NaN.isNormal(), false)
        // normal numbers return true
        @Expect(Float16(1.5).isNormal(), true)
        @Expect(Float16.Max.isNormal(), true)
        @Expect(Float16.Min.isNormal(), true)
        @Expect(Float16.MinNormal.isNormal(), true)
        @Expect((-Float16.MinNormal).isNormal(), true)
    }

    @TestCase
    func testFloat32IsNormal(): Unit {
        // denormal numbers return false
        @Expect(Float32.MinDenormal.isNormal(), false)
        @Expect((-Float32.MinDenormal).isNormal(), false)
        // zero, infinity and NaN return false
        @Expect(Float32(0.0).isNormal(), false)
        @Expect(Float32.Inf.isNormal(), false)
        @Expect(Float32.NaN.isNormal(), false)
        // normal numbers return true
        @Expect(Float32(1.5).isNormal(), true)
        @Expect(Float32.Max.isNormal(), true)
        @Expect(Float32.MinNormal.isNormal(), true)
    }

    @TestCase
    func testFloat64IsNormal(): Unit {
        // denormal numbers return false
        @Expect(Float64.MinDenormal.isNormal(), false)
        @Expect((-Float64.MinDenormal).isNormal(), false)
        // zero, infinity and NaN return false
        @Expect(Float64(0.0).isNormal(), false)
        @Expect(Float64.Inf.isNormal(), false)
        @Expect(Float64.NaN.isNormal(), false)
        // normal numbers return true
        @Expect(Float64(1.5).isNormal(), true)
        @Expect(Float64.Max.isNormal(), true)
        @Expect(Float64.MinNormal.isNormal(), true)
    }
}
