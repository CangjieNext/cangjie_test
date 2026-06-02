/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_01

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that members of a class with the default access modifier can be accessed 
                 within the same package

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class A {
    var defaultVariable = 20

    func getPoweredA() {
        return defaultVariable*defaultVariable
    }
}

class B {
    var obj = A()
    func getDefaultVariable() {
        return obj.defaultVariable
    }

    func callMethod() {
        obj.getPoweredA()
    }
}


main() {
    var obj = A()
    var otherObj = B()
    Assert.equals(20, obj.defaultVariable)
    Assert.equals(400, obj.getPoweredA())
    Assert.equals(20, otherObj.getDefaultVariable())
    Assert.equals(400, otherObj.callMethod())
}
