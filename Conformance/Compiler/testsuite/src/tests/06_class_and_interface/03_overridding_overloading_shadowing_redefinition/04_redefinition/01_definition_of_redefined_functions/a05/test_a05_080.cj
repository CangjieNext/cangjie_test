/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a05_080

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(5)
              If the redefined function is a generic function,
              the type argument constraints of the redefined function
              are more loose or the same as those of the implemented function.

  @Description: Check that a class while redefining a generic function from an abstract class
                can not replace one set of generic constraints with another
                while using the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006404

*/

abstract class I {
    static func f<T1, T2, T3, T4>() where T1 <: T2 {}
}

class A <: I {
    public redef static func f<T1, T2, T3, T4>() where T3 <: T4 {}
}

main() {
}