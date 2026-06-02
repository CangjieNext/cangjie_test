/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a25_17

  @Level:         1

  @Assertion: 6.1.2.1(25)
              After calling super, expressions, local variable declarations and
              local function definitions are allowed in the primary constructor body. 

  @Description: Check that a static public let class member variable definition is not allowed
                in the primary constructor body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A() {
    static public let x = 1
  }
}

main() {
}