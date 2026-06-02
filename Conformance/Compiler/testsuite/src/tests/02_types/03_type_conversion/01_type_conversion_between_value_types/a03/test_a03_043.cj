/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a03_043

  @Level:         1

  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from Int64 to Int64 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Int64 = -2371168140726813920
var a2: Int64 = 3693912266332506984

func foo(): Int64 { return 8934727210469992082 }

class MyCls {
    static var m: Int64 = -7782187267945269292
}

var r1 = Int64(a1)
let r2 = Int64(a2)

main(): Unit {
    let r3 = Int64(foo())
    var r4 = Int64(MyCls.m)

    Assert.isTrue(r1 is Int64)
    Assert.isTrue(r2 is Int64)
    Assert.isTrue(r3 is Int64)
    Assert.isTrue(r4 is Int64)

    Assert.equals(-2371168140726813920, r1)
    Assert.equals(3693912266332506984, r2)
    Assert.equals(8934727210469992082, r3)
    Assert.equals(-7782187267945269292, r4)
}
