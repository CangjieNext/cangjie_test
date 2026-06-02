/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class mytest {
    @TestCase
    func someTest(): Unit {
        println('\u{FFFD}') // ok
        println("${'\u{FFFD}'}") // ok
        println("\u{FFFD}") // error
    }
}
