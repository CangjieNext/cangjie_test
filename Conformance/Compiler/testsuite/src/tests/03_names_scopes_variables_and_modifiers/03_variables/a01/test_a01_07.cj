/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_07

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'var' w/o type and with initialization with right values
                  will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    static public var classVarStaticPublic = 22
    public var classVarPublic = 0..10:1
    static protected var classVarStaticProtected =23 
    protected var classVarProtected = 'H'
    static private var classVarStaticPrivate = 24
    private var classVarPrivate = "9ywesn"
    static var classVarStatic = 3
    var classVar = 42.3
}

struct Point {
    var x = 11
    var y = 56.4
    var structVar = "DDD"
} 

main() {
    var nameVarInt8 = 127
    var nameVarInt16 = 32767
    var nameVarInt32 = 2147483647
    var nameVarInt64 = 9223372036854775807

    var nameVarUInt8 = 255
    var nameVarUInt16 = 65535
    var nameVarUInt32 = 4294967295
    var nameVarUInt64 = 4294967295

    var nameVarFloat16 = 0.0
    var nameVarFloat32 = 0.0
    var nameVarFloat64 = 0.0

    var nameVarByte = 255

    var nameVarChar = 'S'

    var nameVarBool = true

    var nameVarString = "AAA"

    var nameVarRangeOfInt64 = 0..5
}