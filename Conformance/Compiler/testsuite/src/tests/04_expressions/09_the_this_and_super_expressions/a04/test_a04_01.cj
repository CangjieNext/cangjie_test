/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a04_01

  @Level:         1

  @Assertion: 4.9(4)
              The syntax of this and super expressions is defined as:

              thisSuperExpression
                : 'this'
                | 'super'
                ;

  @Description: Check thisSuperExpression usage patterns.
  
  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {
    open public func foo() {
        return 1
    }
}

open class B <: A {
    open public func foo() {
        return 2
    }

    open public func thisFoo() {
        // Case: this
        return this.foo()
    }

    open public func superFoo() {
        // Case: super
        return super.foo()
    }
}

main() {
    let b = B()
    Assert.equals(2, b.thisFoo())
    Assert.equals(1, b.superFoo())
    return
}

