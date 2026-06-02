/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a09_67

  @Level:         1

  @Assertion: 6.1.2.1(9)
              The member variable parameter is introduced to reduce code redundancy.
              Defines a member variable parmeter, including the definitions of both a parameter
              and a member variable.

  @Description: Check that a member variable unnamed parameter modified with 'protected let'
                generates an immutable class memeber variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006183

*/

class A {
  A(protected let x: Int64) {}

  func check_rewrite() {
    x = 1
  }
}

main() {
  let a = A(10)
}
