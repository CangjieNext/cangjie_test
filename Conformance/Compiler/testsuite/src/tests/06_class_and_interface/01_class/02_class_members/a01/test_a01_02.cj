/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a01_02

  @Level:         1

  @Assertion: 6.1.2(1)
              A class consists of the following members:
              • members inherited from its superclass (if there is);
              • members of the interfaces that are implemented by the class, if there are;
              • members declared or defined in the class, including static initializer, primary constructor, 
                init constructors, static member variables, instance member variables, static member functions, 
                instance member functions, static member properties or instance member properties.

  @Description: Check that functions and properties implemented from interfaces are members of the class:
                1. they can be accessed directly by name inside the class definition
                2. they can be accesed through an instance object or the class type outside the class definition
                3. overloaded operators give ability to use objects of the class type in corresponding expressions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006124

*/

import utils.assert.Assert

public interface TestA0102 {
  static func top_sfunc() {
    return 1
  }

  static func top_gen_sfunc<T>() {
    return 2
  }

  func top_func() {
    return 3
  }

  static mut prop top_smprop: Int64 {
    get() {
      5
    }
    set(v) {}
  }

  static prop top_sprop: Int64 {
    get() {
      6
    }
  }

  mut prop top_mprop: Int64 {
    get() {
      7
    }
    set(v) {}
  }

  prop top_prop: Int64 {
    get() {
      8
    }
  }

  operator func ()() {
    return 17
  }
}

sealed interface Bottom <: TestA0102 {
  static func bottom_sfunc() {
    return 9
  }

  static func bottom_gen_sfunc<T>() {
    return 10
  }

  func bottom_func() {
    return 11
  }

  static mut prop bottom_smprop: Int64 {
    get() {
      13
    }
    set(v) {}
  }

  static prop bottom_sprop: Int64 {
    get() {
      14
    }
  }

  mut prop bottom_mprop: Int64 {
    get() {
      15
    }
    set(v) {}
  }

  prop bottom_prop: Int64 {
    get() {
      16
    }
  }

  operator func -() {
    return 18
  }
}

class Test <: Bottom {
  func check() {
    // Check functions from the top interface
    Assert.equals(1, top_sfunc())
    Assert.equals(2, top_gen_sfunc<Bool>())
    Assert.equals(3, top_func())

    // Check properties from the top interface
    Assert.equals(5, top_smprop)
    Assert.equals(6, top_sprop)
    Assert.equals(7, top_mprop)
    Assert.equals(8, top_prop)

    // Check functions from the bottom sealed interface
    Assert.equals(9, bottom_sfunc())
    Assert.equals(10, bottom_gen_sfunc<(Bool, Bool)>())
    Assert.equals(11, bottom_func())

    // Check properties from the bottom sealed interface
    Assert.equals(13, bottom_smprop)
    Assert.equals(14, bottom_sprop)
    Assert.equals(15, bottom_mprop)
    Assert.equals(16, bottom_prop)
  }
}

main() {
  Assert.equals(1, Test.top_sfunc())
  Assert.equals(2, Test.top_gen_sfunc<Bool>())

  Assert.equals(5, Test.top_smprop)
  Assert.equals(6, Test.top_sprop)

  Assert.equals(9, Test.bottom_sfunc())
  Assert.equals(10, Test.bottom_gen_sfunc<(Bool, Bool)>())

  Assert.equals(13, Test.bottom_smprop)
  Assert.equals(14, Test.bottom_sprop)

  let tst = Test()

  Assert.equals(3, tst.top_func())

  Assert.equals(7, tst.top_mprop)
  Assert.equals(8, tst.top_prop)

  Assert.equals(11, tst.bottom_func())

  Assert.equals(15, tst.bottom_mprop)
  Assert.equals(16, tst.bottom_prop)

  // Check operators
  Assert.equals(17, tst())
  Assert.equals(18, -tst)

  tst.check()
}
