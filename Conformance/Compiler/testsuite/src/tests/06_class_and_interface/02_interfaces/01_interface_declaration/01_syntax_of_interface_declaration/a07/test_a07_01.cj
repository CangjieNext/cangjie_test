/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a07_01

  @Level:         1

  @Assertion: 6.2.1.1(7)
              interface I {} // {} not allowed to be omitted

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {} // {} not allowed to be omitted

class TypeChecker<T> {}

main() {
    let decl = TypeChecker<I>()
    Assert.isTrue(decl is TypeChecker<I>)
}