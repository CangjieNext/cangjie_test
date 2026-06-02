/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_03

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that Letiable declaration using keyword 'let' with type will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

public let testA0103: String = "127"
let myTopLet = 'G'

class MyClass {
    static public let classLetStaticPublic: Int32 = 22
    public let classLetPublic: Range<Int64>
    static protected let classLetStaticProtected: Int32 =23 
    protected let classLetProtected: Rune
    static private let classLetStaticPrivate: Int32 = 24
    private let classLetPrivate: String
    static let classLetStatic: Int32 = 3
    let classLet: Float64
    MyClass(){
        classLet = 42.3
        classLetPrivate = "9ywesn"
        classLetPublic = 0..10:1
        classLetProtected = 'H'
    }
}

struct Point {
    let x: Int32
    let y: Int32
    init(x: Int32, y: Int32){
        this.x = x
        this.y = y
    }
} 

main() {
    let nameLetInt8: Int8
    let nameLetInt16: Int16
    let nameLetInt32: Int32
    let nameLetInt64: Int64
    let nameLetIntNative: IntNative

    let nameLetUInt8: UInt8
    let nameLetUInt16: UInt16
    let nameLetUInt32: UInt32
    let nameLetUInt64: UInt64
    let nameLetUIntNative: UIntNative

    let nameLetFloat16: Float16
    let nameLetFloat32: Float32
    let nameLetFloat64: Float64

    let nameLetByte: Byte

    let nameLetChar: Rune

    let nameLetBool: Bool

    let nameLetUnit: Unit

    let nameLetString: String

    let nameLetRangeOfInt64: Range<Int64>

    let nameLetPoint: Point

}