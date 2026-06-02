/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a24_01

  @Level:         1

  @Assertion: 6.1.2.1(24)
              The primary constructor does not allow calls to other constructors in this class

  @Description: Check that the primary constructor works correctly if
                it does not contain any calls to other constructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_string = ""

class A {
  A() {
    constructor_string += "A"
    func f () {
      return 4
    }
    func g(x: Int64) {
      return x + 1
    }

    var x = g(f())
    print(x)
  }
}

open class BParent {}

class B <: BParent {
  B() {
    super()
    constructor_string += "B"
    let x = 1
    let y = 2
    print(x + y)
  }
}

class C {
  C(x: Int64) {
    constructor_string += "C"
    var y = x << 2
    var z = y * 20
    var a = {x: Int64 => x > 0}
    if (a(z)) {
      print(1)
    }
  }
}

main() {
  Assert.equals("", constructor_string)

  let case1 = A()
  Assert.equals("A", constructor_string)

  let case2 = B()
  Assert.equals("AB", constructor_string)

  let case3 = C(1)
  Assert.equals("ABC", constructor_string)
}

