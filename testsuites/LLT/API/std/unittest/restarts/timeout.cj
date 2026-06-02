/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color | compare %f
// ASSERT: scan PASSED: 2, SKIPPED: 0, ERROR: 0
// ASSERT: scan FAILED: 3

import std.unittest.*
import std.unittest.testmacro.*
import std.process.Process

@Test
@Timeout[Duration.second]
func sleepTest(): Unit {
    sleep(Duration.second * 5)
}

@Test
@Timeout[Duration.second]
func passingTest(): Unit {
    // Do nothing
}

@Test
class Tests1 {
    @TestCase
    @Timeout[Duration.second]
    func sleepTest(): Unit {
        sleep(Duration.second * 5)
    }

    @TestCase
    @Timeout[Duration.second]
    func failingTest(): Unit {
        @Assert(1, 2)
    }

    @TestCase
    func passingTest(): Unit {
        // Do nothing
    }
}
