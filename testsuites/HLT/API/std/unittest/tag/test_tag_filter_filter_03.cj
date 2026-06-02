/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --include-tags=Unittest --exclude-tags=unitTest --filter=-*.nfunc* | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple_01
// ASSERT: scan func_simple_case_tag_Function_Simple_02

@Test
@Tag[Unittest, UnittesT]
class Test_Tag_logic {
    @Tag[Unittest, unittest, cases]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
    }

    @Tag[Function_Simple_paramized]
    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
    }

    @Tag[unitTest]
    @TestCase
    func nfunc_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Tag[UNITTEST]
    @TestCase
    func nfunc_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}
