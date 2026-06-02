/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan ERROR: 1
// ASSERT: scan PASSED: 0
// ASSERT: scan Before all step failed.

@Test
class AfterAllStillRunsIfBeforeFails {
    @BeforeAll
    func a() {
        println("__BEFORE_ALL__")
        throw Exception("failed")
    }

    @AfterAll
    func b() {
        println("__AFTER_ALL__")
    }

    @TestCase
    func x() {
        println("__TEST_CASE_X__")
    }

    @TestCase
    func y() {
        println("__TEST_CASE_Y__")
    }
}

/* SCAN-IN
__BEFORE_ALL__
__AFTER_ALL__
 */
