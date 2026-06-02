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

interface Foo <: Equatable<Foo> {}

class A <: Foo {
    public operator func ==(right: Foo) {
        false
    }
    public operator func !=(right: Foo) {
        false
    }
}

@Test
public class TestA {
    func checkMyFoo(x: ToString) {
        @PowerAssert(x as Foo == A())
    }

    @TestCase
    func case1(): Unit {
        let x = "Not Foo"
        checkMyFoo(x)
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}x as Foo == A(){/COLOR})`
                    |_|
                  Not Foo

     */
    @TestCase
    func case2(): Unit {
        let a = "a" * 5
        @PowerAssert(a as String == 0.toString())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}a as String == 0.toString(){/COLOR})`
                    |_|         |  |____________|
                  "aaaaa"       |        "0"
                    |___________|
                     Some(aaaaa)
     */
    @TestCase
    func case3(): Unit {
        let a = 5
        @PowerAssert(a as String == 5.toString())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}a as String == 5.toString(){/COLOR})`
                    |_|         |  |____________|
                    |5          |        "5"
                    |___________|
                         None
     */
}
