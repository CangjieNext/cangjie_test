/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --include-tags=Function_Simple,Function_Skipped

var count = 0

@Test
class Test_Tag_logic {
    @Tag[Function_Simple]
    @TestCase
    func func_simple_case_tag_Function_Simple() {
        @Expect(count, 1010)
    }

    @Tag[Function_Skipped]
    @TestCase
    @Skip
    func func_skipped_case_tag_Function_Skipped() {
        throw Exception("case should not running")
    }

    @TestCase
    func func_simple_case_tag_Function_Simple_1() {
        throw Exception("case should not running")
    }

    @Tag[Function_Simple]
    @TestCase
    func func_simple_case_tag_Function_Simple_2() {
        @Expect(count, 1021)
    }

    @BeforeAll
    func setup() {
        count += 1000
    }

    @BeforeEach
    func setup_invocation() {
        count += 10
    }

    @AfterAll
    func teardown() {
        count += 100
    }

    @AfterEach
    func teardown_invocation() {
        count += 1
    }
}
