/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_06

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that overriden members of the parent class can be accessed through an object of that class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006084

*/

import utils.assert.Assert

public open class TestA1406 {
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

sealed abstract class SealedParent <: TestA1406 {
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

  func test() {
    let po = TestA1406()
    Assert.equals(10000, f())
    Assert.equals(1, po.f())
    Assert.equals(10, immut_prop)
    Assert.equals(2, po.immut_prop)
    Assert.equals(20, mut_prop)
    Assert.equals(3, po.mut_prop)
  }
}

main() {
  var s = ChildOfSealed()
  s.test()
}
