/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a01_05

  @Level:         1

  @Assertion:    3.3(1) As a statically typed language, the Cangjie programming language requires that the type of each
                  variable must be determined during compilation.

  @Description:  Check that variable declaration using keyword 'var' with type and initialisation with right values
                  will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
    var nameVarInt8: Int8 = 127
    var nameVarInt16: Int16 = 32767
    var nameVarInt32: Int32 = 2147483647
    var nameVarInt64: Int64 = 9223372036854775807

    var nameVarUInt8: UInt8 = 255
    var nameVarUInt16: UInt16 = 65535
    var nameVarUInt32: UInt32 = 4294967295
    var nameVarUInt64: UInt64 = 4294967295

    var nameVarFloat16: Float16 = 0.0
    var nameVarFloat32: Float32 = 0.0
    var nameVarFloat64: Float64 = 0.0

    var nameVarByte: Byte = 255

    var nameVarChar: Rune = 'S'

    var nameVarBool: Bool = true

    var nameVarString: String = "AAA"

    var nameVarRangeOfInt64: Range<Int64> = 0..5
}