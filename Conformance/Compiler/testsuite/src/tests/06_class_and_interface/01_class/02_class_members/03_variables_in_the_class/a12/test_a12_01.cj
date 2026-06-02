/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a12_01

  @Level:         1

  @Assertion: 6.1.2.3(12)
              protected: The variable can only be accessed within this package or in a subclass.

  @Description: Check that the member variables declared as with the 'protected' modifiers
                are accessible in the current package, inside their class and
                in a subclass outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a12_aux.cj

*/

import utils.assert.Assert

import a12.*

class Local <: A12Aux {
    protected var li1 = 10
    protected let li2 = 20
    static protected var ls1 = 30
    static protected let ls2 = 40

    func test_intance() {
        let r = A12Aux()
        Assert.equals(1, r.m1)
        Assert.equals(2, r.m2)
        Assert.equals(3, A12Aux.s1)
        Assert.equals(4, A12Aux.s2)

        r.m1 = 3
        A12Aux.s1 = 9
        Assert.equals(3, r.m1)
        Assert.equals(9, A12Aux.s1)
        A12Aux.s1 = 3

        let l = Local()
        Assert.equals(10, l.li1)
        Assert.equals(20, l.li2)
        Assert.equals(30, Local.ls1)
        Assert.equals(40, Local.ls2)

        l.li1 = 3
        Local.ls1 = 9
        Assert.equals(3, l.li1)
        Assert.equals(9, Local.ls1)
        Local.ls1 = 30
    }

    static func test_static() {
        let r = A12Aux()
        Assert.equals(1, r.m1)
        Assert.equals(2, r.m2)
        Assert.equals(3, A12Aux.s1)
        Assert.equals(4, A12Aux.s2)

        r.m1 = 3
        A12Aux.s1 = 9
        Assert.equals(3, r.m1)
        Assert.equals(9, A12Aux.s1)
        A12Aux.s1 = 3

        let l = Local()
        Assert.equals(10, l.li1)
        Assert.equals(20, l.li2)
        Assert.equals(30, Local.ls1)
        Assert.equals(40, Local.ls2)

        l.li1 = 3
        Local.ls1 = 9
        Assert.equals(3, l.li1)
        Assert.equals(9, Local.ls1)
        Local.ls1 = 30
    }
}

main() {
    let l = Local()
    Assert.equals(10, l.li1)
    Assert.equals(20, l.li2)
    Assert.equals(30, Local.ls1)
    Assert.equals(40, Local.ls2)

    l.li1 = 3
    Local.ls1 = 9
    Assert.equals(3, l.li1)
    Assert.equals(9, Local.ls1)
    Local.ls1 = 30

    l.test_intance()
    Local.test_static()
}