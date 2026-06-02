/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_01

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'var' with type will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

public var myPublicTopVar: Float16 = 127.03
var myTopVar: Int32 = 127

class MyClass {
    static public var classVarStaticPublic: Int32 = 22
    public var classVarPublic: Range<Int64>
    static protected var classVarStaticProtected: Int32 =23 
    protected var classVarProtected: Rune
    static private var classVarStaticPrivate: Int32 = 24
    private var classVarPrivate: String
    static var classVarStatic: Int32 = 3
    var classVar: Float64
    MyClass(){
        classVar = 42.3
        classVarPrivate = "9ywesn"
        classVarPublic = 0..10:1
        classVarProtected = 'H'
    }
}

struct Point {
    var x: Int32
    var y: Int32
    init(x: Int32, y: Int32){
        this.x = x
        this.y = y
    }
} 

main() {
    var nameVarInt8: Int8
    var nameVarInt16: Int16
    var nameVarInt32: Int32
    var nameVarInt64: Int64
    var nameVarIntNative: IntNative

    var nameVarUInt8: UInt8
    var nameVarUInt16: UInt16
    var nameVarUInt32: UInt32
    var nameVarUInt64: UInt64
    var nameVarUIntNative: UIntNative

    var nameVarFloat16: Float16
    var nameVarFloat32: Float32
    var nameVarFloat64: Float64

    var nameVarByte: Byte

    var nameVarChar: Rune

    var nameVarBool: Bool

    var nameVarUnit: Unit

    var nameVarString: String

    var nameVarRangeOfInt64: Range<Int64>

    var nameVarPoint: Point

}