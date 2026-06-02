/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-begin basetemp before each
// ASSERT: scan-next temp before each
// ASSERT: scan-next test before each
// ASSERT: scan-next cangjietest1
// ASSERT: scan-next test after each
// ASSERT: scan-next temp after each
// ASSERT: scan-next basetemp after each
// ASSERT: scan-next basetemp before each
// ASSERT: scan-next temp before each
// ASSERT: scan-next test before each
// ASSERT: scan-next cangjietest2
// ASSERT: scan-next test after each
// ASSERT: scan-next temp after each
// ASSERT: scan-next basetemp after each
// ASSERT: scan-next basetemp before each
// ASSERT: scan-next temp before each
// ASSERT: scan-next test before each
// ASSERT: scan-next cangjietest3
// ASSERT: scan-next test after each
// ASSERT: scan-next temp after each
// ASSERT: scan-next basetemp after each
// ASSERT: scan-next basetemp before each
// ASSERT: scan-next temp before each
// ASSERT: scan-next test before each
// ASSERT: scan-next cangjietest4
// ASSERT: scan-next test after each
// ASSERT: scan-next temp after each
// ASSERT: scan-next basetemp after each

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
