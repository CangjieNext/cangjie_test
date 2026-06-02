/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a01_01

  @Level:         1

  @Assertion:   7.3(1) The getter and setter of an properties correspond to two different
                functions, respectively.

  @Description: Checks that getting/setting of property works as function calls.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  static public var str: String = ""
  var propValue: Int64 = 0
  mut prop val: Int64 {
    get() {
      str += "g"
      return propValue
    }
    set(value) {
      str += "s"
      propValue = value
    }
  } 
}


main() {
  var x = A()
  Assert.equals("", A.str)
  var y = x.val
  Assert.equals("g", A.str)
  x.val = 777
  Assert.equals("gs", A.str)
  return 0
}
