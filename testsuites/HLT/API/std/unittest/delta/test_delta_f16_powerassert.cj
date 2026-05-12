/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

@Test
public class Test_Delta_PowerAssert_Float16 {
    // @PowerAssert(leftExpr, rightExpr, delta: deltaExpr)
    @TestCase
    func case_01(): Unit {
        var f_1: Float16 = 0.0f16
        var f_2: Float16 = f_1 - f_1
        // test accuracy
        @PowerAssert(1.0f16, 1.0f16, delta: 0.0f16)
        @PowerAssert(-1.00000000000f16, -1.00000000001f16, delta: 0.000000000011f16)
        @PowerAssert(3.1415926f16, 3.1415926f16, delta: f_2)

        // test extreme value
        @PowerAssert(1.0f16, 1.0f16, delta: 6.1035e-5f16)
        @PowerAssert(6.1035e-5f16, -6.1035e-5f16, delta: 2.5 * 6.1035e-5f16)
        @PowerAssert(6.5504e4f16, 0.01 * 6.5504e4f16, delta: Float16.Max / 1.001)

        // test number order
        @PowerAssert(1.0e3f16, -1.0e3f16, delta: 1.0e4)
        @PowerAssert(-1.0e3f16, 1.0e3f16, delta: 1.0e4)
    }

    // @PowerAssert(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)
    // comparison_operator : ==
    @TestCase
    func case_02(): Unit {
        @PowerAssert(1.0f16 == 1.0f16, delta: 0.00f16)
        @PowerAssert(3.14f16 == 3.15f16, delta: 1.001 * 0.01f16)
        @PowerAssert(1.0f16 == 1.0f16, delta: 3.14f16 - 3.14f16)
        @PowerAssert(3.14f16 == -3.14f16, delta: 6.29f16)
        @PowerAssert(-0.01f16 == 0.02f16, delta: 0.04f16)
    }

    // comparison_operator : !=
    @TestCase
    func case_03(): Unit {
        @PowerAssert(3.14f16 != 3.15f16, delta: 0.95 * 0.01f16)
        @PowerAssert(3.14f16 != -3.14f16, delta: 6.27f16)
        @PowerAssert(-0.01f16 != 0.02f16, delta: 0.95 * 0.03f16)
    }

    // comparison_operator : <
    @TestCase
    func case_04(): Unit {
        @PowerAssert(1.0f16 < 1.01f16, delta: 0.95 * 0.01f16)
        @PowerAssert(3.14f16 < 3.15f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-0.02f16 < -0.01f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-6.5504e4f16 < 6.5504e4f16, delta: Float16.Max / 1.01f16)
    }

    // comparison_operator : >
    @TestCase
    func case_05(): Unit {
        @PowerAssert(1.01f16 > 1.0f16, delta: 0.95 * 0.01f16)
        @PowerAssert(3.15f16 > 3.14f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-0.01f16 > -0.02f16, delta: 0.95 * 0.01f16)
        @PowerAssert(6.5504e4f16 > -6.5504e4f16, delta: Float16.Max / 1.01f16)
    }

    // comparison_operator : <=
    @TestCase
    func case_06(): Unit {
        @PowerAssert(1.0f16 <= 1.01f16, delta: 0.95 * 0.01f16)
        @PowerAssert(3.14f16 <= 3.15f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-0.02f16 <= -0.01f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-6.5504e4f16 <= 6.5504e4f16, delta: Float16.Max / 1.01f16)

        @PowerAssert(1.0f16 <= 1.01f16, delta: 1.01 * 0.01f16)
        @PowerAssert(3.14f16 <= 3.15f16, delta: 1.01 * 0.01f16)
        @PowerAssert(-0.02f16 <= -0.01f16, delta: 1.01 * 0.01f16)
        @PowerAssert(1.01f16 <= 1.0f16, delta: 1.01 * 0.01f16)
        @PowerAssert(3.15f16 <= 3.14f16, delta: 1.01 * 0.01f16)
        @PowerAssert(-0.01f16 <= -0.02f16, delta: 1.01 * 0.01f16)
    }

    // comparison_operator : >=
    @TestCase
    func case_07(): Unit {
        @PowerAssert(1.01f16 >= 1.0f16, delta: 0.95 * 0.01f16)
        @PowerAssert(3.15f16 >= 3.14f16, delta: 0.95 * 0.01f16)
        @PowerAssert(-0.01f16 >= -0.02f16, delta: 0.95 * 0.01f16)
        @PowerAssert(6.5504e4f16 >= -6.5504e4f16, delta: Float16.Max / 1.01f16)

        @PowerAssert(1.0f16 >= 1.01f16, delta: 1.01 * 0.01f16)
        @PowerAssert(3.14f16 >= 3.15f16, delta: 1.01 * 0.01f16)
        @PowerAssert(-0.02f16 >= -0.01f16, delta: 1.01 * 0.01f16)
        @PowerAssert(1.01f16 >= 1.0f16, delta: 1.01 * 0.01f16)
        @PowerAssert(3.15f16 >= 3.14f16, delta: 1.01 * 0.01f16)
        @PowerAssert(-0.01f16 >= -0.02f16, delta: 1.01 * 0.01f16)
    }
}
