/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a02_02

  @Level:         1

  @Assertion:   7(2) By using properties you can encapsulate data operations into access
                functions, which are no different from ordinary fields when used.

  @Description: Checks using properties to remove duplicated spaces from string.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  var str: String = ""
  mut prop string: String {
    get() {
      str
    }
    set(value) {
      str = value.replace("  ", " ")
    }
  }
}


main() {
  var x = A()
  x.string = "aaa  bbbbbbb   ccccc dddddd  eeeee fff    gg"
  Assert.equals("aaa bbbbbbb  ccccc dddddd eeeee fff  gg", x.string)
  x.string = x.string
  Assert.equals("aaa bbbbbbb ccccc dddddd eeeee fff gg", x.string)
  0
}
