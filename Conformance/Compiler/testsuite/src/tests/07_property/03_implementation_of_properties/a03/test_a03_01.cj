/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a03_01

  @Level:         1

  @Assertion:   7.3(3) 2. The setter function is of type (T)->Unit, where T is the type of the
                property and the name of the formal parameter needs to be explicitly specified,
                and the setter function will be executed when the property is assigned a value.

  @Description: Checks that setter function is executed when property is assigned a value.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  static public var str: String = ""
  mut prop val: String {
    get() {
      str += "g"
      ""
    }
    set(v) {
      str += "s"
      ()
    }
  } 
}


main() {
  Assert.equals("", A.str)
  var x = A()
  x.val = "Hello"
  Assert.equals("s", A.str)
  return 0
}
