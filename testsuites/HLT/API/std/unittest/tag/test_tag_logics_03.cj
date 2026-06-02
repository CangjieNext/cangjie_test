/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --exclude-tags=Function_Simple_Blank,Function_Simple_Paramized_Blank | compare %f
// ASSERT: scan func_simple_case_tag_Function_Simple
// ASSERT: scan-4 func_simple_case_tag_Function_Types_Paramized
// ASSERT: scan-not func_n_simple_case_tag_Function_Simple_Blank
// ASSERT: scan-not func_n_simple_case_tag_Function_Simple_Paramized_Blank

import std.time.*
import std.sync.*

@Test
class Test_Tag_logic {
    @Tag[Function_Simple]
    @TestCase
    func func_simple_case_tag_Function_Simple() {
    }

    @TestCase[a in 0 .. 2, 
 b in 0 .. 2 
]
    @Tag[Function_Simple_Paramized]
    @Types[T in<Int64, String>, U in<Int64, String>]
    func func_simple_case_tag_Function_Types_Paramized<T, U>(a: Int64, b: Int64): Unit where T <: Hashable,
        U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<U>().size, 0)
    }

    @Tag[Function_Simple_Blank]
    @TestCase
    func func_n_simple_case_tag_Function_Simple_Blank() {
    }

    @TestCase[a in 0 .. 10, 
 b in 0 .. 10 
]
    @Tag[Function_Simple_Paramized_Blank]
    @Types[T in<Int64, String>, U in<Int64, String>]
    func func_n_simple_case_tag_Function_Types_Paramized_Blank<T, U>(a: Int64, b: Int64): Unit where T <: Hashable,
        U <: Hashable {
        @Expect(Array<T>().size, 0)
        @Expect(Array<U>().size, 0)
    }
}
