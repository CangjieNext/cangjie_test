/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a32_32

  @Level:         1

  @Assertion: 6.1.2.4(32)
              open: A function declared with the modifier open can be override.

  @Description: Check that a public generic function without the 'open' modifier
                without parameters and with a non-Unit return type
                can not be overridden when inherited from an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    public func f<T>() {
      return 1
    }
}

class Test <: A {
    public func f<T>() {
      return 2
    }
}

main() {
}