/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a32_03

  @Level:         1

  @Assertion: 6.1.2.1(32)
              A class can define one primary constructor.

  @Description: Check that a class can not define two primary constructors
                without parameters and with different modifiers

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  public A() {}
  private A() {}
}

main() {
}

