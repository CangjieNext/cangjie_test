
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_01_a02_01

  @Level:         1

  @Assertion: 4.1(2) For collective literals and tuple literals (see Value
              Types), whose value is the value of the literal obtained by 
              evaluating all expressions within it, and whose type is 
              determined by its syntax.
  @Description: Checks value and type of the tuples. Tests integer literals.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var t1 = (0, 56i8, 56i16, 56i32, 56i64)
    Assert.isTrue(t1 is (Int64, Int8, Int16, Int32, Int64))
    if( (Assert.getRuntimeZero(), 56i8, 56i16, 56i32, 56) != t1) {
        Assert.fail(reason: "Should be equal.")
    }

    var t2 = (0, 56u8, 56u16, 56u32, 56u64)
    Assert.isTrue(t2 is (Int64, UInt8, UInt16, UInt32, UInt64))
    if((Assert.getRuntimeZero(), 56u8, 56u16, 56u32, 56u64) != t2) {
        Assert.fail(reason: "Should be equal.")
    }

    var t3 = (0, 0b1111, 0b1111i8, 0b1i16, 0b001i32, 0b111110111i64)
    Assert.isTrue(t3 is (Int64, Int64, Int8, Int16, Int32, Int64))
    if((Assert.getRuntimeZero(), 
            0b1111, 
            0b1111i8, 
            0b1i16, 
            0b001i32, 
            0b111110111i64) != t3) {
        Assert.fail(reason: "Should be equal.")
    }

    var t4 = (0, 0b1111u8, 0b1u16, 0b001u32, 0b111110111u64)
    Assert.isTrue(t4 is (Int64, UInt8, UInt16, UInt32, UInt64))
    if((Assert.getRuntimeZero(), 
            0b1111u8, 
            0b1u16, 
            0b001u32, 
            0b111110111u64) != t4) {
        Assert.fail(reason: "Should be equal.")
    }

    var t5 = (0x11, 0x11i8, 0x11i16, 0x11i32, 0x11i64, 0)
    Assert.isTrue(t5 is (Int64, Int8, Int16, Int32, Int64, Int64))
    if((0x11, 
            0x11i8,
            0x11i16,
            0x11i32, 
            0x11i64, 
            Assert.getRuntimeZero()) != t5) {
        Assert.fail(reason: "Should be equal.")
    }

    var t6 = (0x11u8, 0x11u16, 0x11u32, 0x11u64, 0)
    Assert.isTrue(t6 is (UInt8, UInt16, UInt32, UInt64, Int64))
    if((0x11u8,
            0x11u16,
            0x11u32, 
            0x11u64, 
            Assert.getRuntimeZero()) != t6) {
        Assert.fail(reason: "Should be equal.")
    }

    var t7 = (0o11, 0o11i8, 0o11i16, 0o11i32, 0o11i64, 0)
    Assert.isTrue(t7 is (Int64, Int8, Int16, Int32, Int64, Int64))
    if((0o11, 
            0o11i8,
            0o11i16,
            0o11i32, 
            0o11i64, 
            Assert.getRuntimeZero()) != t7) {
        Assert.fail(reason: "Should be equal.")
    }

    var t8 = (0o11u8, 0o11u16, 0o11u32, 0o11u64, 0)
    Assert.isTrue(t8 is (UInt8, UInt16, UInt32, UInt64, Int64))
    if((0o11u8,
            0o11u16,
            0o11u32, 
            0o11u64, 
            Assert.getRuntimeZero()) != t8) {
        Assert.fail(reason: "Should be equal.")
    }
}
