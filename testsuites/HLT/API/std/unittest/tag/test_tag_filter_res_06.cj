/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --exclude-tags=Unittest+Unittest+unittest+cases,unitTest+UnittesT,UNITTEST+Unittest | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple_02

@Test
@Tag[Unittest, UnittesT]
class Test_Tag_logic {
    @Tag[Unittest, unittest, cases]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
        throw Exception("case should not running")
    }

    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
    }

    @Tag[unitTest]
    @TestCase
    func func_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Tag[UNITTEST]
    @TestCase
    func func_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}

@Test
@Tag[Unittest, UNITTEST]
func func_simple_case_tag_Function_Simple_05() {
    throw Exception("case should not running")
}
