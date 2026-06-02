/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --death-aware --no-color | compare %f
// ASSERT: scan-1 PASSED: 1, SKIPPED: 0, ERROR: 1
// ASSERT: scan-1 FAILED: 0
// ASSERT: scan-1 executed after crash of parametrized

import std.unittest.*
import std.process.*

@Test
public class TestParametrizedTests {
    @TestCase[x in [ 1, 2, 0, 3, 4 ]]
    func crashInTheMiddle(x: Int64): Unit {
        if (x == 3) {
            Process.current.exit(42)
        }
        @Expect(0, x)
    }

    @TestCase
    func continuedAfterCrash(): Unit {
        println("executed after crash of parametrized")
    }
}
