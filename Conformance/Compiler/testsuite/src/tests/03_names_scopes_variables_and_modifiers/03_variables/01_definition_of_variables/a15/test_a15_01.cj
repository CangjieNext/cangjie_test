/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a15_01

  @Level:         1

  @Assertion:    3.3.1(15) The compiler attempts to infer the variable type based on the initial value.

  @Description:  Check that mutable variables initialized with specific values will be recognised with right type

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

type MyTupleType = (Int64, Rune)

let tmpInt8: Int8 = 127
let tmpInt16: Int16 = 32767
let tmpInt32: Int32 = 2147483647
let tmpInt64: Int64 = 9223372036854775807
let tmpUInt8: UInt8 = 255
let tmpUInt16: UInt16 = 65535
let tmpUInt32: UInt32 = 4294967295
let tmpUInt64: UInt64 = 18446744073709551615
let tmpFloat16: Float16 = 24.65
let tmpFloat32: Float32 = 24.65
let tmpFloat64: Float64 = 24.65
let tmpChar: Rune = r'H'
let tmpString: String = "awserre66YGTEW"
let tmpTuple: MyTupleType = (12, r'S')

public var myPublicTopNotDefinedButUInt8Initialized = tmpUInt8
public var myPublicTopNotDefinedButUInt16Initialized = tmpUInt16
public var myPublicTopNotDefinedButUInt32Initialized = tmpUInt32
public var myPublicTopNotDefinedButUInt64Initialized = tmpUInt64

public var myPublicTopNotDefinedButInt8Initialized = tmpInt8
public var myPublicTopNotDefinedButInt16Initialized = tmpInt16
public var myPublicTopNotDefinedButInt32Initialized = tmpInt32
public var myPublicTopNotDefinedButInt64Initialized = tmpInt64

public var myPublicTopNotDefinedButFloat16Initialized = tmpFloat16
public var myPublicTopNotDefinedButFloat32Initialized = tmpFloat32
public var myPublicTopNotDefinedButFloat64Initialized = tmpFloat64

public var myPublicTopNotDefinedButCharInitialized = tmpChar
public var myPublicTopNotDefinedButStringInitialized = tmpString
public var myPublicTopNotDefinedButTupleInitialized = tmpTuple

var myTopNotDefinedButUInt8Initialized = tmpUInt8
var myTopNotDefinedButUInt16Initialized = tmpUInt16
var myTopNotDefinedButUInt32Initialized = tmpUInt32
var myTopNotDefinedButUInt64Initialized = tmpUInt64

var myTopNotDefinedButInt8Initialized = tmpInt8
var myTopNotDefinedButInt16Initialized = tmpInt16
var myTopNotDefinedButInt32Initialized = tmpInt32
var myTopNotDefinedButInt64Initialized = tmpInt64

var myTopNotDefinedFloat16Initialized = tmpFloat16
var myTopNotDefinedFloat32Initialized = tmpFloat32
var myTopNotDefinedFloat64Initialized = tmpFloat64

var myTopNotDefinedButCharInitialized = tmpChar
var myTopNotDefinedButStringInitialized = tmpString
var myTopNotDefinedButTupleInitialized = tmpTuple

class MyClass {
    public var myPublicClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    public var myPublicClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    public var myPublicClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    public var myPublicClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    public var myPublicClassMemberNotDefinedButInt8Initialized = tmpInt8
    public var myPublicClassMemberNotDefinedButInt16Initialized = tmpInt16
    public var myPublicClassMemberNotDefinedButInt32Initialized = tmpInt32
    public var myPublicClassMemberNotDefinedButInt64Initialized = tmpInt64
    public var myPublicClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    public var myPublicClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    public var myPublicClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    public var myPublicClassMemberNotDefinedButCharInitialized = tmpChar
    public var myPublicClassMemberNotDefinedButStringInitialized = tmpString
    public var myPublicClassMemberNotDefinedButTupleInitialized = tmpTuple

    public static var myPublicStaticClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    public static var myPublicStaticClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    public static var myPublicStaticClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    public static var myPublicStaticClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    public static var myPublicStaticClassMemberNotDefinedButInt8Initialized = tmpInt8
    public static var myPublicStaticClassMemberNotDefinedButInt16Initialized = tmpInt16
    public static var myPublicStaticClassMemberNotDefinedButInt32Initialized = tmpInt32
    public static var myPublicStaticClassMemberNotDefinedButInt64Initialized = tmpInt64
    public static var myPublicStaticClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    public static var myPublicStaticClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    public static var myPublicStaticClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    public static var myPublicStaticClassMemberNotDefinedButCharInitialized = tmpChar
    public static var myPublicStaticClassMemberNotDefinedButStringInitialized = tmpString
    public static var myPublicStaticClassMemberNotDefinedButTupleInitialized = tmpTuple

    private var myPrivateClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    private var myPrivateClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    private var myPrivateClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    private var myPrivateClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    private var myPrivateClassMemberNotDefinedButInt8Initialized = tmpInt8
    private var myPrivateClassMemberNotDefinedButInt16Initialized = tmpInt16
    private var myPrivateClassMemberNotDefinedButInt32Initialized = tmpInt32
    private var myPrivateClassMemberNotDefinedButInt64Initialized = tmpInt64
    private var myPrivateClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    private var myPrivateClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    private var myPrivateClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    private var myPrivateClassMemberNotDefinedButCharInitialized = tmpChar
    private var myPrivateClassMemberNotDefinedButStringInitialized = tmpString
    private var myPrivateClassMemberNotDefinedButTupleInitialized = tmpTuple

    private static var myPrivateStaticClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    private static var myPrivateStaticClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    private static var myPrivateStaticClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    private static var myPrivateStaticClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    private static var myPrivateStaticClassMemberNotDefinedButInt8Initialized = tmpInt8
    private static var myPrivateStaticClassMemberNotDefinedButInt16Initialized = tmpInt16
    private static var myPrivateStaticClassMemberNotDefinedButInt32Initialized = tmpInt32
    private static var myPrivateStaticClassMemberNotDefinedButInt64Initialized = tmpInt64
    private static var myPrivateStaticClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    private static var myPrivateStaticClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    private static var myPrivateStaticClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    private static var myPrivateStaticClassMemberNotDefinedButCharInitialized = tmpChar
    private static var myPrivateStaticClassMemberNotDefinedButStringInitialized = tmpString
    private static var myPrivateStaticClassMemberNotDefinedButTupleInitialized = tmpTuple

    protected var myProtectedClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    protected var myProtectedClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    protected var myProtectedClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    protected var myProtectedClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    protected var myProtectedClassMemberNotDefinedButInt8Initialized = tmpInt8
    protected var myProtectedClassMemberNotDefinedButInt16Initialized = tmpInt16
    protected var myProtectedClassMemberNotDefinedButInt32Initialized = tmpInt32
    protected var myProtectedClassMemberNotDefinedButInt64Initialized = tmpInt64
    protected var myProtectedClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    protected var myProtectedClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    protected var myProtectedClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    protected var myProtectedClassMemberNotDefinedButCharInitialized = tmpChar
    protected var myProtectedClassMemberNotDefinedButStringInitialized = tmpString
    protected var myProtectedClassMemberNotDefinedButTupleInitialized = tmpTuple

    protected static var myProtectedStaticClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    protected static var myProtectedStaticClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    protected static var myProtectedStaticClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    protected static var myProtectedStaticClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    protected static var myProtectedStaticClassMemberNotDefinedButInt8Initialized = tmpInt8
    protected static var myProtectedStaticClassMemberNotDefinedButInt16Initialized = tmpInt16
    protected static var myProtectedStaticClassMemberNotDefinedButInt32Initialized = tmpInt32
    protected static var myProtectedStaticClassMemberNotDefinedButInt64Initialized = tmpInt64
    protected static var myProtectedStaticClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    protected static var myProtectedStaticClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    protected static var myProtectedStaticClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    protected static var myProtectedStaticClassMemberNotDefinedButCharInitialized = tmpChar
    protected static var myProtectedStaticClassMemberNotDefinedButStringInitialized = tmpString
    protected static var myProtectedStaticClassMemberNotDefinedButTupleInitialized = tmpTuple

    var myClassMemberNotDefinedButUInt8Initialized = tmpUInt8
    var myClassMemberNotDefinedButUInt16Initialized = tmpUInt16
    var myClassMemberNotDefinedButUInt32Initialized = tmpUInt32
    var myClassMemberNotDefinedButUInt64Initialized = tmpUInt64
    var myClassMemberNotDefinedButInt8Initialized = tmpInt8
    var myClassMemberNotDefinedButInt16Initialized = tmpInt16
    var myClassMemberNotDefinedButInt32Initialized = tmpInt32
    var myClassMemberNotDefinedButInt64Initialized = tmpInt64
    var myClassMemberNotDefinedButFloat16Initialized = tmpFloat16
    var myClassMemberNotDefinedButFloat32Initialized = tmpFloat32
    var myClassMemberNotDefinedButFloat64Initialized = tmpFloat64
    var myClassMemberNotDefinedButCharInitialized = tmpChar
    var myClassMemberNotDefinedButStringInitialized = tmpString
    var myClassMemberNotDefinedButTupleInitialized = tmpTuple

    MyClass() {}

    func checkType() {
        Assert.isTrue(this.myPublicClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(this.myPublicClassMemberNotDefinedButTupleInitialized is MyTupleType)

        Assert.isTrue(myPublicStaticClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(myPublicStaticClassMemberNotDefinedButTupleInitialized is MyTupleType)
  
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(this.myPrivateClassMemberNotDefinedButTupleInitialized is MyTupleType)

        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(myPrivateStaticClassMemberNotDefinedButTupleInitialized is MyTupleType)
  
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(this.myProtectedClassMemberNotDefinedButTupleInitialized is MyTupleType)

        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(myProtectedStaticClassMemberNotDefinedButTupleInitialized is MyTupleType)

        Assert.isTrue(this.myClassMemberNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(this.myClassMemberNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(this.myClassMemberNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(this.myClassMemberNotDefinedButUInt64Initialized is UInt64)
        Assert.isTrue(this.myClassMemberNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(this.myClassMemberNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(this.myClassMemberNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(this.myClassMemberNotDefinedButInt64Initialized is Int64)
        Assert.isTrue(this.myClassMemberNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(this.myClassMemberNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(this.myClassMemberNotDefinedButFloat64Initialized is Float64)
        Assert.isTrue(this.myClassMemberNotDefinedButCharInitialized is Rune)
        Assert.isTrue(this.myClassMemberNotDefinedButStringInitialized is String)
        Assert.isTrue(this.myClassMemberNotDefinedButTupleInitialized is MyTupleType)
    }
}

struct MyStruct {
    var myStructNotDefinedButUInt8Initialized = tmpUInt8
    var myStructNotDefinedButUInt16Initialized = tmpUInt16
    var myStructNotDefinedButUInt32Initialized = tmpUInt32
    var myStructNotDefinedButUInt64Initialized = tmpUInt64

    var myStructNotDefinedButInt8Initialized = tmpInt8
    var myStructNotDefinedButInt16Initialized = tmpInt16
    var myStructNotDefinedButInt32Initialized = tmpInt32
    var myStructNotDefinedButInt64Initialized = tmpInt64

    var myStructNotDefinedButFloat16Initialized = tmpFloat16
    var myStructNotDefinedButFloat32Initialized = tmpFloat32
    var myStructNotDefinedButFloat64Initialized = tmpFloat64

    var myStructNotDefinedButCharInitialized = tmpChar
    var myStructNotDefinedButStringInitialized = tmpString

    var myStructNotDefinedButTupleInitialized = tmpTuple

    func checkType() {
        Assert.isTrue(myStructNotDefinedButUInt8Initialized is UInt8)
        Assert.isTrue(myStructNotDefinedButUInt16Initialized is UInt16)
        Assert.isTrue(myStructNotDefinedButUInt32Initialized is UInt32)
        Assert.isTrue(myStructNotDefinedButUInt64Initialized is UInt64)
    
        Assert.isTrue(myStructNotDefinedButInt8Initialized is Int8)
        Assert.isTrue(myStructNotDefinedButInt16Initialized is Int16)
        Assert.isTrue(myStructNotDefinedButInt32Initialized is Int32)
        Assert.isTrue(myStructNotDefinedButInt64Initialized is Int64)
    
        Assert.isTrue(myStructNotDefinedButFloat16Initialized is Float16)
        Assert.isTrue(myStructNotDefinedButFloat32Initialized is Float32)
        Assert.isTrue(myStructNotDefinedButFloat64Initialized is Float64)

        Assert.isTrue(myStructNotDefinedButCharInitialized is Rune)
        Assert.isTrue(myStructNotDefinedButStringInitialized is String)

        Assert.isTrue(myStructNotDefinedButTupleInitialized is MyTupleType)
    }
} 


func myFunc() {
    var myLocalFuncNotDefinedButUInt8Initialized = tmpUInt8
    var myLocalFuncNotDefinedButUInt16Initialized = tmpUInt16
    var myLocalFuncNotDefinedButUInt32Initialized = tmpUInt32
    var myLocalFuncNotDefinedButUInt64Initialized = tmpUInt64

    var myLocalFuncNotDefinedButInt8Initialized = tmpInt8
    var myLocalFuncNotDefinedButInt16Initialized = tmpInt16
    var myLocalFuncNotDefinedButInt32Initialized = tmpInt32
    var myLocalFuncNotDefinedButInt64Initialized = tmpInt64

    var myLocalFuncNotDefinedButFloat16Initialized = tmpFloat16
    var myLocalFuncNotDefinedButFloat32Initialized = tmpFloat32
    var myLocalFuncNotDefinedButFloat64Initialized = tmpFloat64

    var myLocalFuncNotDefinedButCharInitialized = tmpChar
    var myLocalFuncNotDefinedButStringInitialized = tmpString

    var myLocalFuncNotDefinedButTupleInitialized = tmpTuple

    Assert.isTrue(myLocalFuncNotDefinedButUInt8Initialized is UInt8)
    Assert.isTrue(myLocalFuncNotDefinedButUInt16Initialized is UInt16)
    Assert.isTrue(myLocalFuncNotDefinedButUInt32Initialized is UInt32)
    Assert.isTrue(myLocalFuncNotDefinedButUInt64Initialized is UInt64)
    
    Assert.isTrue(myLocalFuncNotDefinedButInt8Initialized is Int8)
    Assert.isTrue(myLocalFuncNotDefinedButInt16Initialized is Int16)
    Assert.isTrue(myLocalFuncNotDefinedButInt32Initialized is Int32)
    Assert.isTrue(myLocalFuncNotDefinedButInt64Initialized is Int64)
    
    Assert.isTrue(myLocalFuncNotDefinedButFloat16Initialized is Float16)
    Assert.isTrue(myLocalFuncNotDefinedButFloat32Initialized is Float32)
    Assert.isTrue(myLocalFuncNotDefinedButFloat64Initialized is Float64)

    Assert.isTrue(myLocalFuncNotDefinedButCharInitialized is Rune)
    Assert.isTrue(myLocalFuncNotDefinedButStringInitialized is String)

    Assert.isTrue(myLocalFuncNotDefinedButTupleInitialized is MyTupleType)
}

func assignFloat32(): Float32 {
    16.23
}

func assignRangeInt64(): Range<Int64> {
    1..10:1
}

func assignChar() {
    r'F'
}

main() {
    myFunc()
    var myLocalNotDefinedInitialized1 = assignFloat32()
    Assert.isTrue(myLocalNotDefinedInitialized1 is Float32)
    var myLocalNotDefinedInitialized2 = assignRangeInt64()
    Assert.isTrue(myLocalNotDefinedInitialized2 is Range<Int64>)
    var myLocalNotDefinedInitialized3 = assignChar()
    Assert.isTrue(myLocalNotDefinedInitialized3 is Rune)

    var myLocalNotDefinedInitialized4 = 55i8
    Assert.isTrue(myLocalNotDefinedInitialized4 is Int8)
    var myLocalNotDefinedInitialized5 = r'\b'
    Assert.isTrue(myLocalNotDefinedInitialized5 is Rune)

    var lambda1: (Int32, Int32)->Int32 = {a: Int32, b: Int32 => a - b}
    var myLocalNotDefinedInitialized6 = lambda1(12, 8)
    Assert.isTrue(myLocalNotDefinedInitialized6 is Int32)
  
    var myLocalNotDefinedButUInt16Initialized = tmpUInt16
    var myLocalNotDefinedButUInt32Initialized = tmpUInt32
    var myLocalNotDefinedButUInt64Initialized = tmpUInt64

    var myLocalNotDefinedButInt8Initialized = tmpInt8
    var myLocalNotDefinedButInt16Initialized = tmpInt16
    var myLocalNotDefinedButInt32Initialized = tmpInt32
    var myLocalNotDefinedButInt64Initialized = tmpInt64

    var myLocalNotDefinedFloat16Initialized = tmpFloat16
    var myLocalNotDefinedFloat32Initialized = tmpFloat32
    var myLocalNotDefinedFloat64Initialized = tmpFloat64

    var myLocalNotDefinedButCharInitialized = tmpChar
    var myLocalNotDefinedButStringInitialized = tmpString

    var myLocalNotDefinedButTupleInitialized = tmpTuple

    var myClassImpl = MyClass()
    myClassImpl.checkType()

    var myStructImpl = MyStruct()
    myStructImpl.checkType()

    Assert.isTrue(myPublicTopNotDefinedButUInt8Initialized is UInt8)
    Assert.isTrue(myPublicTopNotDefinedButUInt16Initialized is UInt16)
    Assert.isTrue(myPublicTopNotDefinedButUInt32Initialized is UInt32)
    Assert.isTrue(myPublicTopNotDefinedButUInt64Initialized is UInt64)
 
    Assert.isTrue(myPublicTopNotDefinedButInt8Initialized is Int8)
    Assert.isTrue(myPublicTopNotDefinedButInt16Initialized is Int16)
    Assert.isTrue(myPublicTopNotDefinedButInt32Initialized is Int32)
    Assert.isTrue(myPublicTopNotDefinedButInt64Initialized is Int64)

    Assert.isTrue(myPublicTopNotDefinedButFloat16Initialized is Float16)
    Assert.isTrue(myPublicTopNotDefinedButFloat32Initialized is Float32)
    Assert.isTrue(myPublicTopNotDefinedButFloat64Initialized is Float64)

    Assert.isTrue(myPublicTopNotDefinedButCharInitialized is Rune)
    Assert.isTrue(myPublicTopNotDefinedButStringInitialized is String)
    Assert.isTrue(myPublicTopNotDefinedButTupleInitialized is MyTupleType)

    Assert.isTrue(myTopNotDefinedButUInt8Initialized is UInt8)
    Assert.isTrue(myTopNotDefinedButUInt16Initialized is UInt16)
    Assert.isTrue(myTopNotDefinedButUInt32Initialized is UInt32)
    Assert.isTrue(myTopNotDefinedButUInt64Initialized is UInt64)

    Assert.isTrue(myTopNotDefinedButInt8Initialized is Int8)
    Assert.isTrue(myTopNotDefinedButInt16Initialized is Int16)
    Assert.isTrue(myTopNotDefinedButInt32Initialized is Int32)
    Assert.isTrue(myTopNotDefinedButInt64Initialized is Int64)

    Assert.isTrue(myTopNotDefinedFloat16Initialized is Float16)
    Assert.isTrue(myTopNotDefinedFloat32Initialized is Float32)
    Assert.isTrue(myTopNotDefinedFloat64Initialized is Float64)

    Assert.isTrue(myTopNotDefinedButCharInitialized is Rune)
    Assert.isTrue(myTopNotDefinedButStringInitialized is String)
    Assert.isTrue(myTopNotDefinedButTupleInitialized is MyTupleType)
 
    Assert.isTrue(myLocalNotDefinedButUInt16Initialized is UInt16)
    Assert.isTrue(myLocalNotDefinedButUInt32Initialized is UInt32)
    Assert.isTrue(myLocalNotDefinedButUInt64Initialized is UInt64)

    Assert.isTrue(myLocalNotDefinedButInt8Initialized is Int8)
    Assert.isTrue(myLocalNotDefinedButInt16Initialized is Int16)
    Assert.isTrue(myLocalNotDefinedButInt32Initialized is Int32)
    Assert.isTrue(myLocalNotDefinedButInt64Initialized is Int64)

    Assert.isTrue(myLocalNotDefinedFloat16Initialized is Float16)
    Assert.isTrue(myLocalNotDefinedFloat32Initialized is Float32)
    Assert.isTrue(myLocalNotDefinedFloat64Initialized is Float64)

    Assert.isTrue(myLocalNotDefinedButCharInitialized is Rune)
    Assert.isTrue(myLocalNotDefinedButStringInitialized is String)

    Assert.isTrue(myLocalNotDefinedButTupleInitialized is MyTupleType)
}
