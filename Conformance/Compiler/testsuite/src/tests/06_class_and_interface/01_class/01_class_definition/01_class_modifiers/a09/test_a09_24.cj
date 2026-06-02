/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a09_24

  @Level:         1

  @Assertion: 6.1.1.1(9)
              Private abstract functions cannot be declared in abstract classes.

  @Description: Check that private functions with signature (class) -> Unit can not be abstract

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class B {}

abstract class A {
  private func foo(x: B): Unit
}

main() {
}
