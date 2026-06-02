/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a32_06

  @Level:         1

  @Assertion: 6.1.2.1(32)
              A class can define one primary constructor.

  @Description: Check that a class can not defined two primary constructors
                with different signatures

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(x: Bool) {}
  A(a: Int64, b: Int64) {}
}

main() {
}

