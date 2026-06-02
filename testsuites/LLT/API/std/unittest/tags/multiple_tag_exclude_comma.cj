/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --exclude-tags=TagA,TagC --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamFB1
// ASSERT: scan-1 caseParamFB2
// ASSERT: scan-1 [ PASSED ] CASE: caseC
// ASSERT: scan-1 [ PASSED ] CASE: caseE
// ASSERT: scan-1 [ PASSED ] CASE: caseFA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamFB
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 4
// ASSERT: scan-1 SKIPPED: 9

@Test
@Tag[TagA]
func caseA() {
    @Fail("Should not run")
}

@Test
@Tag[TagA, TagB]
func caseB() {
    @Fail("Should not run")
}

@Test
@Tag[TagB]
func caseC() {
    @Assert(1, 1)
}

@Test
@Tag[TagC]
@Tag[TagB]
func caseD() {
    @Fail("Should not run")
}

@Test
func caseE() {
    @Assert(1, 1)
}

@Test
@Tag[TagA]
class SomeTestClassD {
    @TestCase
    func caseDA() {
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamDB(x: Int64) {
        @Fail("Should not run")
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
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamCB(x: Int64) {
        @Fail("Should not run")
    }
}

@Test
class SomeTestClassF {
    @TestCase
    func caseFA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamFB(x: Int64) {
        @Assert(1, 1)
        println("caseParamFB${x}")
    }
}
