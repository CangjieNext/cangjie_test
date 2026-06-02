/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a18_01

  @Level:         1

  @Assertion: 9.2(18) If one generic type A has stricter constraints than another generic type B, B has looser 
              constraints than A.

  @Description: Check looser constraints of two generic types within contraint evaluation context for type that fits
                into all constraint.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Printable {}

interface Runnable {}

// Constraints for GenericStruct1 are looser.
struct GenericStruct1<T1, T2> where T1 <: Printable, T2 <: Runnable {
    GenericStruct1(var x1!: T1, var x2!: T2) {}
}

struct GenericStruct2<T1, T2> where T1 <: Printable & Runnable, T2 <: Printable & Runnable {
    GenericStruct2(var x1!: T1, var x2!: T2) {}
}

class C <: Printable & Runnable {}

main() {
    Assert.isTrue(GenericStruct1<C, C>(x1: C(), x2: C()).x1 is Printable)
    Assert.isTrue(GenericStruct1<C, C>(x1: C(), x2: C()).x2 is Runnable)

    Assert.isTrue(GenericStruct2<C, C>(x1: C(), x2: C()).x1 is Printable)
    Assert.isTrue(GenericStruct2<C, C>(x1: C(), x2: C()).x1 is Runnable)
    Assert.isTrue(GenericStruct2<C, C>(x1: C(), x2: C()).x2 is Printable)
    Assert.isTrue(GenericStruct2<C, C>(x1: C(), x2: C()).x2 is Runnable)
}

