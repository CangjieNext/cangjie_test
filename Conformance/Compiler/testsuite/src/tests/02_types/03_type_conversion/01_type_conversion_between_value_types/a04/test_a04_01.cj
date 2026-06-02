/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a04_01

  @Level:         1

  @Assertion:    2.3.1(4) The conversion of Rune to UInt32 uses UInt32(e), where e is an expression of type Rune
                 and the result of UInt32(e) is the UInt32 value corresponding to the Unicode scalar value of e.

  @Description:  Check that the result of conversion from Rune to UInt32 is the UInt32 value corresponding
                 to the Unicode scalar value

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

func get() { return r'⛄' }

main(): Unit {
    let B = r'B'

    let r1 = UInt32(get())
    var r2 = UInt32({ => r'\u{26D4}'}())
    var r3 = UInt32(r'A')
    var r4 = UInt32(B)

    Assert.isTrue(r1 is UInt32)
    Assert.isTrue(r2 is UInt32)
    Assert.isTrue(r3 is UInt32)
    Assert.isTrue(r4 is UInt32)

    Assert.equals(9924, r1)
    Assert.equals(9940, r2)
    Assert.equals(65, r3)
    Assert.equals(66, r4)
}
