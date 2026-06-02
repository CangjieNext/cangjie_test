/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_07

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that a static initializer defined in the class body are members of the class, i.e:
                a static initializer can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006136

  @Comment: All the preceding are: 
            static initializer
            primary constructor
            constructors
            member variables
            member functions and member operator functions
            member properties
            macro expressions

*/

import utils.assert.Assert

var indicator = 0

class Test {
  private static var p = 1
  
  static init() {
    let x = p
    Assert.equals(1, x)
    indicator = 99
  }
}

main() {
  Assert.equals(99, indicator)
}
