/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-0: %run %run_opt %n.%suffix %run_utest_opt %run_args
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 7, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

import std.unittest.RelativeDelta

@Test
class T {

    @TestCase
    func simpleEq(): Unit {
        let exprAbsoluteDelta = 1.1f16.isNear(1.2f16, delta: 0.11f16)
        let exprRelativeDelta = 1.1f16.isNear(1.2f16, delta: RelativeDelta(absolute: 0.01f16, relative: 0.1f16))
        @Assert(exprAbsoluteDelta && exprRelativeDelta)
    }

    @TestCase
    func simpleNotEq(): Unit {
        let exprAbsoluteDelta = !1.1f16.isNear(1.2f16, delta: 0.01f16)
        let exprRelativeDelta = !1.1f16.isNear(1.2f16, delta: RelativeDelta(absolute: 0.01f16, relative: 0.01f16))
        @Assert(exprAbsoluteDelta && exprRelativeDelta)
    }

    @TestCase
    func overflow(): Unit {
        let a = Float16.Min
        @Assert(!a.isNear(1.2f16, delta: 0.11f16))
    }

    @TestCase
    func firstArgNaN(): Unit {
        let a = Float16.NaN
        @AssertThrows[IllegalArgumentException](a.isNear(1.2f16, delta: 0.11f16))
    }

    @TestCase
    func secondArgNaN(): Unit {
        let a = Float16.NaN
        @AssertThrows[IllegalArgumentException](1.2f16.isNear(a, delta: 0.11f16))
    }

    @TestCase
    func firstArgInf(): Unit {
        let a = Float16.Inf
        @Assert(!a.isNear(1.2f16, delta: 0.11f16))
    }

    @TestCase
    func secondArgInf(): Unit {
        let a = Float16.Inf
        @Assert(!1.2f16.isNear(a, delta: 0.11f16))
    }
}