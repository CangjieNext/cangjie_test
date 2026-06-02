/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a03_01

  @Level:         1

  @Assertion:   7.1(3) Properties declared with a mut modifier require both
                separate getter and setter implementations.

  @Description: Checks that property with mut modifier with getter and setter works as expected.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

class A {
  private var p: Int64 = 0
  mut prop pval: Int64 {
    get() {
      p
    }
    set(value) {
      p = value
    }
  }
}

main() {
  var a = A()
  a.pval = 7
  var x = a.pval
  Assert.equals(7, x)
  return 0;
}


