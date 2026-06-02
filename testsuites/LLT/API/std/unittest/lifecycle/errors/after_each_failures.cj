/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan ERROR: 2
// ASSERT: scan PASSED: 0
// ASSERT: scan [ ERROR  ] CASE: x
// ASSERT: scan [ ERROR  ] CASE: y
// ASSERT: scan-2 After each step failed.

@Test
class AfterEachFailureFailsTheTest {
    @AfterEach
    public func l() {
        println("AFTER_EACH")
        throw Exception("__AFTER_EACH_FAILURE__")
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
AFTER_EACH
TEST_CASE_Y
AFTER_EACH
 */
