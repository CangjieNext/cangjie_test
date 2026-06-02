/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_02

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can be used inside constructors of open classes
                as long as it does not escape

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006224

*/

import utils.assert.Assert

var abstract_call = false
var open_call = false

open class A {
    init() {
        var x = this
        var y = f

        Assert.isTrue(x is A)
        Assert.isTrue(y is () -> Int64)

        abstract_call = true
    }

    func f() {
        return 1
    }
}

open class B <: A {
    init() {
        var x = this
        var y = g

        Assert.isTrue(x is B)
        Assert.isTrue(y is () -> Int64)

        open_call = true
    }

    func g() {
        return 20
    }
}

main() {
    let tst = B()
    Assert.equals(true, abstract_call)
    Assert.equals(true, open_call)
}