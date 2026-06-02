/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a01_01

  @Level:         1

  @Assertion: 6.1.2(1)
              A class consists of the following members:
              • members inherited from its superclass (if there is);
              • members of the interfaces that are implemented by the class, if there are;
              • members declared or defined in the class, including static initializer, primary constructor, 
                init constructors, static member variables, instance member variables, static member functions, 
                instance member functions, static member properties or instance member properties.

  @Description: Check that variables, functions and properties inherited from a superclass are members of the class:
                1. they can be accessed directly by name inside the class definition
                2. they can be accesed through an instance object or the class type outside the class definition
                3. overloaded operators give ability to use objects of the class type in corresponding expressions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084, 0006124

*/

import utils.assert.Assert

public open class Top {
  static var top_svar = 1
  static let top_slet = 2

  var top_var = 3
  let top_let = 4

  static func top_sfunc() {
    return 5
  }

  static func top_gen_sfunc<T>() {
    return 6
  }

  func top_func() {
    return 7
  }

  func top_gen_func<T>() {
    return 8
  }

  static mut prop top_smprop: Int64 {
    get() {
      9
    }
    set(v) {}
  }

  static prop top_sprop: Int64 {
    get() {
      10
    }
  }

  mut prop top_mprop: Int64 {
    get() {
      11
    }
    set(v) {}
  }

  prop top_prop: Int64 {
    get() {
      12
    }
  }

  operator func()() {
    return 37
  }
}

public abstract class Middle <: Top {
  static var middle_svar = 13
  static let middle_slet = 14

  var middle_var = 15
  let middle_let = 16

  static func middle_sfunc() {
    return 17
  }

  static func middle_gen_sfunc<T>() {
    return 18
  }

  func middle_func() {
    return 19
  }

  func middle_gen_func<T>() {
    return 20
  }

  static mut prop middle_smprop: Int64 {
    get() {
      21
    }
    set(v) {}
  }

  static prop middle_sprop: Int64 {
    get() {
      22
    }
  }

  mut prop middle_mprop: Int64 {
    get() {
      23
    }
    set(v) {}
  }

  prop middle_prop: Int64 {
    get() {
      24
    }
  }

  operator func -() {
    return 38
  }
}

sealed abstract class Bottom <: Middle {
  static var bottom_svar = 25
  static let bottom_slet = 26

  var bottom_var = 27
  let bottom_let = 28

  static func bottom_sfunc() {
    return 29
  }

  static func bottom_gen_sfunc<T>() {
    return 30
  }

  func bottom_func() {
    return 31
  }

  func bottom_gen_func<T>() {
    return 32
  }

  static mut prop bottom_smprop: Int64 {
    get() {
      33
    }
    set(v) {}
  }

  static prop bottom_sprop: Int64 {
    get() {
      34
    }
  }

  mut prop bottom_mprop: Int64 {
    get() {
      35
    }
    set(v) {}
  }

  prop bottom_prop: Int64 {
    get() {
      36
    }
  }

  operator func[](indx: Int64) {
    return 39
  }
}

class Test <: Bottom {
  func check() {
    // Check variables from the top open class
    Assert.equals(1, top_svar)
    Assert.equals(2, top_slet)
    Assert.equals(3, top_var)
    Assert.equals(4, top_let)

    // Check functions from the top open class
    Assert.equals(5, top_sfunc())
    Assert.equals(6, top_gen_sfunc<Bool>())
    Assert.equals(7, top_func())
    Assert.equals(8, top_gen_func<String>())

    // Check properties from the top open class
    Assert.equals(9, top_smprop)
    Assert.equals(10, top_sprop)
    Assert.equals(11, top_mprop)
    Assert.equals(12, top_prop)

    // Check variables from the middle abstract class
    Assert.equals(13, middle_svar)
    Assert.equals(14, middle_slet)
    Assert.equals(15, middle_var)
    Assert.equals(16, middle_let)

    // Check functions from the middle abstract class
    Assert.equals(17, middle_sfunc())
    Assert.equals(18, middle_gen_sfunc<Int64>())
    Assert.equals(19, middle_func())
    Assert.equals(20, middle_gen_func<Unit>())

    // Check properties from the middle abstract class
    Assert.equals(21, middle_smprop)
    Assert.equals(22, middle_sprop)
    Assert.equals(23, middle_mprop)
    Assert.equals(24, middle_prop)

    // Check variables from the bottom sealed class
    Assert.equals(25, bottom_svar)
    Assert.equals(26, bottom_slet)
    Assert.equals(27, bottom_var)
    Assert.equals(28, bottom_let)

    // Check functions from the bottom sealed class
    Assert.equals(29, bottom_sfunc())
    Assert.equals(30, bottom_gen_sfunc<(Bool, Bool)>())
    Assert.equals(31, bottom_func())
    Assert.equals(32, bottom_gen_func<Object>())

    // Check properties from the bottom sealed class
    Assert.equals(33, bottom_smprop)
    Assert.equals(34, bottom_sprop)
    Assert.equals(35, bottom_mprop)
    Assert.equals(36, bottom_prop)
  }
}

main() {
  Assert.equals(1, Test.top_svar)
  Assert.equals(2, Test.top_slet)

  Assert.equals(5, Test.top_sfunc())
  Assert.equals(6, Test.top_gen_sfunc<Bool>())

  Assert.equals(9, Test.top_smprop)
  Assert.equals(10, Test.top_sprop)

  Assert.equals(13, Test.middle_svar)
  Assert.equals(14, Test.middle_slet)

  Assert.equals(17, Test.middle_sfunc())
  Assert.equals(18, Test.middle_gen_sfunc<Int64>())

  Assert.equals(21, Test.middle_smprop)
  Assert.equals(22, Test.middle_sprop)

  Assert.equals(25, Test.bottom_svar)
  Assert.equals(26, Test.bottom_slet)

  Assert.equals(29, Test.bottom_sfunc())
  Assert.equals(30, Test.bottom_gen_sfunc<(Bool, Bool)>())

  Assert.equals(33, Test.bottom_smprop)
  Assert.equals(34, Test.bottom_sprop)

  let tst = Test()

  Assert.equals(3, tst.top_var)
  Assert.equals(4, tst.top_let)

  Assert.equals(7, tst.top_func())
  Assert.equals(8, tst.top_gen_func<String>())

  Assert.equals(11, tst.top_mprop)
  Assert.equals(12, tst.top_prop)

  Assert.equals(15, tst.middle_var)
  Assert.equals(16, tst.middle_let)

  Assert.equals(19, tst.middle_func())
  Assert.equals(20, tst.middle_gen_func<Unit>())

  Assert.equals(23, tst.middle_mprop)
  Assert.equals(24, tst.middle_prop)

  Assert.equals(27, tst.bottom_var)
  Assert.equals(28, tst.bottom_let)

  Assert.equals(31, tst.bottom_func())
  Assert.equals(32, tst.bottom_gen_func<Any>())

  Assert.equals(35, tst.bottom_mprop)
  Assert.equals(36, tst.bottom_prop)

  // Check operators
  Assert.equals(37, tst())
  Assert.equals(38, -tst)
  Assert.equals(39, tst[1])

  tst.check()
}
