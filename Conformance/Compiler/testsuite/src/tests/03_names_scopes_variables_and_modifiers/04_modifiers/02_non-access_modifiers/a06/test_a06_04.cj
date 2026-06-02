/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a06_04

  @Level:         1

  @Assertion:    3.4.2(6) abstract means the class is an abstract class, See class for details

  @Description:  Check that abstract classes can inherit functions.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

interface I {
    func foo() {
        return "foo"
    }

    static func fooS() {
        return "static foo"
    }
}

abstract class C1 <: I {

}

class C2 <: C1 {

}

main() {
    Assert.equals("static foo", C1.fooS())

    var obj = C2()
    Assert.equals("foo", obj.foo())
}
