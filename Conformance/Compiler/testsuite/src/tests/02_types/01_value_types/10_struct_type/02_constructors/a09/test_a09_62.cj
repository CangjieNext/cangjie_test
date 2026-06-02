/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a09_62

  @Level:         1

  @Assertion: 2.1.10.2(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that variable member unnamed parameters can not have default values

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

  @Comment: Excerpt from 5.1.2 Parameters:
            When defining a function, you must add ! to the end of 
            the optional parameter name because optional parameters are a kind of named parameters.

*/

struct A {
    A(private var x: Int64 = 1) {}
}

main() {
    let a = A()
}
