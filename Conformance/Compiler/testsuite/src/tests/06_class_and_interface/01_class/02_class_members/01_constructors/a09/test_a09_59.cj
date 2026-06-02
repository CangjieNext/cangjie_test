/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_59

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that a member variable named parameter can not be placed
                in between member variable unnamed parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

  @Comment: Excerpt from 5.1.2 Parameters:
            When the function is declared, non-named parameters must precede all named parameters.

*/

class A {
  A(public let a: Int64, let x!: Int64, private var y: Int64, var b!: Int64) {}
}

main() {
}
