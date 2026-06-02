/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a09_02

  @Level:         1

  @Assertion: 6.2.1.2(9)
              If the sub-interface of a sealed interface is modified by public but not by sealed,
              the sub-interface can be inherited, implemented, or extended outside the package.

  @Description: Check that non-sealed public open classes implementing sealed interfaces
                can be inherited and extended outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a09_aux.cj

  @Issue: 0006084, 0006347

  @Comment: The specification does not say anything about non-sealed classes
            that implement sealed interfaces.
            For now assume that they behave the same: they can be inherited outside the package

*/

import utils.assert.Assert

import a09.*

// Check that classes can be inherited outside the package
class C1 <: OC1 {}
class C2 <: OC2<Unit> {}

// Check that classes can be extended outside the package
extend OC1 {
    func f() {
        return 1
    }
}

extend<T> OC2<T> {
    func f() {
        return 2
    }
}

main() {
    let c1 = C1()
    Assert.isTrue(c1 is OC1)
    Assert.isTrue(c1 is SI1)

    let c2 = C2()
    Assert.isTrue(c2 is OC2<Unit>)
    Assert.isTrue(c2 is SI2<Unit>)

    Assert.equals(1, OC1().f())
    Assert.equals(2, OC2<Bool>().f())
}
