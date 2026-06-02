/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --filter=caseC --no-color 2>&1 | compare %f
// ASSERT: scan-1 [ PASSED ] CASE: caseC
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 1
// ASSERT: scan-1 SKIPPED: 4

@Test
class SomeTestClassA {
    @TestCase
    func caseAA() {
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamAB(x: Int64) {
        @Fail("Should not run")
    }
}

@Test
class SomeTestClassB {
    @TestCase
    func caseBA() {
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamBB(x: Int64) {
        @Fail("Should not run")
    }
}

@Test
func caseC() {
    @Assert(1, 1)
}
