
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_01_a03_01

  @Level:         1

  @Assertion:   16.4.1(3) 3.const functions in an interface, like static functions in an interface, can only be used by
                constrained generic variants or variables when the interface is used as a generic constraint.
  @Description: Check that when the interface is used as a generic constraint, this interface const functions can be
                used by the the constrained generic type (static) and instances of this type (member).
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614, 6637

*/

import utils.assert.Assert

interface I1 {
    const func f(): Int64
}

interface I2 {
    static const func f(): Int64
}

const func f<T1, T2>(x: T1) where T1 <: I1, T2 <: I2 {
    return x.f() + T2.f()
}

class A <: I1 {
    public const func f() { 1 }

    const init() { }
}

class B <: I2 {
    public static const func f() { 2 }
}

main() {
    Assert.equals(3, f<A, B>(A()))
}
