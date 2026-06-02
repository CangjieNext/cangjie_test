/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_03

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can can not escape out of a constructor of an open class
                through a lambda returning 'this'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

var lambda_escape: () -> A = { => A(1) }

open class A {
    init() {
        lambda_escape = { => this }
    }

    init(x: Int64) {}
}

main() {
}