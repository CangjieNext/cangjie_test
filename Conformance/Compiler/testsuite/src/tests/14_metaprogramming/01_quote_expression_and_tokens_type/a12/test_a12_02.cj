/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a12_02

  @Level:         1

  @Assertion:   14.1(12) Note: The token mentioned in this chapter refers to the lexical unit parsed by Cangjie lexer.
                The following are some examples of quote expressions that use Tokens or code interpolation as parameters:

                let a0: Tokens = quote(==)  // ok
                let a1: Tokens = quote(2 + 3) // ok
                let a2: Tokens = quote(2) + quote(+) + quote(3)  // ok
                let a3: Tokens = quote(main(): Int64 {
                    0
                }) // ok
                let a4: Tokens = quote(select * from Users where id=100086) // ok

                let b0: Tokens = quote(()  // error: unmatched `(`
                let b1: Tokens = quote(quote(x))  // ok -- `b1.size() == 4`

  @Description: Negative check example
  
  @Mode:        compileonly

  @Negative:    yes

  @Issue:       0006102
*/

import std.ast.*

main(): Unit {
    // The following are some examples of quote expressions that use Tokens or code interpolation as parameters:
    let b0: Tokens = quote(()  // error: unmatched `(`
}
