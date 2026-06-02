
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a35_01

  @Level:         1

  @Assertion:    2.3.1(35) When the floating point number is a negative number or the integer part is beyond the 
                 range of the target integer type, an exception is thrown.

  @Description:  Check that if the integer part is out of range of the target type, an exception occurs.

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    Assert.throws({ => UInt8(-1.001_f16) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt8(-1.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt8(-1.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt16(-1.001_f16) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt16(-1.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt16(-1.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt32(-1.001_f16) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt32(-1.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt32(-1.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt64(-1.001_f16) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt64(-1.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt64(-1.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(-1.001_f16) }, check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(-1.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(-1.001_f64) }, check: { e => e is OverflowException})

    Assert.throws({ => UInt8(256.0_f16) },  check: { e => e is OverflowException})
    Assert.throws({ => UInt8(256.0_f32) },  check: { e => e is OverflowException})
    Assert.throws({ => UInt8(256.0_f64) },  check: { e => e is OverflowException})
    Assert.throws({ => UInt16(65536.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt16(65536.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt32(4294969299.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt32(4294969299.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt64(180446744073709551617.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UInt64(180446744073709551617.001_f64) }, check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(180446744073709551617.001_f32) }, check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(180446744073709551617.001_f64) }, check: { e => e is OverflowException})
}