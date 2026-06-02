/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamB1
// ASSERT: scan-1 caseParamB2
// ASSERT: scan-1 [ PASSED ] CASE: caseA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamB
// ASSERT: scan-1 [ PASSED ] CASE: caseC
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 3
// ASSERT: scan-1 SKIPPED: 0

@Test
class TestClassA {
    @TestCase
    func caseA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamB(x: Int64) {
        println("caseParamB${x}")
        @Assert(1, 1)
    }
}

@Test
func caseC() {
    @Assert(1, 1)
}
