/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a02_03

  @Level:         1

  @Assertion:   7(2) By using properties you can encapsulate data operations into access
                functions, which are no different from ordinary fields when used.

  @Description: Checks using properties as counter (is decremented when retrieved).

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  var c: Int64 = 0
  mut prop counter: Int64 {
    get() {
      c--
      c
    }
    set(value) {
      c = value
    }
  }
}


main() {
  var x = A()
  var val = 0
  x.counter = 100
  while(x.counter > 0) {
    val++
  }
  Assert.equals(99, val)
  0
}
