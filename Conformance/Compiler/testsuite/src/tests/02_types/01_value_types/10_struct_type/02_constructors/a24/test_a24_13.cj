/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a24_13

  @Level:         1

  @Assertion: 2.1.10.2(24)
              Declarations and expressions are allowed in the primary constructor body
              but must meet the requirements of init constructors.

  @Description: Check that 'this' can not escape from the primary constructor
                before the initialization of all instance member variables

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: From the description in the init constructor section:
            Before all of the instance member variables are initialized,
            the constructor cannot use functions or lambda that capture this

*/

var escape = { => Object() }

struct A {
    A() {
        escape = { => this }

        this.x = 1
    }

    var x: Int64
}

main() {
}