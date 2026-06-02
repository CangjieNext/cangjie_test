/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a06_01

  @Level:         1

  @Assertion: 6.2.1.1(6)
              The {} enclosing the interface body can not be omitted.

  @Description: Check that interfaces with enclosing curly braces are created correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// Empty bodies
interface A {}

interface B<T> {}

interface C <: A {}

interface D<T> <: B<T> {}

// Bodies with abstract members
interface E {
    func f(): Unit
}

interface F<T> {
    func f(): Unit
}

interface G <: E {
    func f(): Unit
}

interface H<T> <: F<T> {
    func f(): Unit
}

// Bodies with non-abstract members
interface I {
    func f() {}
}

interface J<T> {
    func f() {}
}

interface K <: I {
    func f() {}
}

interface L<T> <: J<T> {
    func f() {}
}

class TypeChecker<T> {}

main() {
    let decl1 = TypeChecker<A>()
    Assert.isTrue(decl1 is TypeChecker<A>)

    let decl2 = TypeChecker<B<Rune>>()
    Assert.isTrue(decl2 is TypeChecker<B<Rune>>)

    let decl3 = TypeChecker<C>()
    Assert.isTrue(decl3 is TypeChecker<C>)

    let decl4 = TypeChecker<D<Bool>>()
    Assert.isTrue(decl4 is TypeChecker<D<Bool>>)

    let decl5 = TypeChecker<E>()
    Assert.isTrue(decl5 is TypeChecker<E>)

    let decl6 = TypeChecker<F<String>>()
    Assert.isTrue(decl6 is TypeChecker<F<String>>)

    let decl7 = TypeChecker<G>()
    Assert.isTrue(decl7 is TypeChecker<G>)

    let decl8 = TypeChecker<H<Unit>>()
    Assert.isTrue(decl8 is TypeChecker<H<Unit>>)

    let decl9 = TypeChecker<I>()
    Assert.isTrue(decl9 is TypeChecker<I>)

    let decl10 = TypeChecker<J<Float16>>()
    Assert.isTrue(decl10 is TypeChecker<J<Float16>>)

    let decl11 = TypeChecker<K>()
    Assert.isTrue(decl11 is TypeChecker<K>)

    let decl12 = TypeChecker<L<Array<Unit>>>()
    Assert.isTrue(decl12 is TypeChecker<L<Array<Unit>>>)
}