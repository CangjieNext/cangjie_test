/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a16_01

  @Level:         1

  @Assertion:    3.3.1(16) 5. Variables can be defined in the top-level, expression, or class/struct type

  @Description:  Check that mutable variables can be defined in the top-level, expression, or class/struct type
                 Used variants: variables, class/struct members

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myPublicTopVar: Int8 = 127
var myTopVar: Int32 = 16

class MyClass {
    static public var myStaticPublicClassMemberVar: String = "127"
    public var myPublicClassMemberVar: Int8 = 127
    static private var myStaticPrivateClassMemberVar: Float16 = 12.7
    private var myPrivateClassMemberVar: Int8 = 127
    static protected var myStaticProtectedClassMemberVar: Int8 = 127
    protected var myProtectedClassMemberVar: Rune = r'J'
    static var myStaticClassMemberVar: Int8 = 127
    var myClassMemberVar: Int8 = 127

    public var myPublicClassMemberVarNotInitalised: Int8
    private var myPrivateClassMemberVarNotInitalised: Int8
    protected var myProtectedClassMemberVarNotInitalised: Int8
    var myClassMemberVarNotInitalised: Int8

    MyClass(inVal: Int8) {
        this.myPublicClassMemberVarNotInitalised = inVal
        this.myPrivateClassMemberVarNotInitalised = inVal
        this.myProtectedClassMemberVarNotInitalised = inVal
        this.myClassMemberVarNotInitalised = inVal
    }

    func checkProtected() {
        Assert.equals(r'J', this.myProtectedClassMemberVar)
        Assert.equals(8, this.myProtectedClassMemberVarNotInitalised)
    }
}

struct Triangle { 
    var base: Int32 = 10 
    var height: Int32 = 10 

    init (inBase: Int32, inHeight: Int32) { 
        this.base = inBase 
        this.height = inHeight 
    } 
} 

main() {
    Assert.equals(127, myPublicTopVar)
    Assert.equals("127", MyClass.myStaticPublicClassMemberVar)
    Assert.equals(127, myPublicTopVar)
    Assert.equals(16, myTopVar)

    var myTriangle = Triangle(12, 8)
    Assert.equals(8, myTriangle.height)

    var myClassImp = MyClass(8)
    myClassImp.checkProtected()
}
