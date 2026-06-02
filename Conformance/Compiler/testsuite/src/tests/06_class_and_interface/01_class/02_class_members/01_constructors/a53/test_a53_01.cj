/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a53_01

  @Level:         1

  @Assertion: 6.1.2.1(53)
              If the super class does not have a parameterless constructor,
              an error will be reported during compilation.

  @Description: Check that an error is produced if
                the superclass does not have a parameterless constructor
                and the subclass's constructor does not call any constructors explicitly

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            "If the constructor does not explicitly calling other constructors
            or calling the superclass’s constructor, the compiler inserts
            the parameterless constructor of the super class into the constructor."
            So it only applies to implicit constructors

*/

open class A {
    init(x: Int64) {}
}

class B <: A {
    init() {}
}

main() {
}