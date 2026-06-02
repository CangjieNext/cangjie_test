/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a05_26

  @Level:         1

  @Assertion: 6.2.3(5)
              When inheriting a generic interface, it cannot be directly inherited
              multiple times with the same type arguments.

  @Description: Check that if a generic interface inherits another generic interface without modifiers
                twice and instantiates the superinterface with a generic type parameter,
                the subinterface can not be instantiated with a type that causes
                double inheritance

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {}

interface J<T> <: I<Unit> & I<T> {}

interface K <: J<Unit> {}

main() {
}