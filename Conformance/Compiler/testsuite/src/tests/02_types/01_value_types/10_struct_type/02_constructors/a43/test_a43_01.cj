/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a43_01

  @Level:         1

  @Assertion: 2.1.10.2(43)
              If neither the primary constructor nor the init constructor is defined for a struct,
              the compiler attempts to generate a (public modified) parameterless constructor.

  @Description: Check that a struct without explicit constructor has a parameterless constructor
                that can be invoked outside the struct and outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a43_aux.cj

*/

import utils.assert.Assert

import a43.*

struct Local {
    static func check_static() {
        let l = Local()
        Assert.isTrue(l is Local)
    }

    func check_instance() {
        let l = Local()
        Assert.isTrue(l is Local)
    }
}

main() {
    let l = Local()
    Assert.isTrue(l is Local)

    Local.check_static()

    l.check_instance()

    let r = A43Aux()
    Assert.isTrue(r is A43Aux)
}