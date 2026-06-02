/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

class Foo {
    var f1 = 40
    var f2 = "myvalue"
}

func buildStrByFoo(x: Foo) {
    x.f1.toString() + x.f2
}

func getFoo() {
    Foo()
}

func materializeInt(x: Unit) {
    0
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let x = getFoo()
        x.f1 = 50
        let a = x.f1
        var b = 5
        @PowerAssert(a.toString() + x.f2 + materializeInt(b = 2).toString() == buildStrByFoo(getFoo()))
    }
}

/* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}a.toString() + x.f2 + materializeInt(b = 2).toString() == buildStrByFoo(getFoo()){/COLOR})`
                    |_|          | |____| |              |_____||          |  |_______________________|
                    |50          |"myvalue"                 ()  |          |         "40myvalue"
                    |____________|      | |_____________________|          |
                    |    "50"           | |          0                     |
                    |___________________| |________________________________|
                    |    "50myvalue"                      "0"              |
                    |______________________________________________________|
                                          "50myvalue0"
 */
