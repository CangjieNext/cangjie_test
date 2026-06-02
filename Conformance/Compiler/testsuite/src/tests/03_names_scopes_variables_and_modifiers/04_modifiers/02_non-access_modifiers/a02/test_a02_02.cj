/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_02

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that open modifier allows a class to be inherited and its functions to be accessed from the
                 subclass.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

interface I1 {
    func f0() {
        return "interface foo"
    }
}

open class C1 <: I1 {
    func f1() {
        return "foo"
    }

    protected func f2() {
        return "protected foo"
    }

    static func f3() {
        return "static foo"
    }
}

class C2 <: C1 {

}

main() {
    var obj = C2()
    Assert.equals("interface foo", obj.f0())
    Assert.equals("foo", obj.f1())
    Assert.equals("protected foo", obj.f2())
    Assert.equals("static foo", C2.f3())
}
