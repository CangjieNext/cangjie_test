/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a21_18

  @Level:         1

  @Assertion: 6.1.2.4(21)
              Static member functions in both abstract
              and non-abstract classes must have implementations.

  @Description: Check that a public static member function
                with the empty signature
                can not be abstract in an open class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
    public static func f(): Unit
}

main() {
}