/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f
// ASSERT: scan-1 PASSED: 3

@TestTemplate
abstract class BaseTemplate {
    @BeforeAll
    @AfterAll
    func allBaseBase() {
        println("_All method of base template")
    }

    @BeforeEach
    @AfterEach
    func eachBaseBase() {
        println("_Each method of base template")
    }

    @TestCase
    func testCaseBaseBase() {
        println("test case of base template")
    }
}

@TestTemplate
abstract class Template <: BaseTemplate {
    @BeforeAll
    @AfterAll
    func allBase() {
        println("_All method of template")
    }

    @BeforeEach
    @AfterEach
    func eachBase() {
        println("_Each method of template")
    }

    @TestCase
    func testCaseBase() {
        println("test case of template")
    }
}

@Test
class Tests <: Template {
    @BeforeAll
    @AfterAll
    func all() {
        println("_All method of actual")
    }

    @BeforeEach
    @AfterEach
    func each() {
        println("_Each method of actual")
    }

    @TestCase
    func testCase() {
        println("test case of actual")
    }
}

/* SCAN-IN
_All method of base template
_All method of template
_All method of actual
_Each method of base template
_Each method of template
_Each method of actual
test case of base template
_Each method of actual
_Each method of template
_Each method of base template
_Each method of base template
_Each method of template
_Each method of actual
test case of template
_Each method of actual
_Each method of template
_Each method of base template
_Each method of base template
_Each method of template
_Each method of actual
test case of actual
_Each method of actual
_Each method of template
_Each method of base template
_All method of actual
_All method of template
_All method of base template
 */
