/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

@Test
public class Test_Delta_PowerAssert_Float64 {
    // @PowerAssert(leftExpr, rightExpr, delta: deltaExpr)
    @TestCase
    func case_01(): Unit {
        var f_1: Float64 = 0.0
        var f_2: Float64 = f_1 - f_1
        // test accuracy
        @PowerAssert(1.0f64, 1.0f64, delta: 0.0)
        @PowerAssert(-1.00000000000f64, -1.00000000001f64, delta: 0.000000000011f64)
        @PowerAssert(3.1415926f64, 3.1415926f64, delta: f_2)

        // test extreme value
        @PowerAssert(1.0f64, 1.0f64, delta: 4.9406564584124654e-324)
        @PowerAssert(4.9406564584124654e-324, -4.9406564584124654e-324, delta: 2.5 * 4.9406564584124654e-324)
        let _delta = (Float64.Max / 1.001)
        @PowerAssert(1.7976931348623157e308, 0.01 * 1.7976931348623157e308, delta: _delta) // √
        @PowerAssert(1.7976931348623157e308, 0.01 * 1.7976931348623157e308, delta: (Float64.Max / 1.001))

        // test number order
        @PowerAssert(1.0e307, -1.0e307, delta: 1.0e308)
        @PowerAssert(-1.0e307, 1.0e307, delta: 1.0e308)
    }

    // @PowerAssert(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)
    // comparison_operator : ==
    @TestCase
    func case_02(): Unit {
        @PowerAssert(1.0f64 == 1.0f64, delta: 0.00)
        @PowerAssert(3.14f64 == 3.15f64, delta: 1.001 * 0.01f64)
        @PowerAssert(1.0f64 == 1.0f64, delta: 3.14f64 - 3.14f64)
        @PowerAssert(3.14f64 == -3.14f64, delta: 6.29f64)
        @PowerAssert(-0.01f64 == 0.02f64, delta: 0.04f64)
    }

    // comparison_operator : !=
    @TestCase
    func case_03(): Unit {
        @PowerAssert(3.14f64 != 3.15f64, delta: 0.99 * 0.01f64)
        @PowerAssert(3.14f64 != -3.14f64, delta: 6.27f64)
        @PowerAssert(-0.01f64 != 0.02f64, delta: 0.99 * 0.03f64)
    }

    // comparison_operator : <
    @TestCase
    func case_04(): Unit {
        @PowerAssert(1.0f64 < 1.01f64, delta: 0.99 * 0.01f64)
        @PowerAssert(3.14f64 < 3.15f64, delta: 0.99 * 0.01f64)
        @PowerAssert(-0.02f64 < -0.01f64, delta: 0.99 * 0.01f64)
        // @PowerAssert(-1.7976931348623157e308 < 1.7976931348623157e308, delta: Float64.Max / 1.01)
    }

    // comparison_operator : >
    @TestCase
    func case_05(): Unit {
        @PowerAssert(1.01f64 > 1.0f64, delta: 0.99 * 0.01f64)
        @PowerAssert(3.15f64 > 3.14f64, delta: 0.99 * 0.01f64)
        @PowerAssert(-0.01f64 > -0.02f64, delta: 0.99 * 0.01f64)
        // @PowerAssert(1.7976931348623157e308 > -1.7976931348623157e308, delta: Float64.Max / 1.01)
    }

    // comparison_operator : <=
    @TestCase
    func case_06(): Unit {
        @PowerAssert(1.0f64 <= 1.01f64, delta: 0.99 * 0.01f64)
        @PowerAssert(3.14f64 <= 3.15f64, delta: 0.99 * 0.01f64)
        @PowerAssert(-0.02f64 <= -0.01f64, delta: 0.99 * 0.01f64)
        // @PowerAssert(-1.7976931348623157e308 <= 1.7976931348623157e308, delta: Float64.Max / 1.01)

        @PowerAssert(1.0f64 <= 1.01f64, delta: 1.01 * 0.01f64)
        @PowerAssert(3.14f64 <= 3.15f64, delta: 1.01 * 0.01f64)
        @PowerAssert(-0.02f64 <= -0.01f64, delta: 1.01 * 0.01f64)
        @PowerAssert(1.01f64 <= 1.0f64, delta: 1.01 * 0.01f64)
        @PowerAssert(3.15f64 <= 3.14f64, delta: 1.01 * 0.01f64)
        @PowerAssert(-0.01f64 <= -0.02f64, delta: 1.01 * 0.01f64)
    }

    // comparison_operator : >=
    @TestCase
    func case_07(): Unit {
        @PowerAssert(1.01f64 >= 1.0f64, delta: 0.99 * 0.01f64)
        @PowerAssert(3.15f64 >= 3.14f64, delta: 0.99 * 0.01f64)
        @PowerAssert(-0.01f64 >= -0.02f64, delta: 0.99 * 0.01f64)
        // @PowerAssert(1.7976931348623157e308 >= -1.7976931348623157e308, delta: Float64.Max / 1.01)

        @PowerAssert(1.0f64 >= 1.01f64, delta: 1.01 * 0.01f64)
        @PowerAssert(3.14f64 >= 3.15f64, delta: 1.01 * 0.01f64)
        @PowerAssert(-0.02f64 >= -0.01f64, delta: 1.01 * 0.01f64)
        @PowerAssert(1.01f64 >= 1.0f64, delta: 1.01 * 0.01f64)
        @PowerAssert(3.15f64 >= 3.14f64, delta: 1.01 * 0.01f64)
        @PowerAssert(-0.01f64 >= -0.02f64, delta: 1.01 * 0.01f64)
    }
}
