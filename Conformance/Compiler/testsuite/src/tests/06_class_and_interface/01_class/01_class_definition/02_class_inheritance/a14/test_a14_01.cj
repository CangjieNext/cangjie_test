/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_01

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that members of the parent class can be accessed directly by name in the child class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006084

*/

import utils.assert.Assert

public open class TheTopClass {
  static func s_topFunc() {
    return 0x1
  }
  static func s_topGenFunc<T>() {
    return 0x2
  }

  static prop s_top_immut_prop: Int64 {
    get() {
      0x3
    }
  }
  static mut prop s_top_mut_prop: Int64 {
    get() {
      0x4
    }
    set(v) {}
  }

  static var s_top_var_mem = 0x5
  static let s_top_let_mem = 0x6

  func topFunc() {
    return 0x7
  }
  func topGenFunc<T>() {
    return 0x8
  }

  prop top_immut_prop: Int64 {
    get() {
      0x9
    }
  }
  mut prop top_mut_prop: Int64 {
    get() {
      0xa
    }
    set(v) {}
  }

  var top_var_mem = 0xb
  let top_let_mem = 0xc
}

public abstract class UpperClass <: TheTopClass {
  static func s_upperFunc() {
    return 0x11
  }
  static func s_upperGenFunc<T>() {
    return 0x12
  }

  static prop s_upper_immut_prop: Int64 {
    get() {
      0x13
    }
  }
  static mut prop s_upper_mut_prop: Int64 {
    get() {
      0x14
    }
    set(v) {}
  }

  static var s_upper_var_mem = 0x15
  static let s_upper_let_mem = 0x16

  func upperFunc() {
    return 0x17
  }
  func upperGenFunc<T>() {
    return 0x18
  }

  prop upper_immut_prop: Int64 {
    get() {
      0x19
    }
  }
  mut prop upper_mut_prop: Int64 {
    get() {
      0x1a
    }
    set(v) {}
  }

  var upper_var_mem = 0x1b
  let upper_let_mem = 0x1c
}

sealed abstract class TheParent <: UpperClass {
  static func s_Func() {
    return 0x101
  }
  static func s_GenFunc<T>() {
    return 0x102
  }

  static prop s_immut_prop: Int64 {
    get() {
      0x103
    }
  }
  static mut prop s_mut_prop: Int64 {
    get() {
      0x104
    }
    set(v) {}
  }

  static var s_var_mem = 0x105
  static let s_let_mem = 0x106

  func Func() {
    return 0x107
  }
  func genFunc<T>() {
    return 0x108
  }

  prop immut_prop: Int64 {
    get() {
      0x109
    }
  }
  mut prop mut_prop: Int64 {
    get() {
      0x10a
    }
    set(v) {}
  }

  var var_mem = 0x10b
  let let_mem = 0x10c
}

class Test <: TheParent {
  func test() {
    // Check static members of the inderect open superclass
    Assert.equals(0x1, s_topFunc())
    Assert.equals(0x2, s_topGenFunc<Rune>())
    Assert.equals(0x3, s_top_immut_prop)
    Assert.equals(0x4, s_top_mut_prop)
    Assert.equals(0x5, s_top_var_mem)
    Assert.equals(0x6, s_top_let_mem)

    // Check instance members of the inderect open superclass
    Assert.equals(0x7, topFunc())
    Assert.equals(0x8, topGenFunc<Int64>())
    Assert.equals(0x9, top_immut_prop)
    Assert.equals(0xa, top_mut_prop)
    Assert.equals(0xb, top_var_mem)
    Assert.equals(0xc, top_let_mem)

    // Check static members of the inderect abstract superclass
    Assert.equals(0x11, s_upperFunc())
    Assert.equals(0x12, s_upperGenFunc<Bool>())
    Assert.equals(0x13, s_upper_immut_prop)
    Assert.equals(0x14, s_upper_mut_prop)
    Assert.equals(0x15, s_upper_var_mem)
    Assert.equals(0x16, s_upper_let_mem)

    // Check instance members of the inderect abstract superclass
    Assert.equals(0x17, upperFunc())
    Assert.equals(0x18, upperGenFunc<()->Unit>())
    Assert.equals(0x19, upper_immut_prop)
    Assert.equals(0x1a, upper_mut_prop)
    Assert.equals(0x1b, upper_var_mem)
    Assert.equals(0x1c, upper_let_mem)

    // Check static members of the direct sealed superclass
    Assert.equals(0x101, s_Func())
    Assert.equals(0x102, s_GenFunc<Test>())
    Assert.equals(0x103, s_immut_prop)
    Assert.equals(0x104, s_mut_prop)
    Assert.equals(0x105, s_var_mem)
    Assert.equals(0x106, s_let_mem)

    // Check instance members of the direct sealed superclass
    Assert.equals(0x107, Func())
    Assert.equals(0x108, genFunc<Float32>())
    Assert.equals(0x109, immut_prop)
    Assert.equals(0x10a, mut_prop)
    Assert.equals(0x10b, var_mem)
    Assert.equals(0x10c, let_mem)
  }
}

main() {
  var test = Test()
  test.test()
}
