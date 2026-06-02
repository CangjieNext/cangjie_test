/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a30_03

  @Level:         1

  @Assertion: 6.1.2.1(30)
              A primary constructor is a syntax sugar of regular constructor.
              The compiler automatically generates a definition of the constructor
              and member variables corresponding to the main constructor,
              the form of the automatically generated constructor is as follows:
              • The modifier is the same as that of the primary constructor.
              • The sequence of parameters from left to right is the same as that of parameters
                declared in the primary constructor parameter list.
              • The constructor body is in the following format:
                – Assign values to member variables in sequence.
                  The syntax format is this.x = x, where x indicates the member variable name.
                – The code in the primary constructor body.

  @Description: Check that expressions in the body of the generated constructor
                are executed in the same order as they are written in the primary constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var order = ""
var global_var = 0

func first_func() {
  order += "1"
}

func second_func(x: Int64) {
  order += "2"
}

func third_func() {
  if (global_var > 0) {
    order += "5"
    order += "6"
  } else {
    order += "4"
  }
}

func fourth_func() {
  order += "7"
  return 10
}

func fifth_func() {
  order += "8"
  return ""
}

open class Parent {
  init() {
    order += "0"
  }
}

class Test <: Parent {
  Test(x: Int64) {
    super()
    first_func()
    second_func(x)
    { => order += "3"}()
    third_func()
    global_var = x << 3
    third_func()
    let p = fourth_func()
    var z = fifth_func()
  }
}

main() {
  let tst = Test(12)
  Assert.equals("012345678", order)
}