/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a04_01

  @Level:         1

  @Assertion:   14.1(4) The internal reference can be code (token) or code interpolation.

  @Description: Checking the token & code interpolation support in a quote
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var t1:Token = Token()
    var t2:Token = Token(ILLEGAL)
    var t3:Token = Token(STRING_LITERAL, "It's")
    var t4:Token = Token(STRING_LITERAL, "cool")
    var t5:Token = Token(STRING_LITERAL, "in space")
    Assert.equals(quote( ).toString(), t1.toTokens().toString())
    Assert.equals(quote( ).toString(), t2.toTokens().toString())
    Assert.equals(quote("It's").toString(), t3.toTokens().toString())
    Assert.equals(quote("cool").toString(), t4.toTokens().toString())
    Assert.equals(quote("in space").toString(), t5.toTokens().toString())

    var q1:Tokens = quote($t1)
    var q2:Tokens = quote($t2)
    var q3:Tokens = quote($t3)
    var q4:Tokens = quote($t4)
    var q5:Tokens = quote($t5)

    var t: Tokens = t1 + t2 + t3 + t4 + t5
    var q:Tokens = q1 + q2 + q3 + q4 + q5
    var qt:Tokens = quote($t)
    Assert.equals(q.toString(), t.toString())
    Assert.equals(qt.toString(), t.toString())

    Assert.equals(quote($({=> return 65446}()/2)).toString(), "32723")
}