/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_02

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that members of a class with a public access modifier can be accessed 
                 from same and another packages

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_02.cj

*/

package test02

import utils.assert.Assert
import aux_test_a02_02.*

class B {
    public var publicVariable = 4
    public func publicMethod() {
        return 22
    }
}

main() {
    var obj = AuxTestA0202()
    var otherObj = B()
    Assert.equals(11, obj.publicMethod())
    Assert.equals(2, obj.publicVariable)
    Assert.equals(22, otherObj.publicMethod())
    Assert.equals(4, otherObj.publicVariable)
}
