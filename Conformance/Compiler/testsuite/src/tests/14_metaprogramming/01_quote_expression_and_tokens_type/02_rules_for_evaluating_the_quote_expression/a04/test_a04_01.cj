/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         14_01_02_a04_01

  @Level:         1

  @Assertion:    14.1.2(4) The following are some examples of using quote expressions, The comment indicates the Tokens result returned by the program.
                    var x: Int64 = 2 + 3

                    // tokens in the quote are obtained from the corresponding Tokens.
                    quote(x + 2)           // quote(x + 2)

                    // The Tokens type can only add with Tokens type.
                    quote(x) + 1           // error! quote(x) is Tokens type#can't add with integer

                    // The value of code interpolation in quote equals to the tokens result corresponding to
                    // the value of the interpolation expression.

                    quote($x)              // quote(5)
                    quote($x + 2)          // quote(5 + 2)
                    quote($x + (2 + 3))    // quote(5 + (2 + 3))
                    quote(1 + ($x + 1) * 2)       // quote(1 + (5 + 1) * 2)
                    quote(1 + $(x + 1) * 2)       // quote(1 + 6 * 2)

                    var t: Tokens = quote(x)      // quote(x)

                    // without interpolation, the `t` is the token `t`
                    quote(t)                      // quote(t)

                    // with interpolation, `t` is evaluated and expected to implement ToTokens
                    quote($t)                     // quote(x)
                    quote($t+1)                   // quote(x+1)

                    // quote expressions can be used inside of interpolations, and cancel out
                    quote($(quote(t)))            // quote(t)
                    quote($(quote($t)))           // quote(x)

                    quote($(t+1))                 // error! t is Tokens type#can't add with integer

                    public macro PlusOne(input: Tokens): Tokens {
                      quote(($input + 1))
                    } 

                    // Macro invocations are preserved, unexpanded, until they are re-inserted into the code by
                    // the macro expander. However, interpolation still happens, including among the arguments
                    // to the macro 
                    quote(@PlusOne(x))              // quote(@PlusOne(x))
                    quote(@PlusOne($x))             // quote(@PlusOne(2 + 3))
                    quote(@PlusOne(2+3))            // quote(@PlusOne(2+3))
                    quote(1 + @PlusOne(x) * 2)      // quote(1 + @PlusOne(x) * 2)

                    // When the macro invocation is outside the quote, the macro expansion happens early
                    var y: Int64 = @PlusOne(x)      // 6 + 1
                    quote(1 + $y * 2)              // quote(1 + 7 * 2) 

  @Description:  Check compilability and correctness of the example without commented errors
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

  @Issue:        0006074
*/

import utils.assert.Assert

import std.ast.*
import aux_macros.*

main(): Unit {
    var temp: Tokens

    var x: Int64 = 2 + 3

    // tokens in the quote are obtained from the corresponding Tokens.
    temp = quote(x + 2)           // quote(x + 2)
    Assert.equals("x + 2", temp.toString())

    // The value of code interpolation in quote equals to the tokens result corresponding to
    // the value of the interpolation expression.

    temp = quote($x)                // quote(5)
    Assert.equals("5", temp.toString())
    temp = quote($x + 2)            // quote(5 + 2)
    Assert.equals("5 + 2", temp.toString())
    temp = quote($x + (2 + 3))      // quote(5 + (2 + 3))
    Assert.equals("5 +(2 + 3)", temp.toString())
    temp = quote(1 + ($x + 1) * 2)  // quote(1 + (5 + 1) * 2)
    Assert.equals("1 +(5 + 1) * 2", temp.toString())
    temp = quote(1 + $(x + 1) * 2)  // quote(1 + 6 * 2)
    Assert.equals("1 + 6 * 2", temp.toString())

    var t: Tokens = quote(x)        // quote(x)
    Assert.equals("x", t.toString())

    // without interpolation, the `t` is the token `t`
    temp = quote(t)                 // quote(t)
    Assert.equals("t", temp.toString())

    // with interpolation, `t` is evaluated and expected to implement ToTokens
    temp = quote($t)                // quote(x)
    Assert.equals("x", temp.toString())
    temp = quote($t+1)              // quote(x+1)
    Assert.equals("x + 1", temp.toString())

    // quote expressions can be used inside of interpolations, and cancel out
    temp = quote($(quote(t)))       // quote(t)
    Assert.equals("t", temp.toString())
    temp = quote($(quote($t)))      // quote(x)
    Assert.equals("x", temp.toString())

    // Macro invocations are preserved, unexpanded, until they are re-inserted into the code by
    // the macro expander. However, interpolation still happens, including among the arguments
    // to the macro 
    temp = quote(@PlusOne(x))              // quote(@PlusOne(x))
    Assert.equals("@PlusOne(x)", temp.toString())
    temp = quote(@PlusOne($x))             // quote(@PlusOne(2 + 3))
    Assert.equals("@PlusOne(5)", temp.toString())
    temp = quote(@PlusOne(2+3))            // quote(@PlusOne(2+3))
    Assert.equals("@PlusOne(2 + 3)", temp.toString())
    temp = quote(1 + @PlusOne(x) * 2)      // quote(1 + @PlusOne(x) * 2)
    Assert.equals("1 + @PlusOne(x) * 2", temp.toString())

    // When the macro invocation is outside the quote, the macro expansion happens early
    var y: Int64 = @PlusOne(x+1)      // 6 + 1
    Assert.equals(6 + 1, y)
    temp = quote(1 + $y * 2)        // quote(1 + 7 * 2)
    Assert.equals("1 + 7 * 2", temp.toString())
}
