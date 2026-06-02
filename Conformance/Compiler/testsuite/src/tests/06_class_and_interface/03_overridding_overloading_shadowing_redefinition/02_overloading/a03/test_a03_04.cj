/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a03_04

  @Level:         1

  @Assertion: 6.3.2(3)
              Functions defined in the super classes and sub classes are processed
              as the same scope priority when the function is overloaded.

  @Description: Check that the cosest matching rule is invoked when resolving
                overloading conflicts between generic functions in a generic subtype and a generic supertype

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426, 0006305

  @Comment: If inhereted functions were in the different scope, than the scope rule
            would be invoked first and no closest matching rule would be necessary

*/

import utils.assert.Assert

open class Parent {}
class Child <: Parent {}

interface I<U> {
    static func g<T>(x: Child) {
        return 11
    }
}

interface J<U> <: I<U> {
    static func g<T>(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(11, g<Unit>(Child()))
    }
}

class JImpl <: J<Unit> {}

open class A<U> {
    func f<T>(x: Child) {
        return 1
    }
    static func g<T>(x: Child) {
        return 11
    }
}

class B<U> <: A<U> {
    func f<T>(x: Parent) {
        return 2
    }
    static func g<T>(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(1, f<Unit>(Child()))
        Assert.equals(11, g<Unit>(Child()))
    }
}

class C<U> <: I<U> {
    func f<T>(x: Parent) {
        return 2
    }
    static func g<T>(x: Parent) {
        return 12
    }

    func verify() {
        Assert.equals(2, f<Unit>(Child()))
        Assert.equals(11, g<Unit>(Child()))
    }
}

main() {
    // Two interfaces share the same scope
    JImpl().verify()
    // Two classes share the same scope
    B<Rune>().verify()
    //An interface and a class share the same scope
    C<String>().verify()
}