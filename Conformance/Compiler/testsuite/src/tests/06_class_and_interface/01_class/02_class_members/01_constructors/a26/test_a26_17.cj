/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a26_17

  @Level:         1

  @Assertion: 6.1.2.1(26)
              The declarations, definitions and expressions must comply with the rules
              for using this and super in the init constructors.

  @Description: Check that 'this' can not escape from the primary constructor
                before the initialization of all instance member variables

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: From the description in the init constructor section:
            Before all of the instance member variables are initialized,
            the constructor cannot use functions or lambda that capture this
            or use super functions by super.f or use separate this expression

*/

var escape = { => Object() }

class A {
  A() {
    escape = { => this }

    this.x = 1
  }

  var x: Int64
}

main() {
}