/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_04_01_a01_02

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

  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006465

*/

open class C1<T> {
    public func c1(a: Int32) {} // ok
    public func c1(a: T) {} // ok
}

interface I1<T> {
    func i1(a: Int32): Unit // ok
    func i1(a: T): Unit // ok
}

var a = C1<Int32>() // error

main() {
}