/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a21_37

  @Level:         1

  @Assertion: 6.1.2.1(21)
              Regular parameters must precede all member variable parameters.

  @Description: Check that a var unnamed member variable parameter
                can not be placed between two regular unnamed parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(c: Bool, var a: Int64, b: Bool) {}
}

main() {
}