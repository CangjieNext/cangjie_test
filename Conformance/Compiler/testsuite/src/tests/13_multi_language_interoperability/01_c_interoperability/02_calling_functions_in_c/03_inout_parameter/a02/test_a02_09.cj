/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a02_09

  @Level:         1

  @Assertion:    13.1.2.3(2) The pass-by-reference expression is of type
                 CPointer<T>, where T is the type of the expression that
                 the inout expression modifies.

  @Description:  Use of inout modifier for parameter of type UInt64.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

import utils.assert.Assert

@C func func_01(Ptr: CPointer<UInt64>): Unit {
    let Income = unsafe{ Ptr.read() }
    Assert.equals(18000000000000000000u64, Income)
    unsafe{ Ptr.write(123456789u64) }
}

main() {
    var Arg : UInt64 = 18000000000000000000u64;
    unsafe { func_01(inout Arg) }
    Assert.equals(123456789u64, Arg)
}
