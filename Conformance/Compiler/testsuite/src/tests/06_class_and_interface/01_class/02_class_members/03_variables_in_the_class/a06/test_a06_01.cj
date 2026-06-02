/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a06_01

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            Variables in class can be declared with the following modifiers.

  @Assertion: 6.1.2.3(6)
              public: A variable declared with modifier public can be accessed outside the class.

  @Description: Check that variables in a class can be declared with the 'public' modifier
                and those variables are visible everywhere

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a06_aux.cj

*/

import utils.assert.Assert

import a06.*

class Test <: A06Aux {
    func verifySub() {
        let x = A06Aux()
        Assert.equals(1, x.m1)
        Assert.equals(2, x.m2)

        Assert.equals(10, A06Aux.s1)
        Assert.equals(11, A06Aux.s2)

        x.m1 = -1
        Assert.equals(-1, x.m1)

        A06Aux.s1 = 35
        Assert.equals(35, A06Aux.s1)
    }
}

main() {
    let remote = A06Aux()

    // Check access for reading outside the package
    Assert.equals(1, remote.m1)
    Assert.equals(2, remote.m2)
    Assert.equals(10, A06Aux.s1)
    Assert.equals(11, A06Aux.s2)

    // Check access for reading and writing inside the class
    remote.verifyInstance()
    A06Aux.verifyStatic()

    // Check access for reading and writing in a subclass outside the package
    let test = Test()
    test.verifySub()

    // Check access for writing outside the package
    remote.m1 = 76
    A06Aux.s1 = 876
    Assert.equals(76, remote.m1)
    Assert.equals(876, A06Aux.s1)
}

