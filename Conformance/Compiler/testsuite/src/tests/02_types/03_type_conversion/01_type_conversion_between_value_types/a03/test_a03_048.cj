/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_048

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from Int64 to UInt64 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Int64 = 3800687100437211860
var a2: Int64 = 5988701629813469551

func foo(): Int64 { return 6547391107699798053 }

class MyCls {
    static var m: Int64 = 1014280296062124201
}

var r1 = UInt64(a1)
let r2 = UInt64(a2)

main(): Unit {
    let r3 = UInt64(foo())
    var r4 = UInt64(MyCls.m)

    Assert.isTrue(r1 is UInt64)
    Assert.isTrue(r2 is UInt64)
    Assert.isTrue(r3 is UInt64)
    Assert.isTrue(r4 is UInt64)

    Assert.equals(3800687100437211860, r1)
    Assert.equals(5988701629813469551, r2)
    Assert.equals(6547391107699798053, r3)
    Assert.equals(1014280296062124201, r4)
}
