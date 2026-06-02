/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a02_03

  @Level:         1

  @Assertion:    13.1.2.3(2) The pass-by-reference expression is of type
                 CPointer<T>, where T is the type of the expression that
                 the inout expression modifies.

  @Description:  Use of inout modifier for parameter of type UInt8.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

import utils.assert.Assert

@C func func_01(Ptr: CPointer<UInt8>): Unit {
    let Income = unsafe{ Ptr.read() }
    Assert.equals(128u8, Income)
    unsafe{ Ptr.write(255u8) }
}

main() {
    var Arg : UInt8 = 128u8;
    unsafe { func_01(inout Arg) }
    Assert.equals(255u8, Arg)
}
