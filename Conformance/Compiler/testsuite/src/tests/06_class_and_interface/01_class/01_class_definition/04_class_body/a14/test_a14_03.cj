/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_03

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that properties defined in the class body are members of the class, i.e:
                1. non-private properties can be accessed outside the class 
                   through a class instance for instance properties and through the class type
                   for static properties
                2. all properties can be accessed directly by name inside the class
                3. properties can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

  @Comment: All the preceding are: 
            static initializer
            primary constructor
            constructors
            member variables
            member functions and member operator functions
            member properties
            macro expressions

*/

import utils.assert.Assert

class Test {
  private static let priv_static_var = 100

  private static mut prop a: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      1
    }
    set(v) {}
  }

  private static prop b: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      2
    }
  }

  protected static mut prop c: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      3
    }
    set(v) {}
  }

  protected static prop d: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      4
    }
  }

  static mut prop e: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      5
    }
    set(v) {}
  }

  static prop f: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      6
    }
  }

  private mut prop g: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      7
    }
    set(v) {}
  }

  private prop h: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      8
    }
  }

  protected mut prop i: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      9
    }
    set(v) {}
  }

  protected prop j: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      10
    }
  }

  mut prop k: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      11
    }
    set(v) {}
  }

  prop l: Int64 {
    get() {
      let x = priv_static_var
      Assert.equals(100, x)
      12
    }
  }

  func check() {
    Assert.equals(1, a)
    Assert.equals(2, b)
    Assert.equals(3, c)
    Assert.equals(4, d)
    Assert.equals(5, e)
    Assert.equals(6, f)
    Assert.equals(7, g)
    Assert.equals(8, h)
    Assert.equals(9, i)
    Assert.equals(10, j)
    Assert.equals(11, k)
    Assert.equals(12, l)
  }

  static func check_private() {
    Assert.equals(1, Test.a)
    Assert.equals(2, Test.b)

    let obj = Test()
    Assert.equals(7, obj.g)
    Assert.equals(8, obj.h)
  }
}

main() {
  Assert.equals(3, Test.c)
  Assert.equals(4, Test.d)
  Assert.equals(5, Test.e)
  Assert.equals(6, Test.f)

  let test = Test()
  Assert.equals(9, test.i)
  Assert.equals(10, test.j)
  Assert.equals(11, test.k)
  Assert.equals(12, test.l)

  Test.check_private()

  test.check()
}
