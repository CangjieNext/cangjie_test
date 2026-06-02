/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_02

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of literals is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

main(): Unit {
    // Literals Expressions
    let l_uint8 = 10u8 // UInt8 literal
    let l_int16 = 10i16 // Int16 literal
    let l_uint32 = 1024u32 // UInt32 literal
    let l_int64 = 1024 // Int64 literal
    let l_float32 = 1024.512_f32 // Float32 literal
    let l_float64 = 1024.512 // Float64 literal
    let l_char = 'a' // Rune literal
    let l_char_byte = b'a' // Character byte literal, it has UInt8 type
    let l_bool = true // Bool literal
    let l_str = "Cangjie" // String literal

    var t_uint8 = quote(l_uint8)
    var t_int16 = quote(l_int16)
    var t_uint32 = quote(l_uint32)
    var t_int64 = quote(l_int64)
    var t_float32 = quote(l_float32)
    var t_float64 = quote(l_float64)
    var t_char = quote(l_char)
    var t_char_byte = quote(l_char_byte)
    var t_bool = quote(l_bool)
    var t_str = quote(l_str)
    
    let cit_uint8 = quote($l_uint8)
    let cit_int16 = quote($l_int16)
    let cit_uint32 = quote($l_uint32)
    let cit_int64 = quote($l_int64)
    let cit_float32 = quote($l_float32)
    let cit_float64 = quote($l_float64)
    let cit_char = quote($l_char)
    let cit_char_byte = quote($l_char_byte)
    let cit_bool = quote($l_bool)
    let cit_str = quote($l_str)

    let cil_uint8 = quote($(10u8))
    let cil_int16 = quote($(10i16))
    let cil_uint32 = quote($(1024u32))
    let cil_int64 = quote($(1024))
    let cil_float32 = quote($(1024.512_f32))
    let cil_float64 = quote($(1024.512))
    let cil_char = quote($('a'))
    let cil_char_byte = quote($(b'a'))
    let cil_bool = quote($(true))
    let cil_str = quote($("Cangjie"))

    // UInt8 literal
    Assert.equals("l_uint8", t_uint8.toString())
    Assert.equals(l_uint8.toString(), cit_uint8.toString())
    Assert.equals(l_uint8.toString(), cil_uint8.toString())

    // Int16 literal
    Assert.equals("l_int16", t_int16.toString())
    Assert.equals(l_int16.toString(), cit_int16.toString())
    Assert.equals(l_int16.toString(), cil_int16.toString())

    // UInt32 literal
    Assert.equals("l_uint32", t_uint32.toString())
    Assert.equals(l_uint32.toString(), cit_uint32.toString())
    Assert.equals(l_uint32.toString(), cil_uint32.toString())
    
    // Int64 literal
    Assert.equals("l_int64", t_int64.toString())
    Assert.equals(l_int64.toString(), cit_int64.toString())
    Assert.equals(l_int64.toString(), cil_int64.toString())
    
    // Float32 literal
    Assert.equals("l_float32", t_float32.toString())
    Assert.equals(l_float32.toString(), cit_float32.toString())
    Assert.equals(l_float32.toString(), cil_float32.toString())
    
    // Float64 literal
    Assert.equals("l_float64", t_float64.toString())
    Assert.equals(l_float64.format('4.3'), cit_float64.toString())
    Assert.equals(l_float64.format('4.3'), cil_float64.toString())

    // Rune literal
    Assert.equals("l_char", t_char.toString())
    Assert.equals('"a"', cit_char.toString())
    Assert.equals('"a"', cil_char.toString())

    // Rune Byte literal
    Assert.equals("l_char_byte", t_char_byte.toString())
    Assert.equals(l_char_byte.toString(), cit_char_byte.toString())
    Assert.equals(l_char_byte.toString(), cil_char_byte.toString())

    // Bool literal
    Assert.equals("l_bool", t_bool.toString())
    Assert.equals(l_bool.toString(), cit_bool.toString())
    Assert.equals(l_bool.toString(), cil_bool.toString())

    // Str literal
    Assert.equals("l_str", t_str.toString())
    Assert.equals('"Cangjie"', cit_str.toString())
    Assert.equals('"Cangjie"', cil_str.toString())

    Assert.isTrue(cit_uint8 is Tokens)
    Assert.isTrue(cit_int16 is Tokens)
    Assert.isTrue(cit_uint32 is Tokens)
    Assert.isTrue(cit_int64 is Tokens)
    Assert.isTrue(cit_float32 is Tokens)
    Assert.isTrue(cit_float64 is Tokens)
    Assert.isTrue(cit_char is Tokens)
    Assert.isTrue(cit_char_byte is Tokens)
    Assert.isTrue(cit_bool is Tokens)
    Assert.isTrue(cit_str is Tokens)

    Assert.isTrue(cil_uint8 is Tokens)
    Assert.isTrue(cil_int16 is Tokens)
    Assert.isTrue(cil_uint32 is Tokens)
    Assert.isTrue(cil_int64 is Tokens)
    Assert.isTrue(cil_float32 is Tokens)
    Assert.isTrue(cil_float64 is Tokens)
    Assert.isTrue(cil_char is Tokens)
    Assert.isTrue(cil_char_byte is Tokens)
    Assert.isTrue(cil_bool is Tokens)
    Assert.isTrue(cil_str is Tokens)
}
