/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_03

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that parameters are evaluated left to right
                in the definition order
                during the primary constructor invocation

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

  @Comment: Excerpt from 5.1.2 Parameters:
            When a function is called, the parameter values are evaluated from left to right
            according to the sequence of definition

*/

import utils.assert.Assert

var str = ""

func gen_param(x: String) {
  str += x
  return 1
}

class A {
  A(a: Int64, b: Int64, c: Int64, private let d: Int64, public var e: Int64, protected let f!: Int64, var g!: Int64) {
    Assert.equals("abcdefg", str)
  }
}

main() {
  let a = A(gen_param("a"), gen_param("b"), gen_param("c"), gen_param("d"), 
    gen_param("e"), g: gen_param("g"), f: gen_param("f"))
}