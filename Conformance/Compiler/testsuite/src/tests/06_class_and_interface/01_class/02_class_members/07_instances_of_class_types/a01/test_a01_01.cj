/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_07_a01_01

  @Level:         1

  @Assertion: 6.1.2.7(1)
              When a class type is defined, the corresponding instance of the class can be instanced.

  @Description: Check that instances of defined classes can be created

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006279

*/

import utils.assert.Assert

class A {}

class B {
    init(x: Int64, y: Bool) {}
}

open class C {}

open class D<T1, T2> <: C {}

open class E<F> <: D<F, F> {
    init(x: F, y: F, z: Rune) {}
}

main() {
    let case1 = A()
    Assert.isTrue(case1 is A)

    let case2 = B(1, true)
    Assert.isTrue(case2 is B)

    let case3 = C()
    Assert.isTrue(case3 is C)

    let case4 = D<Int64, Int64>()
    Assert.isTrue(case4 is D<Int64, Int64>)

    let case5 = E<String>("s", "b", r'n')
    Assert.isTrue(case5 is  E<String>)
}