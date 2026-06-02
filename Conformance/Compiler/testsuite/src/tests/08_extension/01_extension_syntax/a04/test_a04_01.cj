/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_a04_01

  @Level:         1

  @Assertion:   8.1(4) Extensions are defined in the order of the extend keyword, the type
                being extended, the optional implementation interface, the optional generic
                constraints, and the definition of the extension body.

  @Description: Checks extensions with different types of definition.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I1 {
    func fi1(): Int64
}

interface I2<T> {
    func fi2(a: T): T
}

class A {
}

extend A {
    func foo(): Int64 { 1 }
}

extend A <: I1 {
    public func fi1(): Int64 { 2 }
}

extend A <: I2<String> {
    public func fi2(a: String): String { "aaa" }
}

class B<T> where T <: Countable<T> {
}

extend<T> B<T> <: I2<T> where T <: Countable<T> {
    public func fi2(a: T): T { a }
}

main() {
    let x = A()
    Assert.equals(1, x.foo())
    Assert.equals(2, x.fi1())
    Assert.equals("aaa", x.fi2(""))
    let y = B<UInt32>()
    Assert.equals(44, y.fi2(44))
    let z = B<Int8>()
    Assert.equals(100, z.fi2(100))
}
