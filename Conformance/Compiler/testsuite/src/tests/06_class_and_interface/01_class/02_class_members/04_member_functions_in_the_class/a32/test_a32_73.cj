/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a32_73

  @Level:         1

  @Assertion: 6.1.2.4(32)
              open: A function declared with the modifier open can be override.

  @Description: Check that a generic function with the default access modifier
                without the 'open' modifier with parameters and with a non-Unit return type
                can not be overridden when inherited from a sealed class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class A {
    func f<T>(x: String) {
      return 1
    }
}

class Test <: A {
    func f<T>(x: String) {
      return 2
    }
}

main() {
}