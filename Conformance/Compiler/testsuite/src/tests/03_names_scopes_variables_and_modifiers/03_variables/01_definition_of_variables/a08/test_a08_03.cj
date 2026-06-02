/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a08_03

  @Level:         1

  @Assertion:    3.3.1(8) var is used to define mutable variables.

  @Description:  Check that variable defined as 'var' is mutable.
                 Case: Value of class member mutable variables can be changed in constructor

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class MyClass {
    public var varPublicNotInitialisedInt32: Int32
    protected var varProtectedNotInitialisedInt32: Int32
    private var varPrivateNotInitialisedInt32: Int32
    var varNotInitialisedInt32: Int32
    MyClass(inVal: Int32) {
        this.varPublicNotInitialisedInt32 = inVal
        this.varProtectedNotInitialisedInt32 = inVal
        this.varPrivateNotInitialisedInt32 = inVal
        this.varNotInitialisedInt32 = inVal
    }

    func getPrivate(): Int32 {
        return varPrivateNotInitialisedInt32;
    }
}

main() {
    var myClassImpl = MyClass(45)

    Assert.equals(45, myClassImpl.varPublicNotInitialisedInt32)
    Assert.equals(45, myClassImpl.varProtectedNotInitialisedInt32)
    var tmpVar = myClassImpl.getPrivate()
    Assert.equals(45, tmpVar)
    Assert.equals(45, myClassImpl.varNotInitialisedInt32)

    let arrayNum: Array<Int32> = [1, 8, 0, 1, 0]

    for (num in arrayNum) {
        var myClassImpl = MyClass(num)
        Assert.equals(myClassImpl.varPublicNotInitialisedInt32, num)
        Assert.equals(myClassImpl.varProtectedNotInitialisedInt32, num)
        Assert.equals(myClassImpl.varNotInitialisedInt32, num)
        var tmpVar = myClassImpl.getPrivate()
        Assert.equals(tmpVar, num)
    }
}
