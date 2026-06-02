/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a18_01

  @Level:         1

  @Assertion:    1.4(18) is Type test as Type cast

  @Description:  Check as Type cast operator

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/


import utils.assert.Assert

open class Rect {
        var wid: Int32 = 10
        var len: Int32 = 20
    }
class Recto <: Rect {
    var age: UInt8 = 18
}
main() {
    var sv : Rect = Rect();
    let ro : Recto = Recto();
    Assert.isSome(ro as Recto)
    Assert.isSome(ro as Rect)
    Assert.isNone(sv as Recto)
    return 0;
}
