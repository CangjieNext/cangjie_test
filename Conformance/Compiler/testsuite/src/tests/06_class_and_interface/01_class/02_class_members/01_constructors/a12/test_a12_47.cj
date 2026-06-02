/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a12_47

  @Level:         1

  @Assertion: 6.1.2.1(12)
              The syntax of the member variable parameter is the same as that
              defined outside the primary constructor.

  @Description: Check that a var member variable parameter can not be named
                with a constant pattern that is an integer literal

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(var 484741: Int64) {}
}

main() {
}