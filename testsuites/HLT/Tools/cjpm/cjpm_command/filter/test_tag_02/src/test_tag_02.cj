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
import std.time.*
import std.sync.*

@Test
@Tag[Unittest]
@Tag[running]
class Test_Tag_logic {
    @Tag[Unittest运行运行]
    @Tag[Unittest运行运行]
    @Bench
    func func_simple_case_tag_Function_Simple_01() {
        sleep(Duration.second * 0.1)
    }

    @Bench
    func func_simple_case_tag_Function_Simple_02() {
        sleep(Duration.second * 0.1)
    }

    @Tag[n_running]
    @Bench
    func func_simple_case_tag_Function_Simple_03() {
        throw Exception("case should not running")
    }

    @Bench
    func nfunc_simple_case_tag_Function_Simple_04() {
        throw Exception("case should not running")
    }
}

@Test
@Tag[Unittest]
@Tag[n_running]
class Test_Tag_logic_nn {
    @Bench
    func func_simple_case_tag_Function_Simple() {
    }
}

main() {}
