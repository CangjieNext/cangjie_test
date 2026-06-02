/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

package pkgA

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

@Test
public class MyTestCls {
    @TestCase
    @Skip
    func myCase1() {
        println("This is case no.1")
    }

    @Bench[10]
    @TestCase
    func myCase4() {
        var s: String = "hello cangjie"
        for (i in 1..1000) {
            s = s.concat(i.toString())
        }
    }

    @TestCase
    @Test // EXPECT: scan '@Test modified function is not top level'
    func myCase5() {
        var s: String = "hello cangjie"
        for (i in 1..1000) {
            s = s.concat(i.toString())
        }
    }

    @Test // EXPECT: scan '@Test modified function is not top level'
    @TestCase
    func myCase6(): Unit {
        var s: String = "hello cangjie"
        for (i in 1..1000) {
            s = s.concat(i.toString())
        }
    }

    @TestCase
    @TestCase
    func myCase7(): Unit {
        var s: String = "hello cangjie"
        for (i in 1..1000) {
            s = s.concat(i.toString())
        }
    }
}

/* SCAN
error: macro using error, '@Test modified function is not top level'
  ==> embedmacro.cj:33:5:
   | 
33 |     @Test // EXPECT: scan '@Test modified function is not top level'
   |     ^ 
   | 

error: macro using error, '@Test modified function is not top level'
  ==> embedmacro.cj:41:5:
   | 
41 |     @Test // EXPECT: scan '@Test modified function is not top level'
   |     ^ 
   | 

2 errors generated, 2 errors printed.
*/
