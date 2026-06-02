/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_39

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can not redefine several generic functions with one
                if the redefining function has generic constraints stricter
                than one of the redefined functions.
                Two functions are abstract functions from an interface
                and one is a function from an open class.

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006426

*/

open class Grandparent {}
open class Parent <: Grandparent {}
open class Child <: Parent {}

interface I {
    static func f<T>(): Unit where T <: Grandparent
}

interface J {
    static func f<T>(): Unit where T <: Parent
}

open class A {
    static func f<T>() where T <: Child {}
}

class C <: A & I & J {
    public redef static func f<T>() where T <: Parent {}
}

main() {
}