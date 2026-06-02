/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_02

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

  @Description: Check that all the listed parts are optional in the class body:
                no elements in the class body and only one element in the class body

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj
  
  @Issue: 0006124, 0006136

*/

import t01.*

import utils.assert.Assert

var indicator = 0

// Case #1: Nothing is present
class Empty {}
public class TestA0202<T> {; ; ; ;}

func check0() {
  var test1 = Empty()
  var test2 = TestA0202<Bool>()
}

// Case #2: Only one element present
class SOOOOOO {
  static init() {}
}

class OCOOOOO {
  OCOOOOO() {
    indicator = 0b0100000
  }
}

class OOIOOOO {
  init() {
    indicator = 0b0010000
  }
}

class OOOVOOO {
  let x = 0b0001000
}

open class OOOOFOO {
  public open func foo() {
    return 0b0000100
  }
}

class OOOOOPO {
  public prop p: Int64 {
    get() {
      0b0000010
    }
  }
}

class OOOOOOM {
  @FuncThatReturns[macro_func](0b0000001)
}

func check1() {
  var s = SOOOOOO()

  var c = OCOOOOO()
  Assert.equals(0b0100000, indicator)
  
  var i = OOIOOOO()
  Assert.equals(0b0010000, indicator)

  var v = OOOVOOO()
  Assert.equals(0b0001000, v.x)

  var f = OOOOFOO()
  Assert.equals(0b0000100, f.foo())

  var p = OOOOOPO()
  Assert.equals(0b0000010, p.p)

  var m = OOOOOOM()
  Assert.equals(0b0000001, m.macro_func())
}

main() {
  check0()
  check1()
}
