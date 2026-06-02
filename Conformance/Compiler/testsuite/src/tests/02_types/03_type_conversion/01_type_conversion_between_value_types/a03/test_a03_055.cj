/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_055

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from IntNative to Int32 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: IntNative = -1705222422
var a2: IntNative = 146257513

func foo(): IntNative { return 605271146 }

class MyCls {
    static var m: IntNative = 2047046433
}

var r1 = Int32(a1)
let r2 = Int32(a2)

main(): Unit {
    let r3 = Int32(foo())
    var r4 = Int32(MyCls.m)

    Assert.isTrue(r1 is Int32)
    Assert.isTrue(r2 is Int32)
    Assert.isTrue(r3 is Int32)
    Assert.isTrue(r4 is Int32)

    Assert.equals(-1705222422, r1)
    Assert.equals(146257513, r2)
    Assert.equals(605271146, r3)
    Assert.equals(2047046433, r4)
}
