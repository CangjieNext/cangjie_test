/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a01_10

  @Level:         1

  @Assertion: 6.1.2.3(1)
              A variable that is declared in a class or interface is called a member variable.
              Member variables can be declared as immutable by the keyword let, or mutable by the keyword var.

  @Description: Check that a static variable without modifiers defined with the 'let' keyword
                is inaccessible for writing

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006231

*/

class A {
    static let x = 1
    func test() {
        x = 2
    }
}

main() {
}
