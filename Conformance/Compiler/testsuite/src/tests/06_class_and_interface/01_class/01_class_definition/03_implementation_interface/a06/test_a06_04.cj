/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a06_04

  @Level:         1

  @Assertion: 6.1.1.3(6)
              Also, interfaces can be generically defined and legal type arguments
              need to be provided when a generic interface is implemented.

  @Description: Check that it's illegal to instantiate an interface with a string literal

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I<T> {}

class A <: I<"oooooooooo"> {}

main() {
}
