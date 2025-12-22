/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not iOS) RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// (iOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan Expect Failed: `(UInt64(0) == 1u64)`
// ASSERT: scan Expect Failed: `(Int8(0) == - 1i8)`
// ASSERT: scan delta: -1.0000000827404e-11
// ASSERT: scan delta: 0.5
// ASSERT: scan delta: 2e-12
// ASSERT: scan delta: 3.14e+34
// ASSERT: scan f16_1: 61248.0
// ASSERT: scan delta: 61248.0

@Test
public class Test_AssertEqual_Num_UnEqual {
    @TestCase
    func test_assert_unequal_integer() {
        @Expect(UInt64(0), 1u64)
        @Expect(Int8(0), -1i8)
    }

    @TestCase
    func test_assert_float64_similar(): Unit {
        @Expect(1.00000000001, 1.00000000002)
        @Expect(1.00000000000, 0.49999999999)
        @Expect(0.000000000001, -0.000000000001)
    }

    @TestCase
    func test_assert_float(): Unit {
        let f32_1: Float32 = 3.14000001e34
        let f32_2: Float32 = 9.99999999e-34
        let f16_1: Float16 = 61234.12
        let f16_2: Float16 = -2e-13
        @Expect(f32_1, f32_2)
        @Expect(f16_1, f16_2)
    }
}
