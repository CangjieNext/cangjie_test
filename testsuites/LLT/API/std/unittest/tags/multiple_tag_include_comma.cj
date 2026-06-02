/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --include-tags=TagA,TagC --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamDB1
// ASSERT: scan-1 caseParamDB2
// ASSERT: scan-1 caseParamBB1
// ASSERT: scan-1 caseParamBB2
// ASSERT: scan-1 caseParamCB1
// ASSERT: scan-1 caseParamCB2
// ASSERT: scan-1 [ PASSED ] CASE: caseA
// ASSERT: scan-2 [ PASSED ] CASE: caseB
// ASSERT: scan-2 [ PASSED ] CASE: caseD
// ASSERT: scan-1 [ PASSED ] CASE: caseDA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamDB
// ASSERT: scan-1 [ PASSED ] CASE: caseBA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamBB
// ASSERT: scan-1 [ PASSED ] CASE: caseCA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamCB
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 9
// ASSERT: scan-1 SKIPPED: 4

@Test
@Tag[TagA]
func caseA() {
    @Assert(1, 1)
}

@Test
@Tag[TagA, TagB]
func caseB() {
    @Assert(1, 1)
}

@Test
@Tag[TagB]
func caseC() {
    @Fail("Should not run")
}

@Test
@Tag[TagC, TagB]
func caseD() {
    @Assert(1, 1)
}

@Test
func caseE() {
    @Fail("Should not run")
}

@Test
@Tag[TagA]
class SomeTestClassD {
    @TestCase
    func caseDA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamDB(x: Int64) {
        @Assert(1, 1)
        println("caseParamDB${x}")
    }
}

@Test
@Tag[TagB, TagC]
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
@Tag[TagA, TagC]
class SomeTestClassC {
    @TestCase
    func caseCA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamCB(x: Int64) {
        @Assert(1, 1)
        println("caseParamCB${x}")
    }
}

@Test
class SomeTestClassF {
    @TestCase
    func caseFA() {
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamFB(x: Int64) {
        @Fail("Should not run")
    }
}
