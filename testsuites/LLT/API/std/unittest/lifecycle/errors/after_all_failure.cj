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
// ASSERT: scan PASSED: 2
// ASSERT: scan After all step failed.

@Test
class AfterAllShowsFailureSeparately {
    @AfterAll
    func a() {
        println("AFTER_ALL")
        throw Exception("__AFTER_ALL_FAILED__")
    }

    @TestCase
    func x() {
        println("TEST_CASE_X")
    }

    @TestCase
    func y() {
        println("TEST_CASE_Y")
    }
}

/* SCAN-IN
TEST_CASE_X
TEST_CASE_Y
AFTER_ALL
 */
