/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a04_02

  @Level:         1

  @Assertion: 6.2.5(4)
              class A <: Any {} // ok
              class B {} // Implicit implement Any
              extend B <: Any {} // error

  @Description: Check the negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class B {} // Implicit implement Any

extend B <: Any {} // error

main() {
}