/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a03_093

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(3)
              The parameter type of the function must be the same as the redefined function.
              The same parameter list indicates that the number and
              types of parameters of a function are the same.

  @Description: Check that a function can not redefine
                a function from a sealed class
                if it has more parameters

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006084

*/

sealed class I {
    static func f(x: Int64, y: Int64) {}
}

class A <: I {
    public redef static func f(x: Int64, y: Int64, z: Int64) {}
}

main() {
}