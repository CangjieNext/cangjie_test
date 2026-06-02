/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a02_08

  @Level:         1

  @Assertion:    2.3.1(2) Type conversion from integer types (i.e., Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64 and UIntNative) to Rune.

  @Description:  Check that the type conversion from UInt64 to Rune is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: UInt64 = 934914
var a2: UInt64 = 691079

func foo(): UInt64 { return 524316 }

class MyCls {
    static var m: UInt64 = 822450
}

var r1 = Rune(a1)
let r2 = Rune(a2)

main(): Unit {
    let r3 = Rune(foo())
    var r4 = Rune(MyCls.m)

    Assert.isTrue(r1 is Rune)
    Assert.isTrue(r2 is Rune)
    Assert.isTrue(r3 is Rune)
    Assert.isTrue(r4 is Rune)

    Assert.equals(934914, UInt32(r1))
    Assert.equals(691079, UInt32(r2))
    Assert.equals(524316, UInt32(r3))
    Assert.equals(822450, UInt32(r4))
}
