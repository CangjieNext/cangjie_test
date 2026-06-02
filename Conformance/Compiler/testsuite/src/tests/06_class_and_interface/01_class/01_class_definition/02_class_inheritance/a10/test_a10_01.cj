/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a10_01

  @Level:         1

  @Assertion: 6.1.1.2(10)
              class Empty {} // Inherit from Object implicitly: class Empty <: Object {}

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Empty {} // Inherit from Object implicitly: class Empty <: Object {}

main() {
  // Check that the operator is sees Empty instances as Object type
  let x = Empty()
  Assert.isTrue(x is Object)

  // Check that Empty type satisfies <: Object constraint
  func foo<T>() where T <: Object {
    return 23
  }
  Assert.equals(23, foo<Empty>())
}
