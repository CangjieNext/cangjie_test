/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a08_01

  @Level:         1

  @Assertion:    2.3.1(8) Note that types of numeric literals are inferred from the context. 
                 It is thus not considered as implicit type conversion.

  @Description:  Check that the types of numeric literals are inferred from the context

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

func f_i8() { return 7_u8 }
func f_uN(): UIntNative{ return 3807 }

main(): Unit {
    var a1 = 8_i8
    var a2: UInt16 = 8735
    var a3: IntNative = 8735890

    Assert.isTrue(a1 is Int8)
    Assert.isTrue(a2 is UInt16)
    Assert.isTrue(a3 is IntNative)
    Assert.isTrue(f_i8() is UInt8)
    Assert.isTrue(f_uN() is UIntNative)
}
