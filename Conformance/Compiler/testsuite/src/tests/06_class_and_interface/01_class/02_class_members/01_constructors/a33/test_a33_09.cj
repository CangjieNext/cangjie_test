/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a33_09

  @Level:         1

  @Assertion: 6.1.2.1(33)
              In addition to the primary constructor,
              other constructors can be defined as usual,
              but the other constructors must form an overload
              with the corresponding constructor of the primary constructor.

  @Description: Check that a class can not have a primary constructor
                and an init constructor with the same signature
                and with different modifiers:
                one signature has a named parameter and another has an unnamed parameter

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(x: Int64) {}
  public init(x!: Int64) {}
}

main() {
}