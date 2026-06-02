/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a16_01

  @Level:         1

  @Assertion: 9.2(16) The constraints of two generic types are the same, which means that the number of type variables 
              of the generic type is the same, and all the corresponding type variables constraints are the same.

  @Description: Check same constraints of two generic types within contraint evaluation context for type that fits
                into constraint.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Printable {}

interface Runnable {}

struct GenericStruct1<T1, T2> where T1 <: Printable, T2 <: Runnable {
    GenericStruct1(var x1!: T1, var x2!: T2) {}
}

struct GenericStruct2<T1, T2> where T1 <: Printable, T2 <: Runnable {
    GenericStruct2(var x1!: T1, var x2!: T2) {}
}

class Text <: Printable {}

class Worker <: Runnable {}

main() {
    Assert.isTrue(GenericStruct1<Text, Worker>(x1: Text(), x2: Worker()).x1 is Text)
    Assert.isTrue(GenericStruct1<Text, Worker>(x1: Text(), x2: Worker()).x2 is Worker)
    Assert.isTrue(GenericStruct2<Text, Worker>(x1: Text(), x2: Worker()).x1 is Text)
    Assert.isTrue(GenericStruct2<Text, Worker>(x1: Text(), x2: Worker()).x2 is Worker)
}

