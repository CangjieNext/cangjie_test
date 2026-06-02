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

class A {
    func foo() {
        true
    }
    func fooThrowing(): Bool {
        throw Exception("Booo")
    }
    func fooAccepting(a: Bool): Bool {
        a
    }
}

func foo() {
    false
}

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = A()
        @PowerAssert(a.foo() == foo())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}a.foo() == foo(){/COLOR})`
                    |_______|  |_____|
                       true     false
     */
    @TestCase
    func case2(): Unit {
        @PowerAssert(foo() == A().fooThrowing())
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo(){/COLOR}{COLOR=GRAY} == {/COLOR}{COLOR=RED}A().fooThrowing(){/COLOR})`
                    |_____|  |_________________|
                    |false       [Exception]   |
                    |__________________________|
                           [not computed]
     */
    @TestCase
    func case3(): Unit {
        let throwingArg: () -> Bool = {=> throw Exception("Booo")}
        @PowerAssert(foo() == A().fooAccepting(throwingArg()))
    }

    /* SCAN-IN
    Assert Failed: `({COLOR=YELLOW}foo(){/COLOR}{COLOR=GRAY} == A().fooAccepting({/COLOR}{COLOR=RED}throwingArg(){/COLOR}{COLOR=GRAY}){/COLOR})`
                    |_____|  |                |_____________||
                    |false   |                  [Exception]  |
                    |        |_______________________________|
                    |                  [not computed]        |
                    |________________________________________|
                                  [not computed]
     */
}
