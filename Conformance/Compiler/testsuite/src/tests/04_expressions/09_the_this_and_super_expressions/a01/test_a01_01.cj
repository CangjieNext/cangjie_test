/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_09_a01_01

  @Level:         1

  @Assertion: 4.9(1)
              this and super expressions are represented by this and super, respectively.

  @Description: Check this and super expressions usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {
    open public func foo() {
        return 1
    }

    open public func thisFoo() {
        return this.foo()
    }
}

open class B <: A {
    open public func foo() {
        return 2
    }

    open public func thisFoo() {
        return this.foo()
    }

    open public func superFoo() {
        return super.foo()
    }
}

class C <: B {
    public func foo() {
        return 3
    }

    public func thisFoo() {
        return this.foo()
    }

    public func superFoo() {
        return super.foo()
    }
}

main() {
    let a = A()
    let b = B()
    let c = C()

    Assert.equals(1, a.foo())
    Assert.equals(1, a.thisFoo())

    Assert.equals(2, b.foo())
    Assert.equals(2, b.thisFoo())
    Assert.equals(1, b.superFoo())

    Assert.equals(3, c.foo())
    Assert.equals(3, c.thisFoo())
    Assert.equals(2, c.superFoo())
}

