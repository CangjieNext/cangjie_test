/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a41_32

  @Level:         1

  @Assertion: 6.1.2.4(41)
              The instance members of the class cannot be accessed in the static member function.

  @Description: Check that a mutable instance variable without modifiers can not be accessed
                in a static generic function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    var x = 1
    static func f<T>() {
        x
    }
}

main() {
}