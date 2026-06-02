/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a04_02

  @Level:         1

  @Assertion:   7(4) Properties are used with the same syntax as fields and can be used as
                expressions or be assigned values.

  @Description: Checks using property as expression.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  private var b: Bool = false
  mut prop switch: Bool {
    get() {
      b = !b
      b
    }
    set(value) {
      b = value
    }
  }
}


main() {
  var a = A()
  a.switch = true
  var a1 = a.switch
  var a2 = a.switch
  var a3 = a.switch
  var a4 = a.switch
  Assert.isFalse(a1)
  Assert.isTrue(a2)
  Assert.isFalse(a3)
  Assert.isTrue(a4)
  0
}
