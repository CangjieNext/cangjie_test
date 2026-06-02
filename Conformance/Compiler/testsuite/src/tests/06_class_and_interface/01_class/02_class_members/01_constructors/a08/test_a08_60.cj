/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a08_60

  @Level:         1

  @Assertion: 6.1.2.1(8)
              The syntax and semantics of regular parameters are consistent 
              with those in the function definition.

  @Description: Check that regular named parameters can not be reassigned
                inside the primary constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: Excerpt from 5.1.2 Parameters:
            Parameters defined in the parameter list are all immutable variables,
            i.e. they are defined with let and cannot be assigned within the function definition.

*/

class A {
  A(x!: Int64) {
    x = 5
  }
}

main() {
  let a = A(x: 10)
}
