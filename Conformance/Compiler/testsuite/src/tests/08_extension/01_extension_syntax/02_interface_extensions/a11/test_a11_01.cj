/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a11_01

  @Level:         1

  @Assertion:   8.1.2(11) If the type being extended has already directly implemented a
                generic interface, the extension cannot be used to re-implement the same
                interface with the same type arguments.

  @Description: Checks that extension can re-implement generic interface with type arguments
                other than the type being extended.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

interface I<T> {
    func foo(i: T): String
}

class Foo<T> <: I<T> {
    public func foo(i: T): String { "a" }
}

extend<T> Foo<T> <: I<String> {
    public func foo(i: String): String { "b" }
}

extend<T> Foo<T> <: I<Bool> {
    public func foo(i: Bool): String { "c" }
}

main() {
    let a = Foo<Rune>()
    Assert.equals("c", a.foo(false))
    Assert.equals("b", a.foo("hello"))
    Assert.equals("a", a.foo(r'd'))
}
