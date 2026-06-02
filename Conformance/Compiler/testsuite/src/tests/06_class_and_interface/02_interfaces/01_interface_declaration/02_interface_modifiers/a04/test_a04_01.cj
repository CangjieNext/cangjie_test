/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a04_01

  @Level:         1

  @Assertion: 6.2.1.2(4)
              Inheritance modifier: By default, the interface has the semantics
              of the open modifier without using the inheritance modifier,
              indicating that the interface can be inherited, implemented,
              or extended anywhere the interface can be accessed.

  @Description: Check that public and non-public interfaces can be inherited and implemented
                in the package

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006345

*/

import utils.assert.Assert

interface I1 {}

interface I2<T> {}

public interface I3 {}

public interface I4<T> {}

// Check that interfaces can be inherited inside the package
interface T1 <: I1 {}
interface T2 <: I2<Int64> {}
interface T3 <: I3 {}
interface T4 <: I4<Int64> {}

// Check that interfaces can be implemented inside the package
class C1 <: I1 {}
class C2 <: I2<Unit> {}
class C3 <: I3 {}
class C4 <: I4<Unit> {}

struct S1 <: I1 {}
struct S2 <: I2<Unit> {}
struct S3 <: I3 {}
struct S4 <: I4<Unit> {}

enum E1 <: I1 {
    Val1(String) | Zero
}
enum E2 <: I2<Unit> {
    Val2(String) | Zero
}
enum E3 <: I3 {
    Val3(String) | Zero
}
enum E4 <: I4<Unit> {
    Val4(String) | Zero
}

// Check that interfaces can be implemented in extend definitions inside the package
class C5 {}
class C6 {}
class C7 {}
class C8 {}

extend C5 <: I1 {}
extend C6 <: I2<Bool> {}
extend C7 <: I3 {}
extend C8 <: I4<Bool> {}

struct S5 {}
struct S6 {}
struct S7 {}
struct S8 {}

extend S5 <: I1 {}
extend S6 <: I2<Bool> {}
extend S7 <: I3 {}
extend S8 <: I4<Bool> {}

enum E5 {
    Val5(String) | Zero
}
enum E6 {
    Val6(String) | Zero
}
enum E7 {
    Val7(String) | Zero
}
enum E8 {
    Val8(String) | Zero
}

extend E5 <: I1 {}
extend E6 <: I2<Bool> {}
extend E7 <: I3 {}
extend E8 <: I4<Bool> {}

// Check that interfaces can be implenebted by standard types inside the package
extend Int64 <: I1 & I2<Rune> & I3 & I4<Any> {}
extend Float16 <: I1 & I2<Rune> & I3 & I4<Any> {}
extend String <: I1 & I2<Rune> & I3 & I4<Any> {}
extend Bool <: I1 & I2<Rune> & I3 & I4<Any> {}
extend Unit <: I1 & I2<Rune> & I3 & I4<Any> {}
extend Rune <: I1 & I2<Rune> & I3 & I4<Any> {}

class TypeChecker<T> {}

main() {
    let t1 = TypeChecker<T1>()
    Assert.isTrue(t1 is TypeChecker<T1>)

    let t2 = TypeChecker<T2>()
    Assert.isTrue(t2 is TypeChecker<T2>)

    let t3 = TypeChecker<T3>()
    Assert.isTrue(t3 is TypeChecker<T3>)

    let t4 = TypeChecker<T4>()
    Assert.isTrue(t4 is TypeChecker<T4>)

    let c1 = C1()
    Assert.isTrue(c1 is I1)

    let c2 = C2()
    Assert.isTrue(c2 is I2<Unit>)

    let c3 = C3()
    Assert.isTrue(c3 is I3)

    let c4 = C4()
    Assert.isTrue(c4 is I4<Unit>)

    let s1 = S1()
    Assert.isTrue(s1 is I1)

    let s2 = S2()
    Assert.isTrue(s2 is I2<Unit>)

    let s3 = S3()
    Assert.isTrue(s3 is I3)

    let s4 = S4()
    Assert.isTrue(s4 is I4<Unit>)

    let e1 = E1.Val1("")
    Assert.isTrue(e1 is I1)

    let e2 = E2.Val2("")
    Assert.isTrue(e2 is I2<Unit>)

    let e3 = E3.Val3("")
    Assert.isTrue(e3 is I3)

    let e4 = E4.Val4("")
    Assert.isTrue(e4 is I4<Unit>)

    let c5 = C5()
    Assert.isTrue(c5 is I1)

    let c6 = C6()
    Assert.isTrue(c6 is I2<Bool>)

    let c7 = C7()
    Assert.isTrue(c7 is I3)

    let c8 = C8()
    Assert.isTrue(c8 is I4<Bool>)

    let s5 = S5()
    Assert.isTrue(s5 is I1)

    let s6 = S6()
    Assert.isTrue(s6 is I2<Bool>)

    let s7 = S7()
    Assert.isTrue(s7 is I3)

    let s8 = S8()
    Assert.isTrue(s8 is I4<Bool>)

    let e5 = E5.Val5("")
    Assert.isTrue(e5 is I1)

    let e6 = E6.Val6("")
    Assert.isTrue(e6 is I2<Bool>)

    let e7 = E7.Val7("")
    Assert.isTrue(e7 is I3)

    let e8 = E8.Val8("")
    Assert.isTrue(e8 is I4<Bool>)

    Assert.isTrue(1i64 is I1)
    Assert.isTrue(1i64 is I2<Rune>)
    Assert.isTrue(1i64 is I3)
    Assert.isTrue(1i64 is I4<Any>)

    Assert.isTrue(.1f16 is I1)
    Assert.isTrue(.1f16 is I2<Rune>)
    Assert.isTrue(.1f16 is I3)
    Assert.isTrue(.1f16 is I4<Any>)

    Assert.isTrue("" is I1)
    Assert.isTrue("" is I2<Rune>)
    Assert.isTrue("" is I3)
    Assert.isTrue("" is I4<Any>)

    Assert.isTrue(false is I1)
    Assert.isTrue(false is I2<Rune>)
    Assert.isTrue(false is I3)
    Assert.isTrue(false is I4<Any>)

    Assert.isTrue(() is I1)
    Assert.isTrue(() is I2<Rune>)
    Assert.isTrue(() is I3)
    Assert.isTrue(() is I4<Any>)

    Assert.isTrue('b' is I1)
    Assert.isTrue('b' is I2<Rune>)
    Assert.isTrue('b' is I3)
    Assert.isTrue('b' is I4<Any>)
}