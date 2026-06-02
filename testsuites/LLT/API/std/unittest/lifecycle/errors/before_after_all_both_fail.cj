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
// ASSERT: scan Tests not run.
// ASSERT: scan Before all step failed.
// ASSERT: scan-not After all step failed.
// ASSERT: scan __BEFORE_ALL_FAILED__
// ASSERT: scan-not __AFTER_ALL_FAILED__
// ASSERT: scan-not TEST_CASE

@Test
class AfterAllSilentlyRunsIfBeforeAllFailed {
    @BeforeAll
    public func b() {
        println("BEFORE_ALL")
        throw Exception("__BEFORE_ALL_FAILED__")
    }

    @AfterAll
    func a() {
        println("AFTER_ALL")
        throw Exception("__AFTER_ALL_FAILED__")
    }

    @TestCase
    func testX() {
        println("TEST_CASE")
    }
}

/* SCAN-IN
BEFORE_ALL
AFTER_ALL
 */
