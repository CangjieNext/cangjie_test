/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a07_03

  @Level:         1

  @Assertion:    13.1.2.3(7) Variables modified by inout can be variables
                 defined in the top-level scope, local variables, or member
                 variables in struct, but cannot be derived directly or
                 indirectly from instance member variables of class. 

  @Description:  Struct member variable as inout variable.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

import utils.assert.Assert

@C func func_01(Ptr: CPointer<Int32>): Unit {
    let Income = unsafe{ Ptr.read() }
    unsafe{ Ptr.write(Income + 100)}
}

struct ABC {
    var f1: Int32 = 777;
}

main() {
    var Arg: ABC = ABC()
    unsafe { func_01(inout Arg.f1) }
    Assert.equals(877, Arg.f1)
}
