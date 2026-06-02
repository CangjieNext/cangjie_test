/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_011

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from Int8 to Float16 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Int8 = -71
var a2: Int8 = -118

func foo(): Int8 { return -21 }

class MyCls {
    static var m: Int8 = 0
}

var r1 = Float16(a1)
let r2 = Float16(a2)

main(): Unit {
    let r3 = Float16(foo())
    var r4 = Float16(MyCls.m)

    Assert.isTrue(r1 is Float16)
    Assert.isTrue(r2 is Float16)
    Assert.isTrue(r3 is Float16)
    Assert.isTrue(r4 is Float16)

    Assert.approxEquals(-71.0f16, r1)
    Assert.approxEquals(-118.0f16, r2)
    Assert.approxEquals(-21.0f16, r3)
    Assert.approxEquals(0.0f16, r4)
}
