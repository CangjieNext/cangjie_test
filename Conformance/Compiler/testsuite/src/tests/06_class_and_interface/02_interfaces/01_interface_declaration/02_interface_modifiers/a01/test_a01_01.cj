/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a01_01

  @Level:         1

  @Assertion: 6.2.1.2(1)
              Access modifier: If no access modifier is used when defining an interface,
              then the interface can only be accessed inside the package

  @Description: Check that interfaces with the default access modifier
                can be accessed inside the package

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}

interface I2<T> {}

interface I3 {}

// Check that interfaces can be inherited inside the package
interface T1 <: I1 {}
interface T2 <: I2<Any> {}
interface T3 <: I3 {}

// Check that interfaces can be implemented inside the package
class C1 <: I1 {}
class C2 <: I2<Unit> {}
class C3 <: I3 {}

struct S1 <: I1 {}
struct S2 <: I2<Unit> {}
struct S3 <: I3 {}

enum E1 <: I1 {
    Val1(String) | Zero
}
enum E2 <: I2<Unit> {
    Val2(String) | Zero
}

enum E3 <: I3 {
    Val3(String) | Zero
}

// Check that interfaces can be added in extend definitions inside the package
class C4 {}
class C5 {}
class C6 {}

extend C4 <: I1 {}
extend C5 <: I2<Bool> {}
extend C6 <: I3 {}

struct S4 {}
struct S5 {}
struct S6 {}

extend S4 <: I1 {}
extend S5 <: I2<Bool> {}
extend S6 <: I3 {}

enum E4 {
    Val4(String) | Zero
}
enum E5 {
    Val5(String) | Zero
}

enum E6 {
    Val6(String) | Zero
}

extend E4 <: I1 {}
extend E5 <: I2<Bool> {}
extend E6 <: I3 {}

// Check that interfaces can be added to standard types inside the package
extend Int64 <: I1 & I2<Rune> & I3 {}
extend Float16 <: I1 & I2<Rune> & I3 {}
extend String <: I1 & I2<Rune> & I3 {}
extend Bool <: I1 & I2<Rune> & I3 {}
extend Unit <: I1 & I2<Rune> & I3 {}
extend Rune <: I1 & I2<Rune> & I3 {}

// Check that interfaces can be used as generic constraints inside tha package
class A<X, Y, Z> where X <: I1, Y <: I2<String>, Z <: I3 {}

class TypeChecker<T> {}

main() {
    let t1 = TypeChecker<T1>()
    Assert.isTrue(t1 is TypeChecker<T1>)

    let t2 = TypeChecker<T2>()
    Assert.isTrue(t2 is TypeChecker<T2>)

    let t3 = TypeChecker<T3>()
    Assert.isTrue(t3 is TypeChecker<T3>)

    let c1 = C1()
    Assert.isTrue(c1 is I1)

    let c2 = C2()
    Assert.isTrue(c2 is I2<Unit>)

    let c3 = C3()
    Assert.isTrue(c3 is I3)

    let s1 = S1()
    Assert.isTrue(s1 is I1)

    let s2 = S2()
    Assert.isTrue(s2 is I2<Unit>)

    let s3 = S3()
    Assert.isTrue(s3 is I3)

    let e1 = E1.Val1("")
    Assert.isTrue(e1 is I1)

    let e2 = E2.Val2("")
    Assert.isTrue(e2 is I2<Unit>)

    let e3 = E3.Val3("")
    Assert.isTrue(e3 is I3)

    let c4 = C4()
    Assert.isTrue(c4 is I1)

    let c5 = C5()
    Assert.isTrue(c5 is I2<Bool>)

    let c6 = C6()
    Assert.isTrue(c6 is I3)

    let s4 = S4()
    Assert.isTrue(s4 is I1)

    let s5 = S5()
    Assert.isTrue(s5 is I2<Bool>)

    let s6 = S6()
    Assert.isTrue(s6 is I3)

    let e4 = E4.Val4("")
    Assert.isTrue(e4 is I1)

    let e5 = E5.Val5("")
    Assert.isTrue(e5 is I2<Bool>)

    let e6 = E6.Val6("")
    Assert.isTrue(e6 is I3)

    Assert.isTrue(1i64 is I1)
    Assert.isTrue(1i64 is I2<Rune>)
    Assert.isTrue(1i64 is I3)

    Assert.isTrue(.1f16 is I1)
    Assert.isTrue(.1f16 is I2<Rune>)
    Assert.isTrue(.1f16 is I3)

    Assert.isTrue("" is I1)
    Assert.isTrue("" is I2<Rune>)
    Assert.isTrue("" is I3)

    Assert.isTrue(false is I1)
    Assert.isTrue(false is I2<Rune>)
    Assert.isTrue(false is I3)

    Assert.isTrue(() is I1)
    Assert.isTrue(() is I2<Rune>)
    Assert.isTrue(() is I3)

    Assert.isTrue('b' is I1)
    Assert.isTrue('b' is I2<Rune>)
    Assert.isTrue('b' is I3)

    // Check that interfaces can be used for generic instantiation inside the package
    let tst = A<I1, I2<String>, I3>()
    Assert.isTrue(tst is A<I1, I2<String>, I3>)
}