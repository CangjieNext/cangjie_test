/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_07

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that subclass can override superclass open functions.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

interface I {
    func foo () {
        return "foo"
    }
}

open class C1 {
    var num = 0

    public open func addOne() {
        this.num += 1
    }
}

class C2 <: C1 & I {
    override public  func addOne() {
        this.num += 1000
    }

    override public func foo() {
        return "Hello World!"
    }
}

main() {
    var obj1 = C1()
    var obj2 = C2()
    obj1.addOne()
    obj2.addOne()
    Assert.equals(1, obj1.num)
    Assert.equals(1000, obj2.num)
}
