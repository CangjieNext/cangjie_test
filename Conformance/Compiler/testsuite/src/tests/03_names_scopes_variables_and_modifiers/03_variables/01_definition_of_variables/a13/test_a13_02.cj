/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a13_02

  @Level:         1

  @Assertion:    3.3.1(13) The variable type is optional.

  @Description:  Check that mutable variables can be declared w\o type.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

public var myPublicTopVarNotDefinedButInt = 128
public var myPublicTopVarNotDefinedButFloat = 0.13
public var myPublicTopVarNotDefinedButString = "String"
public var myPublicTopVarNotDefinedButChar = r'A'
public var myPublicTopVarNotDefinedButTuple = (12, "aaa", true)

var myTopVarNotDefinedButInt = -16
var myTopVarNotDefinedButFloat = 0.55
var myTopVarNotDefinedButString = "Another string"
var myTopVarNotDefinedButChar = r'V'
var myTopVarNotDefinedButTuple = (74, r'a', 0.25)

enum MyEnym {
    A(Int32) | B(Float32, Rune)
}

class MyClass {
    static public var staticPublicIntVar = 3 
    static public var staticPublicFloatVar = 3.22
    static public var staticPublicStringVar = "string member"
    static public var staticPublicCharVar = r'D'

    public var publicIntVar = 3 
    var intVar = 3 

    public var publicFloatVar = 3.22
    var floatVar = 3.22 

    public var publicStringVar = "string member"
    var stringVar = "string member"

    public var publicCharVar = r'D'
    var charVar = r'D'
}

struct myTestStruct { 
    static var staticIntVar = 3 
    static public var staticPublicIntVar = 3 
    static private var staticPrivateIntVar = 3 
    static var staticFloatVar = 3.22
    static public var staticPublicFloatVar = 3.22
    static private var staticPrivateFloatVar = 3.22
    static var staticStringVar = "string member"
    static public var staticPublicStringVar = "string member"
    static private var staticPrivateStringVar = "string member"
    static var staticCharVar = r'D'
    static public var staticPublicCharVar = r'D'
    static private var staticPrivateCharVar = r'D'

    public var publicIntVar = 3 
    private var privateIntVar = 3 
    var intVar = 3 

    public var publicFloatVar = 3.22
    private var privateFloatVar = 3.22
    var floatVar = 3.22 

    public var publicStringVar = "string member"
    private var privateStringVar = "string member"
    var stringVar = "string member"

    public var publicCharVar = r'D'
    private var privateCharVar = r'D'
    var charVar = r'D'

    var myEnumCase = MyEnym.A(1)

    static func checkStaticPrivateValues() {
        Assert.equals(3, staticPrivateIntVar)
        Assert.equals(3.22, staticPrivateFloatVar)

        Assert.equals("string member", staticPrivateStringVar)
        Assert.equals(r'D', staticPrivateCharVar)
    }

    func checkPrivateValues() {
        Assert.equals(3, privateIntVar)
        Assert.equals(3.22, privateFloatVar)

        Assert.equals("string member", privateStringVar)
        Assert.equals(r'D', privateCharVar)
    }
} 

main() {
    var myVarNotDefinedButInt = 24
    var myVarNotDefinedButFloat = -1.29
    var myVarNotDefinedButString = "Another string in local-level variable"
    var myVarNotDefinedButChar = r'L'
    var myVarNotDefinedButTuple = (0.22, "0.25", true)

    Assert.equals(24, myVarNotDefinedButInt)
    Assert.equals(-1.29, myVarNotDefinedButFloat)

    Assert.equals("Another string in local-level variable", myVarNotDefinedButString)
    Assert.equals(r'L', myVarNotDefinedButChar)

    let (x0, y0, z0) = myVarNotDefinedButTuple
    Assert.equals(0.22, x0)
    Assert.equals("0.25", y0)
    Assert.equals(true, z0)

    Assert.equals(128, myPublicTopVarNotDefinedButInt)
    Assert.equals(0.13, myPublicTopVarNotDefinedButFloat)

    Assert.equals("String", myPublicTopVarNotDefinedButString)
    Assert.equals(r'A', myPublicTopVarNotDefinedButChar)

    let (x1, y1, z1) = myPublicTopVarNotDefinedButTuple
    Assert.equals(12, x1)
    Assert.equals("aaa", y1)
    Assert.equals(true, z1)

    Assert.equals(-16, myTopVarNotDefinedButInt)
    Assert.equals(0.55, myTopVarNotDefinedButFloat)

    Assert.equals("Another string", myTopVarNotDefinedButString)
    Assert.equals(r'V', myTopVarNotDefinedButChar)
    let (x2, y2, z2) = myTopVarNotDefinedButTuple
    Assert.equals(74, x2)
    Assert.equals(r'a', y2)
    Assert.equals(0.25, z2)

    Assert.equals(3, myTestStruct.staticIntVar)
    Assert.equals(3.22, myTestStruct.staticFloatVar)
    Assert.equals("string member", myTestStruct.staticStringVar)
    Assert.equals(r'D', myTestStruct.staticCharVar)
    Assert.equals(3, myTestStruct.staticPublicIntVar)
    Assert.equals(3.22, myTestStruct.staticPublicFloatVar)

    Assert.equals("string member", myTestStruct.staticPublicStringVar)
    Assert.equals(r'D', myTestStruct.staticPublicCharVar)
    myTestStruct.checkStaticPrivateValues()

    var myTestStructImpl = myTestStruct()

    Assert.equals(3, myTestStructImpl.intVar)
    Assert.equals(3.22, myTestStructImpl.floatVar)
    Assert.equals("string member", myTestStructImpl.stringVar)
    Assert.equals(r'D', myTestStructImpl.charVar)

    Assert.equals(3, myTestStructImpl.publicIntVar)
    Assert.equals(3.22, myTestStructImpl.publicFloatVar)

    Assert.equals("string member", myTestStructImpl.publicStringVar)
    Assert.equals(r'D', myTestStructImpl.publicCharVar)
    myTestStructImpl.checkPrivateValues()

    Assert.equals(3, MyClass.staticPublicIntVar)
    Assert.equals(3.22, MyClass.staticPublicFloatVar)

    Assert.equals("string member", MyClass.staticPublicStringVar)
    Assert.equals(r'D', MyClass.staticPublicCharVar)

    var aaa = MyClass()

    Assert.equals(3, aaa.publicIntVar)
    Assert.equals(3, aaa.intVar)
    Assert.equals(3.22, aaa.publicFloatVar)
    Assert.equals(3.22, aaa.floatVar)

    Assert.equals("string member", aaa.publicStringVar)
    Assert.equals("string member", aaa.stringVar)
    Assert.equals(r'D', aaa.publicCharVar)
    Assert.equals(r'D', aaa.charVar)

    var qwert = MyEnym.B(1.0, r'C')
}
