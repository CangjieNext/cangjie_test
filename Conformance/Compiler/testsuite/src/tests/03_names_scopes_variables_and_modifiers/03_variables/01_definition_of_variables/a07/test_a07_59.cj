/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a07_59

  @Level:         1

  @Assertion:    3.3.1(7)  let is used to define immutable variables.  Once initialized, a let variable 
                 cannot be changed.

  @Description:  Check that immutable variables are defined, initialized and assigned correctly

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public let myPublicTopLetNotDefinedInitialized = 16
public let myPublicTopLetInt64Initialized: Int64 = 2
public let myPublicTopLetTupleInitialized = (-4,"Afaf")

let myTopLetNotDefinedInitialized = 7
let myTopLetInt64Initialized: Int64 = -88
let myTopLetTupleInitialized = (12,"HtH")

class MyClass {
    public let letPublicInitialisedInt32: Int32 = 12
    public let letPublicNotInitialisedInt32: Int32
    protected let letProtectedInitialisedFloat32: Float32 = 12.03
    protected let letProtectedNotInitialisedInt32: Int32
    private let letPrivateInitialisedChar: Rune = r'R'
    private let letPrivateNotInitialisedInt32: Int32
    let letInitialisedString: String = "12segfdx"
    let letNotInitialisedInt32: Int32
    MyClass(inVal: Int32){
        this.letPublicNotInitialisedInt32 = inVal
        this.letProtectedNotInitialisedInt32 = inVal
        this.letPrivateNotInitialisedInt32 = inVal
        this.letNotInitialisedInt32 = inVal
    }

    func checkValues(inVal: Int32) {
        Assert.equals(this.letPublicNotInitialisedInt32, inVal)
        Assert.equals(this.letProtectedNotInitialisedInt32, inVal)
        Assert.equals(this.letPrivateNotInitialisedInt32, inVal)
        Assert.equals(this.letNotInitialisedInt32, inVal)
  
        Assert.equals(12, this.letPublicInitialisedInt32)
        Assert.equals(12.03, this.letProtectedInitialisedFloat32)

        Assert.equals(r'R', this.letPrivateInitialisedChar)
        Assert.equals("12segfdx", this.letInitialisedString)
    }
}

func assignAndCheckByCondition(flag: Bool) {
    let myLocalNotInitializedFloat32: Float32
    if (flag) {
      myLocalNotInitializedFloat32 = 24.13
      Assert.equals(24.13, myLocalNotInitializedFloat32)
    } else {
      myLocalNotInitializedFloat32 = -9.03
      Assert.equals(-9.03, myLocalNotInitializedFloat32)
    }
}

main() {
    let myBoolTrue: Bool = true
    let myBoolFalse: Bool = false
    Assert.equals(true, myBoolTrue)
    Assert.equals(false, myBoolFalse)

    assignAndCheckByCondition(myBoolTrue)
    assignAndCheckByCondition(myBoolFalse)

    var myVarInt64Initialized: Int64 = 0
    let myLetInt64Initialized: Int64 = myVarInt64Initialized
    Assert.equals(0, myLetInt64Initialized)

    let myLetNotDefinedInitialized = 44
    Assert.equals(44, myLetNotDefinedInitialized)

    var myVarTupleInitialized = (0,"AAA")
    let myLetTupleInitialized = myVarTupleInitialized
    Assert.equals(0, myLetTupleInitialized[0])
    Assert.equals("AAA", myLetTupleInitialized[1])

    let myLetInt64NotInitialized: Int64
    myLetInt64NotInitialized = -90
    Assert.equals(-90, myLetInt64NotInitialized)

    Assert.equals(16, myPublicTopLetNotDefinedInitialized)
    Assert.equals(2, myPublicTopLetInt64Initialized)
    Assert.equals(-4, myPublicTopLetTupleInitialized[0])
    Assert.equals("Afaf", myPublicTopLetTupleInitialized[1])
    Assert.equals(7, myTopLetNotDefinedInitialized)
    Assert.equals(-88, myTopLetInt64Initialized)
    Assert.equals(12, myTopLetTupleInitialized[0])
    Assert.equals("HtH", myTopLetTupleInitialized[1])

    let myClassImpl = MyClass(22)
    myClassImpl.checkValues(22)
}
