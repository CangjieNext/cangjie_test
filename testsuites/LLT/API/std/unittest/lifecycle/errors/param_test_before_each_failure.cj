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
// ASSERT: scan TOTAL: 2
// ASSERT: scan-2 Before each step failed.
// ASSERT: scan-not TEST_CASE_

@Test
class WholeBunchNotRunOnFailure {
    @BeforeEach
    func a() {
        println("__BEFORE_EACH__")
        throw Exception("failed")
    }

    @TestCase[a in [ 1, 2 ]]
    func x(a: Int) {
        println("TEST_CASE_X: ${a}")
    }

    @TestCase[a in [ 1, 2 ]]
    func y(a: Int) {
        println("TEST_CASE_Y: ${a}")
    }
}

/* SCAN-IN
__BEFORE_EACH__
__BEFORE_EACH__
 */
