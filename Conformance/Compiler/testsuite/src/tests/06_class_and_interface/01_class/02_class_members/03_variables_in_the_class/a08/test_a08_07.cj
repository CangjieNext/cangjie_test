/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a08_07

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            Variables in class can be declared with the following modifiers.

  @Assertion: 6.1.2.3(8)
              private: A variable declared with modifier private can only be accessed in this class.

  @Description: Check that a private immutable instance variable is invisible in a subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


open class A {
    private let x = 1
}

class B <: A {
    func check() {
        let a = A()
        a.x
    }
}

main() {
}