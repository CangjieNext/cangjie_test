/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a03_36

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function overriding must comply with the following rules.

  @Assertion: 6.3.1.1(3)
              The parameter type of the function must be the same as the overridden function.
              The same parameter list indicates that the number
              and types of parameters of a function are the same.

  @Description: Check that a function with parameters
                can not override an open function with no parameters from an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
    public open func f() {}
}

class C <: A {
    public override func f(x: Unit) {}
}

main() {
}