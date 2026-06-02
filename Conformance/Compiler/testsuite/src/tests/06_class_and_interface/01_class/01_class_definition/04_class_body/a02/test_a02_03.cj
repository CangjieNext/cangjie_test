/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_03

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
                pairs of elements

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_test_a02_01.cj
  
  @Issue: 0006124, 0006136

*/

import t01.*

import utils.assert.Assert

var indicator = 0

// Case #3: Two elements present
class SCOOOOO {
  static init() {}
  SCOOOOO(x: Int64) {
    indicator = x
  }
}

class SOIOOOO {
  static init() {}
  init() {
    indicator = 0b1010000
  }
}

class SOOVOOO {
  static init() {
    x = 0b1001000
  }
  static var x: Int64
}

class SOOOFOO {
  static init() {}

  operator func()() {
    return 0b1000100
  }
}

class SOOOOPO {
  static init() {}
  mut prop p: Int64 {
    get() {
      0b1000010
    }
    set(v) {}
  }
}

class SOOOOOM {
  static init() {}

  @ModifiesGlobal[f_mod] (0b1000001)
}

class OCIOOOO {
  OCIOOOO() {}
  init(x: Int64) {
    indicator = x
  }
}

class OCOVOOO {
  let x:Int64
  OCOVOOO() {
    x = 0b0101000
  }
}

class OCOOFOO {
  OCOOFOO() {
    indicator = 0b0100100
  }
  static func f() {
    return 0b0100100
  }
}

class OCOOOPO {
  OCOOOPO(x:Int64) {
    indicator = x
  }
  static prop p: Int64 {
    get() {
      0b0100010
    }
  }
}

class OCOOOOM {
  OCOOOOM() {
    indicator = 0b0100001
  }

  @NothingMacros(f)
}

class OOIVOOO {
  init() {
    x = 0b0011000
  }
  let x: Int64
}

class OOIOFOO {
  init() {
    indicator = 0b0010100
  }

  public func f(a: String, b: String) {
    return "${a}${b}"
  }
}

class OOIOOPO {
  init() {
    indicator = 0b0010010
  }
  mut prop p: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}

class OOIOOOM {
  init() {
    indicator = 0b0010001
  }
  @FuncThatReturns[f](0b0010001)
}

class OOOVFOO {
  let x: Int64 = 0b0001100

  func f() {
    return x
  }
}

class OOOVOPO {
  var x: Int64 = 0b0001010
  mut prop p: Int64 {
    get() {
      x
    }
    set(v) {
      x = v
    }
  }
}

class OOOVOOM {
  let x = 0b0001001

  @FuncThatReturns[f](x)
}

class OOOOFPO {
  operator func !() {
    return false
  }
  prop p: Int64 {
    get() {
      0b0000110
    }
  }
}

class OOOOFOM {
  func f() {
    return 0b0000101
  }
   @FuncThatReturns[g](f())
}

class OOOOOPM {
  prop p: Int64 {
    get() {
      0b0000011
    }
  }

  @NothingMacros(f)
}

func check2() {
  var sc = SCOOOOO(0b1100000)
  Assert.equals(0b1100000, indicator)

  var si = SOIOOOO()
  Assert.equals(0b1010000, indicator)

  var sv = SOOVOOO()
  Assert.equals(0b1001000, SOOVOOO.x)

  var sf = SOOOFOO()
  Assert.equals(0b1000100, sf())

  var sp = SOOOOPO()
  Assert.equals(0b1000010, sp.p)

  var sm = SOOOOOM()
  sm.f_mod()
  Assert.equals(0b1000001, indicator)

  var ci = OCIOOOO(0b0110000)
  Assert.equals(0b0110000, indicator)

  var cv = OCOVOOO()
  Assert.equals(0b0101000, cv.x)

  var cf = OCOOFOO()
  Assert.equals(0b0100100, indicator)
  Assert.equals(0b0100100, OCOOFOO.f())

  var cp = OCOOOPO(0b0100010)
  Assert.equals(0b0100010, indicator)
  Assert.equals(0b0100010, OCOOOPO.p)

  var cm = OCOOOOM()
  cm.f()
  Assert.equals(0b0100001, indicator)

  var iv = OOIVOOO()
  Assert.equals(0b0011000, iv.x)

  var if_ = OOIOFOO()
  Assert.equals(0b0010100, indicator)
  Assert.equals("12", if_.f("1", "2"))

  var ip = OOIOOPO()
  Assert.equals(0b0010010, indicator)
  Assert.equals(r'a', ip.p)

  var im = OOIOOOM()
  Assert.equals(0b0010001, indicator)
  Assert.equals(0b0010001, im.f())

  var vf = OOOVFOO()
  Assert.equals(0b0001100, vf.x)
  Assert.equals(0b0001100, vf.f())

  var vp = OOOVOPO()
  Assert.equals(0b0001010, vp.x)
  Assert.equals(0b0001010, vp.p)

  var vm = OOOVOOM()
  Assert.equals(0b0001001, vm.x)
  Assert.equals(0b0001001, vm.f())

  var fp = OOOOFPO()
  Assert.equals(false, !fp)
  Assert.equals(0b0000110, fp.p)

  var fm = OOOOFOM()
  Assert.equals(0b0000101, fm.f())
  Assert.equals(0b0000101, fm.g())

  var pm = OOOOOPM()
  pm.f()
  Assert.equals(0b0000011, pm.p)
}

main() {
  check2()
}
