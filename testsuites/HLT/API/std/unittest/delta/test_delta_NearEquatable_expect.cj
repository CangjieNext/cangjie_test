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

import std.math.*

class Test_Delta <: NearEquatable<Test_Delta, Test_Delta> {
    Test_Delta(let x: Int64, let y: Int64, let z: Int64) {}

    public func isNear(obj: Test_Delta, delta!: Test_Delta): Bool {
        abs(x - obj.x) <= 2 * delta.x && abs(y - obj.y) <= 2 * delta.y && abs(z - obj.z) <= 2 * delta.z
    }
}

@Test
public class Test_Delta_Expect_Test_Delta {
    // @Expect(leftExpr, rightExpr, delta: deltaExpr)
    @TestCase
    func case_01(): Unit {
        var f_1: Test_Delta = Test_Delta(0, 1, 2)
        @Expect(Test_Delta(0, 1, 2), f_1, delta: Test_Delta(0, 0, 0))
        @Expect(Test_Delta(0, 1, 2), f_1, delta: Test_Delta(1, 1, 1))
    }

    // @Expect(leftExpr <comparison_operator> rightExpr, delta: deltaExpr)
    // comparison_operator : ==
    @TestCase
    func case_02(): Unit {
        @Expect(Test_Delta(0, 1, 2) == Test_Delta(-1, -1, -2), delta: Test_Delta(1, 2, 4))
    }

    // comparison_operator : !=
    @TestCase
    func case_03(): Unit {
        @Expect(Test_Delta(0, 1, 2) != Test_Delta(1, 1, 2), delta: Test_Delta(0, 0, 0))
    }
}
