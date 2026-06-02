/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a09_09

  @Level:         1

  @Assertion: 6.3.4.1(9)
              redef modifier cannot be used for a static initializer
              because it’s only called implicitly, the compiler reports an error otherwise.

  @Description: Check that a generic class can not redefine the static initializer
                from a parent open class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006136

*/

open class A {
    static init() {}
}

class C<T> <: A {
    redef static init() {}
}

main() {
}