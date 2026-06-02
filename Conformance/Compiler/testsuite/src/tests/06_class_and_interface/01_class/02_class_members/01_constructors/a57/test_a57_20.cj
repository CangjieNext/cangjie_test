/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_20

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can can not escape out of a constructor of an abstract class
                through a function accessing an instance member variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006225

*/

var func_escape: () -> Int64 = { => 1 }

abstract class A {
    init() {
        func local() {
            return this.x
        }

        func_escape = local
    }

    var x = 1
}

main() {
}