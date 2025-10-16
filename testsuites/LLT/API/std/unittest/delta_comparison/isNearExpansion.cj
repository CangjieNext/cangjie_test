/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output --no-color 2>&1 | compare %f
// ASSERT: scan PASSED: 2, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 0

import std.unittest.RelativeDelta

@Test
class T {

    @TestCase
    func notSupportedCmpType(): Unit {
        let e = @AssertThrows[IllegalArgumentException](isNearExpansion(1.1f16, 1.1f16, delta: 0.1f16, cmpType: "-_-"))
        @Expect(e.message == "Given '-_-' is not supported.")
    }

    @TestCase
    func notSupportedCmpTypeForIsNearEq(): Unit {
        let e = @AssertThrows[IllegalArgumentException](
            isNearExpansion(1.1f16, 1.1f16, delta: 0.1f16, cmpType: "/-|-\\", overloadHack: false))
        @Expect(e.message == "Trying to compare incomparable objects.")
    }
}
