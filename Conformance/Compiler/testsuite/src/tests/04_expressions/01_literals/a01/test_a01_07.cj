
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_07

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that integer literal type is determined by the program
                context for literals whish starts with 0x.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let i8: Int8 = Int8(Assert.getRuntimeZero())
let i16: Int16 = Int16(Assert.getRuntimeZero() + 1)
let i32: Int32 = Int32(Assert.getRuntimeZero() + 2)
let i64: Int64 = Assert.getRuntimeZero() + 3
let u8: UInt8 = UInt8(Assert.getRuntimeZero())
let u16: UInt16 = UInt16(Assert.getRuntimeZero() + 1)
let u32: UInt32 = UInt32(Assert.getRuntimeZero() + 2)
let u64: UInt64 = UInt64(Assert.getRuntimeZero() + 3)

main() {  
    // Literal type is the same as variable type
    var x1: Int8 = 0x0001
    var x2: Int16 = 0x0000_1111
    var x3: Int32 = 0x0000_1111
    var x4: Int64 = 0x0000_1111
    var x5: UInt8 = 0x0010
    var x6: UInt16 = 0x0000_1111
    var x7: UInt32 = 0x0000_1111
    var x8: UInt64 = 0x0000_1111

    // Literal type is the same as the type of the second literal:

    var x9 = 0x0001i8 + 10
    Assert.isTrue(x9 is Int8)

    var x10 = 10 - 0x0000_1111i16
    Assert.isTrue(x10 is Int16)

    var x11 = 0x0000_1111i32 * 10
    Assert.isTrue(x11 is Int32)

    var x12 = 10 / 0x0000_1111i64
    Assert.isTrue(x12 is Int64)

    var x13 = 0x0011u8 % 10
    Assert.isTrue(x13 is UInt8)

    var x14 = 10 + 0x0000_1111u16
    Assert.isTrue(x14 is UInt16)

    var x15 = 0x0000_1111u32 - 10
    Assert.isTrue(x15 is UInt32)

    var x16 = 10 * 0x0000_1111u64
    Assert.isTrue(x16 is UInt64)

    // Literal type is the same as the type of the variable type:

    var x17 = i8 / 0x11
    Assert.isTrue(x17 is Int8)

    var x18 = 0x0000_1111 % i16
    Assert.isTrue(x18 is Int16)

    var x19 = i32 + 0x0000_1111
    Assert.isTrue(x19 is Int32)

    var x20 = 0x0000_1111 - i64
    Assert.isTrue(x20 is Int64)

    var x21 = u8 * 0x0
    Assert.isTrue(x21 is UInt8)

    var x22 = 0x0000_1111 / u16
    Assert.isTrue(x22 is UInt16)

    var x23 = u32 % 0x0000_1111
    Assert.isTrue(x23 is UInt32)

    var x24 = 0x0000_1111 + u64
    Assert.isTrue(x24 is UInt64)

    // Literal type is Int64:
    var x25 = 0x0000_1111 - 0x0000_1111_0000_1111
    Assert.isTrue(x25 is Int64)

    // Power - the first argument is Int64, the second is UInt64, the result is Int64:

    var x26 = 0x0011 ** 3
    Assert.isTrue(x26 is Int64)

    var x27 = 0x0011 ** 3u64
    Assert.isTrue(x27 is Int64)

    var x28 = 0x0000_1111 ** u64
    Assert.isTrue(x28 is Int64)

    var x29 = 10i64 ** 0x0001
    Assert.isTrue(x29 is Int64)

    var x30 = i64 ** 0x0010
    Assert.isTrue(x30 is Int64)

    // Bitwise operations: 
     // Literal type is the same as the type of the second literal:

    var x31 = 10i8 >> 0x01
    Assert.isTrue(x31 is Int8)

    var x32 = 0x0000_1111 << 10i16
    Assert.isTrue(x32 is Int64)

    var x33 = 10i32 & 0x0000_1111
    Assert.isTrue(x33 is Int32)

    var x34 = 0x0000_1111 ^ 10i64
    Assert.isTrue(x34 is Int64)

    var x35 = 10u8 | 0x0011
    Assert.isTrue(x35 is UInt8)

    var x36 = 0x0000_1111 >> 10u16
    Assert.isTrue(x36 is Int64)

    var x37 = 10u32 << 0x0001
    Assert.isTrue(x37 is UInt32)

    var x38 = 0x0000_1111 & 10u64
    Assert.isTrue(x38 is UInt64)

    // Literal type is the same as the type of the variable type:

    var x39 = i8 ^ 0x0001
    Assert.isTrue(x39 is Int8)

    var x40 = 0x0000_1111 | i16
    Assert.isTrue(x40 is Int16)

    var x41 = i32 >> 0x0001
    Assert.isTrue(x41 is Int32)

    var x42 = 0x0000_1111 << i64
    Assert.isTrue(x42 is Int64)

    var x43 = u8 & 0x0000
    Assert.isTrue(x43 is UInt8)

    var x44 = 0x0000_1111 ^ u16
    Assert.isTrue(x44 is UInt16)

    var x45 = u32 | 0x0000_1111
    Assert.isTrue(x45 is UInt32)

    var x46 = 0x0000_1111 >> u64
    Assert.isTrue(x46 is Int64)
}
