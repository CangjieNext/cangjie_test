/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a36_17

  @Level:         1

  @Assertion: 6.1.2.4(36)
              Functions modified by open must be modified by public or protected

  @Description: Check that an open function with parameters and with a non-Unit return type
                can not have the default access modifier in an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    open func f(x: String, y: String) {
      return x + y
    }
}

main() {
}