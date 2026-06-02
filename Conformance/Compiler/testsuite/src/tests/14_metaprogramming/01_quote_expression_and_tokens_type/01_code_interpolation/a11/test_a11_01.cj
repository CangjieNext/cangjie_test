/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a11_01

  @Level:         1

  @Assertion:   14.1.1(11) The standard library provides various APIs for generating Tokens.
                For example, for a variable str of the String type, you can directly use str.toTokens()
                to obtain Tokens corresponding to str.
 
  @Description: Check example
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var str0: String = "str"
    let str1: String = "2 + 3"
    var str2 = "func foo() { \"something\" }"

    Assert.isTrue(str0 is ToTokens)
    Assert.isTrue(str1 is ToTokens)
    Assert.isTrue(str2 is ToTokens)
    Assert.isTrue(str0.toTokens() is Tokens)
    Assert.isTrue(str1.toTokens() is Tokens)
    Assert.isTrue(str2.toTokens() is Tokens)
}
