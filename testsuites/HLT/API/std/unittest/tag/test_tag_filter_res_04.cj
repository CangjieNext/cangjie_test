/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --include-tags=Unittest+Unittest01+Unittest02+Unittest03+Unittest04+Unittest05+Unittest06+Unittest07+Unittest08+Unittest09+Unittest10+Unittest11+Unittest12+Unittest13+Unittest14+Unittest15+Unittest16+Unittest17+Unittest18+Unittest19+Unittest20 | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple_01

@Test
@Tag[Unittest]
class Test_Tag_logic {
    @Tag[Unittest01, Unittest02, Unittest03, Unittest04, Unittest, Unittest05, Unittest06, Unittest07, Unittest08,
        Unittest09, Unittest10, Unittest11, Unittest12, Unittest13, Unittest14, Unittest15, Unittest16, Unittest17,
        Unittest18, Unittest19, Unittest20]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
    }

    @Tag[Unittest01, Unittest02, Unittest03, Unittest04, Unittest, Unittest05, Unittest06, Unittest07, Unittest08,
        Unittest09, Unittest10, Unittest11, Unittest12, Unittest13, Unittest14, Unittest15, Unittest16, Unittest17,
        Unittest18, Unittest19]
    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
        throw Exception("case should not running")
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
