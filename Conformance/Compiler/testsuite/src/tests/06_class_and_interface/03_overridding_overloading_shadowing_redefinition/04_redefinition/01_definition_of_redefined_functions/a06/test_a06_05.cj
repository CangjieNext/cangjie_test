/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a06_05

  @Level:         1

  @Comment: This assertion is a part of a list with the heading:
            Such function redefinition must comply with the following rules.

  @Assertion: 6.3.4.1(6)
              Same function redefines several functions in the super classes, each follows the above rules.

  @Description: Check that a class can redefine several generic functions with one function
                if the constrains of the redefining function are looser
                than constraints of each redefined function

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006426

*/

import utils.assert.Assert

open class Grandparent {}
open class Parent <: Grandparent {}
class Child <: Parent {}

interface I1 {
    static func f<T>(): Int64 where T <: Parent
}

interface I2 {
    static func f<T>(): Int64 where T <: Child
}

open class A {
    public static func f<T>() where T <: Grandparent {
        return 0
    }
}

class T1 <: A & I1 & I2 {
    public redef static func f<T>() where T <: Object {
        return 11
    }
}

main() {
    Assert.equals(11, T1.f<Box<Unit>>())
}