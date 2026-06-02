/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a05_02

  @Level:         1

  @Assertion: 6.2.3(5)
              When inheriting a generic interface, it cannot be directly inherited
              multiple times with the same type arguments.

  @Description: Check that an interface can not directly inherit a generic interface
                without modifiers with the same type parameters twice

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {}

interface J <: I<Unit> & I<Unit> {}

main() {
}