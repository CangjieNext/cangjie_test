/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --include-tags=Unittest+run --exclude-tags=no_run | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple_01
// ASSERT: scan func_simple_case_tag_Function_Simple_02

@Test
@Tag[Unittest]
class Test_Tag_logic {
    @Tag[run]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
    }

    @Tag[run, runs]
    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
    }

    @Tag[run, no_run]
    @TestCase
    func func_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Tag[no_run]
    @TestCase
    func func_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}
