/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_01

  @Level:         1

  @Assertion: 6.1.1.4(2)
              A class body consists of the following parts.
              • optional static initializer
              • optional primary constructor definition
              • optional constructors definition
              • optional member variables definition
              • optional member functions and member operator functions definition or declaration
              • optional member properties definition or declaration
              • optional macro expression

  @Description: Check that the class body can contain all the listed parts

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj
  
  @Issue: 0006124, 0006136

*/

import t01.*

import utils.assert.Assert

class FullBody {
  static init() {
    x = 0
  }

  FullBody() {
    a = 3
  }

  init(_a: Int64) {
    a = _a
  }

  static var x: Int64
  static let y = 1
  var a: Int64
  let b = 4

  static func s_f() {
    return x + 5
  }
  func f() {
    return b + 2
  }

  operator func ()() {
    return 7
  }

  static mut prop smp: Int64 {
    get() {
      8
    }
    set(v) {}
  }

  static prop sp: Int64 {
    get() {
      9
    }
  }

  mut prop mp: Int64 {
    get() {
      10
    }
    set(v) {}
  }

  prop p: Int64 {
    get() {
      11
    }
  }

  @NewVariable[Int64](macro_var)
}

main() {
  var test = FullBody()
  Assert.equals(0, FullBody.x)
  Assert.equals(1, FullBody.y)
  Assert.equals(3, test.a)
  Assert.equals(4, test.b)
  Assert.equals(5, FullBody.s_f())
  Assert.equals(6, test.f())
  Assert.equals(7, test())
  Assert.equals(8, FullBody.smp)
  Assert.equals(9, FullBody.sp)
  Assert.equals(10, test.mp)
  Assert.equals(11, test.p)
  Assert.equals(12, test.macro_var)
}
