/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --filter=SomeTestClass*.case*A,*.case*B --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamAB1
// ASSERT: scan-1 caseParamAB2
// ASSERT: scan-1 caseParamBB1
// ASSERT: scan-1 caseParamBB2
// ASSERT: scan-1 [ PASSED ] CASE: caseAA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamAB
// ASSERT: scan-1 [ PASSED ] CASE: caseBA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamBB
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 4
// ASSERT: scan-1 SKIPPED: 1

@Test
class SomeTestClassA {
    @TestCase
    func caseAA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamAB(x: Int64) {
        @Assert(1, 1)
        println("caseParamAB${x}")
    }
}

@Test
class SomeTestClassB {
    @TestCase
    func caseBA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamBB(x: Int64) {
        @Assert(1, 1)
        println("caseParamBB${x}")
    }
}

@Test
func caseC() {
    @Fail("Should not run")
}
