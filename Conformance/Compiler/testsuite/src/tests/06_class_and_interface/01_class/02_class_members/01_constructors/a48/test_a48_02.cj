/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a48_02

  @Level:         1

  @Assertion: 6.1.2.1(48)
              If the super class does not have a parameterless constructor or
              one of the instance member variables of the class have no initial value,
              an error is reported during compilation.

  @Description: Check that an error is produced if a class does not have an explicit constructor
                and the superclass does not have the parameterless constructor

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            "If neither the primary constructor nor the init constructor is defined for a class,
            the compiler attempts to generate a (public modified) parameterless constructor."
            So it only applies to implicit constructors

*/

open class Parent {
    init(x: Int64) {}
}

class A <: Parent {}

main() {
}