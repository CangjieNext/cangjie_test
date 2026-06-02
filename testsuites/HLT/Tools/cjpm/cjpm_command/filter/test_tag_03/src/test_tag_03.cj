/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Tag[Unittest]
@Tag[running]
class Test_Tag_logic {
    @Tag[case01]
    @TestCase
    func func_simple_case_tag_Function_Simple_01() {
    }

    @Tag[case02]
    @TestCase
    func func_simple_case_tag_Function_Simple_02() {
    }

    @Tag[case03]
    @Tag[n_running]
    @TestCase
    func func_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Tag[case04]
    @TestCase
    func nfunc_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}

@Test
@Tag[Unittest]
@Tag[n_running]
class Test_Tag_logic_nn {
    @Tag[case05]
    @TestCase
    func func_simple_case_tag_Function_Simple() {
        throw Exception("case should not running")
    }
}

main() {}
