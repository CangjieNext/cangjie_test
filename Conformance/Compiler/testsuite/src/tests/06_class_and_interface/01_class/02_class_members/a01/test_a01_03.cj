/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a01_03

  @Level:         1

  @Assertion: 6.1.2(1)
              A class consists of the following members:
              • members inherited from its superclass (if there is);
              • members of the interfaces that are implemented by the class, if there are;
              • members declared or defined in the class, including static initializer, primary constructor, 
                init constructors, static member variables, instance member variables, static member functions, 
                instance member functions, static member properties or instance member properties.

  @Description: Check that variables, functions and properties declared in a class are members of the class:
                1. they can be accessed directly by name inside the class definition
                2. they can be accesed through an instance object or the class type outside the class definition
                3. overloaded operators give ability to use objects of the class type in corresponding expressions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class Test {
  static var svar = 1
  static let slet = 2

  var ivar = 3
  let ilet = 4

  static func sfunc() {
    return 5
  }

  static func gen_sfunc<T>() {
    return 6
  }

  func ifunc() {
    return 7
  }

  func gen_ifunc<T>() {
    return 8
  }

  static mut prop smprop: Int64 {
    get() {
      9
    }
    set(v) {}
  }

  static prop siprop: Int64 {
    get() {
      10
    }
  }

  mut prop mprop: Int64 {
    get() {
      11
    }
    set(v) {}
  }

  prop iprop: Int64 {
    get() {
      12
    }
  }

  operator func()() {
    return 13
  }

  func check() {
    // Check variables
    Assert.equals(1, svar)
    Assert.equals(2, slet)
    Assert.equals(3, ivar)
    Assert.equals(4, ilet)

    // Check functions
    Assert.equals(5, sfunc())
    Assert.equals(6, gen_sfunc<Rune>())
    Assert.equals(7, ifunc())
    Assert.equals(8, gen_ifunc<()->Bool>())

    // Check properties
    Assert.equals(9, smprop)
    Assert.equals(10, siprop)
    Assert.equals(11, mprop)
    Assert.equals(12, iprop)
  }
}

main() {
  Assert.equals(1, Test.svar)
  Assert.equals(2, Test.slet)

  Assert.equals(5, Test.sfunc())
  Assert.equals(6, Test.gen_sfunc<String>())

  Assert.equals(9, Test.smprop)
  Assert.equals(10, Test.siprop)

  let tst = Test()

  Assert.equals(3, tst.ivar)
  Assert.equals(4, tst.ilet)

  Assert.equals(7, tst.ifunc())
  Assert.equals(8, tst.gen_ifunc<Any>())

  Assert.equals(11, tst.mprop)
  Assert.equals(12, tst.iprop)

  // Check operators
  Assert.equals(13, tst())

  tst.check()
}
