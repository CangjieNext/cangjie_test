/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_03

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that functions from generic classes and interfaces can be overriden.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1<T1> {
    open public func foo1(p: T1) {
        return p
    }
}

interface I<T2> {
    func foo2(p: T2) {
        return p
    }
}

class C2 <: C1<Int64> & I<String> {
    override public func foo1(p: Int64) {
        return p + p
    }

    override public func foo2(p: String) {
        return "type ${p}"
    }
}

main() {
    var obj = C2()
    Assert.equals(64, obj.foo1(32))
    Assert.equals("type string", obj.foo2("string"))
}
