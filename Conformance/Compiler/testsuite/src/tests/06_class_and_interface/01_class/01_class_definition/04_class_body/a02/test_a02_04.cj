/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_04

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
                triples of elements

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj
  
  @Issue: 0006124, 0006136

*/

import t01.*

import utils.assert.Assert

var indicator = 0

// Case #4: Three elements present
class SCIOOOO {
  static init() {}
  SCIOOOO(x: Int64) {
    indicator = x
  }
  init() {}
}

class SCOVOOO {
  static init() {}
  SCOVOOO() {
    indicator = 0b1101000
  }
  let m: String = "str"
}

class SCOOFOO {
  static init() {}
  SCOOFOO() {
    indicator = 0b1100100
  }

  func f1() {
    return indicator + 1
  }
}

class SCOOOPO {
  static init() {}
  SCOOOPO() {
    indicator = 0b1100010
  }
  prop p: Bool {
    get() {
      true
    }
  }
}

class SCOOOOM {
  static init() {}

  SCOOOOM() {
    x = 0b1100001
  }

  @NewVariable[Int64](x)
}

class SOIVOOO {
  static init() {
    y = 0b1011000
  }

  static var y: Int64

  init() {
    indicator = 0b1011000
  }
}

func check3() {
  var sci = SCIOOOO(0b1110000)
  Assert.equals(0b1110000, indicator)

  var scv = SCOVOOO()
  Assert.equals(0b1101000, indicator)
  Assert.equals("str", scv.m)

  var scf = SCOOFOO()
  Assert.equals(0b1100100, indicator)
  Assert.equals(101, scf.f1())

  var scp = SCOOOPO()
  Assert.equals(0b1100010, indicator)
  Assert.equals(true, scp.p)

  var scm = SCOOOOM()
  Assert.equals(0b1100001, scm.x)

  var siv = SOIVOOO()
  Assert.equals(0b1011000, indicator)
  Assert.equals(0b1011000, SOIVOOO.y)
}

main() {
  check3()
}
