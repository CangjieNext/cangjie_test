/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a22_11

  @Level:         1

  @Assertion: 6.1.2.1(22)
              The sequence of the parameters of the primary constructor 
              must follow the parameter sequence when the function is defined.
              Non-named parameters must precede all named parameters.

  @Description: Check that a regular named parameter can not be placed
                before a let member variable unnamed parameter

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

*/

class A {
  A(a!: Int64, let b: Int64) {}
}

main() {
}