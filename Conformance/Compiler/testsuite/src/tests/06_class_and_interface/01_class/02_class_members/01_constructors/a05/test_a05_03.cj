/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a05_03

  @Level:         1

  @Assertion: 6.1.2.1(5)
              The keyword func is not allowed before the primary constructor name.

  @Description: Check that a primary constructor with a protected modifier and with class parameters
                can not have a keyword func before it

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  protected func A(public let x: String) {}
}

main() {
}
