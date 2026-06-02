/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamAB1
// ASSERT: scan-1 caseParamAB2
// ASSERT: scan-1 [ PASSED ] CASE: caseAA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamAB
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 2
// ASSERT: scan-1 SKIPPED: 0

@Test
@Tag[TagA]
class SomeTestClassA {
    @TestCase
    @Tag[TagB]
    func caseAA() {
        @Assert(1, 1)
    }

    @Tag[TagD]
    @TestCase[x in [ 1, 2 ]]
    func caseParamAB(x: Int64) {
        @Assert(1, 1)
        println("caseParamAB${x}")
    }
}
