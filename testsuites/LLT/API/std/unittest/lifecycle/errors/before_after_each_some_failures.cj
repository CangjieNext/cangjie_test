/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan PASSED: 1
// ASSERT: scan ERROR: 3
// ASSERT: scan [ PASSED ] CASE: w
// ASSERT: scan [ ERROR  ] CASE: z
// ASSERT: scan [ ERROR  ] CASE: x
// ASSERT: scan [ ERROR  ] CASE: y
// ASSERT: scan-2 After each step failed
// ASSERT: scan-1 Before each step failed

@Test
class X {
    @AfterEach
    public func l1(caseName: String) {
        println("__AFTER_EACH__")
        if (caseName == "x" || caseName == "y") {
            throw Exception("failed")
        }
    }

    @BeforeEach
    public func l2(caseName: String) {
        println("__BEFORE_EACH__")
        if (caseName == "z") {
            throw Exception("failed")
        }
    }

    @TestCase
    func x() {
        println("__X__")
    }

    @TestCase
    func y() {
        println("__Y__")
    }

    @TestCase
    func z() {
        println("__Z__")
    }

    @TestCase
    func w() {
        println("__W__")
    }
}

/* SCAN-IN
__BEFORE_EACH__
__X__
__AFTER_EACH__
__BEFORE_EACH__
__Y__
__AFTER_EACH__
__BEFORE_EACH__
__AFTER_EACH__
__BEFORE_EACH__
__W__
__AFTER_EACH__
 */
