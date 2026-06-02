/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a08_55

  @Level:         1

  @Assertion: 6.1.2.1(8)
              The syntax and semantics of regular parameters are consistent 
              with those in the function definition.

  @Description: Check that a regular named parameter can not be placed
                in between regular unnamed parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: Excerpt from 5.1.2 Parameters:
            When the function is declared, non-named parameters must precede all named parameters.

*/

class A {
  A(a: Int64, x!: Int64, y: Int64, b!: Int64) {}
}

main() {
}
