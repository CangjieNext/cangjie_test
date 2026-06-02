/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a09_04

  @Level:         1

  @Assertion: 6.1.1.3(9)
              When implementing a generic interface, it cannot be directly implemented multiple times 
              with the same type arguments

  @Description: Check that a class can not implement a generic interface twice with the same generic type arguments

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {}

class A<T> <: I<T> & I<T> {}

main() {
}
