/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_13

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can not escape out of a constructor of an open class
                by passing it as an argument to a global function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

func f(x: A) {}

open class A {
    init() {
        f(this)
    }
}

main() {
}