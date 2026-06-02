/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a32_37

  @Level:         1

  @Assertion: 6.1.2.4(32)
              open: A function declared with the modifier open can be override.

  @Description: Check that a protected function without the 'open' modifier
                with parameters and with a non-Unit return type
                can not be overridden when inherited from an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    protected func f(x: String) {
      return 1
    }
}

class Test <: A {
    protected func f(x: String) {
      return 2
    }
}

main() {
}