/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a09_61

  @Level:         1

  @Assertion: 2.1.10.2(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that during the primary constructor invocation
                the name can not be specified for variable member unnamed parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

  @Comment: Excerpt from 5.1.2 Parameters:
            If a parameter is a named parameter, you need to specify the parameter name
            with the prefix parameter name: before the argument value when calling the function.

*/

struct A {
    A(var x: Int64) {}
}

main() {
    let a = A(x: 10)
}
