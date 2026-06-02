/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_05

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers

  @Description:  Checks that members of a class with a private access modifier can be accessed from the same scope
                 via getters method

  @Mode:         run

  @Negative:     no

  @Dependencies: aux_test_a01_05.cj

  @Structure:    complex-main

*/

package test05
import aux_test_a01_05.*

import utils.assert.Assert

class C {
    private var privateVariable = 1
    private func privateMethod() { return privateVariable*3 }
  
    func getPrivateVar() { return privateVariable }
    func callPrivateMethod() { privateMethod() }
}


main() {
    var obj = C()
    var otherObj = AuxTestA0105()

    Assert.equals(1, obj.getPrivateVar())
    Assert.equals(3, obj.callPrivateMethod())
    Assert.equals(10, otherObj.getPrivateVar())
    Assert.equals(30, otherObj.callPrivateMethod())
}
