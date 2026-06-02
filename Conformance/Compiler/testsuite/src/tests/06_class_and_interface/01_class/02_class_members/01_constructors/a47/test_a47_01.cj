/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a47_01

  @Level:         1

  @Assertion: 6.1.2.1(47)
              If neither the primary constructor nor the init constructor is defined for a class,
              the compiler attempts to generate a (public modified) parameterless constructor.

  @Description: Check that a class without explicit constructor has a parameterless constructor
                that can be invoked outside the class and outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a47_aux.cj

*/

import utils.assert.Assert

import a47.*

class Local {
    static func check_static() {
        let l = Local()
        Assert.isTrue(l is Local)
    }

    func check_instance() {
        let l = Local()
        Assert.isTrue(l is Local)
    }
}

class Child <: A47Aux {
    static func check_subclass() {
        let r = A47Aux()
        Assert.isTrue(r is A47Aux)
    }
}

main() {
    let l = Local()
    Assert.isTrue(l is Local)

    Local.check_static()

    l.check_instance()

    let r = A47Aux()
    Assert.isTrue(r is A47Aux)

    Child.check_subclass()
}