/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a09_10

  @Level:         1

  @Assertion: 6.1.1.3(9)
              When implementing a generic interface, it cannot be directly implemented multiple times 
              with the same type arguments

  @Description: Check that a class can not implement a generic interfaces multiple times 
                with the same generic type arguments. Other interfaces are present as well.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {}
interface I1 {}
interface I2 {}
interface I3 {}

class A<T> <: I1 & I<T> & I2 & I<T> & I3 & I<T> {}

main() {
}
