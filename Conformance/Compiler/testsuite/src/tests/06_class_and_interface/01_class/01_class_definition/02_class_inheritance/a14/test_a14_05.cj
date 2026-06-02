/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a14_05

  @Level:         1

  @Assertion: 6.1.1.2(14)
              Subclasses can access the members of the parent class directly, but when overriding, 
              it will not be possible to access the members of the overridden instance of the parent class directly by name, 
              which can be specified by super (super points to the direct parent of the current class object) 
              or by creating an object and accessing it through the object.

  @Description: Check that super points to the direct parent and not to any other parents

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006127

  @Comment: This test is based on the compiler behavior. It's unclear from the specificaion how super should behave here.
            Does super get a direct parent of a runtime instance, or a direct parent of a compile-time class definition?
            Might need to change this test after the resolution of issue 6127.

*/

import utils.assert.Assert

open class Level3 {
  public open func f() {
    return 3
  }
}

open class Level2 <: Level3 {
  public open func f() {
    return 2
  }

  func test2() {
    Assert.equals(3, super.f())
  }
}

open class Level1 <: Level2 {
  public open func f() {
    return 1
  }

  func test1() {
    Assert.equals(2, super.f())
    test2()
  }
}

class Level0 <: Level1 {
  public func f() {
    return 0
  }

  func test0() {
    Assert.equals(1, super.f())
    test1()
  }
}


main() {
  var lvl = Level0()
  lvl.test0()
}
