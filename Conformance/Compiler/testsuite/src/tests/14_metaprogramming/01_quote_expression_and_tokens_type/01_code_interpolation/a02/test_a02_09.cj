/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_09

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of type check expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

public open class BaseCls {
    public var value: Int8 = 8
}

public class ImplCls <: BaseCls{
    public var local_value: Int32 = 32
}

main(): Unit {
    // Type Check Expressions
    var base = BaseCls()
    let impl = ImplCls()
    var ci_cast_0 = quote($(impl is BaseCls))
    var ci_cast_1 = quote($(impl is ImplCls))
    let ci_cast_2 = quote($(base is BaseCls))
    let ci_cast_3 = quote($(base is ImplCls))

    Assert.equals((impl is BaseCls).toString(), ci_cast_0.toString())
    Assert.equals((impl is ImplCls).toString(), ci_cast_1.toString())
    Assert.equals((base is BaseCls).toString(), ci_cast_2.toString())
    Assert.equals((base is ImplCls).toString(), ci_cast_3.toString())

    Assert.isTrue(ci_cast_0 is Tokens)
    Assert.isTrue(ci_cast_1 is Tokens)
    Assert.isTrue(ci_cast_2 is Tokens)
}
