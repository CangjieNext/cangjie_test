/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_138

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from Float16 to UInt32 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Float16 = 58688.0f16
var a2: Float16 = 37600.0f16

func foo(): Float16 { return 24400.0f16 }

class MyCls {
    static var m: Float16 = 31008.3242f16
}

var r1 = UInt32(a1)
let r2 = UInt32(a2)

main(): Unit {
    let r3 = UInt32(foo())
    var r4 = UInt32(MyCls.m)

    Assert.isTrue(r1 is UInt32)
    Assert.isTrue(r2 is UInt32)
    Assert.isTrue(r3 is UInt32)
    Assert.isTrue(r4 is UInt32)

    Assert.equals(58688, r1)
    Assert.equals(37600, r2)
    Assert.equals(24400, r3)
    Assert.equals(31008, r4)
}
