/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a17_01

  @Level:         1

  @Assertion:    14.2.2(17) As an expression, a macro invocation can appear anywhere the expression is 
                 allowed to appear. 

  @Description:  Checking that a macro call can look like an expression
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {

    var a: Int64 = 0

    // Conditional Expressions
    if (@compile(true)) {
    a = 5
    }

    Assert.equals(5, a)

    // Match Expressions
    match(@compile(6)) {
    case 6 => a = -1
    case _ => ()
    }

    Assert.equals(-1, a)

    // Loop Expressions
    do {
    a++
    } while (a < @compile(2))

    Assert.equals(2, a)

    while (@compile(a) > -10) {
    a--
    }

    Assert.equals(-10, a)

    for (i in @compile(0..10)) {
    a += i
    }

    Assert.equals(35, a)

    // Index Access
    var arr = [ 10, 11, 12, 13 ]
    Assert.equals(10, arr[@compile(0)])

    // Function Invocation Expressions
    println(@compile("Some text"))

    // Arithmetic Expressions
    Assert.equals(30, a - @compile(5))
}
