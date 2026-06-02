/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// ASSERT: scan 1 error generated
package A

internal import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion
internal import std.io.*

func myCase1(): Unit {
    println("This is case no.1")
}

@Test
class MyClass {
    @TestCase
    func myCase4() {
        println("This is case no.1")
        244
    }

    @TestCase
    func myCase3(): Unit {
        println("This is case no.1")
        244
    }

    @TestCase // EXPECT: scan '@TestCase modified function type is not ()->Unit'
    func myCase1(): Int64 {
        println("This is case no.1")
        244
    }

    @TestCase
    func myCase2(a: Int64): Unit {
        println("This is case no.2")
    }
}
