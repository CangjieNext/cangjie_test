/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_04_01_a01_01

  @Level:         1

  @Assertion: 6.4.1(1)
              When defining a generic class, the following class C1 and functions in C1
              are legal since functions can be overloaded.
              open class C1<T> {
                public func c1(a: Int32) {} // ok
                public func c1(a: T) {} // ok
              }
              interface I1<T> {
                func i1(a: Int32): Unit // ok
                func i1(a: T): Unit // ok
              }
              var a = C1<Int32>() // error
              class C2 <: C1<Int32> {} // error
              var b = I1<Int32>() // error
              class C2 <: I1<Int32> {} // error
              However, when generic class C1<T> needs to be instantiated as C1<Int32>,
              it has two member functions with exactly the same type signature.
              In such cases, the location where type C<Int32> is used will emit an error.

  @Description: Check that the overloading from the example is correct if generic instantiation
                does not create redefinitions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006465

  @Comment: One of C2's from the example is changed to C3

*/

import utils.assert.Assert

open class C1<T> {
    public func c1(a: Int32) {} // ok
    public func c1(a: T) {} // ok
}

interface I1<T> {
    func i1(a: Int32): Unit // ok
    func i1(a: T): Unit // ok
}

var a = C1<Rune>()
class C2 <: C1<String> {}
class C3 <: I1<Float16> {
  public func i1(a: Int32) {}
  public func i1(a: Float16) {}
}

main() {
    let c = C2()
    let d = C3()
    Assert.isTrue(a is C1<Rune>)
    Assert.isTrue(c is C1<String>)
    Assert.isTrue(d is I1<Float16>)
}