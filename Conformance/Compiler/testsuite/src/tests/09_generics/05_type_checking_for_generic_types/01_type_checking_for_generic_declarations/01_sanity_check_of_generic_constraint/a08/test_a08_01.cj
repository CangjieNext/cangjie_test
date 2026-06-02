/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a08_01

  @Level:         1

  @Assertion: 9.5.1.1(8) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
                 There is no special rules for interfaces.

  @Description: Check that limitation on hierarchy is not applied for interfaces.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I1 {}

interface I2 {}

class GenericClass<T> where T <: I1 & I2 {
    init(arg: T) {
        x = arg
    }

    var x: T
}

class C <: I1 & I2 {}

main() {
    Assert.isTrue(GenericClass<C>(C()).x is I1)
    Assert.isTrue(GenericClass<C>(C()).x is I2)
}

