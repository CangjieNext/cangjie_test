/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a03_01

  @Level:         1

  @Assertion: 6.2.5(3)
              The Any interface can be explicitly declared at the type definition,
              or implicitly implemented by the compiler if it is not,
              but cannot be reimplemented using extensions.

  @Description: Check that the implementation of Any is optional during a type definition

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 <: Any {}
interface I2 {}

interface I3<T> <: Any {}
interface I4<T> {}

open class C1 <: Any {}
open class C2 {}

class C3<T> <: Any {}
class C4<T> {}

abstract class C5 <: Any {}
abstract class C6 {}

class C7 <: C2 & Any {}
class C8 <: C2 {}

class C9 <: I2 & Any {}
class C10 <: I2 {}

struct S1 <: Any {}
struct S2 {}

struct S3<T> <: Any {}
struct S4<T> {}

struct S5 <: I2 & Any {}
struct S6 <: I2 {}

enum E1 <: Any {
    E
}
enum E2 {
    E
}

enum E3<T> <: Any {
    E
}
enum E4<T> {
    E
}

enum E5 <: I2 & Any {
    E
}
enum E6 <: I2 {
    E
}

class TypeChecker<T> where T <: Any {}

main() {
    let i1 = TypeChecker<I1>()
    Assert.isTrue(i1 is TypeChecker<I1>)

    let i2 = TypeChecker<I2>()
    Assert.isTrue(i2 is TypeChecker<I2>)

    let i3 = TypeChecker<I3<Unit>>()
    Assert.isTrue(i3 is TypeChecker<I3<Unit>>)

    let i4 = TypeChecker<I4<Unit>>()
    Assert.isTrue(i4 is TypeChecker<I4<Unit>>)

    let c1 = TypeChecker<C1>()
    Assert.isTrue(c1 is TypeChecker<C1>)

    let c2 = TypeChecker<C2>()
    Assert.isTrue(c2 is TypeChecker<C2>)

    let c3 = TypeChecker<C3<Unit>>()
    Assert.isTrue(c3 is TypeChecker<C3<Unit>>)

    let c4 = TypeChecker<C4<Unit>>()
    Assert.isTrue(c4 is TypeChecker<C4<Unit>>)

    let c5 = TypeChecker<C5>()
    Assert.isTrue(c5 is TypeChecker<C5>)

    let c6 = TypeChecker<C6>()
    Assert.isTrue(c6 is TypeChecker<C6>)

    let c7 = TypeChecker<C7>()
    Assert.isTrue(c7 is TypeChecker<C7>)

    let c8 = TypeChecker<C8>()
    Assert.isTrue(c8 is TypeChecker<C8>)

    let c9 = TypeChecker<C9>()
    Assert.isTrue(c9 is TypeChecker<C9>)

    let c10 = TypeChecker<C10>()
    Assert.isTrue(c10 is TypeChecker<C10>)

    let s1 = TypeChecker<S1>()
    Assert.isTrue(s1 is TypeChecker<S1>)

    let s2 = TypeChecker<S2>()
    Assert.isTrue(s2 is TypeChecker<S2>)

    let s3 = TypeChecker<S3<Unit>>()
    Assert.isTrue(s3 is TypeChecker<S3<Unit>>)

    let s4 = TypeChecker<S4<Unit>>()
    Assert.isTrue(s4 is TypeChecker<S4<Unit>>)

    let s5 = TypeChecker<S5>()
    Assert.isTrue(s5 is TypeChecker<S5>)

    let s6 = TypeChecker<S6>()
    Assert.isTrue(s6 is TypeChecker<S6>)

    let e1 = TypeChecker<E1>()
    Assert.isTrue(e1 is TypeChecker<E1>)

    let e2 = TypeChecker<E2>()
    Assert.isTrue(e2 is TypeChecker<E2>)

    let e3 = TypeChecker<E3<Unit>>()
    Assert.isTrue(e3 is TypeChecker<E3<Unit>>)

    let e4 = TypeChecker<E4<Unit>>()
    Assert.isTrue(e4 is TypeChecker<E4<Unit>>)

    let e5 = TypeChecker<E5>()
    Assert.isTrue(e5 is TypeChecker<E5>)

    let e6 = TypeChecker<E6>()
    Assert.isTrue(e6 is TypeChecker<E6>)
}