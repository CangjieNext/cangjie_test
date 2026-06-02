/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_006

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from Int8 to UInt8 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Int8 = 121
var a2: Int8 = 68

func foo(): Int8 { return 118 }

class MyCls {
    static var m: Int8 = 52
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

    Assert.equals(121, r1)
    Assert.equals(68, r2)
    Assert.equals(118, r3)
    Assert.equals(52, r4)
}
