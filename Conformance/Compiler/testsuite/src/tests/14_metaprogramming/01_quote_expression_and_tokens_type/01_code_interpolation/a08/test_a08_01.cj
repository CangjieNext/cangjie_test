/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a08_01

  @Level:         1

  @Assertion:   14.1.1(8) - Most of the value types in the standard library are implemented by default,
                including numeric, Rune, Bool, String, and Tuple.
 
  @Description: Check that the standard types implement the ToTokens interface, 
                including numeric, Rune, Bool, String and Tuple.
  
  @Mode:        run

  @Negative:    no

  @Issue:       0006122

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    let uint8: UInt8 = 10u8                 // UInt8 literal
    var int16: Int16 = 10i16                // Int16 literal
    let uint32: UInt32 = 1024u32            // UInt32 literal
    var int64: Int64 = 1024                 // Int64 literal
    let float32: Float32 = 1024.512_f32     // Float32 literal
    var float64: Float64 = 1024.512         // Float64 literal
    let char: Rune = 'a'                    // Rune literal
    var char_byte: UInt8 = b'a'             // Character byte literal, it has UInt8 type
    let bool: Bool = true                   // Bool literal
    var str: String = "Cangjie"             // String literal
    let tuple = (1, 2i16)                   // Tuple<Int64, Int16>

    Assert.isTrue(uint8 is ToTokens)
    Assert.isTrue(int16 is ToTokens)
    Assert.isTrue(uint32 is ToTokens)
    Assert.isTrue(int64 is ToTokens)
    Assert.isTrue(float32 is ToTokens)
    Assert.isTrue(float64 is ToTokens)
    Assert.isTrue(char is ToTokens)
    Assert.isTrue(char_byte is ToTokens)
    Assert.isTrue(bool is ToTokens)
    Assert.isTrue(str is ToTokens)
    
    Assert.equals(uint8.toTokens().toString(), quote($uint8).toTokens().toString())
    Assert.equals(int16.toTokens().toString(), quote($int16).toTokens().toString())
    Assert.equals(uint32.toTokens().toString(), quote($uint32).toTokens().toString())
    Assert.equals(int64.toTokens().toString(), quote($int64).toTokens().toString())
    Assert.equals(float32.toTokens().toString(), quote($float32).toTokens().toString())
    Assert.equals(float64.toTokens().toString(), quote($float64).toTokens().toString())
    Assert.equals(char.toTokens().toString(), quote($char).toTokens().toString())
    Assert.equals(char_byte.toTokens().toString(), quote($char_byte).toTokens().toString())
    Assert.equals(bool.toTokens().toString(), quote($bool).toTokens().toString())
    Assert.equals(str.toTokens().toString(), quote($str).toTokens().toString())
}
