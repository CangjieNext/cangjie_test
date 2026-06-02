/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a03_01

  @Level:         1

  @Assertion: 6.3.2(3)
              Functions defined in the super classes and sub classes are processed
              as the same scope priority when the function is overloaded.

  @Description: Check that the cosest matching rule is invoked when resolving
                overloading conflicts between functions in a subtype and a supertype

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

  @Comment: If inhereted functions were in the different scope, than the scope rule
            would be invoked first and no closest matching rule would be necessary

*/

import utils.assert.Assert

open class Parent {}
class Child <: Parent {}

interface I {
    func f(x: Child) {
        return 1
    }
    static func g(x: Child) {
        return 11
    }
}

interface J <: I {
    func f(x: Parent) {
        return 2
    }
    static func g(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(1, f(Child()))
        Assert.equals(11, g(Child()))
    }
}

class JImpl <: J {}

open class A {
    func f(x: Child) {
        return 1
    }
    static func g(x: Child) {
        return 11
    }
}

class B <: A {
    func f(x: Parent) {
        return 2
    }
    static func g(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(1, f(Child()))
        Assert.equals(11, g(Child()))
    }
}

class C <: I {
    func f(x: Parent) {
        return 2
    }
    static func g(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(1, f(Child()))
        Assert.equals(11, g(Child()))
    }
}

main() {
    // Two interfaces share the same scope
    JImpl().verify()
    // Two classes share the same scope
    B().verify()
    //An interface and a class share the same scope
    C().verify()
}