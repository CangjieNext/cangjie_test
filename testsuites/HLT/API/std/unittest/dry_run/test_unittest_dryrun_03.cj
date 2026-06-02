/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --dry-run 2>&1 | compare %f
// ASSERT: scan-1 TOTAL: 9, SKIPPED: 0
// ASSERT: scan-9 NORUN
// ASSERT: scan-not PASSED
// ASSERT: scan-not ERROR

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*
import std.unittest.mock.*

func test() {
    "cangjie"
}

func test1(x: String, y: String): String {
    x + y
}

class top_class {
    static func foo() {
        "cangjiestaticclass"
    }
    static func loo() {
        "仓颉鸿蒙test"
    }
    static func goo(x: Int64, y: Int64) {
        x + y
    }
}

let a_test = 1
var b_test = "string"

@Test
public class Test_unittest_dryrun_03 {
    @TestCase
    func test01(): Unit {
        @On(test()).returns("cangjiehongmeng")
        println(test())
    }

    @TestCase
    func test02(): Unit {
        @On(test()).returns("仓颉鸿蒙")
        println(test())
    }

    @TestCase
    func test03(): Unit {
        @On(test1("cangjie","cangjie")).returns("hongmeng")
        println(test1("cangjie", "cangjie"))
    }

    @TestCase
    func test04(): Unit {
        @On(top_class.foo()).returns("#$%^&^*&")
        println(top_class.foo())
    }

    @TestCase
    func test05(): Unit {
        @On(top_class.loo()).returns("zpstest")
        println(top_class.loo())
    }

    @TestCase
    func test06(): Unit {
        @On(top_class.goo(10,20)).returns(100)
        println(top_class.goo(10, 20))
    }

    @TestCase
    func test07(): Unit {
        @On(a_test).returns(1000)
        println(a_test)
    }

    @TestCase
    func test08(): Unit {
        @On(b_test).returns("cangjietest100")
        println(b_test)
    }

    @TestCase
    func test09(): Unit {
        println(test1("100", "100"))
        println(top_class.goo(100, 100))
    }
}
