/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_03_01_a01_01

  @Level:         1

  @Assertion:   2.3.1(1) Type conversion from Rune to UInt32.

  @Description:  Check that the type conversion from Rune to UInt32 is supported

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let a1 = r'z'
var a2 = r'l'

func foo() { return r'c' }

class MyCls {
    static var m = r'\u{ffff}'
}

var r1 = UInt32(a1)
let r2 = UInt32(a2)

main(): Unit {
    let r3 = UInt32(foo())
    var r4 = UInt32(MyCls.m)
    var r5 = UInt32("Some"[0])

    Assert.isTrue(r1 is UInt32)
    Assert.isTrue(r2 is UInt32)
    Assert.isTrue(r3 is UInt32)
    Assert.isTrue(r4 is UInt32)
    Assert.isTrue(r5 is UInt32)
    Assert.isTrue(UInt32(r'\u{0000}') is UInt32)

    Assert.equals(122, r1)
    Assert.equals(108, r2)
    Assert.equals(99, r3)
    Assert.equals(65535, r4)
    Assert.equals(83, r5)
}
