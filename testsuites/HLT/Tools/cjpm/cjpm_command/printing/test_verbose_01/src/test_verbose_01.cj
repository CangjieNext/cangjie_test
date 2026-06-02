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
@Measure[TimeNow(Seconds)]
class Test_Verbose_01 {
    @Bench
    func func_simple_case_tag_Function_Simple_01() {
        sleep(Duration.second * 0.1)
    }
}

@Test
class Test_Verbose_02 {
    @Bench
    func func_simple_case_tag_Function_Simple() {
        sleep(Duration.second * 0.1)
    }
}

main() {}
