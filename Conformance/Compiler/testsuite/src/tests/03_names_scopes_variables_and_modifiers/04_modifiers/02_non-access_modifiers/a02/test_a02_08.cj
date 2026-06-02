/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_08

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that subclass can override abstract superclass open functions.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

abstract class C1 {
    public open func f1() {
        return "foo"
    }
}

class C2 <: C1 {
    override public func f1() {
        return "new foo"
    }
}

main() {
    var obj2 = C2()
    Assert.equals("new foo", obj2.f1())
}
