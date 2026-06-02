/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_05

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
                four or more elements are present

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj
  
  @Issue: 0006124, 0006136

*/

import t01.*

import utils.assert.Assert

var indicator = 0

// Case #5: Four elements present
class SCOVOOM {
  static init() {
    z = ""
  }

  SCOVOOM() {
    indicator = 0b1101001
  }

  static var z: String 

  @FuncThatReturns[f](r'c')
}

class SOIOFOM {
  static init() {}
  init() {
    indicator = 0b1010101
  }

  operator func()() {
    return "func()"
  }

  @NothingMacros(ntng)
}

class OCIOOPM {
  OCIOOPM(x: Int64) {
    indicator = x
  }
  init() {}

  prop p: Float64 {
    get() {
      .5
    }
  }

  @ModifiesGlobal[f](1)
}

class OCOVOPM {
  OCOVOPM() {
    va = 0b0101011
  }

  let va: Int64

  prop p: Int64 {
    get() {
      va
    }
  }
  @NothingMacros(ff)
}

func check4() {
  var scvm = SCOVOOM()
  Assert.equals(0b1101001, indicator)
  Assert.equals("", SCOVOOM.z)
  Assert.equals(r'c', scvm.f())

  var sifm = SOIOFOM()
  Assert.equals(0b1010101, indicator)
  Assert.equals("func()", sifm())
  sifm.ntng()

  var cipm = OCIOOPM(0b0110011)
  Assert.equals(0b0110011, indicator)
  Assert.equals(.5, cipm.p)
  cipm.f()
  Assert.equals(1, indicator)

  var cvpm = OCOVOPM()
  Assert.equals(0b0101011, cvpm.va)
  Assert.equals(0b0101011, cvpm.p)
  cvpm.ff()
}

// Case #6: Five elements present
class SCIOFPO {
  static init() {}
  SCIOFPO(x: Int64) {
    indicator = x
  }
  init() {}

  func f(a: Int64, b: Int64) {
    return a + b
  }

  mut prop p: Bool {
    get() {
      false
    }
    set(v) {}
  }
}

class SCOVFOM {
  static init() {
    a = 11
  }
  static var a: Int64

  SCOVFOM() {
    indicator = 0b1101101
  }

  static func sf() {
    return a - 1
  }

  @NewVariable[Int64](twelve)
}

class OCOVFPM {
  OCOVFPM() {
    indicator = 0b0101111
  }

  var z = 1

  operator func()() {
    return ""
  }

  mut prop p: Int64 {
    get() {
      z
    }
    set(v) {
      z = v
    }
  }

  @FuncThatReturns[ftr](r'a')
}

class OOIVFPM {
  init() {
    indicator = 0b0011111
  }

  let a = 1

  func b() {
    return 2
  }

  prop c: Int64 {
    get() {
      3
    }
  }

  @FuncThatReturns[d](4)
}

func check5() {
  var scifp = SCIOFPO(0b1110110)
  Assert.equals(0b1110110, indicator)
  Assert.equals(false, scifp.p)
  Assert.equals(3, scifp.f(1, 2))

  var scvfm = SCOVFOM()
  Assert.equals(0b1101101, indicator)
  Assert.equals(11, SCOVFOM.a)
  Assert.equals(10, SCOVFOM.sf())
  Assert.equals(12, scvfm.twelve)

  var cvfpm = OCOVFPM()
  Assert.equals(0b0101111, indicator)
  Assert.equals("", cvfpm())
  Assert.equals(1, cvfpm.p)
  Assert.equals(1, cvfpm.z)
  Assert.equals(r'a', cvfpm.ftr())

  var ivfpm = OOIVFPM()
  Assert.equals(0b0011111, indicator)
  Assert.equals(1, ivfpm.a)
  Assert.equals(2, ivfpm.b())
  Assert.equals(3, ivfpm.c)
  Assert.equals(4, ivfpm.d())
}

// Case #7: Six elements present
class SCIVFPO {
  static init() {}
  SCIVFPO(x: Int64) {
    indicator = x
  }

  init() {}

  let v = 7

  operator func !() {
    return true
  }

  prop p: Rune {
    get() {
      r'0'
    }
  }
}

class OCIVFPM {
  OCIVFPM(x: Int64) {
    v = x
  }
  init() {
    v = 1
  }

  var v: Int64

  func f() {
    return "1"
  }

  prop p: String {
    get() {
      "2"
    }
  }
  @FuncThatReturns[m](f())
}

func check6() {
  var scivfp = SCIVFPO(0b1111110)
  Assert.equals(0b1111110, indicator)
  Assert.equals(7, scivfp.v)
  Assert.equals(r'0', scivfp.p)
  Assert.equals(true, !scivfp)

  var civfpm = OCIVFPM(0b0111111)
  Assert.equals(0b0111111, civfpm.v)
  Assert.equals("1", civfpm.f())
  Assert.equals("1", civfpm.m())
  Assert.equals("2", civfpm.p)
}

main() {
  check4()
  check5()
  check6()
}
