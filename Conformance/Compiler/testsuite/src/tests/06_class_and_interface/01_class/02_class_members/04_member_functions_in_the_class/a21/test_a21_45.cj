/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a21_45

  @Level:         1

  @Assertion: 6.1.2.4(21)
              Static member functions in both abstract
              and non-abstract classes must have implementations.

  @Description: Check that a protected static member function
                with parameters and a non-unit return type
                can not be abstract in an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    protected static func f(a: Float32, b: String, c: Rune, d!: Unit): Array<Float16>
}

main() {
}