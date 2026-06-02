/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a02_01

  @Level:         1

  @Assertion:   7.3(2) 1. The getter function type is ()->T, where T is the type of the property
                and the getter function will be executed when the property is used as an expression.

  @Description: Checks that getter can be used as an expression.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  prop val: String {
    get() {
      return "o"
    }
  } 
}


main() {
  var x = A()
  var s = "Hell" + x.val
  Assert.equals("Hello", s)
  return 0
}
