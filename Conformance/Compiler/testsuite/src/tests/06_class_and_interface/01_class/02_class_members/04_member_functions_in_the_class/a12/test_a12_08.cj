/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a12_08

  @Level:         1

  @Assertion: 6.1.2.4(12)
              Abstract instance member functions have the semantics of open by default.

  @Description: Check that an abstract function with parameters and with a unit return type
                can not have the private access modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: 6.1.2.4 Member functions in the class:
            Functions modified by open must be modified by public or protected

*/

abstract class A {
    private func f(x: Bool, y: String): Unit
}

main() {
}