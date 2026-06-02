/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// （not Windows）RUN-EXEC-PIPE: %run %run_opt %output %run_args --include-tags=用例_类_execute --exclude-tags=用例_func_nexe | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple_01
// ASSERT: scan func_simple_case_tag_Function_Simple_02

@Test
@Tag[用例_类_execute]
class Test_Tag_logic {
    @Tag[用例_func_exe, agdfsshajadha]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
    }

    @Tag[agsadhdkj, 用例_func_exe]
    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
    }

    @Tag[用例_func_nexe]
    @TestCase
    func func_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Tag[用例_func_nexe]
    @TestCase
    func func_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}
