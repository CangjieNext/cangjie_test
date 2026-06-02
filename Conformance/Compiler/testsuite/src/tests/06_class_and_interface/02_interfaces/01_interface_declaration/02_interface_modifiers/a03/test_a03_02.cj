/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a03_02

  @Level:         1

  @Assertion: 6.2.1.2(3)
              public interface I {} // can be accessed outside the package
              interface I2 {} // can only be accessed inside the package

  @Description: Check that the public interface is accessible outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a03_aux.cj

*/

import utils.assert.Assert

import a03.*

class TypeChecker<T> {}

main() {
    let i1 = TypeChecker<A03Aux>()
    Assert.isTrue(i1 is TypeChecker<A03Aux>)
}