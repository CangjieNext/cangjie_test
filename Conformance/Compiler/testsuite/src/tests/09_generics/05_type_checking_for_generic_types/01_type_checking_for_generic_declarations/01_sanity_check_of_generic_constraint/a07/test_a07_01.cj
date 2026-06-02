/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a07_01

  @Level:         1

  @Assertion: 9.5.1.1(7) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
              2. When upper bounds are classes and interfaces, if there are multiple classes then these classes must
                 be in one inheritance chain.

  @Description: Check multiple classes in upper bounds being in one inheritance chain.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}

open class B <: A {}

class GenericClass<T> where T <: A & B {
    init(arg: T) {
        x = arg
    }

    var x: T
}

main() {
    Assert.isTrue(GenericClass<B>(B()).x is A)
    Assert.isTrue(GenericClass<B>(B()).x is B)
}

