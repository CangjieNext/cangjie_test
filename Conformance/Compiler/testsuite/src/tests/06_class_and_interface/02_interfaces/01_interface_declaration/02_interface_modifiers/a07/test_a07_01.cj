/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a07_01

  @Level:         1

  @Assertion: 6.2.1.2(7)
              The public modifier is optional when defining a sealed class
              because the semantics of public are already implied by sealed.

  @Description: Check that interfaces modified with the 'sealed' modifier
                are visible outside the package regardless of their access modifier

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a07_aux.cj

  @Issue: 0006084, 0006347

*/

import utils.assert.Assert

import a07.*

// Check that interfaces can be used in generic constraints outside the package
class C1<T> where T <: I1 {}
class C2<T> where T <: I2<Unit> {}
class C3<T> where T <: I3 {}
class C4<T> where T <: I4<Unit> {}

main() {
    // Check that interfaces can be used to instantiate generic types outside the package
    let c1 = C1<I1>()
    let c2 = C2<I2<Unit>>()
    let c3 = C3<I3>()
    let c4 = C4<I4<Unit>>()
    Assert.isTrue(c1 is C1<I1>)
    Assert.isTrue(c2 is C2<I2<Unit>>)
    Assert.isTrue(c3 is C3<I3>)
    Assert.isTrue(c4 is C4<I4<Unit>>)

    // Check that interfaces can be used in an is expression outside the package
    Assert.isFalse(c1 is I1)
    Assert.isFalse(c2 is I2<Unit>)
    Assert.isFalse(c3 is I3)
    Assert.isFalse(c4 is I4<Unit>)

    // Check that interfaces can be used in an as expression outside the package
    let o1 = c1 as I1
    let o2 = c2 as I2<Unit>
    let o3 = c3 as I3
    let o4 = c4 as I4<Unit>
    Assert.isNone(o1)
    Assert.isNone(o2)
    Assert.isNone(o3)
    Assert.isNone(o4)

    // Check that interfaces can be used in a match expression outside the package
    let c5 = match(c1) {
        case t1: I1 => 1
        case t2: I2<Unit> => 2
        case t3: I3 => 3
        case t4: I4<Unit> => 4
        case _ => 5
    }
    Assert.equals(5, c5)

    // Check that interfaces can be used as variable types outside the package
    let v1: I1 = Impl1()
    let v2: I2<Unit> = Impl2()
    let v3: I3 = Impl3()
    let v4: I4<Unit> = Impl4()

    // Check that interfaces can be used as functon's parameters and return types outside the package
    func f1(x: I1) :I1 {
        Assert.isTrue(x is I1)
        return x
    }

    func f2(x: I2<Unit>) :I2<Unit> {
        Assert.isTrue(x is I2<Unit>)
        return x
    }

    func f3(x: I3) :I3 {
        Assert.isTrue(x is I3)
        return x
    }

    func f4(x: I4<Unit>) :I4<Unit> {
        Assert.isTrue(x is I4<Unit>)
        return x
    }

    Assert.isTrue(f1(v1) is I1)
    Assert.isTrue(f2(v2) is I2<Unit>)
    Assert.isTrue(f3(v3) is I3)
    Assert.isTrue(f4(v4) is I4<Unit>)
}