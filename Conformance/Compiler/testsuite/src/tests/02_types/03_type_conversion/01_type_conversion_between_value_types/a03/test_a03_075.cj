/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_075

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from UInt8 to UIntNative is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: UInt8 = 112
var a2: UInt8 = 7

func foo(): UInt8 { return 63 }

class MyCls {
    static var m: UInt8 = 192
}

var r1 = UIntNative(a1)
let r2 = UIntNative(a2)

main(): Unit {
    let r3 = UIntNative(foo())
    var r4 = UIntNative(MyCls.m)

    Assert.isTrue(r1 is UIntNative)
    Assert.isTrue(r2 is UIntNative)
    Assert.isTrue(r3 is UIntNative)
    Assert.isTrue(r4 is UIntNative)

    Assert.equals(112, r1)
    Assert.equals(7, r2)
    Assert.equals(63, r3)
    Assert.equals(192, r4)
}
