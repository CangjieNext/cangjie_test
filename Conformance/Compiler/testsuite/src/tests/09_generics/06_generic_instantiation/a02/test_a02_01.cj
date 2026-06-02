/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a02_01

  @Level:         1

  @Assertion: 9.6(2) When using a generic declaration, such as calling a generic function, constructing a value 
              instance of a generic type, the values of all type parameters of the generic must be determined 
              and instantiated.

  @Description: Check the instantiation when all type parameters of the generic are determined and instantiated.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

// Checker for a type parameter to be instantiated.
class A<T> {}

func genericFunction<T1, T2>(x1: T1, x2: T2) {
    return x1
}

class GenericStruct<T1, T2> {
    GenericStruct(var x!: T1, var y!: T2) {}
}

func foo<T>() {
    return 35
}

main() {
    // Case: calling a generic function.
    Assert.equals(42, genericFunction<Int32, A<Int32>>(42, A<Int32>()))

    // Case: constructing a value instance of a generic type.
    let c = GenericStruct<Int32, A<Int32>>(x: 42, y: A<Int32>())
    Assert.isTrue(c.x is Int32)
    Assert.isTrue(c.y is A<Int32>)

    // Generic type parameters are determined implicitly.
    Assert.equals(42, genericFunction(42, "hello world"))
    Assert.equals(35, foo<Rune>())
}

