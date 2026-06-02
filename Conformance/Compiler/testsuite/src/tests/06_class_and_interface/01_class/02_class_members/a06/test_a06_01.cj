/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a06_01

  @Level:         1

  @Assertion: 6.1.2(6)
              Note the following: - All static members are not accessible by instance name.

  @Description: Check that static members can be accessed by the class name outside the class
                and directly by name inside the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class Test {
  // Variables
  static var mem1 = "mem1"
  static let mem2 = 999999

  // Functions
  static func mem3(b: Bool) {
    if (b) {
      return "T"
    } else {
      return "F"
    }
  }

  // Properties
  static mut prop mem4: Rune {
    get() {
      r'o'
    }
    set(v) {}
  }

  static prop mem5: Float64 {
    get() {
      1.5672e-10
    }
  }

  static func check_direct() {
    Assert.equals("mem1", mem1)
    Assert.equals(999999, mem2)
    Assert.equals("F", mem3(false))
    Assert.equals(r'o', mem4)
    Assert.approxEquals(1.5672e-10, mem5)
  }
}

main() {
  Assert.equals("mem1", Test.mem1)
  Assert.equals(999999, Test.mem2)
  Assert.equals("F", Test.mem3(false))
  Assert.equals(r'o', Test.mem4)
  Assert.approxEquals(1.5672e-10, Test.mem5)
}
