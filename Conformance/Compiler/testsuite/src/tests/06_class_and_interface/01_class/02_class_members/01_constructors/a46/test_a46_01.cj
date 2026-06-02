/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a46_01

  @Level:         1

  @Assertion: 6.1.2.1(46)
              When creating an instance of a class,
              the declarations and expressions in the class will be executed in the following order:
              1. Run the declaration of member variables except primary constructor.
              2. If the constructor body does not explicitly invoke another constructor of this class
                or the superclass’s constructor, invoke the superclass’s parameterless constructor super().
                If the superclass does not have a parameterless constructor, an error will be reported.
              3. Execute the code in the constructor body.

  @Description: Check that the order of instantiation is as described in the assertion

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006221

*/

import utils.assert.Assert

var order_string = ""

func order_checker(x: Int64){
  order_string += "_" + x.toString()
  return x
}

open class Parent {
  init() {
    order_checker(9)
  }
}

class A <: Parent {
  A(nn: String, let x!: Int64 = order_checker(-1), var y!: Int64 = order_checker(-1)) {}

  // Implicit super invocation
  init() {
    order_checker(10)
    var v = order_checker(11)
    func f() {
      return order_checker(12)
    }
    x = f() + order_checker(13)

    y = order_checker(14)
    order_checker(15)
  }

  // Explicit super invocation
  init(a: Int64) {
    super()
    order_checker(10)
    x = order_checker(11) + order_checker(12)
    func f() {
      return order_checker(13)
    }
    y = f()

    order_checker(14)
  }

  // Invoke this
  init(a: Float64) {
    this(1)
    
    var v = order_checker(15)

    v = order_checker(16) - order_checker(17)

    func f() {
      return order_checker(18)
    }

    v = f()

    order_checker(19)
  }

  var i1 = order_checker(1)
  let i2 = order_checker(2)
  public var i3 = order_checker(3)
  public let i4 = order_checker(4)
  protected var i5 = order_checker(5)
  protected let i6 = order_checker(6)
  private var i7 = order_checker(7)
  private let i8 = order_checker(8)
}

main() {
  let case1 = A()
  Assert.equals("_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15", order_string)

  order_string = ""

  let case2 = A(1)
  Assert.equals("_1_2_3_4_5_6_7_8_9_10_11_12_13_14", order_string)

  order_string = ""

  // Constructor is run twice, so the instance variables are initialized twice
  let case3 = A(.01)
  Assert.equals("_1_2_3_4_5_6_7_8_9_10_11_12_13_14_15_16_17_18_19", order_string)
}

