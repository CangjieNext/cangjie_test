/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_a01_01

  @Level:         1

  @Assertion:   7(1) Properties are a special syntax that does not store values like fields,
                instead they provide a getter and an optional setter to indirectly retrieve
                and set values.

  @Description: Checks property may not store values and that setter can be omitted.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

import utils.assert.Assert

public var propValue: Int64 = 0

class A {
  mut prop prop1: Int64 {
    get() {
      propValue
    }
    set(value) {
      propValue = value
    }
  } 
}

class B {
  prop prop1: Int64 {
    get() {
      print("get")
      0
    }
  }
}


main() {
  var x = A()
  var y = B()
  x.prop1 = 555
  Assert.equals(555, propValue)
  propValue = 777
  let xProp = x.prop1
  Assert.equals(777, xProp)
  y.prop1
}
