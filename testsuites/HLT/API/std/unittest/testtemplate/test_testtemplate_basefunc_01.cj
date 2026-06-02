/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan cangjietest
// ASSERT: scan hongmengtest
// ASSERT: scan 仓颉鸿蒙

import std.unittest.*
import std.unittest.testmacro.*

@TestTemplate
abstract class Template {
    @TestCase
    func case01() {
        println("cangjietest")
    }

    @TestCase
    func case02() {
        println("hongmengtest")
    }
}

@Test
class Tests <: Template {
    @TestCase
    func case03() {
        println("仓颉鸿蒙")
    }
}
