/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --filter=*ot,*Bo* --no-color 2>&1 | compare %f
// ASSERT: scan-1 caseParamBotB1
// ASSERT: scan-1 caseParamBotB2
// ASSERT: scan-1 caseParamPotB1
// ASSERT: scan-1 caseParamPotB2
// ASSERT: scan-1 caseParamBopB1
// ASSERT: scan-1 caseParamBopB2
// ASSERT: scan-1 [ PASSED ] CASE: caseBotA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamBotB
// ASSERT: scan-1 [ PASSED ] CASE: casePotA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamPotB
// ASSERT: scan-1 [ PASSED ] CASE: caseBopA
// ASSERT: scan-1 [ PASSED ] CASE: caseParamBopB
// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 6
// ASSERT: scan-1 SKIPPED: 3

@Test
class SomeTestClassTop {
    @TestCase
    func caseTopA() {
        @Fail("Should not run")
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamTopB(x: Int64) {
        @Fail("Should not run")
    }
}

@Test
class SomeTestClassBot {
    @TestCase
    func caseBotA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamBotB(x: Int64) {
        @Assert(1, 1)
        println("caseParamBotB${x}")
    }
}

@Test
class SomeTestClassPot {
    @TestCase
    func casePotA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamPotB(x: Int64) {
        @Assert(1, 1)
        println("caseParamPotB${x}")
    }
}

@Test
class SomeTestClassBop {
    @TestCase
    func caseBopA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseParamBopB(x: Int64) {
        @Assert(1, 1)
        println("caseParamBopB${x}")
    }
}

@Test
func caseC() {
    @Fail("Should not run")
}
