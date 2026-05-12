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
public class Test_Delta_PowerAssert_Float32 {
    // @PowerAssert(leftExpr, rightExpr, delta: deltaExpr)
    @TestCase
    func case_01(): Unit {
        var f_1: Float32 = 0.0f32
        var f_2: Float32 = f_1 - f_1
        // test accuracy
        @PowerAssert(1.0f32, 1.0f32, delta: 0.0f32)
        @PowerAssert(-1.00000000000f32, -1.00000000001f32, delta: 0.000000000011f32)
        @PowerAssert(3.1415926f32, 3.1415926f32, delta: f_2)

        // test extreme value
        @PowerAssert(1.0f32, 1.0f32, delta: 1.1754943508222875e-38f32)
        @PowerAssert(1.1754943508222875e-38f32, -1.1754943508222875e-38f32, delta: 2.5 * 1.1754943508222875e-38f32)
        @PowerAssert(3.4028234663852886e38f32, 0.01 * 3.4028234663852886e38f32, delta: Float32.Max / 1.001)

        // test number order
        @PowerAssert(1.0e37f32, -1.0e37f32, delta: 1.0e38)
        @PowerAssert(-1.0e37f32, 1.0e37f32, delta: 1.0e38)
    }

    // @PowerAssert(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)
    // comparison_operator : ==
    @TestCase
    func case_02(): Unit {
        @PowerAssert(1.0f32 == 1.0f32, delta: 0.00f32)
        @PowerAssert(3.14f32 == 3.15f32, delta: 1.001 * 0.01f32)
        @PowerAssert(1.0f32 == 1.0f32, delta: 3.14f32 - 3.14f32)
        @PowerAssert(3.14f32 == -3.14f32, delta: 6.29f32)
        @PowerAssert(-0.01f32 == 0.02f32, delta: 0.04f32)
    }

    // comparison_operator : !=
    @TestCase
    func case_03(): Unit {
        @PowerAssert(3.14f32 != 3.15f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.14f32 != -3.14f32, delta: 6.27f32)
        @PowerAssert(-0.01f32 != 0.02f32, delta: 0.99 * 0.03f32)
    }

    // comparison_operator : <
    @TestCase
    func case_04(): Unit {
        @PowerAssert(1.0f32 < 1.01f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.14f32 < 3.15f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-0.02f32 < -0.01f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-3.4028234663852886e38f32 < 3.4028234663852886e38f32, delta: Float32.Max / 1.01f32)
    }

    // comparison_operator : >
    @TestCase
    func case_05(): Unit {
        @PowerAssert(1.01f32 > 1.0f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.15f32 > 3.14f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-0.01f32 > -0.02f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.4028234663852886e38f32 > -3.4028234663852886e38f32, delta: Float32.Max / 1.01f32)
    }

    // comparison_operator : <=
    @TestCase
    func case_06(): Unit {
        @PowerAssert(1.0f32 <= 1.01f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.14f32 <= 3.15f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-0.02f32 <= -0.01f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-3.4028234663852886e38f32 <= 3.4028234663852886e38f32, delta: Float32.Max / 1.01f32)

        @PowerAssert(1.0f32 <= 1.01f32, delta: 1.01 * 0.01f32)
        @PowerAssert(3.14f32 <= 3.15f32, delta: 1.01 * 0.01f32)
        @PowerAssert(-0.02f32 <= -0.01f32, delta: 1.01 * 0.01f32)
        @PowerAssert(1.01f32 <= 1.0f32, delta: 1.01 * 0.01f32)
        @PowerAssert(3.15f32 <= 3.14f32, delta: 1.01 * 0.01f32)
        @PowerAssert(-0.01f32 <= -0.02f32, delta: 1.01 * 0.01f32)
    }

    // comparison_operator : >=
    @TestCase
    func case_07(): Unit {
        @PowerAssert(1.01f32 >= 1.0f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.15f32 >= 3.14f32, delta: 0.99 * 0.01f32)
        @PowerAssert(-0.01f32 >= -0.02f32, delta: 0.99 * 0.01f32)
        @PowerAssert(3.4028234663852886e38f32 >= -3.4028234663852886e38f32, delta: Float32.Max / 1.01f32)

        @PowerAssert(1.0f32 >= 1.01f32, delta: 1.01 * 0.01f32)
        @PowerAssert(3.14f32 >= 3.15f32, delta: 1.01 * 0.01f32)
        @PowerAssert(-0.02f32 >= -0.01f32, delta: 1.01 * 0.01f32)
        @PowerAssert(1.01f32 >= 1.0f32, delta: 1.01 * 0.01f32)
        @PowerAssert(3.15f32 >= 3.14f32, delta: 1.01 * 0.01f32)
        @PowerAssert(-0.01f32 >= -0.02f32, delta: 1.01 * 0.01f32)
    }
}
