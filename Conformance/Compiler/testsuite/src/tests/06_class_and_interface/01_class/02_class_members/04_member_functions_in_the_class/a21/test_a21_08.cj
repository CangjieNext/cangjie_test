/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a21_08

  @Level:         1

  @Assertion: 6.1.2.4(21)
              Static member functions in both abstract
              and non-abstract classes must have implementations.

  @Description: Check that a public static member generic function
                without parameters and a non-unit return type
                can not be abstract in a regular class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    public static func f<T1, T2, T3>(): (Unit, Unit, Unit)
}

main() {
}