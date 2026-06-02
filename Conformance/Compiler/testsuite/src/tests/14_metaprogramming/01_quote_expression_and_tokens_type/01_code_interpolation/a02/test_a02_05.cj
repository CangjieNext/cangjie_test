/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_05

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of this and super expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

public open class BaseCls {
    public var value: Int8 = 8

    public open func getThisQuote() {
        return quote($(this.value))
    }
}

public class ImplCls <: BaseCls{
    public var local_value: Int32 = 32

    public func getThisQuote() {
        return quote($(this.local_value))
    }

    public func getSuperQuote() {
        return quote($(super.value))
  }
}

main(): Unit {
    // The this and super Expressions
    var base = BaseCls()
    let impl = ImplCls()

    Assert.equals(base.value.toString(), base.getThisQuote().toString())
    Assert.equals(impl.local_value.toString(), impl.getThisQuote().toString())
    Assert.equals(impl.value.toString(), impl.getSuperQuote().toString())

    Assert.isTrue(base.getThisQuote() is Tokens)
    Assert.isTrue(impl.getThisQuote() is Tokens)
    Assert.isTrue(impl.getSuperQuote() is Tokens)
}
