/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a20_06

  @Level:         1

  @Assertion: 6.1.2.1(20)
              Note that the initial values of member variable form parameters 
              are only valid in the main constructor
              and are not included in the member variable definition.

  @Description: Check that the initial value of a protected let member variable parameter
                does not become the default value of the generated instance variable,
                i.e. the instance variable can not be left uninitialized in other constructors

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  A(protected let a!: Int64 = 1) {}

  init(x: Bool) {
  }
}

main() {
}