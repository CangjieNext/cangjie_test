/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_03

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check inheritance by sealed classes.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6084

*/

import utils.assert.Assert

public open class TestA1003 {
    var oVar = 0
    let oLet = 1

    func oFunc() { 2 }
}

sealed abstract class S {
    var sVar = 3
    let sLet = 4

    public func sFunc(): Int64
}

sealed abstract class S1 <: TestA1003 {
    var s1Var = 6
    let s1Let = 7

    public func s1Func(): Int64
}

sealed abstract class S2 <: S {
    var s2Var = 9
    let s2Let = 10

    public func s2Func(): Int64
}

open class C1 <: S1 {
    public func s1Func() { 8 }
}

open class C2 <: S2 {
    public func sFunc() { 5 }
    public func s2Func() { 11 }
}

main() {
    var c1 = C1()
    Assert.isTrue(c1 is S1)
    Assert.isTrue(c1 is TestA1003)
    Assert.equals(0, c1.oVar)
    Assert.equals(1, c1.oLet)
    Assert.equals(2, c1.oFunc())
    Assert.equals(6, c1.s1Var)
    Assert.equals(7, c1.s1Let)
    Assert.equals(8, c1.s1Func())

    var c2 = C2()
    Assert.isTrue(c2 is S2)
    Assert.isTrue(c2 is S)
    Assert.equals(3, c2.sVar)
    Assert.equals(4, c2.sLet)
    Assert.equals(5, c2.sFunc())
    Assert.equals(9, c2.s2Var)
    Assert.equals(10, c2.s2Let)
    Assert.equals(11, c2.s2Func())
}
