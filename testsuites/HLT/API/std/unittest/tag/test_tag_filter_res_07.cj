/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --include-tags=Unittest+cases --exclude-tags=Unittest+cases

@Test
@Tag[Unittest, cases]
class Test_Tag_logic {
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
        throw Exception("case should not running")
    }

    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
        throw Exception("case should not running")
    }
}

@Test
@Tag[Unittest, cases]
func func_simple_case_tag_Function_Simple_03() {
    throw Exception("case should not running")
}
