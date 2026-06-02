/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a02_02

  @Level:         1

  @Assertion:    2.3.1(2) Type conversion from integer types (i.e., Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64 and UIntNative) to Rune.

  @Description:  Check that the type conversion from Int16 to Rune is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1: Int16 = 29378
var a2: Int16 = 18940

func foo(): Int16 { return 10354 }

class MyCls {
    static var m: Int16 = 6513
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

    Assert.equals(29378, UInt32(r1))
    Assert.equals(18940, UInt32(r2))
    Assert.equals(10354, UInt32(r3))
    Assert.equals(6513, UInt32(r4))
}
