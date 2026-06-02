/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --include-tags=Unittest,Property --exclude-tags=Property+Slow,Slow+Fast --no-color 2>&1 | compare %f
// ASSERT: scan-1 [ PASSED ] CASE: testA 
// ASSERT: scan-1 [ PASSED ] CASE: testB 
// ASSERT: scan-1 [ PASSED ] CASE: caseAB 
// ASSERT: scan-1 [ PASSED ] CASE: caseBA 
// ASSERT: scan-1 [ PASSED ] CASE: caseBB

// ASSERT: scan-not [ FAILED ]
// ASSERT: scan-1 PASSED: 5
// ASSERT: scan-1 SKIPPED: 6

@Test
@Tag[Slow, Unittest]
func testA() {
    @Assert(1, 1)
}

@Test
@Tag[Fast, Unittest]
func testB() {
    @Assert(1, 1)
}

@Test
// Whaaat
@Tag[Fast]
@Tag[Slow]
func testC() {
    @Fail("Should not run")
}

@Test
@Tag[Property, Slow]
func testD() {
    @Fail("Should not run")
}

@Test
func testE() {
    @Assert(1, 1)
}

@Test
@Tag[Property]
class PropertyTestClassA {
    @TestCase
    @Tag[Slow]
    func caseAA() {
        @Fail("Should not run")
    }

    @TestCase
    @Tag[Fast]
    func caseAB() {
        @Assert(1, 1)
    }
}

@Test
@Tag[Unittest]
class UnitTestClassA {
    @TestCase
    @Tag[Slow]
    func caseBA() {
        @Assert(1, 1)
    }

    @TestCase[x in [ 1, 2 ]]
    func caseBB() {
        @Assert(1, 1)
    }
}

@Test
class SomeTestClassC {
    @TestCase
    func caseCA() {
        @Assert(1, 1)
    }

    @TestCase
    func caseCB() {
        @Assert(1, 1)
    }
}
