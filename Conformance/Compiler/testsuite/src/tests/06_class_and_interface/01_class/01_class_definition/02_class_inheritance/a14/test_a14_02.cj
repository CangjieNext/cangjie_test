/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_02

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that overriden members of the parent class can not be accessed directly by name in the child class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006084

*/

import utils.assert.Assert

public open class TheTopClass {
  public open func topFunc() {
    return 0x1
  }

  public open prop top_immut_prop: Int64 {
    get() {
      0x2
    }
  }

  public open mut prop top_mut_prop: Int64 {
    get() {
      0x3
    }
    set(v) {}
  }
}

public abstract class UpperClass <: TheTopClass {
  public open func upperFunc() {
    return 0x4
  }

  public open prop upper_immut_prop: Int64 {
    get() {
      0x5
    }
  }

  public open mut prop upper_mut_prop: Int64 {
    get() {
      0x6
    }
    set(v) {}
  }
}

sealed abstract class TheParent <: UpperClass {
  public open func Func() {
    return 0x7
  }

  public open prop immut_prop: Int64 {
    get() {
      0x8
    }
  }
  public open mut prop mut_prop: Int64 {
    get() {
      0x9
    }
    set(v) {}
  }
}

class Test <: TheParent {
  public func topFunc() {
    return 0x11
  }

  public prop top_immut_prop: Int64 {
    get() {
      0x12
    }
  }
  public mut prop top_mut_prop: Int64 {
    get() {
      0x13
    }
    set(v) {}
  }

  public func upperFunc() {
    return 0x14
  }

  public prop upper_immut_prop: Int64 {
    get() {
      0x15
    }
  }
  public mut prop upper_mut_prop: Int64 {
    get() {
      0x16
    }
    set(v) {}
  }

  public func Func() {
    return 0x17
  }

  public prop immut_prop: Int64 {
    get() {
      0x18
    }
  }
  public mut prop mut_prop: Int64 {
    get() {
      0x19
    }
    set(v) {}
  }

  func test() {
    Assert.equals(0x11, topFunc())
    Assert.equals(0x12, top_immut_prop)
    Assert.equals(0x13, top_mut_prop)

    Assert.equals(0x14, upperFunc())
    Assert.equals(0x15, upper_immut_prop)
    Assert.equals(0x16, upper_mut_prop)

    Assert.equals(0x17, Func())
    Assert.equals(0x18, immut_prop)
    Assert.equals(0x19, mut_prop)
  }
}

main() {
  var test = Test()
  test.test()
}
