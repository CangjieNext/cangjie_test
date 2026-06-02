/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a03_01

  @Level:         1

  @Assertion: 9.5.1.1(3) The first case is when upper bounds are classes or interfaces, which are called class-related 
              types.

  @Description: Check class-related types.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {}

class C <: I {}

// Upper bound is an interface.
class GenericClass1<T> where T <: I {
    init(arg: T) {
        x = arg
    }

    var x: T
}

// Upper bound is a class.
class GenericClass2<T> where T <: C {
    init(arg: T) {
        x = arg
    }

    var x: T
}

main() {
    Assert.isTrue(GenericClass1<C>(C()).x is C)
    Assert.isTrue(GenericClass2<C>(C()).x is C)
}

