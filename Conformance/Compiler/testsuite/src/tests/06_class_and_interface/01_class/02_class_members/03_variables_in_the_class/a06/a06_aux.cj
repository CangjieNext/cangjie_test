/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*

  @Comment: This assertion is a part of the list with the following heading:
            Variables in class can be declared with the following modifiers.

  @Assertion: public: A variable declared with modifier public can be accessed outside the class.

  @Description: Definition of a class with public member variables

  @Structure: complex-aux
*/

package a06

import utils.assert.Assert

public open class A06Aux {
    public var m1 = 1
    public let m2 = 2

    static public var s1 = 10
    static public let s2 = 11

    public func verifyInstance() {
        let x = A06Aux()
        Assert.equals(1, x.m1)
        Assert.equals(2, x.m2)

        Assert.equals(10, A06Aux.s1)
        Assert.equals(11, A06Aux.s2)

        x.m1 = -1
        Assert.equals(-1, x.m1)

        A06Aux.s1 = 99
        Assert.equals(99, A06Aux.s1)
    }

    public static func verifyStatic() {
        let x = A06Aux()
        Assert.equals(1, x.m1)
        Assert.equals(2, x.m2)

        Assert.equals(99, A06Aux.s1)
        Assert.equals(11, A06Aux.s2)

        x.m1 = -1
        Assert.equals(-1, x.m1)

        A06Aux.s1 = 10
        Assert.equals(10, A06Aux.s1)
    }
}

