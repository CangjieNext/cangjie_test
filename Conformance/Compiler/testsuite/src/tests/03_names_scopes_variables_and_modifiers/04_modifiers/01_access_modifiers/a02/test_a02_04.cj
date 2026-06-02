/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_04

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that members of a class with a protected access modifier can be accessed 
                 from the same package and other package via inheritance

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_04.cj

*/

package test04

import utils.assert.Assert
import aux_test_a02_04.*

class Test {
    protected var a = 2
    protected func b() { return 3 }
}

class SubC <: AuxTestA0204 {
    func getProtectedVar() { return protectedVariable }
    func callProtectedMethod() { protectedMethod() }
}

main() {
    var obj = AuxTestA0204()
    var sub = SubC()
    var t = Test()

    Assert.equals(11, obj.getVar())
    Assert.equals(33, obj.callMethod())
    Assert.equals(11, sub.getProtectedVar())
    Assert.equals(33, sub.callProtectedMethod())
    Assert.equals(2, t.a)
    Assert.equals(3, t.b())
}
