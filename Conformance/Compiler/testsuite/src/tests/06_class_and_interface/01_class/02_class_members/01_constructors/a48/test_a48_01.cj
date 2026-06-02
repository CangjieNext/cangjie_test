/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a48_01

  @Level:         1

  @Assertion: 6.1.2.1(48)
              If the super class does not have a parameterless constructor or
              one of the instance member variables of the class have no initial value,
              an error is reported during compilation.

  @Description: Check that a class can have an implicit constructor
                if all the member variables have initial values and
                the superclass has a parameterless constructor

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            "If neither the primary constructor nor the init constructor is defined for a class,
            the compiler attempts to generate a (public modified) parameterless constructor."
            So it only applies to implicit constructors

*/

import utils.assert.Assert

open class ExplicitParent {
    init() {}
}

open class ImplicitParent {}

class A <: ExplicitParent {
    var x = 1
    var y = 2
}

class B <: ExplicitParent {}

class C <: ImplicitParent {
    public let a = ""
    public var b = 'a'
    protected let c = ()
    protected var d = 12
    private let e = -0.15
    private var f = (9, 9)
    let g = [1, 2, 3]
    var h = { => 1}
}

class D <: ImplicitParent {}

class E {
    var a = 10
    let b = 'm'
}

class F {}

main() {
    let case1 = A()
    Assert.isTrue(case1 is A)

    let case2 = B()
    Assert.isTrue(case2 is B)

    let case3 = C()
    Assert.isTrue(case3 is C)

    let case4 = D()
    Assert.isTrue(case4 is D)

    let case5 = E()
    Assert.isTrue(case5 is E)

    let case6 = F()
    Assert.isTrue(case6 is F)
}