/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_04

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that overriden members of the direct parent class can be accessed through super keyword

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006084

*/

import utils.assert.Assert

open class OpenParent {
  public open func f() {
    return 1
  }

  public open prop immut_prop: Int64 {
    get() {
      2
    }
  }

  public open mut prop mut_prop: Int64 {
    get() {
      3
    }
    set(v) {}
  }
}

class ChildOfOpen <: OpenParent {
  public func f() {
    return 10
  }

  public prop immut_prop: Int64 {
    get() {
      11
    }
  }

  public mut prop mut_prop: Int64 {
    get() {
      12
    }
    set(v) {}
  }

  func testOpen() {
    Assert.equals(10, f())
    Assert.equals(1, super.f())
    Assert.equals(11, immut_prop)
    Assert.equals(2, super.immut_prop)
    Assert.equals(12, mut_prop)
    Assert.equals(3, super.mut_prop)
  }
}

abstract class AbstractParent {
  public open func f() {
    return 0
  }

  public open prop immut_prop: String {
    get() {
      "a"
    }
  }

  public open mut prop mut_prop: String {
    get() {
      "b"
    }
    set(v) {}
  }
}

class ChildOfAbstract <: AbstractParent {
  public func f() {
    return -1
  }

  public prop immut_prop: String {
    get() {
      "C"
    }
  }

  public mut prop mut_prop: String {
    get() {
      "D"
    }
    set(v) {}
  }

  func testAbstract() {
    Assert.equals(-1, f())
    Assert.equals(0, super.f())
    Assert.equals("C", immut_prop)
    Assert.equals("a", super.immut_prop)
    Assert.equals("D", mut_prop)
    Assert.equals("b", super.mut_prop)
  }
}

sealed abstract class SealedParent {
  public open func f() {
    return 100
  }

  public open prop immut_prop: Int64 {
    get() {
      -10
    }
  }

  public open mut prop mut_prop: Int64 {
    get() {
      -20
    }
    set(v) {}
  }
}

class ChildOfSealed <: SealedParent {
  public func f() {
    return 10000
  }

  public prop immut_prop: Int64 {
    get() {
      10
    }
  }

  public mut prop mut_prop: Int64 {
    get() {
      20
    }
    set(v) {}
  }

  func testSealed() {
    Assert.equals(10000, f())
    Assert.equals(100, super.f())
    Assert.equals(10, immut_prop)
    Assert.equals(-10, super.immut_prop)
    Assert.equals(20, mut_prop)
    Assert.equals(-20, super.mut_prop)
  }
}

main() {
  var o = ChildOfOpen()
  o.testOpen()

  var a = ChildOfAbstract()
  a.testAbstract()

  var s = ChildOfSealed()
  s.testSealed()
}
