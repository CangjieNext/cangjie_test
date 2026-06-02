/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a09_01

  @Level:         1

  @Assertion: 6.2.1.2(9)
              If the sub-interface of a sealed interface is modified by public but not by sealed,
              the sub-interface can be inherited, implemented, or extended outside the package.

  @Description: Check that non-sealed public interfaces inherited from sealed interfaces
                can be inherited and implemented outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a09_aux.cj

  @Issue: 0006084, 0006347

*/

import utils.assert.Assert

import a09.*

// Check that interfaces can be inherited outside the package
interface T1 <: I1 {}
interface T2 <: I2<Int64> {}

// Check that interfaces can be implemented outside the package
class C1 <: I1 {}
class C2 <: I2<Unit> {}

struct S1 <: I1 {}
struct S2 <: I2<Unit> {}

enum E1 <: I1 {
    Val1(String) | Zero
}
enum E2 <: I2<Unit> {
    Val2(String) | Zero
}

// Check that interfaces can be implemented in extend definitions outside the package
class C3 {}
class C4 {}

extend C3 <: I1 {}
extend C4 <: I2<Bool> {}

struct S3 {}
struct S4 {}

extend S3 <: I1 {}
extend S4 <: I2<Bool> {}

enum E3 {
    Val3(String) | Zero
}
enum E4 {
    Val4(String) | Zero
}

extend E3 <: I1 {}
extend E4 <: I2<Bool> {}

class TypeChecker1<T> where T <: SI1 {}
class TypeChecker2<T> where T <: SI2<Int64> {}

main() {
    let t1 = TypeChecker1<T1>()
    Assert.isTrue(t1 is TypeChecker1<T1>)

    let t2 = TypeChecker2<T2>()
    Assert.isTrue(t2 is TypeChecker2<T2>)

    let c1 = C1()
    Assert.isTrue(c1 is I1)
    Assert.isTrue(c1 is SI1)

    let c2 = C2()
    Assert.isTrue(c2 is I2<Unit>)
    Assert.isTrue(c2 is SI2<Unit>)

    let c3 = C3()
    Assert.isTrue(c3 is I1)
    Assert.isTrue(c3 is SI1)

    let c4 = C4()
    Assert.isTrue(c4 is I2<Bool>)
    Assert.isTrue(c4 is SI2<Bool>)

    let s1 = S1()
    Assert.isTrue(s1 is I1)
    Assert.isTrue(s1 is SI1)

    let s2 = S2()
    Assert.isTrue(s2 is I2<Unit>)
    Assert.isTrue(s2 is SI2<Unit>)

    let s3 = S3()
    Assert.isTrue(s3 is I1)
    Assert.isTrue(s3 is SI1)

    let s4 = S4()
    Assert.isTrue(s4 is I2<Bool>)
    Assert.isTrue(s4 is SI2<Bool>)

    let e1 = E1.Val1("")
    Assert.isTrue(e1 is I1)
    Assert.isTrue(e1 is SI1)

    let e2 = E2.Val2("")
    Assert.isTrue(e2 is I2<Unit>)
    Assert.isTrue(e2 is SI2<Unit>)

    let e3 = E3.Val3("")
    Assert.isTrue(e3 is I1)
    Assert.isTrue(e3 is SI1)

    let e4 = E4.Val4("")
    Assert.isTrue(e4 is I2<Bool>)
    Assert.isTrue(e4 is SI2<Bool>)
}