/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan   [ ERROR  ] CASE: notFails1
// ASSERT: scan-1 [ PASSED ] CASE: notFails2
// ASSERT: scan-not [ ERROR  ] CASE: notFails2
// ASSERT: scan-1 [ FAILED ] CASE: failsOnce
// ASSERT: scan-not [ ERROR  ] CASE: failsOnce
// ASSERT: scan-2 [ FAILED ] CASE: failsTwice
// ASSERT: scan-not [ ERROR  ] CASE: failsTwice

@Test
class AfterEachOnlyReportedOnTestSuccess {
    @AfterEach
    func a(name: String) {
        println("__AFTER_EACH__: ${name}")
        if (name != "notFails2") {
            throw Exception("failed")
        }
    }

    @TestCase[a in [ 1, 2 ]]
    func failsOnce(a: Int) {
        println("TEST_CASE_1: ${a}")
        if (a == 2) {
            @Assert(false)
        }
    }

    @TestCase[a in [ 1, 2 ]]
    func failsTwice(a: Int) {
        println("TEST_CASE_2: ${a}")
        @Assert(false)
    }

    @TestCase[a in [ 1, 2 ]]
    func notFails1(a: Int) {
        println("TEST_CASE_3: ${a}")
    }

    @TestCase[a in [ 1, 2 ]]
    func notFails2(a: Int) {
        println("TEST_CASE_4: ${a}")
    }
}

/* SCAN-IN
TEST_CASE_1: 1
TEST_CASE_1: 2
__AFTER_EACH__: failsOnce
TEST_CASE_2: 1
TEST_CASE_2: 2
__AFTER_EACH__: failsTwice
TEST_CASE_3: 1
TEST_CASE_3: 2
__AFTER_EACH__: notFails1
TEST_CASE_4: 1
TEST_CASE_4: 2
__AFTER_EACH__: notFails2
 */
