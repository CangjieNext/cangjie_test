/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_058

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from IntNative to UInt8 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: IntNative = 27
var a2: IntNative = 29

func foo(): IntNative { return 76 }

class MyCls {
    static var m: IntNative = 239
}

var r1 = UInt8(a1)
let r2 = UInt8(a2)

main(): Unit {
    let r3 = UInt8(foo())
    var r4 = UInt8(MyCls.m)

    Assert.isTrue(r1 is UInt8)
    Assert.isTrue(r2 is UInt8)
    Assert.isTrue(r3 is UInt8)
    Assert.isTrue(r4 is UInt8)

    Assert.equals(27, r1)
    Assert.equals(29, r2)
    Assert.equals(76, r3)
    Assert.equals(239, r4)
}
