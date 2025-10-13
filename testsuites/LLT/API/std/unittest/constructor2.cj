/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f

package A

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion
import std.io.*

@Test
class MyClass {
    let width: Int64
    MyClass(width: Int64) {
        this.width = width
    }
    @TestCase
    func myCase1(): Unit {
        println("This is case no.1")
    }
}

/* SCAN
error: macro using error, 'Class modified by @Test must contain a parameterless construction.'
  ==> constructor2.cj:16:1:
   | 
16 | @Test
   | ^ 
   | 

1 error generated, 1 error printed.
*/
