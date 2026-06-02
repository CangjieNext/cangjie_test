/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_03_a04_01

  @Level:         1

  @Assertion:   7.3(4) The implementation of properties follows the same rules as functions,
                which can contain declarations and expressions, can omit return, and must
                return a value that matches the return type.

  @Description: Checks that setter/getter implementations can have declarations and expressions,
                can omit return and must return appropriate type.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

class A {
  var propVal: Int64 = 0
  mut prop prop1: Int64 {
    get() {
      var x1: String = ""
      var y1: Int64 = 0
      y1 = 234
      x1 = "Hello " + y1.toString()
      propVal
    }
    set(value) {
      var x2: String = ""
      var y2: Int64 = 0
      y2 = 234
      x2 = "Hello " + y2.toString()
      propVal = value
    }
  } 
}


main() {
  var x = A()
  return 0
}
