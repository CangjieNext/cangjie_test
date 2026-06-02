/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_04

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of numeric type conversion is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

main(): Unit {
    // Numeric Type Conversion Expressions
    var int_8 = Int8(3.2)
    let int_16 = Int16(UInt8(100))
    var uint_32 = UInt32(5.6_f32)
    let uint_64 = UInt64(b'a')
    var float_16 = Float16(UInt8(127))
    let float_32 = Float32(4.99999)
    var float_64 = Float64(60)

    var ci_int_8 = quote($int_8)
    let ci_int_16 = quote($int_16)
    var ci_uint_32 = quote($uint_32)
    let ci_uint_64 = quote($uint_64)
    var ci_float_16 = quote($float_16)
    let ci_float_32 = quote($float_32)
    var ci_float_64 = quote($float_64)

    var cit_int_8 = quote($(Int8(3.2)))
    let cit_int_16 = quote($(Int16(UInt8(100))))
    var cit_uint_32 = quote($(UInt32(5.6_f32)))
    let cit_uint_64 = quote($(UInt64(b'a')))
    var cit_float_16 = quote($(Float16(UInt8(127))))
    let cit_float_32 = quote($(Float32(4.99999)))
    var cit_float_64 = quote($(Float64(60)))

    Assert.equals(int_8.toString(), ci_int_8.toString())
    Assert.equals(int_8.toString(), cit_int_8.toString())

    Assert.equals(int_16.toString(), ci_int_16.toString())
    Assert.equals(int_16.toString(), cit_int_16.toString())

    Assert.equals(uint_32.toString(), ci_uint_32.toString())
    Assert.equals(uint_32.toString(), cit_uint_32.toString())

    Assert.equals(uint_64.toString(), ci_uint_64.toString())
    Assert.equals(uint_64.toString(), cit_uint_64.toString())

    Assert.equals(float_16.toString(), ci_float_16.toString())
    Assert.equals(float_16.toString(), cit_float_16.toString())

    Assert.equals(float_32.toString(), ci_float_32.toString())
    Assert.equals(float_32.toString(), cit_float_32.toString())

    Assert.equals(float_64.format('2.1'), ci_float_64.toString())
    Assert.equals(float_64.format('2.1'), cit_float_64.toString())   
}
