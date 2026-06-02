/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --dry-run 2>&1 | compare %f
// ASSERT: scan-1 TOTAL: 4, SKIPPED: 0
// ASSERT: scan-4 NORUN
// ASSERT: scan-not PASSED
// ASSERT: scan-not ERROR

import std.unittest.*
import std.unittest.testmacro.*

@TestTemplate
abstract class BaseTemplate {
    @BeforeEach
    func basetempBeforeEach() {
        println("basetemp before each")
    }

    @AfterEach
    func basetempAfterEach() {
        println("basetemp after each")
    }

    @TestCase
    func case01() {
        println("cangjietest1")
    }

    @TestCase
    func case02() {
        println("cangjietest2")
    }
}

@TestTemplate
abstract class Template <: BaseTemplate {
    @BeforeEach
    func tempBeforeEach() {
        println("temp before each")
    }

    @AfterEach
    func tempAfterEach() {
        println("temp after each")
    }

    @TestCase
    func case03() {
        println("cangjietest3")
    }
}

@Test
class Test_testtemplate_sequence_02 <: Template {
    @BeforeEach
    func testBeforeEach() {
        println("test before each")
    }

    @AfterEach
    func testAfterEach() {
        println("test after each")
    }

    @TestCase
    func case04() {
        println("cangjietest4")
    }
}
