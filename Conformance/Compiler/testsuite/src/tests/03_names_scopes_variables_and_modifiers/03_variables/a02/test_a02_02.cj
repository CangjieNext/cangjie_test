/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a02_02

  @Level:         1

  @Assertion:    3.3(2) Variables can be classified into the following types based on whether they can be modified:
                  immutable variables (whose value cannot be modified once initialized) and mutable variables
                  (whose values can be modified).

  @Description:  Check that variable declaration using keyword r'var' (mutable) and with type can be modified after
                  init.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myTopLevelPublicVar: Float32 = 0.0
public var myTopLevelVar: String = "AAA"

class MyClass {
    static public var myStaticPublicClassMemberVar: Int32 = 127
    public var myPublicClassMemberVar: Int64 = 127
    static private var myStaticPrivateClassMemberVar: Float64 = 12.3
    private var myPrivateClassMemberVar: Float16 = 1.03
    static protected var myStaticProtectedClassMemberVar: UInt32 = 27
    protected var myProtectedClassMemberVar: Int8 = 17
    static var myStaticClassMemberVar: String = "12"
    var myClassMemberVar: Rune = r'2'

    MyClass() {}

    func updateIntValues(inVal1: Int64, inVal2: Int8 ){
        this.myPublicClassMemberVar = inVal1
        Assert.equals(this.myPublicClassMemberVar,inVal1)
        this.myProtectedClassMemberVar = inVal2
        Assert.equals(this.myProtectedClassMemberVar,inVal2)
    }

    func updateFloatValue(inVal: Float16){
        this.myPrivateClassMemberVar = inVal
        Assert.equals(this.myPrivateClassMemberVar,inVal)
    }

    func updateCharValue(inVal: Rune){
        this.myClassMemberVar = inVal
        Assert.equals(this.myClassMemberVar,inVal)
    }

    func updateStaticValues(inVal1: Float64,inVal2: UInt32){
        myStaticPrivateClassMemberVar = inVal1
        Assert.equals(myStaticPrivateClassMemberVar,inVal1)
        myStaticProtectedClassMemberVar = inVal2
        Assert.equals(myStaticProtectedClassMemberVar,inVal2)
    }
}

main() {
    myTopLevelPublicVar = -1.22
    Assert.equals(-1.22, myTopLevelPublicVar)

    myTopLevelVar = "New string"
    Assert.equals("New string", myTopLevelVar)
    
    var nameVar: Rune = r'A'
    Assert.equals(r'A', nameVar)

    nameVar = r'B'
    Assert.equals(r'B', nameVar)

    MyClass.myStaticPublicClassMemberVar = 12
    Assert.equals(12, MyClass.myStaticPublicClassMemberVar)
    MyClass.myStaticClassMemberVar = "SSSSS"
    Assert.equals("SSSSS", MyClass.myStaticClassMemberVar)

    var myClassImpl = MyClass()
    myClassImpl.updateIntValues(44, 28)
    myClassImpl.updateFloatValue(3.14)
    myClassImpl.updateCharValue(r'G')
    myClassImpl.updateStaticValues(2.73,273)
}
