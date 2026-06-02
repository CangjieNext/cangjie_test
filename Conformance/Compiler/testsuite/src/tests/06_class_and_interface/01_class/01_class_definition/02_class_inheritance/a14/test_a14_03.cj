/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_03

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that redefined static members of the parent class can not be accessed directly by name in the child class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006084, 0006126

  @Comment: The assertion does not explicitly mention redefined members, but they are analogous to overriden members.
            Depending on the resolution of 0006126 either assertion text will be modified 
            or this test case will be moved to a new assertion

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
}

public abstract class UpperClass <: TheTopClass {
  static func s_upperFunc() {
    return 0x5
  }

  static func s_upperGenFunc<T>() {
    return 0x6
  }

  static prop s_upper_immut_prop: Int64 {
    get() {
      0x7
    }
  }

  static mut prop s_upper_mut_prop: Int64 {
    get() {
      0x8
    }
    set(v) {}
  }
}

sealed abstract class TheParent <: UpperClass {
  static func s_Func() {
    return 0x9
  }

  static func s_GenFunc<T>() {
    return 0xa
  }

  static prop s_immut_prop: Int64 {
    get() {
      0xb
    }
  }

  static mut prop s_mut_prop: Int64 {
    get() {
      0xc
    }
    set(v) {}
  }
}

class Test <: TheParent {
  static func s_topFunc() {
    return 0x11
  }

  static func s_topGenFunc<T>() {
    return 0x12
  }

  static prop s_top_immut_prop: Int64 {
    get() {
      0x13
    }
  }

  static mut prop s_top_mut_prop: Int64 {
    get() {
      0x14
    }
    set(v) {}
  }

  static func s_upperFunc() {
    return 0x15
  }

  static func s_upperGenFunc<T>() {
    return 0x16
  }

  static prop s_upper_immut_prop: Int64 {
    get() {
      0x17
    }
  }

  static mut prop s_upper_mut_prop: Int64 {
    get() {
      0x18
    }
    set(v) {}
  }

  static func s_Func() {
    return 0x19
  }

  static func s_GenFunc<T>() {
    return 0x1a
  }

  static prop s_immut_prop: Int64 {
    get() {
      0x1b
    }
  }

  static mut prop s_mut_prop: Int64 {
    get() {
      0x1c
    }
    set(v) {}
  }

  func test() {
    Assert.equals(0x11, s_topFunc())
    Assert.equals(0x12, s_topGenFunc<Rune>())
    Assert.equals(0x13, s_top_immut_prop)
    Assert.equals(0x14, s_top_mut_prop)
    Assert.equals(0x15, s_upperFunc())
    Assert.equals(0x16, s_upperGenFunc<Bool>())
    Assert.equals(0x17, s_upper_immut_prop)
    Assert.equals(0x18, s_upper_mut_prop)
    Assert.equals(0x19, s_Func())
    Assert.equals(0x1a, s_GenFunc<Test>())
    Assert.equals(0x1b, s_immut_prop)
    Assert.equals(0x1c, s_mut_prop)
  }
}

main() {
  var test = Test()
  test.test()
}
