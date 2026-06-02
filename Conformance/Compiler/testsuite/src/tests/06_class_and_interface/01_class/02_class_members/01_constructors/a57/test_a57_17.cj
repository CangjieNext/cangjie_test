/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_17

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can can not escape out of a constructor of an abstract class
                through a lambda accessing an instance member property

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

var lambda_escape: () -> Int64 = { => 1 }

abstract class A {
    init() {
        lambda_escape = { => this.p }
    }

    prop p: Int64 {
        get() {
            10
        }
    }
}

main() {
}