/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a28_01

  @Level:         1

  @Assertion:    2.3.1(28) In addition, when the value of a floating-point number is NaN, POSITIVE_INFINITY, or
                 NEGTIVE_INFINITY, an exception is thrownwhen it is converted to a signed integer.

  @Description:  Check that if the floating-point number value is NaN, POSITIVE_INFINITY or NEGTIVE_INFINITY,
                 an exception occurs when converting it to a signed integer.

  @Mode:         run

  @Negative:     no

  @Issue:        0006075

*/

import utils.assert.Assert

main(): Unit {
    Assert.throws({ => Int8(Float16.Inf) },          check: { e => e is OverflowException})
    Assert.throws({ => UInt8(-Float32.Inf) },         check: { e => e is OverflowException})
    Assert.throws({ => Int8(Float64.NaN) },                        check: { e => e is OverflowException})

    Assert.throws({ => Int16(-Float16.Inf) },         check: { e => e is OverflowException})
    Assert.throws({ => UInt16(Float32.Inf) },        check: { e => e is OverflowException})
    Assert.throws({ => Int16(Float64.NaN) },                       check: { e => e is OverflowException})

    Assert.throws({ => Int32(Float64.Inf) },         check: { e => e is OverflowException})
    Assert.throws({ => UInt32(-Float32.Inf) },        check: { e => e is OverflowException})
    Assert.throws({ => Int32(Float16.NaN) },                       check: { e => e is OverflowException})

    Assert.throws({ => Int64(Float64.Inf) },         check: { e => e is OverflowException})
    Assert.throws({ => UInt64(Float16.Inf) },        check: { e => e is OverflowException})
    Assert.throws({ => Int64(Float32.NaN) },                       check: { e => e is OverflowException})

    Assert.throws({ => IntNative(-Float16.Inf) },     check: { e => e is OverflowException})
    Assert.throws({ => UIntNative(Float64.Inf) },    check: { e => e is OverflowException})
    Assert.throws({ => IntNative(Float32.NaN) },                   check: { e => e is OverflowException})
}