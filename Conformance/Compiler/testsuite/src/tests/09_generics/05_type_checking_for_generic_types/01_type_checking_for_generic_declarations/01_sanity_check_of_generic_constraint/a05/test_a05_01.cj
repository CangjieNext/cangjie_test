/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a05_01

  @Level:         1

  @Assertion: 9.5.1.1(5) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
              1.  They must be one of the above two cases. Its upper bounds are in class-related case or
                  class-irrelative case. 

  @Description: Check class-related and class-irrelated cases.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {}

class C <: I {}

// Upper bound is an interface, which is class-related case.
class GenericClass1<T> where T <: I {
    init(arg: T) {
        x = arg
    }

    var x: T
}

// Upper bound is an integral, which is class-irrelated case.
class GenericClass2<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

main() {
    Assert.isTrue(GenericClass1<C>(C()).x is C)
    Assert.isTrue(GenericClass2<Int64>(42).x is Int64)
}

