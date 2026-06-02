/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a06_01

  @Level:         1

  @Assertion:   14.1.1(6) Expression types meant to be interpolated must implement the ToTokens interface. 

  @Description: Positive check that interpolated expression must implement the ToTokens interface
  
  @Mode:        run

  @Negative:    no

  @Issue: 0006124

*/

import utils.assert.Assert
import std.ast.*

class MyClass <: ToTokens {
    private var _value: Array<Int64> = []

    mut prop value: Array<Int64> {
        get() {
            _value
        }
        set(val) {
            _value = val
        }
    }

    public func toTokens(): Tokens { 
        var t = Tokens()
        t += Token(LSQUARE)
        for (item in value) {
            t += Token(INTEGER_LITERAL, item.toString())
        }
        t += Token(RSQUARE)
        return t
    }

    init(val: Array<Int64> ) {
        this.value = val
    }
}

main(): Unit {
    var cls = MyClass([5, 77, 1000000000, 0])
    var t0 = quote($(cls))
    var t1 = quote($(MyClass([1, 2, 3])))
    var t2 = quote($(MyClass()))

    Assert.equals("[5 77 1000000000 0]", t0.toString())
    Assert.equals("[1 2 3]", t1.toString())
    Assert.equals("[]", t2.toString())

    Assert.isTrue(t0 is Tokens)
    Assert.isTrue(t1 is Tokens)
    Assert.isTrue(t2 is Tokens)
}
