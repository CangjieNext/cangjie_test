/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a01_72

  @Level:         1

   @Assertion: 6.1.2.3(1)
              A variable that is declared in a class or interface is called a member variable.
              Member variables can be declared as immutable by the keyword let, or mutable by the keyword var.

  @Description: Check that a variable inside the class can not be declared with the keyword 'while'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006231

*/

class A {
    while x: Int64 = 1
}

main() {
}
