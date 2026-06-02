/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_01

  @Level:         1

  @Assertion:    3.4.2(3)
                 override means overriding a member of the parent class, See class for details

  @Description:  Check that types which inherit classes and interfaces can override their functionsa.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

interface I {
    func foo1(): String

    func foo2() {
        return 'I'
    }
}

open class C1 {
    open public func foo3(): Int64 {
        return 1999
    }

    open public func foo4() {
        return 19.99
    }
}

class C2 <: C1 & I  {
    override public func foo1() {
        return "overriden fi"
    }

    override public func foo2() {
        return 'o'
    }

    override public func foo3() {
        return 2023
    }

    override public func foo4() {
        return 20.23
    }
}

main() {
    var obj2 = C2()
    Assert.equals("overriden fi", obj2.foo1())
    Assert.equals('o', obj2.foo2())
    Assert.equals(2023, obj2.foo3())
    Assert.equals(20.23, obj2.foo4())
}
