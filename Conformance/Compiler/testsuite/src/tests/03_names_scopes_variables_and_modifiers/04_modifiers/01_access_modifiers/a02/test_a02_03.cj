/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_03

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that members of a class with a private access modifier can be accessed from the same scope
                 via getters method

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_03.cj

*/

package test03

import utils.assert.Assert
import aux_test_a02_03.*


class C {
    private var privateVariable = 11
    private func privateMethod() { return privateVariable*3 }
  
    func getPrivateVar() { return privateVariable }
    func callPrivateMethod() { privateMethod() }
}


main() {
    var obj = C()
    var otherObj = AuxTestA0203()
    Assert.equals(11, obj.getPrivateVar())
    Assert.equals(33, obj.callPrivateMethod())
    Assert.equals(2, otherObj.getPrivateVar())
    Assert.equals(3, otherObj.callPrivateMethod())
}
