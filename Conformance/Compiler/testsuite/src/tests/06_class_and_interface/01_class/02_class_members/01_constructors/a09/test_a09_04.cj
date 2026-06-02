/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_04

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that default values for parameters are evaluated during
                the primary constructor invocation

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006183

  @Comment: Excerpt from 5.1.2 Parameters:
            The default value of the parameter is evaluated when the function is called, not when the function is defined.

*/

import utils.assert.Assert

var global_var = 0

func default_param() {
  return global_var
}

class A {
  A(private let a!: Int64 = default_param()) {
    Assert.equals(10, a)
  }
}

main() {
  global_var = 10
  let a = A()
}