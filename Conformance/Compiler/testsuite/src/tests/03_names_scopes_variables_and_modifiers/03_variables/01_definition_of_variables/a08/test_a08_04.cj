/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a08_04

  @Level:         1

  @Assertion:    3.3.1(8) var is used to define mutable variables.

  @Description:  Check that variable defined as 'var' is mutable.
                 Case: Value of class member mutable variables can be changed using class methods

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class MyClass {
    public var varPublicInitialisedInt32: Int32 = 12
    public var varPublicNotInitialisedInt32: Int32
    protected var varProtectedInitialisedInt32: Int32 = 12
    protected var varProtectedNotInitialisedInt32: Int32
    private var varPrivateInitialisedInt32: Int32 = 12
    private var varPrivateNotInitialisedInt32: Int32
    var varInitialisedInt32: Int32 = 12
    var varNotInitialisedInt32: Int32

    MyClass(inVal: Int32) {
        this.varPublicNotInitialisedInt32 = inVal
        this.varProtectedNotInitialisedInt32 = inVal
        this.varPrivateNotInitialisedInt32 = inVal
        this.varNotInitialisedInt32 = inVal
    }

    func changeVal(inVal: Int32) {
        this.varPublicInitialisedInt32 = inVal
        this.varPublicNotInitialisedInt32 = inVal
        this.varProtectedInitialisedInt32 = inVal
        this.varProtectedNotInitialisedInt32 = inVal
        this.varPrivateInitialisedInt32 = inVal
        this.varPrivateNotInitialisedInt32 = inVal
        this.varInitialisedInt32 = inVal
        this.varNotInitialisedInt32 = inVal
    }

    func getPrivate1(): Int32 {
        return varPrivateInitialisedInt32;
    }

    func getPrivate2(): Int32 {
        return varPrivateNotInitialisedInt32;
    }

    func setPrivate1(inVal: Int32) {
        this.varPrivateInitialisedInt32 = inVal;
    }

    func setPrivate2(inVal: Int32) {
        this.varPrivateNotInitialisedInt32 = inVal;
    }
}

func changeVal(num: Int32) {
    var myClassImpl = MyClass(3)
    myClassImpl.changeVal(num)
    Assert.equals(myClassImpl.varPublicInitialisedInt32, num)
    Assert.equals(myClassImpl.varPublicNotInitialisedInt32, num)
    Assert.equals(myClassImpl.varProtectedInitialisedInt32, num)
    Assert.equals(myClassImpl.varProtectedNotInitialisedInt32, num)
}
main() {
    var myClassImpl = MyClass(45)
    myClassImpl.changeVal(65)
    Assert.equals(65, myClassImpl.varPublicInitialisedInt32)
    Assert.equals(65, myClassImpl.varPublicNotInitialisedInt32)
    Assert.equals(65, myClassImpl.varProtectedInitialisedInt32)
    Assert.equals(65, myClassImpl.varProtectedNotInitialisedInt32)
    var tmpVar = myClassImpl.getPrivate1()
    Assert.equals(65, tmpVar)
    tmpVar = myClassImpl.getPrivate2()
    Assert.equals(65, tmpVar)
    Assert.equals(65, myClassImpl.varInitialisedInt32)
    Assert.equals(65, myClassImpl.varNotInitialisedInt32)

    let arrayNum: Array<Int32> = [1, 8, 0, 1, 0]

    for (num in arrayNum) {
        myClassImpl.changeVal(num)
        Assert.equals(myClassImpl.varPublicInitialisedInt32, num)
        Assert.equals(myClassImpl.varPublicNotInitialisedInt32, num)
        Assert.equals(myClassImpl.varProtectedInitialisedInt32, num)
        Assert.equals(myClassImpl.varProtectedNotInitialisedInt32, num)

        myClassImpl.setPrivate1(num)
        tmpVar = myClassImpl.getPrivate1()
        Assert.equals(tmpVar, num)

        myClassImpl.setPrivate2(num)
        tmpVar = myClassImpl.getPrivate2()
        Assert.equals(tmpVar, num)
    }

    for (num in arrayNum) {
        changeVal(num)
    }
}