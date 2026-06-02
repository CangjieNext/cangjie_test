/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a05_20

  @Level:         1

  @Assertion: 6.2.3(5)
              When inheriting a generic interface, it cannot be directly inherited
              multiple times with the same type arguments.

  @Description: Check that a generic interface can not directly inherit a generic interface
               modified with 'open' twice with the type parameters being a type and its alias

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006378

*/

interface I<T> {}

type X = Unit

interface J<T> <: I<Unit> & I<X> {}

main() {
}