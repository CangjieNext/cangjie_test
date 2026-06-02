/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_05

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that primary constructors defined in the class body are members of the class, i.e:
                constructors can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: single

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

var const_indicator = 0

class Test1 {
  private var p = 111
  Test1() {
    var x = p
    Assert.equals(111, x)
    const_indicator++
  }
}

class Test2 {
  private var p = 222
  Test2(p1: Int64) {
    var x = p
    Assert.equals(222, x)
    const_indicator++
  }
}

class Test3 {
  private var p = 333
  Test3(p1: Bool, p2: String) {
    var x = p
    Assert.equals(333, x)
    const_indicator++
  }
}

class Test4<T> {
  private var p = 444
  Test4() {
    var x = p
    Assert.equals(444, x)
    const_indicator++
  }
}

class Test5<T, U> {
  private var p = 555
  Test5(a: U, b: T) {
    var x = p
    Assert.equals(555, x)
    const_indicator++
  }
}


main() {
  Assert.equals(0, const_indicator)
  let t1 = Test1()
  Assert.equals(1, const_indicator)
  let t2 = Test2(1)
  Assert.equals(2, const_indicator)
  let t3 = Test3(false, "")
  Assert.equals(3, const_indicator)
  let t4 = Test4<Object>()
  Assert.equals(4, const_indicator)
  let t5 = Test5<Float64, Float32>(1.5f32, 1.5)
  Assert.equals(5, const_indicator)
}
