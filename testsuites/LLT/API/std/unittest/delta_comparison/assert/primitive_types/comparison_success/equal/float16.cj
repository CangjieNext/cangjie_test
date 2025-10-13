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
// ASSERT: scan PASSED: 9, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

import std.unittest.RelativeDelta

@Test
class Test_Float16 {

    @TestCase
    func simple(): Unit {
        @Assert(1.1f16 == 1.2f16, delta: 0.11f16)
    }

    @TestCase
    func simpleThreeArgs(): Unit {
        @Assert(1.1f16, 1.2f16, delta: 0.11f16)
    }

    @TestCase
    func complex(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @Assert(1.1f16 + b * (c - a) - 2.0f16 == 1.3f16 * (a + a + b - c * a), delta: 0.35f16 + c * a)
    }

    @TestCase
    func complexThreeArgs(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @Assert(1.1f16 + b * (c - a) - 2.0f16, 1.3f16 * (a + a + b - c * a), delta: 0.35f16 + c * a)
    }

    @TestCase
    func simpleRelativeDelta(): Unit {
        @Assert(1.1f16 == 1.2f16, delta: RelativeDelta(absolute: 0.11f16, relative: 0.0001f16))
    }

    @TestCase
    func simpleRelativeDeltaThreeArgs(): Unit {
        @Assert(1.1f16, 1.2f16, delta: RelativeDelta(absolute: 0.11f16, relative: 0.0001f16))
    }

    @TestCase
    func complexRelativeDelta(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @Assert(1.1f16 + b * (c - a) - 2.0f16 == 1.3f16 * (a + a + b - c * a),
            delta: RelativeDelta(absolute: 0.35f16 + c * a, relative: 0.0001f16))
    }

    @TestCase
    func complexRelativeDeltaThreeArgs(): Unit {
        let a = 0.002f16
        let b = 0.3f16
        let c = 3.11f16
        @Assert(1.1f16 + b * (c - a) - 2.0f16, 1.3f16 * (a + a + b - c * a),
            delta: RelativeDelta(absolute: 0.35f16 + c * a, relative: 0.0001f16))
    }

    @TestCase
    func simpleRelativeDeltaMatters(): Unit {
        @Assert(65503.0004f16 == 65503.003f16, delta: RelativeDelta(absolute: 0.00001f16, relative: 0.000001f16))
    }
}
