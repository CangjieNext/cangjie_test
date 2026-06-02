/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_02_a01_15

  @Level:         1

  @Assertion:    3.2.3.2(1) Names defined inside a function definition or an expression have local-level scope.

  @Description:  Checks that variables defined in "try" expression blocks have local-level scope.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
  var i = 0
  try {
    var i = 1
    Assert.equals(1, i)
    throw ArithmeticException()
  }
  catch (e: ArithmeticException) {
    Assert.equals(0, i)
    var i = 2
    Assert.equals(2, i)
  }
  finally {
    Assert.equals(0, i)
    var i = 3
    Assert.equals(3, i)
  }

  Assert.equals(0, i)
}
